package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

local sphereEffect = 1.3

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
   return svMultimplicativeEffectDamage1(unit, prev, sphereEffect)
end

function getAttackHeal(unit, prev)
   return svMultimplicativeEffectHeal1(unit, prev, sphereEffect)
end

function getAttack2Damage(unit, prev)
   return svMultimplicativeEffectDamage2(unit, prev, sphereEffect)
end

function getAttack2Heal(unit, prev)
   return svMultimplicativeEffectHeal2(unit, prev, sphereEffect)
end
