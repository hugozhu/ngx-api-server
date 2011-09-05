---
--
-- Created by IntelliJ IDEA.
-- User: hugozhu
-- Date: 9/4/11
-- Time: 11:21 PM
--
module(...,package.seeall)

function from(str)
    if type(str) ~= 'string' then
        error("input argument should be a string")
    end
    local session = {}

    return session
end
