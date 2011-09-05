package.path = '../api/?.lua'

local crc32 = require("lib.crc32")

print(crc32.hash(arg[1]))
