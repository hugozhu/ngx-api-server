require("base_test")

local config = require("lib.Config").new({
    foo='foo',
    bar='bar',
    arr = {foo='foo2'}
})
config.arr.foo = 'hello'
