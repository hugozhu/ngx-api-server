--[[
--此文件将在nginx的请求access阶段被执行，此阶段进行必要的安全校验，尽早拒绝无效请求
--]]

--引用公用模块
util   = require("lib.functions")
_debug = require("lib.debug")
db     = require("lib.db")
date   = require("lib.date")

--引用应用全局变量
require("app.global")

--初始化
ngx.header['Server'] = ngx.var._server_name

--判断需要执行的模块是否存在
local module = "app.actions.insight." .. ngx.var._module
local result, action = pcall(require, module)

if result == false then
    --Can't find the module to execute
    ngx.req.set_header('error-msg',module..' not found')
    ngx.exit(404)
end

local cgi = require("lib.CGI"):new()

--Verify user session
local session = ngx.var.arg_session or not_nil_string(ngx.var.cookie_session)

if util.is_empty_string(session) then
    cgi:send_error(403,"session data is required")
end

if #session > 128 then
    cgi:send_error(403,"session data is too long")
end

--1-1315215770-242eb5b9
local fields = util.split('-', session)

if not config.debug then
    local sig = fields[#fields]
    fields[#fields]=config.session_secret

    local sig_v = require("lib.CRC32").hash(table.concat(fields))
    if sig_v~=sig then
        cgi:send_error(403,"session data can't be verified, should be "..sig_v)
    end

    local timestamp = tonumber(fields[#fields-1])
    local now = ngx.time()

    local custid = tonumber(fields[1])

    if custid < 1 then
       cgi:send_error(403,"empty custid")
    end

    if now == nil or now - timestamp > 60 * 60 * 8 then
        cgi:send_error(403,"session data is expired ".. (now - timestamp))
    end
end

local custid = tonumber(fields[1])
local database, backend = get_db_info(custid)

cgi.session = {custid = custid}


--传递主程序需要的变量
ngx.ctx.action      = action
ngx.ctx.cgi         = cgi
ngx.ctx.database    = database
ngx.ctx.backend     = backend
