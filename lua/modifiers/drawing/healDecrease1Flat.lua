

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackHeal(unit, prev)
	if unit.impl.attack1.type == Attack.Heal then
		return prev - 1
	end
	return prev
end

function getAttack2Heal(unit, prev)
	if unit.impl.attack2 ~= nil then
		if unit.impl.attack2.type == Attack.Heal then
			return prev - 1
		end
	end
	return prev
end
