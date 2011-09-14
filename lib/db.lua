-- 数据库操作类

module(...,package.seeall)

--每张报表保存在A，B两个数据库，正常情况随机选择一个库，A库导入的时候，则只选择B库查询
--通过redis的一个key对应的值来指定
local _db = {
    'a', 'b'
}


function table_name(t)
    return ngx.ctx.database.."."..t
end

function database()
    return ngx.ctx.database
end

function backend()
    return ngx.ctx.backend
end

--新生成一个SQL绑定变量
function new_binding()
    local binding = {}
    binding.add_str = function (val)
        table.insert(binding, val)
    end
    
    binding.add_str_q = function (val)
        table.insert(binding, quote(val))
    end
    
    binding.add_int = function (val)
        if val == nil then val = 0 end
        if type(val) == 'string' then val = tonumber(val) end
        table.insert(binding, val)
    end    
    
    binding.add = function (...)
        local n = select('#', ...)
        for i = 1,n do
            local v = select(i, ...)
            table.insert(binding, v)
        end
    end

    binding.__tostring = function () 
        local s = '' 
        for i,v in ipairs(binding) do
            s = s ..' '..v
        end
        return s
    end    
    return binding
end

function quote(var)
    return ngx.quote_sql_str(var)
end

function parse_date_str(date_str)
    if (date_str) then
        local _,_,y,m,d=string.find(date_str, "(%d+)-(%d+)-(%d+)")
        return tonumber(y),tonumber(m),tonumber(d)
    end
    return 1977,1,1
end

function output(mybackend , sql, binding, fmt)
    if binding ~= nil then
        sql = string.format(sql, unpack(binding))
    end
    local location
    if fmt == 'csv' then
        location = '/mysql_to_csv'
    else
        location = '/mysql_to_json'
    end
    ngx.var._backend = mybackend
    ngx.var._sql     = sql

    if config.debug then
        _debug.log(mybackend..': '..sql)
    end

    ngx.exec(location)
    --ngx.exec 不能POST，所以通过变量传递
    --ngx.exec(location,'backend='..mybackend..'&sql='..ngx.escape_uri(sql))
end


--
function query(mybackend , sql, binding)
    if binding ~= nil then
        sql = string.format(sql, unpack(binding))
    end

    if config.debug then
        _debug.log(mybackend..': '..sql)
    end

    --ngx.location.capture 不能继承ngx.var.arg，所以通过POST变量传递
    local res = ngx.location.capture('/mysql_to_rds',
                {
                    method=ngx.HTTP_POST,
                    body=sql,
                    args={backend=mybackend,sql=sql}
                }
            )

    if res.status == 200 or res.status == 201 then
         if res.body == nil then
             return error("nothing returned by db")
         end
         return res.body
    end

    if res.status == 504 then
        local tid = res.header["X-Mysql-Tid"]
        if tid then
            tid = tonumber(tid)
            ngx.location.capture('/export_in_json',{ args={backend=mybackend,sql='kill query '..tid} })
        end
    end
end
