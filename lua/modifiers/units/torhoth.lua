package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('mRnd')

local torhoth_Mods = {}
for i=1, 99 do
	torhoth_Mods[i] = Id.new("g024um"..1000 + i)
end

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAtckTwice(unit, prev)
	local chance = 10 * ( unit.impl.level - unit.baseImpl.level )
	return _mRnd_simpleRndEvent(chance)
end

function getAttackWards(unit, prev)
	local result = {}
	local level = unit.impl.level - unit.baseImpl.level + 1
	table.insert(result, torhoth_Mods[level])
	return result
end
