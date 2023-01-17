package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require "unitAuraCustomDesc"
require "setValue"
require "unitAura"

darkPaladinFearLevelCap = 5

function getModifierDisplay(unit, prev)
	if unit.impl.level - unit.baseImpl.level >= darkPaladinFearLevelCap then
		return false
	else
		return prev
	end
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttack2Id(unit, prev)
	if tostring(prev) ~= tostring(unit.leveledImpl.attack2.id) then
		return prev
	end
	local overlevels = unit.impl.level - unit.baseImpl.level
	if overlevels > 0 then
		_unitAura_SetNewPower2(unit, 10 * math.min(overlevels, darkPaladinFearLevelCap))
		return prev
	end
	return prev.emptyId()
end
