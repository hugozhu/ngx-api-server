module(...,package.seeall)

local des56 = require("des56")

function execute(cgi)
    local a = cgi:get_str('txt')
    db.output(db.get_backend(1,'ab'), 'show tables;', {} , 'csv')
    return true
end
