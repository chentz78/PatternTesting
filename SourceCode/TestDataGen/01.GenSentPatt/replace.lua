require("init")
local Set = require("Set")
local Util = require("Util")

local function repFunc(line, repTab, ln)
  if not repTab then error("Invalid replace table!") end
  
  local ret = line
  for k,v in pairs(repTab) do
    ret = ret:gsub(k, function (s) return v(ln) end)
  end
  return ret
end

local fToReplace = arg[1]
if not fToReplace then error("Invalid file!") end

local repRules = arg[2]
if not repRules then error("Invalid file!") end

local fToReplaceOut = arg[3]
fToReplaceOut = fToReplaceOut or (fToReplace.."rep")

local lf = loadfile(repRules)
if not lf then error("Invalid replace table file!") end

local repTab = lf()
if not repTab then error("Unable to load replace table!") end

print("Replacing tags over", fToReplace)

local fOut = io.open(fToReplaceOut, "w")
if not fOut then error("Invalid file output!") end

local function fRead(cnt, ln)
  fOut:write(repFunc(cnt, repTab, ln))
  fOut:write("\n")
  return true
end

local lr = Util.readContent(fToReplace, fRead)
print("Replaced for", lr, "lines")
fOut:flush()
fOut:close()