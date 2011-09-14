local template = require("lib.Template")
local app = require("app/global")

local input = io.read("*all")
local output = ''

comment = '#'

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
