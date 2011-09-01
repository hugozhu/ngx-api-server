module(...,package.seeall)

local mydata = {
    values = {},
    name = ''
}

function mydata:new (o)
    local o =  o or {} -- create object if user does not provide one setmetatable(o, self)
    setmetatable(o, self)    
    self.__index = self
    return o
end

function mydata:set_name(s)
    self.name = s
end

function mydata:get_name()
    return self.name
end

function mydata:set_val(s) 
    self.values.val = s
end

function mydata:get_val()
    return self.values.val
end

return mydata;