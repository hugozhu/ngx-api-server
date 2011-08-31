ngx.header.content_type = "text/plain"
ngx.header['Server'] = ngx.var._server_name

if ngx.status == 0 then
    ngx.status = 403
end

if ngx.req.get_headers()["error_msg"] == nil then
    ngx.print("error\n")
else
    ngx.print("error: " .. ngx.req.get_headers()["error_msg"].."\n")
end