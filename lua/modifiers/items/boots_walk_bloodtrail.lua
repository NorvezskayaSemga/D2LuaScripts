package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getMovement(unit, prev)
	local maxHP = getScenario():getUnit(unit.id).hpMax
	return svFlatEffectMovement(unit, prev, 10 + math.floor(10 * ( maxHP - math.min(maxHP, unit.hp) ) / maxHP))
end
