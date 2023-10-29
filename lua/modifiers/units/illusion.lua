

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getImmuneToSource(unit, source, prev)
	if unit.baseImpl.id == Id.new('g000uu0107') and source == Source.Fire then
		return svSourceImmunityClass(unit, source, Immune.NotImmune, Immune.Once)
	end
	return svSourceImmunityClass(unit, source, Immune.NotImmune, Immune.NotImmune)
end

function getImmuneToAttack(unit, attack, prev)
	return svAttackImmunityClass(unit, attack, Immune.NotImmune, Immune.NotImmune)
end

function getHitPoint(unit, prev)
	return svFlatEffectHitPoint(unit, 1, 0)
end