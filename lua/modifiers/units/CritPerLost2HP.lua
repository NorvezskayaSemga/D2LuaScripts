package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackCritHit(unit, prev)
    return true
end

function getAttackCritDamage(unit, prev)
    local maxHP = getScenario():getUnit(unit.id).hpMax
    local bonus = 100 * ( maxHP - math.min(maxHP, unit.hp) ) / ( 2 * maxHP ) + 5
    return svAddCrit1Damage(unit, prev, bonus)
end

function getAttack2CritHit(unit, prev)
    return true
end

function getAttack2CritDamage(unit, prev)
    local maxHP = getScenario():getUnit(unit.id).hpMax
    local bonus = 100 * ( maxHP - math.min(maxHP, unit.hp) ) / ( 2 * maxHP ) + 5
    return svAddCrit2Damage(unit, prev, bonus)
end
