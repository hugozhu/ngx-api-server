-- 类似servlet，一个worker只有一个对象
module(...,package.seeall)

local data = {} -- 注意这个变量是多个请求共享的

function execute(cgi)
    local cust_id    = cgi.session.custid
    local start_date = date(cgi:get_str('start_date','2011-07-30'))
    local end_date   = date(cgi:get_str('end_date','2011-09-30'))

    --SQL绑定变量
    local binding = db.new_binding()
    
    local table   = db.table_name('t_basic_adgroup_'..start_date:fmt('%Y%m'))

    local where_date = string.format("date between '%s' and '%s'", start_date:fmt("%Y-%m-%d"), end_date:fmt("%Y-%m-%d"))

    local sql = '(select * from %s where custId=%d and %s order by date)'
    binding.add(table, cust_id, where_date)

    local next_month = start_date:addmonths(1)
    while next_month <= end_date do
        table = db.table_name('t_basic_adgroup_'..next_month:fmt('%Y%m'))
        sql = sql .. ' union (select * from %s where custId=%d and %s order by date)'
        binding.add(table, cust_id, where_date)
        next_month = next_month:addmonths(1)
    end

    db.output(db.backend(), sql, binding, ngx.var.arg_format)
end
