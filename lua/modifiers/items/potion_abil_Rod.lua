

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function hasAbility(unit, ability, prev)
	if ability == Ability.Rod then
		return true
	end
	return prev
end
