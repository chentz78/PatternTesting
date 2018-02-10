require("init")
local U = require("Util")

--local t = {"C","D","E"}
local t = {["D"]=1, ["F"]=2,["Z"]=3}
print("Random iterator")
for k,v in U.randomIterator(t) do
  print("tab:", k,v)
end

local a,b = 1,10
local fr = U.randomExc(a,b)
local r = fr()
while r do
  print("OutR",r)
  r = fr()
end