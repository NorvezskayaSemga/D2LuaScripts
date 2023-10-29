
require('GroupInfo')
require('unitAura')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

-- function getAttackInitiative(unit, prev)
-- 	return svMultimplyInitiative(unit, prev, 0.01 * _summon_RodPlacerEffect(unit))
-- end

-- function getAttackPower(unit, prev)
-- 	return svMultimplyPower1(unit, prev, 0.01 * _summon_RodPlacerEffect(unit))
-- end

-- function getAttack2Power(unit, prev)
-- 	return svMultimplyPower2(unit, prev, 0.01 * _summon_RodPlacerEffect(unit))
-- end

function getAttackCritHit(unit, prev)
    if prev then
    	return prev
    end
    _get_Group_and_Mods(unit)
    if _summon_RodPlacerEffect(unit) > 0 then
    	return true
    else
    	return prev
    end
end

function getAttackCritDamage(unit, prev)
    return svAddCrit1Damage(unit, prev, _summon_RodPlacerEffect(unit))
end

function getAttackCritPower(unit, prev)
	return svAddCrit1Power(unit, prev, _summon_RodPlacerEffect(unit))
end

function getAttack2CritHit(unit, prev)
    if prev then
    	return prev
    end
    _get_Group_and_Mods(unit)
    if _summon_RodPlacerEffect(unit) > 0 then
    	return true
    else
    	return prev
    end
end

function getAttack2CritDamage(unit, prev)
    return svAddCrit2Damage(unit, prev, _summon_RodPlacerEffect(unit))
end

function getAttack2CritPower(unit, prev)
	return svAddCrit2Power(unit, prev, _summon_RodPlacerEffect(unit))
end

function _summon_RodPlacerEffect(unit)
	local effectFunction = _unitAura_GlobalMagicSummonCritAndAccuracy_txt
	return _unitAura_NearestGroupsAuraEffect(unit, effectFunction, 4)
end

