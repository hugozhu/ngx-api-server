module(...,package.seeall)


function execute(cgi)
    cgi:send_error(404, 'haha')
    return true
end