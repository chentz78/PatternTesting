local ns = "int n = 0"

SS_Name = 'extract'

--initDecl = "list[int] a = []"

--testAPIf = "tcModule"

tPLS = {
  {"p1", "p3078"},
  {"p2", "p3110"}
}

tSS = {
  ["p1"] = "(a <- l)", 
  ["p2"] = "int b := (a <- l)",  
  ["\\p1"] = ns,
  ["\\p2"] = ns  
}

local fName = SS_Name..".pls"
f = io.open(fName,"w")
for k,t in ipairs(tPLS) do
  f:write(string.format("//%s -> %s\n",t[1],t[2]))
end
f:flush()
f:close()

