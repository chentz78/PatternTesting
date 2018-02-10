local function genID(ID, inc)
  local ic = {};
  local s;
  return function (ln) 
    if not inc then return ID..ln
    else
      local i;
      if not ic[ln] then
        ic[ln] = 1
        s = ID..ln
      else
        i = ic[ln]
        s = string.format("%s%i_%i",ID, ln, i)
        ic[ln] = i+1;
      end
      
      return s 
    end
  end
end

local function const(c)
  return function (ln) 
    return c
  end
end

--[[NEW]]
return {
  ["<NAME>"] = genID("N",true),
  ["<Nonterminal>"] = genID("NT"),
  ["<UnicodeEscape>"] = const("\\u0fab"),
  ["<Mapping>"] = const("T1 : T2"),
  ["<DateTimeLiteral>"] = const("$2010-07-15$"),
  ["<RationalLiteral>"] = const("0r"),
  ["<RealLiteral>"] = const("0.0"),
  ["<LAYOUT>"] = const("")
}
--]]

--[[OLD
return {
  ["<NAME>"] = genID("N"),
  ["<Nonterminal>"] = genID("NT"),
  ["<UnicodeEscape>"] = const("%%UE%%")
}
--]]