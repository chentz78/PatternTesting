--http://www.wolframalpha.com/input/?i=163+choose+1
-- Mathematica "n choose k"
require("init")
local EP = require("EqPart")
local BT = require("BenchTimer")

local negSym = "\\"
local nPatt = tonumber(arg[1]) or 2

--PPC
print("Pattern Coverage")
print("Pattern Set Size:", nPatt)
local TRSize = EP.TRSizePPC(nPatt)
print("Requirement Set Size:", TRSize)

local fName = "PatternPPC.ts"
local f = io.open(fName,"w")

local tmr = BT.new()
tmr:start()
local fGen = EP.GenPPC(nPatt,"p", negSym)
local r = fGen()
local c = 0
while r do
  f:write(string.format("%s\n", r[1]))
  r = fGen()
  c = c+1
end
assert(c == TRSize, string.format("Wrong count! c: %d, TRSize: %d", c, TRSize))
f:flush()
f:close()
tmr:stop()
local _, t = tmr:timeSum()
_ = (t/TRSize)
print("Timer PPC:", t, _,string.format("%.0f",86400/_))

--ECPC
print("Each-Choice Pattern Coverage")
print("Pattern Set Size:", nPatt)
TRSize = EP.TRSizeECPC(nPatt)
print("Requirement Set Size:", TRSize)

fName = "PatternECPC.ts"
f = io.open(fName,"w")

tmr = BT.new()
tmr:start()
fGen = EP.GenEC(nPatt,"p", negSym)
r = fGen()
c = 0
while r do
  f:write(string.format("%s\n", r[1]))
  --print(r[1])
  r = fGen()
  c = c+1
end
assert(c == TRSize, string.format("Wrong count! c: %d, TRSize: %d", c, TRSize))
f:flush()
f:close()
tmr:stop()
_, t = tmr:timeSum()
_ = (t/TRSize)
print("Timer EC:", t, _, string.format("%.0f",86400/_) )