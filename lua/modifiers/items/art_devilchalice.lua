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
	return svMultimplyDamage1(unit, prev, 0.15)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.15)
end

function getAttackDrain(unit, damage, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	local b = 0.2 * _GroupInfo_UnitModifierAmount(mods, overlordblood_mod)
	return svAddDrain1(unit, prev, damage, 0.1 + b)
end

function getAttack2Drain(unit, damage, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	local b = 0.2 * _GroupInfo_UnitModifierAmount(mods, overlordblood_mod)
	return svAddDrain2(unit, prev, damage, 0.1 + b)
end

function getHitPoint(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, holychalice_mod) > 0 then
		return svFlatEffectHitPoint(unit, prev, 20)
	end
	return prev
end
