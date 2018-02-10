require("init")
local Comb = require("Combinatorics")
local U = require("Util")

local zTab = require("ZeroIndexTab")
local Set = require("Set")
local Rel = require("Relation")
local BT = require("BenchTimer")
local BN = require("openssl").bn

local EqPartition = {}

--local negSym = "\\"

local dFmt = {userdataOpen='[', userdataSepClose=']', userdataSep=': ',
          tableOpen='[', tableClose=']', tableSep=',', tableEquals='=',
			    keyOpen=nil, keyClose=']', itemOpen='', itemClose=''}

local function fCheckElem(rec, n)
  if not rec then return false end
  --print("fCheckElem:",rec, n, #rec)
  
  local cComp
  for i=0,#rec-1 do
    for j=i+1,#rec-1 do
      cComp = rec[j]
      --print("fCheckElem:",i,j, cComp, rec[i], rec[j])
      if cComp > n and 
         (cComp-n == rec[i]) then
        return false
      end
    end
  end
  return true
end

local fmtTable = nil

local function genFmtTable(nPatt,prefix,negSym)
  --print("genFmtTable:",nPatt,prefix,negSym)
  fmtTable = {}
  for i=1,nPatt*2 do
    if negSym and (i > nPatt) then
      fmtTable[i] = string.format("%s%s%d",negSym, prefix, i-nPatt)
    else
      fmtTable[i] = string.format("%s%d",prefix, i)
    end
  end
  --print("genFmtTable:",#fmtTable)
end

local function fmtValues(rec, nPatt, prefix, negSym)
  if not rec then return nil end
  
  if not fmtTable then genFmtTable(nPatt,prefix,negSym) end
  
  --print("fmtValues:",rec, nPatt, prefix, negSym, fmtTable)
  local ret = {}
  for i=0,#rec-1 do
    ret[i+1] = fmtTable[rec[i]]
  end
  return ret
end

local tPattEquiv = {}

local function fCheckConst1(rec, n, neg)
  --print("fCheckConst1",rec)
  if not neg then return true end
  
  --Reduction to the values to only i <= n values. Repetitions equals to invalid record
  local recIdx = {}
  --setmetatable(recIdx, {__mode="k"})
  local elem,absV
  for i=0,#rec-1 do
    elem = rec[i]
    
    if elem <= n then recIdx[elem] = true
    else
      absV = elem-n
      if recIdx[absV] then return false
      else recIdx[absV] = true end
    end
  end
  return true
end

local function baseCombGen(n, k, prefix, negSym)
  --print("baseCombGen:", n, k, prefix, negSym)
  local f, len
    
  local sSize
  if not negSym then sSize = n else sSize = n*2 end
  f, len =  Comb.CobinationGen(sSize,k)
  
  if len > BN.number(math.maxinteger) then
    print("Combination number > Lua maxinteger. Limited to 100")
    len = 100 
  else
    len = BN.tonumber(len)
  end
  --print("baseCombGen:", n, k, len)
  fmtTable = nil
  --Check nil prefix
  prefix = prefix or ""
  return coroutine.wrap(function()
    --print("baseCombGen#:", n, k)
    local tmr = BT.new()
    tmr:start()
    tmr:pause()
    local fr
    for i=1,len do
      fr = f()
      tmr:resume()
      
      --Constraint 1
      
      local cRet = fCheckConst1(fr, n, negSym)
      --print(fr, cRet)
      if cRet then
        fr = fmtValues(fr, n, prefix, negSym)
        --fr = fr.iTab
        tmr:pause()
        coroutine.yield(fr)
      else
        tmr:pause()
      end
    end
    --print("baseCombGen#:", tmr:timeSum())
  end), len
end

local function baseComb(n, k)
  --print("baseComb: ", n, k)
  local ret = {}
  --local ti = os.clock()
  local tCombi = Comb.CobinationTable(n,k)
  --print("baseComb Time1:", os.clock()-ti)
  --print("baseComb:",#tCombi)
  --print("baseComb:", U.tostring(tCombi))
  local len = countCombi(n,k)
  
  --ti = os.clock()
  local maskNeg = Comb.genBinTruthTable(k)
  --print("baseComb Time2:", os.clock()-ti)
  --print("baseComb MaskNeg:", U.tostring(maskNeg,dFmt))
  
  local fm = function(tab)
    return function(key,val)
      --print("fm:", key, val)
      if val == 0 then return tab[key]
      else return tab[key]+n end
    end
  end
  
  local v
  --ti = os.clock()
  for i=1,#tCombi do
    for j=1,#maskNeg do
      ret[#ret+1] = U.map(maskNeg[j], fm(tCombi[i]))
    end
  end
  --print("baseComb Time3:", os.clock()-ti)
  
  --print("baseComb ret:", #ret, U.tostring(ret,dFmt))
  return ret
end

function sortTRS(trs)
  local ts = {}
  local tVals = {}
  local vKey
  for k,v in ipairs(trs) do
    table.sort(v)
    vKey = table.concat(v,"")
    tVals[#tVals+1] = vKey
    ts[vKey] = v
  end
  
  table.sort(tVals)
  
  local ret = {}
  for k,v in ipairs(tVals) do
    ret[#ret+1] = ts[v]
  end
  return ret
end

function convertNumToStringNotation(t, s, ns)
  --print("convertNumToStringNotation")
  
  local len = #t
	local n = s:card()
	
	local ti = os.clock()
	local sTab = s:table()
	table.sort(sTab)
	local nsTab = ns:table()
	table.sort(nsTab)
	--print("convertNumToStringNotation time1:", os.clock()-ti)
	
  local fMap = function(key,val)
    if val > n then return nsTab[(val-n)]
    else return sTab[val] end
  end
    
  ti = os.clock()
	local ts = sortTRS(t)
	--print("convertNumToStringNotation time2:", os.clock()-ti)
	
	ti = os.clock()
	local ret = {}
	
  for k,v in ipairs(ts) do
    ret[#ret+1] = U.map(v,fMap)
  end
  
	--print("convertNumToStringNotation time3:", os.clock()-ti)
	
  return ret
end

function tableToString(t)
  --print("tableToString")
  
	local tabS = "{"
	local ti = os.clock()
	local len = #t
	
  for k,v in ipairs(t) do
    if k == 1 then 
      tabS = string.format("%s%s",tabS,table.concat(v,""))
    else
      tabS = string.format("%s,%s",tabS,table.concat(v,""))
    end
    
    if k > 1000 then
      tabS = tabS..",...}"
      --print("tableToString time1:", os.clock()-ti)
      return string.format("%s %s",len,tabS)
    end
  end
  tabS = tabS.."}"
	--print("tableToString time1:", os.clock()-ti)
	
  return string.format("%s %s",len,tabS)
end

function EqPartition.TRSizePPC(nPatt)
  return nPatt
end

function EqPartition.TRSizeECPC(nPatt)
  return nPatt*2
end

function EqPartition.TRSizePWPC(nPatt)
  local k = 2
  return Comb.BinCoefficient(nPatt,k)*math.pow(2,k)
end

function EqPartition.TRSizeACPC(nPatt)
  local k = nPatt
  return math.pow(2,k)
end

function EqPartition.GenPPC(nPatt, prefix, negSym)
  return baseCombGen(nPatt, 1, prefix, nil)
end

function EqPartition.GenEC(nPatt, prefix, negSym)
  return baseCombGen(nPatt, 1, prefix, negSym)
end

function EqPartition.GenPW(nPatt, prefix, negSym)
  return baseCombGen(nPatt, 2, prefix, negSym)
end

function EqPartition.GenAC(nPatt, prefix, negSym)
  return baseCombGen(nPatt, nPatt, prefix, negSym)
end

--Traditional EqPartition comb criteria

function EqPartition.minTSSizeEC(blocks, sameSize)
  if sameSize then return blocks[2]
  else
    local max = 0
    for _,v in ipairs(blocks) do
      if v > max then max = v end
    end
    return max
  end
end

function EqPartition.minTSSizePW(blocks, sameSize)
  if sameSize then return blocks[2]^2
  else
    local m1,m2 = 0,0
    for _,v in ipairs(blocks) do
      if v > m1 then
        m2 = m1
        m1 = v
      elseif v > m2 then m2 = v end
    end
    return m1 * m2
  end
end

function EqPartition.minTSSizeAC(blocks, sameSize)
  return EqPartition.TRSizeAC(blocks, sameSize)
end

return EqPartition