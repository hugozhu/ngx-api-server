config = _G.config

config.debug = true

config.cluster = 'dev'

config.nginx.port = 8080

config.redis_servers = {
   {host = '127.0.0.1:6379'},
   {host = 'localhost:6379'},
}
