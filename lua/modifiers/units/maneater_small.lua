

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
	return svFlatEffectSplash1(unit, 
				   prev - unit.baseImpl.attack1.damageRatio, 
				   math.min(25, unit.impl.level - 1))
end

function getAttack2DamRatio(unit, prev)
	local r
	local a = unit.baseImpl.attack2
	if a ~= nil then
		r = a.damageRatio
	else
		r = 0
	end
	return svFlatEffectSplash2(unit, 
				   prev - r, 
				   math.min(25, unit.impl.level - 1))
end
