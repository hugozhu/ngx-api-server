module(...,package.seeall)

function execute(cgi)
    local sql = [[
    show tables;
    ]]

    if cgi:get_str('fmt') == 'rds' then
        local rds = db.query('db_1_a', sql, {})
        local parser = require "rds.parser"

        local res, err = parser.parse(rds)

        if res == nil then
            error("failed to parse: " .. err)
        end

        ngx.print(res.errcode)
        ngx.print(res.errstr)
        ngx.print(res.insert_id)
        ngx.print(res.affected_rows)

        local rows = res.resultset
        if rows then
            for i, row in ipairs(rows) do
                for col, val in pairs(row) do
                    if val ~= parser.null then
                        ngx.print(col .. ": " .. val)
                    end
                end
            end
        end
        ngx.print("\n")
    else
        db.output('db_1_a', sql, {} , cgi:get_str('fmt'))
    end
    return true
end
