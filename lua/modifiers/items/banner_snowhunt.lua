package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackPower(unit, prev)
   return svMultimplyPower1(unit, prev, _banner_bonus(unit))
end

function getAttack2Power(unit, prev)
   return svMultimplyPower2(unit, prev, _banner_bonus(unit))
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.Frostbite and prev ~= Immune.Always then
		return Immune.Once
	end
	return prev
end

function _banner_bonus(unit)
	local group = _GroupInfo_getUnitGroup(unit)
	return 0.05 * _GroupInfo_getFrontlineBonusMultiplier(group)
end
