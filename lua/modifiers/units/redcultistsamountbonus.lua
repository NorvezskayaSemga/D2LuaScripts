package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

local _redCultModifierID = Id.new('g040um0250').value

function getAttackDamage(unit, prev)
	local bonus = _redCultGetBonus(unit)
	return svMultimplyDamage1(unit, prev, bonus)
end

function getAttack2Damage(unit, prev)
	local bonus = _redCultGetBonus(unit)
	return svMultimplyDamage2(unit, prev, bonus)
end

function getAttackHeal(unit, prev)
	local bonus = _redCultGetBonus(unit)
	return svMultimplyHeal1(unit, prev, bonus)
end

function getAttack2Heal(unit, prev)
	local bonus = _redCultGetBonus(unit)
	return svMultimplyHeal2(unit, prev, bonus)
end

function getAttackInitiative(unit, prev)
	local bonus = _redCultGetBonus(unit)
	return svMultimplyInitiative(unit, prev, bonus)
end

function _redCultGetBonus(unit)
	_get_Group_and_Mods(unit)
	return 0.05 * math.max(_GroupInfo_stackHasModifierAmount(_redCultModifierID) - 1, 0)
end
