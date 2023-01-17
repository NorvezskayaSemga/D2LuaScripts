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

function getAttackPower(unit, prev)
	return svMultimplyPower1(unit, prev, 0.05)
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2(unit, prev, 0.05)
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, 0.25)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.25)
end

function getHitPoint(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, devilchalice_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(mods, helmetofthedamned_mod) > 0 then
		return svFlatEffectHitPoint(unit, prev, 50)
	end
	return prev
end
