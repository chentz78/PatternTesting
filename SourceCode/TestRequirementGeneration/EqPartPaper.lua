require("init")
require("EqPart")

local Set = require("Set")
local U = require("Util")
local Comb = require("Combinatorics")

local negSym = "\\"
local nPatt = tonumber(arg[1]) or 8

print("Patt number:", nPatt) 
local n = nPatt
local sP = Set.new(U.tableGen(nPatt,"p"))
local sNP = Set.new(U.tableGen(nPatt,negSym.."p"))

local rS = sP + sNP

local i
print("Starting TR_ECPC...")
print("Size: ", Comb.CobinationCount(n,1))
print("Size Final: ", countCombi(n,1) )
local TR_ECPC = convertNumToStringNotation(ECPC(n),sP, sNP)
--print(U.tostring(TR_ECPC))
print("TR_ECPC:",tableToString(TR_ECPC))

print("Starting TR_PWPC...")
local t = os.clock()
print("Size: ", Comb.CobinationCount(n,2))
print("Size Final: ", countCombi(n,2) )
print("Count time: ", os.clock()-t)

t = os.clock()
local TR_PWPC = convertNumToStringNotation(PWPC(n),sP, sNP)
print("TR Gen Time:",os.clock()-t)
print("TR_PWPC:",tableToString(TR_PWPC))

print("Starting TR_ACPC...")
t = os.clock()
print("Size: ", Comb.CobinationCount(n,n))
print("Size Final: ", countCombi(n,n) )
print("Count Time:",os.clock()-t)

t = os.clock()
local TR_ACPC = convertNumToStringNotation(ACPC(n),sP, sNP)
print("TR Gen Time:", os.clock()-t)
print("TR_ACPC:",tableToString(TR_ACPC))

--[==[
print("Starting generating test cases...")

--[[Case paper.]]
local tabPatt = {
  Desc = "Paper",
  tempBegin = "public class id0 { static {",
  tempEnd = "} }",
  p1 = "while (false) { return ; }",
  p2 = "for (  ;  ;  ) { return ; }",
  p3 = "for (  :  ) { return ; }",
  neg = "if (id1 && true) { return ; }"
}

print("Generating ECPC TC Set...")
local r = genTestCases(TR_ECPC, tabPatt)
print("TC Card:", r:card())
i=1
for k,v in pairs(r) do
  print("tc:", i,k,v)
  i=i+1
end

r = genTestCases(TR_PWPC, tabPatt)
print("TC Card:", r:card())
i=1
for k,v in pairs(r) do
  print("tc:", i,k,v)
  i=i+1
end

r = genTestCases(TR_ACPC, tabPatt)
print("TC Card:", r:card())
i=1
for k,v in pairs(r) do
  print("tc:", i,k,v)
  i=i+1
end
]==]