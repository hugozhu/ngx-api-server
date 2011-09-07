module(...,package.seeall)

function is_array(table)
    local max = 0
    local count = 0
    for k, v in pairs(table) do
        if type(k) == "number" then
            if k > max then max = k end
            count = count + 1
        else
            return -1
        end
    end
    if max > count * 2 then
        return -1
    end

    return max
end

function serialise_table(value, indent, depth)
    local spacing, spacing2, indent2
    if indent then
        spacing = "\n" .. indent
        spacing2 = spacing .. "  "
        indent2 = indent .. "  "
    else
        spacing, spacing2, indent2 = " ", " ", false
    end
    depth = depth + 1
    if depth > 50 then
        return "Cannot serialise any further: too many nested tables"
    end

    local max = is_array(value)

    local comma = false
    local fragment = { "{" .. spacing2 }
    if max > 0 then
        -- Serialise array
        for i = 1, max do
            if comma then
                table.insert(fragment, "," .. spacing2)
            end
            table.insert(fragment, serialise_value(value[i], indent2, depth))
            comma = true
        end
    elseif max < 0 then
        -- Serialise table
        for k, v in pairs(value) do
            if comma then
                table.insert(fragment, "," .. spacing2)
            end
            table.insert(fragment, string.format(
                "[%s] = %s", serialise_value(k, indent2, depth),
                             serialise_value(v, indent2, depth))
            )
            comma = true
        end
    end
    table.insert(fragment, spacing .. "}")

    return table.concat(fragment)
end

function serialise_value(value, indent, depth)
    if indent == nil then indent = "" end
    if depth == nil then depth = 0 end

    if type(value) == "string" then
        return string.format("%q", value)
    elseif type(value) == "nil" or type(value) == "number" or
           type(value) == "boolean" then
        return tostring(value)
    elseif type(value) == "table" then
        return serialise_table(value, indent, depth)
    else
        return "\"<" .. type(value) .. ">\""
    end
end

function dump(value)
    ngx.print(serialise_value(value).."\n")
    ngx.exit(200)
end

function log(value)
    ngx.log(ngx.ERR, serialise_value(value))
end

function dump_value(value)
    return serialise_value(value)
end
