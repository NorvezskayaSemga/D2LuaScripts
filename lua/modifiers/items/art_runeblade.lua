package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, 0.3)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.3)
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.LowerDamage and prev ~= Immune.Always then
		local mods = _GroupInfo_UnitModifiers(unit)
		if _GroupInfo_UnitModifierAmount(mods, runestone_mod) > 0 then
			return Immune.Once
		end
	end
	return prev
end
