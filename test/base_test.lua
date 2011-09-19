package.path = '../?.lua'

ngx = {
    req={
        get_uri_args=function() return {} end,
    },
}