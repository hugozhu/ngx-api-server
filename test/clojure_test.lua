local foo = 'foo'

local func = function()
    print(foo)
end

foo = 'bar'
func()
