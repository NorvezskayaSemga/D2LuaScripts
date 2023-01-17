package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getHitPoint(unit, prev)
	return svMultimplyHitPoint(unit, prev, 0.15)
end

function getArmor(unit, prev)
	return prev + 10
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.Shatter and prev ~= Immune.Always then
		return Immune.Once
	end
	return prev
end
