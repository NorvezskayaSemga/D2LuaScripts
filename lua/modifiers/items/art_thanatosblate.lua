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
	if _GroupInfo_UnitModifierAmount(mods, mortistear_mod) > 0 then
		return svMultimplyDamage1(unit, prev, 0.1)
	end
	return prev
end

function getAttack2Damage(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, mortistear_mod) > 0 then
		return svMultimplyDamage2(unit, prev, 0.1)
	end
	return prev
end

function getAttackSource(unit, prev)
	if prev ~= Source.Life and prev ~= Source.Death then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, thanatosskull_mod) > 0 then
			return Source.Death
		end
	end
	return prev
end

function getAttack2Source(unit, prev)
	if prev ~= Source.Life and prev ~= Source.Death then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, thanatosskull_mod) > 0 then
			return Source.Death
		end
	end
	return prev
end
