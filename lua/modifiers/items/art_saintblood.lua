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
	return svFlatEffectHitPoint(unit, prev, 75)
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Mind and prev ~= Immune.Always then
		return Immune.Once
	end
	return prev
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.Petrify and prev ~= Immune.Always then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, holychalice_mod) > 0 then
			return Immune.Once
		end
	end
	return prev
end
