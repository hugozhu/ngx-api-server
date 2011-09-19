require("base_test")

local cgi = require("lib.CGI"):new();

print(cgi:today())
print(cgi:yesterday())