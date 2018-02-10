require("init")

local Util = require("Util")
local Set = require("Set")
local Rel = require("Relation")

--- Execute Lua instance
local function execLuaInst(lMod, params)
  if not Util.fileExists(lMod) then return nill end
  
  local tmpF = os.tmpname()
  local sExec = string.format('/bin/bash -c "lua %s', lMod)
  
  sExec = string.format("%s %s ", sExec, params)
  sExec = string.format('%s &> %s ; touch %s.done" &', sExec, tmpF, tmpF)
  local r = os.execute(sExec)
  return r and tmpF
end

--- Execute excluded symbols
local function execExcludedSym(sym, sLimit, preName)
  local outName = (preName or "O_") .. sym
  local params = string.format("%s %s %s.out", sym, sLimit, outName)
  return execLuaInst("genSymbolsRascal.lua", params)
end

--- Execute LGen instances
local function execAPIRascal(startS, sentNum, preName, terms, nts)
  --local sExec = string.format("/bin/bash -c 'lua APIRascal.lua %s %s' &> %s && touch %s.done &", startS, sentNum, tmpF, tmpF)
  local outName = (preName or "O_") .. startS
  local a,b = nil,nil
  if terms and terms:card()>0 then
    a = tostring(terms)
    print("execAPIRascal:Terms", a)
  end
  if nts and nts:card()>0 then 
    b = tostring(nts)
    print("execAPIRascal:NTs", b)
  end
  
  local params = string.format("%s %s %s.out", startS, sentNum, outName)
  params = string.format('%s \\"%s\\" \\"%s\\"', params, a, b)
  
  return execLuaInst("APIRascal.lua", params)
end

local function checkExecDone(eID)
  return Util.fileExists(eID..".done")
end

local function closeExec(exID, NT, filePrefix)
  local nFName = (filePrefix or "out_") .. NT .. ".txt"
  --os.rename(exID, nFName)
  local r = os.execute(string.format("mv %s %s", exID, nFName))
  if not r then error("Connot move temp files!") end
  os.remove(exID..".done")
  return nFName
end

--- control LGen multiple instances
local function execLGen(tPatt, maxProc, filePrefix, sentLimit, excludeNT)
  local sCard = Util.sizeTable(tPatt)
  local sLimit = Util.defVal(sentLimit, 50)
  --print("execLGen", sCard, tPatt)
  
  local exContext = {}
  local exCount, exDone = 0,0
  local eID
  local rec
  local v
  while exDone < sCard do
    for v, t in pairs(tPatt) do
      --print("execLGen", v,t.Terms, t.NTs)
      if exContext[v] and not exContext[v].done then
        eID = exContext[v].execID
        if checkExecDone(eID) then
           rec = exContext[v]
           rec.stopCPUTime = os.clock()
           rec.resultF = closeExec(eID, v, filePrefix)
           rec.done = true
           exDone = exDone+1
           exCount = exCount-1
           print(string.format("The execution of %s is done. CPU spend: %s. It is %s of %s", v, (rec.stopCPUTime-rec.startCPUTime), exDone, sCard) )
        end
      else
        if not exContext[v] and exCount < maxProc then 
          print("Starting the execution of", v)
          rec = {}
          rec.startCPUTime = os.clock()
          if excludeNT and excludeNT:inSet(v) then
            print(v, "is an excluded symbol!")
            eID = execExcludedSym(v, sLimit, filePrefix)
          else
            --eID = execAPIRascal(v, sLimit, filePrefix, t.Terms, t.NTs)
            eID = execAPIRascal(v, sLimit, filePrefix)
          end
          if not eID then error("Invalid eID!") end
          rec.execID = eID
          exContext[v] = rec
          exCount = exCount+1
        else
          os.execute('sleep 1') 
        end
      end
    end
  end
  
  local ret = {}
  for k,v in pairs(exContext) do
    ret[k] = v.resultF
  end
  return ret
end

local function loadSubNT(tPatts)
  local ret = Set.new()
  local nts
  
  for k,v in pairs(tPatts) do
    nts = Util.loadTable(v.NTSet)
    if nts then ret = ret + Set.new(nts) end
  end
  
  return ret:internalSet(), ret
end

local function unifySets(tPatts)
  local tpSet = Set.new()
  
  local ret = {}
  local terms, nts
  local rec
  local c = 0
  for k,v in pairs(tPatts) do
    if ret[v.topSymbol] then rec = ret[v.topSymbol]
    else 
      rec = {Terms=Set.new(), NTs=Set.new()}
      c = c +1
      tpSet(v.topSymbol)
    end
    
    terms = Util.loadTable(v.TermSet)
    if not terms then error("Unable to load the term table:", v.TermSet) end
    rec.Terms = rec.Terms + Set.new(terms)
    
    nts = Util.loadTable(v.NTSet)
    if not nts then error("Unable to load the NT table:", v.NTSet) end
    rec.NTs = rec.NTs + Set.new(nts)
    
    ret[v.topSymbol] = rec
  end
  
  return ret, tpSet
end

local function loadPatterns(pFile)
  local extPattTab = {}
  local t, tab
  local f = function(line, lNum)
    t = Util.splitString(line, '%%')
    --print(t[3], t[4]:find("external") > 0, t[5])
    --t[5] == pattId, t[3] == Pattern NT, t[4] == flags
    if t[6]:find("external") > 0 then
      tab = {}
      tab.topSymbol = t[3]
      tab.NTSet = t[4]
      tab.TermSet = t[5]
      --t[7] = Pattern ID
      extPattTab[t[7]] = tab
    end
    return true
  end
  local ln = Util.readContent(pFile, f)
  return extPattTab, ln
end

local pattFile = arg[1]
if not pattFile then error("Invalid pattern file!") end

local pattBaseFN = pattFile:match("(.+)%.[^%.]+$")

local sentLabel = Util.defVal(arg[2], pattBaseFN)
print("Base config: Label:",sentLabel, "P. File:", pattFile) 

local procNum = tonumber(Util.defVal(arg[3], 4))
local sentNumLimit = tonumber(Util.defVal(arg[4], 100))

local tPatts,cPatts = loadPatterns(pattFile)
--local rRet,NTSet = unifySets(tPatts)
local rRet,NTSet = loadSubNT(tPatts)
---print(rRet)
--local restric = Set.new{'Declaration'}
local restric = Set.new{'Visibility','Tags','UserType',
  'Name','Nonterminal','QualifiedName'}
if restric then
  print("Using the restriction set:", restric)
  local t = {}
  for k,v in pairs(rRet) do
    if restric:inSet(k) then t[k] = v end
  end
  rRet = t
  NTSet = NTSet * restric 
end

local excNT = Set.new{'Name','Nonterminal','QualifiedName'}

print("The execution set: ", NTSet:card(), NTSet)
local tResultF = execLGen(rRet, procNum, string.format("sen_%s_", sentLabel), sentNumLimit, excNT)
local f = io.open("sen_NTSymbols.txt","w")
local s = Util.defVal(excNT, Set.new())
s = NTSet - s
for k in pairs(s) do
  f:write(k.."\n")
end
f:close()
print("The execution is done.")