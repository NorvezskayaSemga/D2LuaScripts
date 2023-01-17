package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getHitPoint(unit, prev)
	local m = 0.05 * unit.impl.leadership
	return svMultimplyHitPoint(unit, prev, m)
end

function getAttackDrain(unit, damage, prev)
	local m = 0.05 * unit.impl.leadership
	return svAddDrain1(unit, prev, damage, m)
end

function getAttack2Drain(unit, damage, prev)
	local m = 0.05 * unit.impl.leadership
	return svAddDrain2(unit, prev, damage, m)
end

function hasAbility(unit, ability, prev)
	if ability == Ability.WeaponMaster and prev == false then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, harvestarmor_mod) > 0 and
		   _GroupInfo_UnitModifierAmount(mods, harvestcup_mod) > 0 and
		   _GroupInfo_UnitModifierAmount(mods, harvestdagger_mod) > 0 then
			return true
		end
	end
	return prev
end
