package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')
require('setValue')
require('named_mods')
require('unitAuraCustomDesc')

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_HitPoint_Percent(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_HitPoint_Percent(unit, prev)
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, math.min(0.25 + 0.01 * (unit.impl.level - 1), 0.35))
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, math.min(0.25 + 0.01 * (unit.impl.level - 1), 0.35))
end

function getNegotiate(unit, prev)
	local stack = _GroupInfo_getUnitStack(unit)
	if stack:getEquippedItem(Equipment.Banner) ~= nil then
		return prev + 10
	end
	return prev
end
