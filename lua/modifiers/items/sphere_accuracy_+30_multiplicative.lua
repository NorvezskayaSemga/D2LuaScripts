package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

local sphereEffect = 1.3

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackPower(unit, prev)
   return svMultimplicativeEffectPower1(unit, prev, sphereEffect)
end

function getAttack2Power(unit, prev)
   return svMultimplicativeEffectPower2(unit, prev, sphereEffect)
end
