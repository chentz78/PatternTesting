require("init")

local EP = require("EqPart")
local BT = require("BenchTimer")
local BN = require("openssl").bn

local negSym = "\\"
local nPatt = tonumber(arg[1]) or 16
local pre = arg[2] or "p"

if nPatt < 2 then
  print("PW not supported for "..nPatt)
  return
end

--[[
35,019,707 combinations per hour
]]
print("Pair-Wise Pattern Coverage")
print("Pattern Set Size:", nPatt)
local TRSize = BN.tonumber(EP.TRSizePWPC(nPatt))
print("Requirement Set Size:", TRSize)

fName = "PatternPWPC.ts"
f = io.open(fName,"w")

local tmr = BT.new()
tmr:start()
local fGen,fLen = EP.GenPW(nPatt,pre, negSym)
local r = fGen()
local c = 0
local printLim = 10000
print("Genenarion space without constraints:",fLen)
while (r and (c < printLim)) do
  f:write(string.format("%s,%s\n", r[1],r[2]))
  r = fGen()
  c = c+1
end
--print(c)
if printLim >= TRSize then assert(c == TRSize, string.format("Wrong count! c: %d, TRSize: %d", c, TRSize)) end
f:flush()
f:close()
tmr:stop()

local _, t = tmr:timeSum()
_ = (t/TRSize)
print("Timer PW:", t, _, string.format("%.0f",86400/_) )