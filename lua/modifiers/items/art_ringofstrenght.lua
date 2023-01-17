package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')
require('setValue')
require('named_mods')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, 0.2)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.2)
end

function getAttackCritHit(unit, prev)
	if not prev then
		if ringorstrenghtCritDmg(unit, prev) > 0 then
			return true
		end
	end
	return prev
end

function getAttackCritDamage(unit, prev)
	local b = ringorstrenghtCritDmg(unit, prev)
	if b > 0 then
		return svAddCrit1Damage(unit, prev, b)
	end
	return prev
end

function getAttackCritPower(unit, prev)
	local b = ringorstrenghtCritDmg(unit, prev)
	if b > 0 then
		return svAddCrit1Power(unit, prev, b)
	end
	return prev
end

function getAttack2CritHit(unit, prev)
	if not prev then
		if ringorstrenghtCritDmg(unit, prev) > 0 then
			return true
		end
	end
	return prev
end

function getAttack2CritDamage(unit, prev)
	local b = ringorstrenghtCritDmg(unit, prev)
	if b > 0 then
		return svAddCrit2Damage(unit, prev, b)
	end
	return prev
end

function getAttack2CritPower(unit, prev)
	local b = ringorstrenghtCritDmg(unit, prev)
	if b > 0 then
		return svAddCrit2Power(unit, prev, b)
	end
	return prev
end

function ringorstrenghtCritDmg(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, luckybone_mod) > 0 then
		return 10
	end
	return 0
end
