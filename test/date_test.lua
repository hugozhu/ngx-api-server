require("base_test")
local date = require("lib.date")

local date2 = require("test.mydate")

print(date("2011-01-01"))
print(date2("2011-01-01"))


local test = "2011-02-12"

test=tostring(test)

local i,j = string.find(test,"%d%d%d%d%-[01]+[%d]?-[0123]+[%d]?")
print(i)
print(j)
print(string.len(test))
if i==1 and j==string.len(test) then
    print("yes")
end


local today = date()
today:adddays(-1)
print(today)

