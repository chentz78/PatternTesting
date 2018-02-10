local ns = "int b; b = 0"

SS_Name = 'build'

initDecl = "list[int] a = []"

tSS = {
  ["p1"] = "a[0] = 0", --p5221
  ["p2"] = "a[0..0] = []", --p5266
  ["p3"] = "a[0..0] = []", --p5269
  ["p4"] = "a[0,0..0] = []", --p5300
  ["p5"] = "a[0,0..0] = []", --p5306
  ["\\p1"] = "a[0+1] = 0",
  ["\\p2"] = ns,
  ["\\p3"] = ns,
  ["\\p4"] = ns,
  ["\\p5"] = ns
}

tPLS = {
  {"p1", "p5221"},
  {"p2", "p5266"},
  {"p3", "p5269"},
  {"p4", "p5300"},
  {"p5", "p5306"}
}

local fName = SS_Name..".pls"
f = io.open(fName,"w")
for k,t in ipairs(tPLS) do
  f:write(string.format("//%s -> %s\n",t[1],t[2]))
end
f:flush()
f:close()

