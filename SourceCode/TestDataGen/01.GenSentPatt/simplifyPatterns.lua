require("init")
local LP = require("lpeg")
local Util = require("Util")

---Alias
local P, S, V, R, S = LP.P, LP.S, LP.V, LP.R, LP.S
local C, Cg, Ct, Cc, Cmt = LP.C, LP.Cg, LP.Ct, LP.Cc, LP.Cmt

-- Aux. functions
function taggedCap(tag, pat)
  return Ct(Cg(Cc(tag), "tag") * pat)
end

function getFuncToken(sk)
  return function(pat)
    return pat * sk
  end
end

function notPatt(pat) return (1-pat) end

local space = S("\r\n\f\t ")
local letters = R("az", "AZ")
local alpha = letters + R("09")
local skip = space^0

local token = getFuncToken(skip)

local function symb(str,cap)
  if not cap then
    return token(P(str))
  else
    return token(P(str) / cap)
  end
end

local function dataStream(openS, closeS)
  return P(openS) * C( ( P('\\') * P(1) + (1 - P(closeS)))^0) * P(closeS)
end

local stringLex = (P('"') * C((P('\\') * P(1) + 
                            (1 - P('"')))^0) * P('"') +
                   P("'") * C((P("\\")* P(1) + 
                            (1 - P("'")))^0) * P("'")
                  ) * skip
                   
local ID = C( (P("_") + letters) * (alpha + P("_"))^0 + 
              P(".") * -P(".") ) * skip

local patt = '(Declaration)`<Tags _> <Visibility _> tag <Kind _> <Name _> on <{Type ","}+ _> ;`'

local function getTopConcrete(s)
  local G = P{"S";
    S = taggedCap("S", symb("(") * ID * symb(")") * dataStream("`","`") );
  }
  
  local ret = LP.match(G, s)
  
  if not ret then error("Syntax error") end
  
  return ret[1], ret[2]
end

local function simpS(s)
  
  local G = P{"S";
    S = taggedCap("S",
          ( V("Tags") +
          V("Terms") )^1 --* symb(";")
        );
    Tags = taggedCap("Tags",
             P("<") * ID * ID * P(">") +
             P("<") * P("{") * ID * stringLex * P("}") * P("+")^0 * skip * ID * P(">")
           ) * skip;
    Terms = taggedCap("Terms", C( (P(1) - S("<")  )^1 )) * skip;
  }
  
  local ret = LP.match(G, s)
  
  if not ret then error("Syntax error") end
  
  local r = ""
  for k,v in pairs(ret) do
    if (v.tag == "Tags") then
      r = r .. "<" .. v[1] .. "> "
    elseif (v.tag == "Terms") then
      r = r .. " " .. v[1] .. " "
    end
  end
  
  return r
end

local topSym, s = getTopConcrete(patt)
print("Top Symbol:", topSym)
print(simpS(s))