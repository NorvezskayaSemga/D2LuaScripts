

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	if unit.impl.level > 1 then
		return 55
	end
	return prev
end

function getAttackDamRatio(unit, prev)
	return math.min(50, 2 * (unit.impl.level - 1))
end

function getAttack2DamRatio(unit, prev)
	return getAttackDamRatio(unit, prev)
end
