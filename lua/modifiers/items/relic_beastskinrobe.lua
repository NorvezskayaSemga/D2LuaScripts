package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackInitiative(unit, prev)
	return svMultimplyInitiative(unit, prev, -0.2)
end

function getAttackPower(unit, prev)
	return svMultimplyPower1(unit, prev, 0.1)
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2(unit, prev, 0.1)
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, 0.4)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.4)
end
