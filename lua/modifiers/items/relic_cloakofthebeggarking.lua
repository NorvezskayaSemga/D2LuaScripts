package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getLowerCost(unit, prev)
	local p = _GroupInfo_getUnitPlayer(unit)
	if p ~= nil then
		return prev + math.max(50 - math.floor(p.bank.gold / 50), 0)
	end
	return prev
end
