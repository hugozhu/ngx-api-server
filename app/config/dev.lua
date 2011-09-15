_G.log.debug = function(s) ngx.log(ngx.ERR, "[ debug ]\n"..tostring(s).."\n") end

config = _G.config

config.cluster = 'dev'

config.debug = true

config.nginx.port = 8080

config.redis_servers = {
   {host = '127.0.0.1:6379'},
   {host = 'localhost:6379'},
}

config.database_servers = {
    db_1 = {
        server_a   = 'localhost',
        server_b   = '127.0.0.1',
        username   = 'root',
        password   = '',
        hash_range = {{1,1000}},
    },
}
