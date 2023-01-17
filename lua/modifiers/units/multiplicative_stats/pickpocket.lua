package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackPower(unit, prev)
   return svMultimplicativeEffectPower1(unit, prev, 0.8)
end

function getAttack2Power(unit, prev)
   return svMultimplicativeEffectPower2(unit, prev, 0.8)
end

function getAttackHeal(unit, prev)
   return svMultimplicativeEffectHeal1(unit, prev, 0.8)
end

function getAttack2Heal(unit, prev)
   return svMultimplicativeEffectHeal2(unit, prev, 0.8)
end

function getFastRetreat(unit, prev)
   return _GroupInfo_canUseFastRetreat(unit, false)
end
