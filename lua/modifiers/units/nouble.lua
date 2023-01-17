package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getMovement(unit, prev)
	local p = _GroupInfo_getUnitPlayer(unit)
	if p ~= nil and p.race ~= Race.Neutral and p.lord == Lord.Diplomat then
		return svFlatEffectMovement(unit, prev, 5)
	end
	return prev
end
