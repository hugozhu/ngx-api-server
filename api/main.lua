--引用公用模块
_debug = require("lib.debug")
db     = require("lib.db")
date   = require("lib.date")
crc32  = require("lib.crc32")

--初始化
ngx.header['Server'] = ngx.var._server_name
local cgi = require("lib.CGI"):new()
local token = cgi:get_str('token')

local result, action = pcall(require, "actions.insight." .. ngx.var._module)
if result == false then
    cgi:send_error(404, action)
elseif action.execute(cgi) then
    ngx.exit(200)
end

--最后失败输出
cgi:send_error(403, 'invalid access')