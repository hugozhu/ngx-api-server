module(...,package.seeall)

function send_error(code, msg)
    ngx.req.set_header('error_code',msg)
    ngx.req.set_header('error_msg',msg)
    ngx.exit(500)
end