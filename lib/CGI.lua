module(..., package.seeall)

getmetatable(lib.CGI).__newindex = function (table, key, val)
    error('Attempt to write to undeclared variable "' .. key .. '": '
            .. debug.traceback())
end

local date = require("lib.date")

local CGI = {
    params = {}
}

function CGI:new ()
    local o = {params = {}}
    for key, val in pairs(ngx.req.get_uri_args()) do
        if type(val) == "table" then
            o.params[key] = table.concat(val, ", ")
        else
            o.params[key] = val
        end
    end
    setmetatable(o, self)
    self.__index = self
    return o
end

function CGI:get_str(name, def)
    return self.params[name] or def
end

function CGI:get_int(name, def)
    def = tonumber(def) or 0
    return tonumber(self:get_str(name)) or def
end

function CGI:get_date(name, def)
    local s   = self:get_str(name,"")
    local i,j = string.find(test,"%d%d%d%d%-[01]+[%d]?-[0123]+[%d]?")
    if i==1 and j==string.len(s) then
        return date(s)
    end
    return nil
end

function CGI:today()
    return date()
end

function CGI:send_error(code, msg)
    -- hack: 把错误代码传递到错误页 error.lua
    ngx.status = code
    ngx.req.set_header('error-msg',msg)
    ngx.exec("/error")
end

return CGI
