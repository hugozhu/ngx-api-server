require("base_test")

local config = require("lib.Config").new({
    foo='foo',
    bar='bar'
})
print(config.foo)
config.foo = 'foo2'