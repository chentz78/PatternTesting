--- API use of the GE to generate Rascal sentences.
-- @script APIRascal
-- arg[1] startSymbol
-- arg[2] maxSentence generated
-- arg[3] output file name
-- arg[4] terminal set
-- arg[5] nonterminal set

require("init")
local GR = require("GenerationRunner")
local Set = require("Set")

local Util = require("Util")

--[[
print = local function(...)
  error()
end
]]

local function outLimitNumberBuff(lNumber, bSize)
  local buf = {}
  local bIdx = 1
  local strTmp
  return function(sent, index)
    buf[bIdx] = index .."\t".. sent
    print(index, sent)
    if (index % bSize == 0) or
       index >= lNumber then
      strTmp=""
      for i=1,bIdx do
        if i==bIdx then
          strTmp = string.format("%s%s", strTmp, buf[i])
        else
          strTmp = string.format("%s%s\n", strTmp, buf[i])
        end
      end
      print(strTmp)
      bIdx = 1
    else
      bIdx = bIdx+1
    end
        
    if index >= lNumber then return true end
    
    return false
  end  
end

local function cleanStr(str)
  if (not str) then return nil end
  
  return str:gsub("\"","")
end

--print("BPath:", BasePath)
local RascalGF = BasePath..'/GenerationEngine/Grammars/Rascal.lua'

local sentLimit = tonumber(Util.defVal(arg[2],50))
--local fOut = outLimitNumberBuff(sentLimit, 20)
local fOut, outTable = GR.outTable()
fOut = GR.outLimitNumber(sentLimit, fOut)
  
local conf = {
  maxDerivLen=7,
  --grammarTrans={"calcMinTreeHeight"},
  coverageCrit="productionCoverage",
  altStartSymbol=nil,
  quietExec=false,
  useRandomAlts=false,
  useMinTSortAlts=false,
  FuncResult=fOut
}

conf.altStartSymbol = Util.defVal(arg[1], nil)
local FNOut = Util.defVal(arg[3], "output.out")

local termSet = Util.loadTable(cleanStr(arg[4]))
if termSet then termSet = Set.new(termSet) end

local NTSet = Util.loadTable(cleanStr(arg[5]))
if NTSet then NTSet = Set.new(NTSet) end

print("termSet", termSet)
print("NTSet", NTSet)

if termSet or NTSet then
  conf.coverageCrit = "multiGoalCoverage"
  local gs = {}
  local idx
  if termSet then
    idx = #gs+1
    gs[idx] = {}
    gs[idx].goalType="term"
    gs[idx].goalSet=termSet
  end
  --[[
  if NTSet then
    idx = #gs+1
    gs[idx] = {}
    gs[idx].goalType="NT"
    gs[idx].goalSet=NTSet
  end
  ]]
  conf.multiGoalCoverage = {["goalSymbols"]=gs}
  print("Using multigoal")
end

--if arg[1] then conf.altStartSymbol=arg[1] end

local gr = GR.new()
gr:setConfig(conf)
local a,b,c = gr:runGFile(RascalGF)
--print("OK")

Util.writeContent(FNOut, function(index)
  if index > #outTable then return nil end
  return string.format("%s\n", outTable[index])
end)

print("Sent. Number:", a)
print("NT List:", b)
if c and type(c) == "table" then
  print("CCriterion Global Coverage:", c.txCoverage)
  print("CCriterion Relative Coverage:", c.txCoverageRel)
end