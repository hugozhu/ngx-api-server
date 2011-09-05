local action = ngx.ctx.action
local cgi    = ngx.ctx.cgi

local token = cgi:get_str('token')

if action.execute(cgi) then
    ngx.exit(200)
else
    --最后失败输出: 内部错误
    cgi:send_error(500, 'Internal Server Error')
end
