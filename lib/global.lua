function not_nil_string(s, def)
    def = def or ''
    if s == nil then
        return def
    end
    return s
end

function is_empty_string(s)
    if s == nil then
        error("is_empty_string requires string as argument")
    end

    if s == '' then
        return true
    end

    return false
end

function split(d,p)
  local t, ll
  t={}
  ll=0
  if(#p == 1) then return {p} end
    while true do
      local l=string.find(p,d,ll,true) -- find the next d in the string
      if l~=nil then -- if "not not" found then..
        table.insert(t, string.sub(p,ll,l-1)) -- Save it in our array.
        ll=l+1 -- save just after where we found it for searching next time.
      else
        table.insert(t, string.sub(p,ll)) -- Save what's left in our array.
        break -- Break at end, as it should be, according to the lua manual.
      end
    end
  return t
end
