module(...,package.seeall)

function execute(cgi)
    db.output('db-1', 'show tables;', {} , 'csv')
    return true
end
