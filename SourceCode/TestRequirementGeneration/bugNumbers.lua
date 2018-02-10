local n1 = 177983496334718613
local n2 = 177983496334718624
assert(n1 == 177983496334718613)
assert(n1 == tonumber("177983496334718613"))
print(string.format("%d", n1), tonumber("177983496334718613"))
assert(n2 == 177983496334718624)
assert(n2 == tonumber("177983496334718624"))
print(string.format("%d", n2), tonumber("177983496334718624"))
assert(n1 ~= n2)