package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('GroupInfo')
require('setValue')
require('named_mods')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackCritHit(unit, prev)
    return true
end

function getAttackCritDamage(unit, prev)
    return svAddCrit1Damage(unit, prev, 100 * _orc_shield_bonus(unit))
end

function getAttack2CritHit(unit, prev)
    return true
end

function getAttack2CritDamage(unit, prev)
    return svAddCrit2Damage(unit, prev, 100 * _orc_shield_bonus(unit))
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, _orc_shield_bonus(unit))
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, _orc_shield_bonus(unit))
end

function _orc_shield_bonus(unit)
	return math.min(0.2, 0.1 + 0.02 * ( unit.impl.level - unit.baseImpl.level ))
end

function getImmuneToAttack(unit, attack, prev)
	if prev ~= Immune.Always and attack == Attack.LowerDamage then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, khanflail_mod) > 0 then
			return Immune.Always
		end
	end
	return prev
end

function getAttackPower(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, khanskull_mod) > 0 then
		return svMultimplyPower1(unit, prev, 0.05)
	end
	return prev
end

function getAttack2Power(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, khanskull_mod) > 0 then
		return svMultimplyPower2(unit, prev, 0.05)
	end
	return prev
end
