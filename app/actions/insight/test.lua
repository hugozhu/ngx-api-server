module(...,package.seeall)

function execute(cgi)
    db.output('db_1_a', 'show tables;', {} , 'csv')
    return true
end
