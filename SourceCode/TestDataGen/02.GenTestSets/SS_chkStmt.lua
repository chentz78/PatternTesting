local ns = "void f();"

SS_Name = 'chkStmt'

notClose = true

tPLS = {
  {"p1", "p4388"},
  {"p2", "p4438"},
  {"p3", "p4515"},
  {"p4", "p4586"},
  {"p5", "p4663"},
  {"p6", "p4717"},
  {"p7", "p4778"},
  {"p8", "p4814"},
  {"p9", "p4826"},
  {"p10", "p4846"},
  {"p11", "p4956"},
  {"p12", "p5037"},
  {"p13", "p5072"},
  {"p14", "p5097"},
  {"p15", "p5097"},
  {"p16", "p5098"},
  {"p17", "p5108"},
  {"p18", "p5108"},
  {"p19", "p5109"},
}

initDecl = "int a"

tSS = {
  ["p1"] = "n0: top-down visit(a) { case int i =\\\\> i }", 
  ["p2"] = "n0: while(a==0) { a += 1; }", 
  ["p3"] = "n0: do { a += 1; } while (a==0);", 
  ["p4"] = "n0: for (int i := a) { a += 1; }",
  ["p5"] = "n0: if (a == 0) { a += 1; }",
  ["p6"] = "n0: if (a == 0) { a += 1; } else { a +=1; }",
  ["p7"] = "n0: switch(a) { case int i : a +=1; }",
  ["p8"] = "n0: for (int i := a) { fail n0; }",
  ["p9"] = "n0: for (int i := a) { break n0; }",
  ["p10"] = "n0: for (int i := a) { continue n0; }",
  ["p11"] = "n0: { a +=1; }",
  ["p12"] = "n0: top-down visit(a) { case int i : insert i; }",
  ["p13"] = "n0: for (int i := a) { append i; }",
  ["p14"] = "int b0;",
  ["p15"] = "dynamic int b1;",
  ["p16"] = "int b2,b3;",
  ["p17"] = "a = a + 0;",
  ["p18"] = "a;",
  ["p19"] = "int b4=0;",
  ["\\p1"] = ns, 
  ["\\p2"] = ns, 
  ["\\p3"] = ns, 
  ["\\p4"] = ns, 
  ["\\p5"] = ns,
  ["\\p6"] = ns,
  ["\\p7"] = ns,
  ["\\p8"] = ns,
  ["\\p9"] = ns,
  ["\\p10"] = ns,
  ["\\p11"] = ns,
  ["\\p12"] = ns,
  ["\\p13"] = ns,
  ["\\p14"] = ns,
  ["\\p15"] = ns,
  ["\\p16"] = ns,
  ["\\p17"] = ns,
  ["\\p18"] = ns,
  ["\\p19"] = ns
}

local fName = SS_Name..".pls"
f = io.open(fName,"w")
for k,t in ipairs(tPLS) do
  f:write(string.format("//%s -> %s\n",t[1],t[2]))
end
f:flush()
f:close()

