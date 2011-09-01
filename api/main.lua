--引用公用模块
debug = require("lib.debug") 
CGI   = require("lib.CGI")
db    = require("lib.db")
date  = require("lib.date")
crc32 = require("lib.crc32")

--初始化
ngx.header['Server'] = ngx.var._server_name


local action = require("actions.insight.adgroup")
action.execute(CGI:new())

ngx.exit(200)

--最后失败输出
cgi.send_error(403, 'invalid access')