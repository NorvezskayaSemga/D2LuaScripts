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
	return svMultimplyDamage1(unit, prev, -0.2)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, -0.2)
end

function getHitPoint(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, thanatosblade_mod) > 0 then
		return svMultimplyHitPoint(unit, prev, 0.1)
	end
	return prev
end

function getAttackPower(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, thanatosskull_mod) > 0 then
		return svMultimplyPower1(unit, prev, 0.1)
	end
	return prev
end

function getAttack2Power(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, thanatosskull_mod) > 0 then
		return svMultimplyPower2(unit, prev, 0.1)
	end
	return prev
end
