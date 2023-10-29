
local _setValue_initiativeFloatPart  = {}
local _setValue_initiativeAddedValuesMultiplier  = {}
local _setValue_InitiativeSpellBuffMultiplier = {}
function svInitiativeInit(unit, floatPart, addedValuesMultiplier, spellBuffMutiplier)
	local uid = unit.id.value
	_setValue_initiativeFloatPart[uid] = floatPart
	_setValue_initiativeAddedValuesMultiplier[uid] = addedValuesMultiplier
	_setValue_InitiativeSpellBuffMultiplier[uid] = spellBuffMutiplier
	return 0
end
function svRoundInitiative(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_initiativeFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_Initiative(unit, sum)
	_setValue_initiativeFloatPart[uid] = floatPart
	return intPart
end

function svMultimplyInitiative(unit, prev, multiplier)
	local uid = unit.id.value
	local v = _unitAura_GetBaseInitiative(uid)
	if v ~= nil then
		return svRoundInitiative(unit, v * multiplier * _setValue_initiativeAddedValuesMultiplier[uid], prev)
	end
	return prev
end

function svMultimplicativeEffectInitiative(unit, prev, multiplier)
	return svRoundInitiative(unit, prev * ( multiplier - 1 ), prev)
end

function svFlatEffectInitiative(unit, prev, value)
	local uid = unit.id.value
	return svRoundInitiative(unit, value * _setValue_initiativeAddedValuesMultiplier[uid], prev)
end

function svMultimplyInitiative_Spell(unit, prev, multiplier)
	local uid = unit.id.value
	return svMultimplyInitiative(unit, prev, multiplier * _setValue_InitiativeSpellBuffMultiplier[uid])
end