#!/usr/bin/env lua
---
-- Created by IntelliJ IDEA.
-- User: hugozhu
-- Date: 9/13/11
-- Time: 11:01 PM
-- To change this template use File | Settings | File Templates.
--

local template = require("lib.Template")

for i,v in ipairs(arg) do
    require(v)
end

comment = '#'

local input = io.read("*all")
local output = ''

local result, message = template.preprocess(
    {
        input  = input,
        output = output,
        lookup = _G,
        strict=strict,
    }
)

if message then
    error(message)
else
    io.write(result)
end
