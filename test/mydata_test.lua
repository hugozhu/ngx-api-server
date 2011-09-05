local mydata = require ('mydata')

local a = mydata:new()
local b = mydata:new()

b:set_val('b')
b:set_name('nameb')

print(a:get_val()) -- = b ??
print(a:get_name())