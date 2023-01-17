

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getXpKilled(unit, prev)
	return math.max(prev - 10000, 1)
end
