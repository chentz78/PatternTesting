require("init")
require("EqPart")

local Set = require("Set")
local U = require("Util")
local Comb = require("Combinatorics")
local EP = require("EqPart")

local DG = require("openssl").digest

local negSym = "\\"
local nPatt = tonumber(arg[1]) or 16
local pre = arg[2] or "p"
local printLim = 1000

print("All-combinations Pattern Coverage")
--110,129,802 per hour 8 elem comb
--630,689 per hour 272 elem comb
print("Pattern Set Size:", nPatt)
local TRSize = EP.TRSizeACPC(nPatt)
--local TRSize = countCombi(nPatt,8)
print("Requirement Set Size:", TRSize)
print("TRSize approx:",Comb.printBigNumber(TRSize))

if TRSize > printLim then
  error("TRSize is greater than the limit.")
end

fName = "PatternAC.ts"
f = io.open(fName,"w")

local fGen = EP.GenAC(nPatt, "p", negSym)

local r,val
r = fGen()
--print(#r)
local c = 0
local sr
while (r and (c < printLim)) do
  sr = r[1]
  for i=2,#r do
    sr = string.format("%s,%s", sr,r[i])
  end
  r = fGen()
  c = c+1
  --print(sr)
  f:write(string.format("%s\n",sr))
end
f:flush()
f:close()

if printLim >= TRSize then assert(c == TRSize, string.format("Wrong count! c: %d, TRSize: %d", c, TRSize)) end