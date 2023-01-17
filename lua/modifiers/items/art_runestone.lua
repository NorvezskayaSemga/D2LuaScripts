package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')
require('setValue')
require('named_mods')
require('unitAuraCustomDesc')

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_Regen_Flat(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_Regen_Flat(unit, prev)
end

function getArmor(unit, prev)
	return prev + 10
end

function getRegen(unit, prev)
	return prev + 10
end

function getHitPoint(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, gnomebracers_mod) > 0 then
		return svFlatEffectHitPoint(unit, prev, 15)
	end
	return prev
end

function getImmuneToAttack(unit, attack, prev)
	if prev == Immune.NotImmune and attack == Attack.Shatter then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, runemaul_mod) > 0
		or _GroupInfo_UnitModifierAmount(mods, runeblade_mod) > 0 then
			return Immune.Once
		end
	end
	return prev
end
