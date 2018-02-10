local ns = "void f()"

SS_Name = 'chkDecl'

--initDecl = "list[int] a = []"

testAPIf = "tcModule"

tPLS = {
  {"p1", "p5868"},
  {"p2", "p5868"},
  {"p3", "p5875"},
  {"p4", "p5875"},
  {"p5", "p5876"},
  {"p6", "p5996"},
  {"p7", "p6039"},
  {"p8", "p6061"}
}

tSS = {
  ["p1"] = "public int a1 = 0+0", 
  ["p2"] = "public int a2", 
  ["p3"] = "public int a3 = 0+0", 
  ["p4"] = "public int a4", 
  ["p5"] = "public int a5 = 0+0",
  ["p6"] = "data d6(int a=0)", 
  ["p7"] = "data d7(int a=0) = d7()", 
  ["p8"] = "data d8(int a = 0, int b = 0) = d8()", 
  ["\\p1"] = ns,
  ["\\p2"] = ns,
  ["\\p3"] = ns,
  ["\\p4"] = ns,
  ["\\p5"] = ns,
  ["\\p6"] = ns,
  ["\\p7"] = ns,
  ["\\p8"] = ns
}

local fName = SS_Name..".pls"
f = io.open(fName,"w")
for k,t in ipairs(tPLS) do
  f:write(string.format("//%s -> %s\n",t[1],t[2]))
end
f:flush()
f:close()

