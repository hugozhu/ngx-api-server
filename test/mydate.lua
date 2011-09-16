module(...,package.seeall)

date = {}
local date = date
setmetatable(date, date)

function date:__call(...)
    return 'hello'
end

return date
