config = _G.config

config.cluster = 'dev'

config.debug = true

config.nginx.port = 8080

config.redis_servers = {
   {host = '127.0.0.1:6379'},
   {host = 'localhost:6379'},
}
