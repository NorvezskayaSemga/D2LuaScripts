
local _setValue_scoutFloatPart  = {}
local _setValue_scoutSpellBuffMultiplier = {}
function svSetScoutFloatPart(unit, value, spellBuffMutiplier)
	local uid = unit.id.value
	_setValue_scoutFloatPart[uid] = value
	_setValue_scoutSpellBuffMultiplier[uid] = spellBuffMutiplier
	return 0
end
function svRoundScout(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_scoutFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_Scout(unit, sum)
	_setValue_scoutFloatPart[uid] = floatPart
	return intPart
end

function svFlatEffectScout(unit, prev, value)
	return svRoundScout(unit, value, prev)
end

function svFlatEffectScout_Spell(unit, prev, value)
	local uid = unit.id.value
	return svRoundScout(unit, value * _setValue_scoutSpellBuffMultiplier[uid], prev)
end
