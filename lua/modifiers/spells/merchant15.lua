

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function canApplyAsLowerSpell()
	return false
end

function canApplyAsBoostSpell()
	return true
end

function getLowerCost(unit, prev)
	return svFlatEffectLowerCost_Spell(unit, prev, 15)
end
