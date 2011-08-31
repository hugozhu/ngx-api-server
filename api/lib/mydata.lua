module(...,package.seeall)

local mydata = {
    val = 0
}

function mydata:new (o)
    o =  o or {} -- create object if user does not provide one setmetatable(o, self)
    setmetatable(o, self)    
    self.__index = self
    return o
end

function mydata:set_val(s) 
    self.val = s
end

function mydata:get_val()
    return self.val
end

return mydata;