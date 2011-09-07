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
    return 0,0,0
end

function output(mybackend , sql, binding, fmt)
    if binding == nil then
        ngx.var._sql = sql
    else
        ngx.var._sql = string.format(sql, unpack(binding))
    end

    ngx.var._backend = mybackend

    local location
    if fmt == 'csv' then
        location = '/export_in_csv'
    else
        location = '/export_in_json'
    end

    ngx.exec(location)
end

function query(backend , sql, binding)
    if  binding == nil then
        ngx.var._sql = sql
    else
        ngx.var._sql = string.format(sql, unpack(binding))
    end
    ngx.var._backend = backend    
    
    return ngx.location.capture('/export_in_rds')   
end
