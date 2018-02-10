require("init")

local Util = require("Util")
local Set = require("Set")
local Rel = require("Relation")


local function callFunc(tabF, sym)
  local fHnd
  for s,t in pairs(tabF) do
    if sym == s then
      fHnd = io.open(t.FOutName, 'w')
      t.func(sym, t.elemNum, fHnd)
      fHnd:close()
      break
    end
  end
end

local fPrint = print

local function fGenRandIdent(sym, num, fHnd)
  math.randomseed(os.clock()*1000000)
  local baseN = string.format('%s%s_',sym,math.random(1,1000))
  for i=1,num do
    fHnd:write(string.format("%s%s\n",baseN, i)) 
  end
end

--Input params
local sym = Util.defVal(arg[1], nil)
local sentLimit = tonumber(Util.defVal(arg[2],50))
local FNOut = Util.defVal(arg[3], "output.out")

print("genSymbolsRascal Sym:", sym, "sentLimit:", sentLimit, "FNOut:", FNOut)

local tSymFunction = {
  ['Name'] = {func = fGenRandIdent, elemNum = sentLimit, FOutName=FNOut},
  ['QualifiedName'] = {func = fGenRandIdent, elemNum = sentLimit, FOutName=FNOut},
  ['Nonterminal'] = {func = fGenRandIdent, elemNum = sentLimit, FOutName=FNOut}
}

callFunc(tSymFunction, sym)