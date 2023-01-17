

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getNegotiate(unit, prev)
	return prev - 20
end

function hasAbility(unit, ability, prev)
	if ability == Ability.Incorruptible then
		return false
	end
	return prev
end
