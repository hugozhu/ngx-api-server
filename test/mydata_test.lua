require("base_test")

local mydata = require ('lib.mydata')

local a = mydata:new()
local b = mydata:new()

b:set_val('b')
b:set_name('nameb')

print(a:get_val()) -- = b ??
print(a:get_name())

b.new_key = 'hello'

print(a.new_key)
print(b.new_key)
