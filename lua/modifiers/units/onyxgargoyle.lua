package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDrain(unit, damage, prev)
    local maxHP = getScenario():getUnit(unit.id).hpMax
    local bonus = ( maxHP - math.min(maxHP, unit.hp) ) / ( 2 * maxHP )
    return svAddDrain1(unit, prev, damage, bonus)
end

function getAttack2Drain(unit, damage, prev)
    local maxHP = getScenario():getUnit(unit.id).hpMax
    local bonus = ( maxHP - math.min(maxHP, unit.hp) ) / ( 2 * maxHP )
    return svAddDrain2(unit, prev, damage, bonus)
end

