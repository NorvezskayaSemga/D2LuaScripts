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

function getHitPoint(unit, prev)
	return svFlatEffectHitPoint(unit, prev, 30)
end

function getImmuneToAttack(unit, attack, prev)
	if prev == Immune.NotImmune and (attack == Attack.Paralyze or attack == Attack.Petrify) then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, khanflail_mod) > 0 then
			return Immune.Once
		end
	end
	return prev
end

function getImmuneToSource(unit, source, prev)
	if prev == Immune.NotImmune and source == Source.Weapon then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, orcishshield_mod) > 0 then
			return Immune.Once
		end
	end
	return prev
end
