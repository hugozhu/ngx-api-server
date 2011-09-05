---
-- 构建一张只读表
-- Created by IntelliJ IDEA.
-- User: hugozhu
-- Date: 9/4/11
-- Time: 11:27 PM
--
module(...,package.seeall)

function new (t)
    local o = {}
    local mt = {
      __index = t,
      __newindex = function (t,v,k) error("attemp to change config") end
    }
    setmetatable(o, mt)
    return o
end
