package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('unitAura')
require('named_mods')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getHitPoint(unit, prev)
	return svMultimplyHitPoint(unit, prev, 0.1)
end

function getArmor(unit, prev)
	return prev + 20
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Death and prev ~= Immune.Always then
		return Immune.Once
	end
	return prev
end
