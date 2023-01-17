package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require "unitAura"
require "setValue"

function getModifierDescTxt(unit, prev)
	return prev
end

function getModifierDisplay(unit, prev)
	return not _unitAura_hasAlwaysImmuneToSource(unit, Source.Earth)
end

function getHitPoint(unit, prev)
	if unit.impl.small then
		return svMultimplyHitPoint(unit, prev, -0.15)
	else
		return svMultimplyHitPoint(unit, prev, -0.075)
	end
end
