package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getHitPoint(unit, prev)
	return svMultimplyHitPoint(unit, prev, 0.2)
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Mind and prev ~= Immune.Always then
		return Immune.Once
	end
	return prev
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.DrainLevel then
		return Immune.Always
	end
	return prev
end
