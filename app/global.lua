--全局变量和函数，请注意全局变量名很容易污染命名空间

--根据用户的ID以及redis中的读写库设置（custid 或 memberid）来获得数据库连接ID

--只读配置
_G['config'] = require("lib.Config").new({
    debug = true,
    session_secret = 'taobao_BP_API_0.1',
    database_prefix = 'insight_',
    databases = {
        db_1 = {
            hash_range = {{1,125}, {901,910}, {981,982}},
        },

        db_2 = {
            hash_range = {{126,250}, {911,920}, {983,984}},
        },

        db_3 = {
            hash_range = {{251,375}, {921,930}, {985,986}},
        },

        db_4 = {
            hash_range = {{376,400}, {931,940}, {987,988}},
        },

        db_5 = {
            hash_range = {{401,525}, {941,950}, {989,990}},
        },

        db_6 = {
            hash_range = {{526,650}, {951,960}, {991,994}},
        },

        db_7 = {
            hash_range = {{651,775}, {961,970}, {995,997}},
        },

        db_7 = {
            hash_range = {{776,900}, {971,980}, {998,1000}},
        },
    }
})

local _db_flags = {'a', 'b' }

-- 返回传入用户对应的数据库分库，以及该分库所位于的主机ID
_G.get_db_info = function (custid)
    if type(custid)~='number' then
        error("wrong argument custid "..custid)
    end

    local parser = require "redis.parser"

    local db = 'db_0'

    --一共拆分成1000个数据库
    local hash = custid % 1000
    for k, v in pairs(config.databases) do
        for i, range in ipairs(v.hash_range) do
            if hash >= range[1] and hash <= range[2] then
                db = k
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
        flag = _db_flags[math.random(1)]
    end

    return config.database_prefix..hash, db..'_'..flag
end
