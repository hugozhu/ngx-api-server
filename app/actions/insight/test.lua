module(...,package.seeall)

function execute(cgi)
    db.output(db.get_backend(1,'ab'), 'show tables;', {} , 'csv')
    return true
end
