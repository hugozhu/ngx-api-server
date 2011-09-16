--[[
--出错页面
--]]
ngx.header.content_type = "text/plain"
ngx.header['Server'] = ngx.var._server_name

if ngx.status == 0 then
    ngx.status = ngx.HTTP_FORBIDDEN
end

local json = require("cjson")

if ngx.req.get_headers()["error-msg"] == nil then
    ngx.print(json.encode({error = "service not availible "..ngx.status}))
else
    ngx.print(json.encode({error = ngx.req.get_headers()["error-msg"]}))
end
