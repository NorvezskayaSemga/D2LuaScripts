package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require "unitAura"
require "setValue"

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getHitPoint(unit, prev)
	if _unitAura_hasOnceImmuneToSource(unit, Source.Fire) then
		if unit.impl.small then
			return svMultimplyHitPoint(unit, prev, -0.15)
		else
			return svMultimplyHitPoint(unit, prev, -0.075)
		end
	else
		if unit.impl.small then
			return svMultimplyHitPoint(unit, prev, -0.3)
		else
			return svMultimplyHitPoint(unit, prev, -0.15)
		end
	end
end
