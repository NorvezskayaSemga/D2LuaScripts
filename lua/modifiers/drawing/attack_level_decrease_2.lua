package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('game_constants')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttack2Level(unit, prev)
	local a = unit.impl.attack2.type
	if a == Attack.LowerDamage then
		return math.max(LowerDamage_minLevel, math.min(LowerDamage_maxLevel, prev - 1))
	elseif a == Attack.LowerInitiative then
		return math.max(LowerInitiative_minLevel, math.min(LowerInitiative_maxLevel, prev - 1))
	elseif a == Attack.BoostDamage then
		return math.max(BoostDamage_minLevel, math.min(BoostDamage_maxLevel, prev - 1))
	else
		return prev
	end
end
