package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')
require('setValue')
require('named_mods')
require('unitAuraCustomDesc')

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_AttackDamageHeal_Percent(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_AttackDamageHeal_Percent(unit, prev)
end

function getArmor(unit, prev)
	return prev + 20
end

function getRegen(unit, prev)
	return prev + 10
end

function getImmuneToAttack(unit, attack, prev)
	if (attack == Attack.LowerDamage or attack == Attack.LowerInitiative) and prev == Immune.NotImmune then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, holychalice_mod) > 0 then
			return Immune.Once
		end
	end
	return prev
end

function getImmuneToSource(unit, source, prev)
	if (source == Source.Mind or source == Source.Death) and prev == Immune.NotImmune then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, holychalice_mod) > 0 then
			return Immune.Once
		end
	end
	return prev
end
