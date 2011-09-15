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
    return date(self:get_str(name, def))
end


function CGI:send_error(code, msg)
    -- hack: 把错误代码传递到错误页 error.lua
    ngx.req.set_header('error-msg',msg)
    ngx.exit(code)
end

return CGI
