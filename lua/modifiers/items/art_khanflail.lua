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
	local mods = _GroupInfo_UnitModifiers(unit)
	return svMultimplyDamage1(unit, prev, 0.1 + 0.1 * _GroupInfo_UnitModifierAmount(mods, khanskull_mod))
end

function getAttack2Damage(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	return svMultimplyDamage2(unit, prev, 0.1 + 0.1 * _GroupInfo_UnitModifierAmount(mods, khanskull_mod))
end

function getAttackInitiative(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, orcishshield_mod) > 0 then
		return svMultimplyInitiative(unit, prev, 0.1)
	end
	return prev
end
