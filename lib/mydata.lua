module(...,package.seeall)

local mydata = {
    values = {},
    name = 'default'
}

function mydata:new ()
    --生成一个clone对象先，注意对table类型的字段需要重新初始化一次，或者会指向mydata.values初始化的那个table
    local o = {values={}}
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