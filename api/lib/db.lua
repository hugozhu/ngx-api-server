module(...,package.seeall)

local db = {
    'a', 'b'
}

function get_backend(member_id, flag)
    local hash = 1;
    if flag == 'a' then
        
    elseif flag == 'b' then
        
    end 
end

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
        _,_,y,m,d=string.find(date_str, "(%d+)-(%d+)-(%d+)")
        return tonumber(y),tonumber(m),tonumber(d)
    end
    return 0,0,0
end

function output(backend , sql, binding, fmt)
    if binding == nil then
        ngx.var._sql = sql
    else
        ngx.var._sql = string.format(sql, unpack(binding))
    end    
    
    ngx.var._backend = backend
    
    if fmt == 'csv' then
        ngx.exec('/export_in_csv')
    else
        ngx.exec('/export_in_json')
    end    
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