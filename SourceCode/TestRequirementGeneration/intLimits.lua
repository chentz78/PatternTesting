--**** should be compatible with 5.xx
function intlimit()
  local floor = math.floor

  -- get highest power of 2 which Lua can still handle as integer
  local step = 2
  while true do
    local nextstep = step*2
    if (floor(nextstep) == nextstep) and (nextstep-1 ~= nextstep) then
      step = nextstep
    else
      break
    end
  end

  -- now get the highest number which Lua can still handle as integer
  local limit,step = step,step/2
  while step > 0 do
    local nextlimit = limit+step
    if (floor(nextlimit) == nextlimit) and (nextlimit-1 ~= nextlimit) then
      limit = nextlimit
    end
    step = floor(step/2)
  end
  return limit
end

local limit = intlimit()

print()
print("IntegerDomain - what is the largest supported integer number?")
print()

--**** do not rely on Lua to print "limit" properly by itself!
--local printablelimit = string.format("%d", limit)         -- fails under Lua!
local printablelimit = string.format("%.16e", limit)

print("supported integer range is: -" .. printablelimit .. "...+" .. printablelimit)