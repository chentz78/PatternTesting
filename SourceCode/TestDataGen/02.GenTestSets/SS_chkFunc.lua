SS_Name = 'chkFunc'

--initDecl = "list[int] a = []"

testAPIf = "tcModule"

notClose = true

local ns = "public int a;"

tPLS = {
  {"p1", "p6444"}
}

tSS = {
  ["p1"] = "public void f() { int a; }",
  ["\\p1"] = ns
}

local fName = SS_Name..".pls"
f = io.open(fName,"w")
for k,t in ipairs(tPLS) do
  f:write(string.format("//%s -> %s\n",t[1],t[2]))
end
f:flush()
f:close()

