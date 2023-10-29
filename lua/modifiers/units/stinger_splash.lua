

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamRatio(unit, prev)
	return svFlatEffectSplash1(unit, 
				   prev - _common_getImplAttack1(unit.baseImpl).damageRatio, 
				   math.min(25, 10 + unit.impl.level - unit.baseImpl.level))
end

function getAttack2DamRatio(unit, prev)
	return svFlatEffectSplash2(unit, 
				   prev - unit.baseImpl.attack2.damageRatio, 
				   math.min(25, 10 + unit.impl.level - unit.baseImpl.level))
end
