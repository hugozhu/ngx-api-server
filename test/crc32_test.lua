package.path = '../?.lua'

function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end

local crc32 = require("lib.crc32")

local strs = {'a','','1','0',0x1,'我','hello','world',' ', "我的测试 字符串",'ab d ab d 我的ab d ab d ab d '}

for i,v in ipairs(strs) do
    local java_result = os.capture("java CRC32 \""..v.."\"",false)
    local lua_result  = crc32.hash(v)
    if lua_result~=java_result then
        error("failed test")
    end
    print(crc32.hash(v).."  "..java_result)
end
