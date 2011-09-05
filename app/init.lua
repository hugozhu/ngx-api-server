--引用公用模块
require("lib.global")
_debug = require("lib.debug")
db     = require("lib.db")
date   = require("lib.date")

--初始化
config = require("lib.Config"):new{
    debug = true,
    session_secret = 'taobao_BP_API_0.1'
}
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

if is_empty_string(session) then
    cgi:send_error(403,"session data is required")
end

if #session > 128 then
    cgi:send_error(403,"session data is too long")
end

--123456789-1231231-crc32
local fields = split('-', session)
local sig = fields[#fields]
fields[#fields]=config.session_secret
local sig_v = require("lib.CRC32").hash(table.concat(fields))
if sig_v~=sig then
    cgi:send_error(403,"session data can't be verified, should be "..sig_v)
end

--传递主程序需要的变量
ngx.ctx.action  = action
ngx.ctx.cgi     = cgi
ngx.ctx.session = session
