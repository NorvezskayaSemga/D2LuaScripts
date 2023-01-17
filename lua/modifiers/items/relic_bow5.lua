package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')
require('setValue')
require('statscheck')

function getModifierDisplay(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _unitAura_FrostbiteResist_cnt(unit, mods) > 0 or not _GroupInfo_UnitIsRangedWithoutBow(unit) then
		return false
	else
		if unit.hp > 0 then
			return true
		else
			return false
		end
	end
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	return _RangeInfo_changeToRanged(prev)
end

function getAttackDamage(unit, prev)
	if _GroupInfo_UnitIsRangedWithoutBow(unit) then
		return prev
	else
		return svMultimplyDamage1(unit, prev, -0.2)
	end
end

function getAttack2Damage(unit, prev)
	if _GroupInfo_UnitIsRangedWithoutBow(unit) then
		return prev
	else
		return svMultimplyDamage2(unit, prev, -0.2)
	end
end

function getAttack2Source(unit, prev)
	if statsCheck_isDirectDmgAttack(unit.impl.attack2) then
		return Source.Water
	else
		return prev
	end
end
