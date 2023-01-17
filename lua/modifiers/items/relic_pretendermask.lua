package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"

G000AA2079 = Id.new("g000aa2079")

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackId(unit, prev)
	if unit.original ~= nil or not unit.impl.small then
		return prev
	else
		return G000AA2079
	end
end

G000000000 = Id.new("g000000000")
function getAttack2Id(unit, prev)
	if unit.impl.attack1.type == Attack.Doppelganger then
		return G000000000
	else
		return prev
	end
end

function getAtckTwice(unit, prev)
	if unit.original == nil then
		return false
	end
	return prev
end
