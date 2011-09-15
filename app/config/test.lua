-- 继承了dev环境的配置
require("app.config.dev")

config = _G.config

config.cluster = 'test'

config.debug = false
