config = _G.config

config.cluster = 'cm4'

config.redis_servers = {
   {host = '127.0.0.1:6379'},
   {host = 'localhost:6379'},
}

config.database_servers = {
    ['db_1'] = {
        server_a   = 'localhost',
        server_b   = '127.0.0.1',
        username   = 'root',
        password   = '',
        hash_range = {{1,125}, {901,910}, {981,982}},
    },

    db_2 = {
        server_a   = 'localhost',
        hash_range = {{126,250}, {911,920}, {983,984}},
    },

    db_3 = {
        server_a   = 'localhost',
        hash_range = {{251,375}, {921,930}, {985,986}},
    },

    db_4 = {
        server_a   = 'localhost',
        hash_range = {{376,400}, {931,940}, {987,988}},
    },

    db_5 = {
        server_a   = 'localhost',
        hash_range = {{401,525}, {941,950}, {989,990}},
    },

    db_6 = {
        server_a   = 'localhost',
        hash_range = {{526,650}, {951,960}, {991,994}},
    },

    db_7 = {
        server_a   = 'localhost',
        hash_range = {{651,775}, {961,970}, {995,997}},
    },

    db_8 = {
        server_a   = 'localhost',
        hash_range = {{776,900}, {971,980}, {998,1000}},
    },
}
