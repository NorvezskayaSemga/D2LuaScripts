package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getArmor(unit, prev)
   return prev + 17
end

function getAttackPower(unit, prev)
   return svMultimplicativeEffectPower1(unit, prev, 1.39)
end

function getAttackDamage(unit, prev)
   return svMultimplicativeEffectDamage1(unit, prev, 1.39)
end

function getAttack2Power(unit, prev)
   return svMultimplicativeEffectPower2(unit, prev, 1.39)
end

function getAttack2Damage(unit, prev)
   return svMultimplicativeEffectDamage2(unit, prev, 1.39)
end
