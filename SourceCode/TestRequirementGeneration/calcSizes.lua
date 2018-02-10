require("init")

local U = require("Util")
local EP = require("EqPart")

local inBlocks = arg[1]
--print(inBlocks)
if not inBlocks then error("Invalid argument!") end

local blocks = {}
for m in inBlocks:gmatch("([^,]+)") do
  val = tonumber(m)
  --print(val)
  blocks[#blocks+1] = val
end

local sSize = #blocks == 2
if sSize then
  print("Block set size:", blocks[1])
  print("Blocks:", blocks[2])
else
  print("Block set size:", #blocks)
  print("Blocks:", U.tostring(blocks))
end

local ret
print("Traditional Partition Criteria:")
ret = EP.TRSizeEC(blocks, sSize)
print("TR Size for Each Choice", ret)
ret = EP.TRSizePW(blocks, sSize)
print("TR Size for Pair-Wise", ret)
ret = EP.TRSizeAC(blocks, sSize)
print("TR Size for All Combinations", ret)

print("Minimal Test Set:")
ret = EP.minTSSizeEC(blocks, sSize)
print("Min TS Size for Each Choice", ret)
ret = EP.minTSSizePW(blocks, sSize)
print("Min TS Size for Pair-Wise", ret)
ret = EP.minTSSizeAC(blocks, sSize)
print("Min TS Size for All Combinations", ret)