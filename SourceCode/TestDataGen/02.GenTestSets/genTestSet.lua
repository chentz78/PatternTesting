require("init")

local Util = require("Util")
local Set = require("Set")
local Rel = require("Relation")

local function loadTR(f)
  local rt = {}
  local vt1
  
  local ln = Util.readContent(f, function(line, lNum)
    vt1 = Util.splitString(line, ",")
    rt[#rt+1] = vt1
    
    return true
  end)
  return rt
end

local function gSentTC(initDec, ts, idt)
  local rt = {sentHeader={},sents={}}
  local sh,sr
  local sep="; "
  local pre=""
  local lastVal
  local nc = notClose or false
  
  if initDec then pre = string.format("%s%s ",initDec,sep) end
  
  for i,v in ipairs(idt) do
    lastVal = ts[v[1]]
    sh = v[1]
    sr = string.format("%s%s",pre, lastVal)
    for j=2,#v do
      sh = sh .. v[j]
      if lastVal ~= ts[v[j]] then 
        sr = string.format("%s%s%s",sr,sep,ts[v[j]]) 
        lastVal = ts[v[j]]
      end
    end
    
    if not nc then
      sr = string.format("%s%s",sr,sep)
    end
    
    rt.sentHeader[#rt.sentHeader+1] = sh
    rt.sents[#rt.sentHeader] = sr
  end
  return rt
end

--[[
arg[1] = TR set file
arg[2] = Sentence set file
]]
local fTR = arg[1]
local fSS = arg[2]

if not (Util.fileExists(fTR) and 
        Util.fileExists(fSS) ) then 
  error("Invalid file!")
end

--Load sentence table
dofile(fSS)

local tr = loadTR(fTR)

local ts = gSentTC(initDecl, tSS, tr)

local rts = Rel.new()

for i=1,#ts.sents do
  rts(ts.sents[i],ts.sentHeader[i])
end

local ss = rts:domain()
local tf = testAPIf or "testCase"
local pSet
for v in pairs(ss) do
  pSet = (rts%v):tostring()
  pSet = pSet:gsub('\\','\\\\')
  print(string.format("%s@%s@%s", v, pSet, tf))
end