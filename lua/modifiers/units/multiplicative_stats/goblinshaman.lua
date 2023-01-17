package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackInitiative(unit, prev)
	return svMultimplicativeEffectInitiative(unit, prev, 1.2)
end

function getAttackDamage(unit, prev)
	return svMultimplicativeEffectDamage1(unit, prev, 1.15)
end

function getAttack2Damage(unit, prev)
	return svMultimplicativeEffectDamage2(unit, prev, 1.15)
end
