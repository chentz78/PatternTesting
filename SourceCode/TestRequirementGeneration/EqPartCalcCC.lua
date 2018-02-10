--[[
Specification to generate test requirement and test cases to CalcCC algorithm.
]]

require("init")
require("EqPart")

local Set = require("Set")
local U = require("Util")
local Comb = require("Combinatorics")

--Case config
local negSym = "\\"
local nPatt = 16
local n = nPatt

local tabPatt = {
  Desc = "CalcCC",
  tempBegin = "public class id0 {",
  tempEnd = "}",
  p1 = "final void id1() { if (true) return ; }",
  p2 = "final void id2() { if (true) { return ;} else { return ; } }",
  p3 = "final void id3() { switch (v3) { case 1: break; default: break; } }",
  p4 = "final void id4() { do { return ; } while (false); }",
  p5 = "final void id5() { while (false) { return ; } }",
  p6 = "final void id6() { for (  ;  ) { return ; } }",
  p7 = "final void id7() { for (  ;  ; ) { return ; } }",
  p8 = "final void id8() { for (  :  ) { return ; } }",
  p9 = "final void id9() { try { return ; } catch( IOException e ) { return ; } }",
  p10 = "final void id10() { bool b = false ? true : false ; }",
  p11 = "final void id11() { bool b = true && false ; }",
  p12 = "final void id12() { bool b = false || true ; }",
  
  p13 = "final void id13() { bool b = false ; }",
  p14 = "public id0() { super(); }",
  p15 = "{ bool b = false; }",
  p16 = "static { bool b := false; }",

  neg = "final bool b0 = false;"
}

local sP = Set.new(U.tableGen(nPatt,"p"))
local sNP = Set.new(U.tableGen(nPatt,negSym.."p"))

local i
print("Generating the TR...")
print("Starting TR_PPC...")
print("Size Final: ", n)
local TR_PPC = convertNumToStringNotation(Comb.CobinationTable(n,1),sP, sNP)
print("TR_PPC:",tableToString(TR_PPC))

print("Starting TR_ECPC...")
print("Size Final: ", countCombi(n,1) )
local TR_ECPC = convertNumToStringNotation(ECPC(n),sP, sNP)
print("TR_ECPC:",tableToString(TR_ECPC))

print("Starting TR_PWPC...")
print("Size Final: ", countCombi(n,2) )
local TR_PWPC = convertNumToStringNotation(PWPC(n),sP, sNP)
print("TR_PWPC:",tableToString(TR_PWPC))

print("Starting TR_ACPC...")
print("Size Final: ", countCombi(n,n) )
local TR_ACPC = convertNumToStringNotation(ACPC(n),sP, sNP)
print("TR_ACPC:",tableToString(TR_ACPC))

print("Starting generating test cases...")
print("Generating PPC TC Set...")
local r = genTestCases(TR_PPC, tabPatt, "PPC", true)
print("TC Card:", r:card())
i=1
for k,v in pairs(r) do
  print("tc:", i,k,v)
  i=i+1
end

print("Generating ECPC TC Set...")
local r = genTestCases(TR_ECPC, tabPatt, "ECPC", true)
print("TC Card:", r:card())
i=1
for k,v in pairs(r) do
  print("tc:", i,k,v)
  i=i+1
end

r = genTestCases(TR_PWPC, tabPatt, "PWPC", true)
print("TC Card:", r:card())
i=1
for k,v in pairs(r) do
  print("tc:", i,k,v)
  i=i+1
end