package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
   return svMultimplyDamage1(unit, prev, _banner_bonus(unit))
end

function getAttackHeal(unit, prev)
   return svMultimplyHeal1(unit, prev, _banner_bonus(unit))
end

function getAttack2Damage(unit, prev)
   return svMultimplyDamage2(unit, prev, _banner_bonus(unit))
end

function getAttack2Heal(unit, prev)
   return svMultimplyHeal2(unit, prev, _banner_bonus(unit))
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.DrainLevel and prev ~= Immune.Always then
		return Immune.Once
	end
	return prev
end

function _banner_bonus(unit)
	local group = _GroupInfo_getUnitGroup(unit)
	return 0.05 * _GroupInfo_getFrontlineBonusMultiplier(group)
end
