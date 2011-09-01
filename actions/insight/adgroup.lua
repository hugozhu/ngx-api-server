module(...,package.seeall)

function execute(cgi)
    local cust_id    = cgi:get_int('custid', 0)
    local start_date = date('2011-07-30')
    local end_date   = date('2011-09-30')
    
    --SQL绑定变量
    local binding = db.new_binding()
    
    local table = 't_basic_adgroup_'..start_date:fmt('%Y%m')
    
    local where_date = string.format("date between '%s' and '%s'", start_date:fmt("%Y-%m-%d"), end_date:fmt("%Y-%m-%d"))
    
    local sql = '(select * from %s where custId=%d and %s order by date)'
    binding.add(table, cust_id, where_date)
    
    local next_month = start_date:addmonths(1)
    while next_month <= end_date do
        table = 't_basic_adgroup_'..next_month:fmt('%Y%m')
        sql = sql .. ' union (select * from %s where custId=%d and %s order by date)'   
        binding.add(table, cust_id, where_date)
        next_month = next_month:addmonths(1)
    end
    
    db.output(db.get_backend(cust_id,'ab'), sql, binding, ngx.var.arg_format)
end