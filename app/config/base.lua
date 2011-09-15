--全局变量和函数，请注意全局变量名很容易污染命名空间

--根据用户的ID以及redis中的读写库设置（custid 或 memberid）来获得数据库连接ID

--只读配置
_G.config = {
    cluster = 'base',
    debug = false,
    session_secret = 'taobao_BP_API_0.1',
    session_timeout = 60 * 60 * 8,

    nginx = {
        port=80,
    },

    redis_servers = {

    },

    database_prefix = 'insight_',

    database_servers = {

    }
}

local _db_flags = {'a', 'b' }

_G.log = {
    debug=function(s) end,
    error=function(s) ngx.log(ngx.ERR, tostring(s)) end
}

-- 返回传入用户对应的数据库分库，以及该分库所位于的主机ID
_G.get_db_info = function (custid)
    if custid==nil or type(custid)~='number' then
        error("wrong argument custid, must be number")
    end

    local parser = require "redis.parser"

    local db = 'db_0'

    --一共拆分成1000个数据库
    local hash = custid % 1000
    if hash == 0 then hash = 1000 end

    for k, v in pairs(config.database_servers) do
        for i, range in ipairs(v.hash_range) do
            if hash >= range[1] and hash <= range[2] then
                db = k
                break
            end
        end
    end

    local res = ngx.location.capture("/redis",
                    {   method = ngx.HTTP_PUT,
                        body = parser.build_query({'GET', db})
                    }
    )

    local res, typ = parser.parse_reply(res.body)

    local flag = res or 'ab'

    if flag ~= 'a' or flag ~= 'b' then
        flag = _db_flags[math.random(2)]
    end

    return config.database_prefix..hash, db..'_'..flag
end
