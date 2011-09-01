module(...,package.seeall)

local CGI = {
    args = ngx.req.get_uri_args()
}

function CGI:new ()
    local o = {}
    setmetatable(o, self)  
    self.__index = self
    return o
end

function CGI:get_str(name, def)
    if self.args[name] == nil then
        self.args[name] = def
    end
    if type(self.args[name]) == 'table' then
        return table.concat(self.args[name],', ')
    end
    return self.args[name]
end

function CGI:get_int(name, def)
    return tonumber(CGI:get_str(name, def))
end

function CGI:send_error(code, msg)
    -- hack: 把错误代码传递到错误页 error.lua
    ngx.req.set_header('error_code',msg)
    ngx.req.set_header('error_msg',msg)
    ngx.exit(403)
end

return CGI