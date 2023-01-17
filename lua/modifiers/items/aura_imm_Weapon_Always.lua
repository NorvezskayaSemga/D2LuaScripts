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
	if _unitAura_hasOnceImmuneToSource(unit, Source.Weapon) then
		if unit.impl.small then
			return svMultimplyHitPoint(unit, prev, -0.25)
		else
			return svMultimplyHitPoint(unit, prev, -0.125)
		end
	else
		if unit.impl.small then
			return svMultimplyHitPoint(unit, prev, -0.5)
		else
			return svMultimplyHitPoint(unit, prev, -0.25)
		end
	end
end
