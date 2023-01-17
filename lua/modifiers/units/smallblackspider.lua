package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('converter')
require('GroupInfo')
require('setValue')

function getModifierDisplay(unit, prev)
	return _modifDisplay_Cannibalism(unit, prev)
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_Cannibalism(unit, prev)
end

function getAttackDamage(unit, prev)
	if prev > 0 then
		local multiplier = _getSmallBlackSpiderBonus(unit)
		return svMultimplyDamage1(unit, prev, multiplier)
	end
	return prev
end

function getAttackHeal(unit, prev)
	if prev > 0 then
		local multiplier = _getSmallBlackSpiderBonus(unit)
		return svMultimplyHeal1(unit, prev, multiplier)
	end
	return prev
end

function getAttack2Damage(unit, prev)
	if prev > 0 then
		local multiplier = _getSmallBlackSpiderBonus(unit)
		return svMultimplyDamage2(unit, prev, multiplier)
	end
	return prev
end

function getAttack2Heal(unit, prev)
	if prev > 0 then
		local multiplier = _getSmallBlackSpiderBonus(unit)
		return svMultimplyHeal2(unit, prev, multiplier)
	end
	return prev
end

function getAttackInitiative(unit, prev)
	local multiplier = _getSmallBlackSpiderBonus(unit)
	return svMultimplyInitiative(unit, prev, multiplier)
end

function _getSmallBlackSpiderBonus(unit)
	local group = _GroupInfo_getUnitGroup(unit)
	local units = group.units
	local result = 0
	for i = 1, #units do
		u = units[i]
		if u.hp == 0 then
			result = result + 0.1
		end
	end
	return result
end
