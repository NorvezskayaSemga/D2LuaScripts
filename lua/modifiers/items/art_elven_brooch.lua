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
	return svAddCrit1Damage(unit, prev, 15)
end

function getAttackCritPower(unit, prev)
	return svAddCrit1Power(unit, prev, 10)
end

function getAttack2CritHit(unit, prev)
	return true
end

function getAttack2CritDamage(unit, prev)
	return svAddCrit2Damage(unit, prev, 15)
end

function getAttack2CritPower(unit, prev)
	return svAddCrit2Power(unit, prev, 10)
end

function getScout(unit, prev)
	return prev + 3
end

