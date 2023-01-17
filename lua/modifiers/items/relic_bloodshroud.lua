package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, 0.2)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.2)
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.Paralyze or attack == Attack.Fear then
		return Immune.Always
	end
	return prev
end
