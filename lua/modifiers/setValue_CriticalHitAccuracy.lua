
local _svCurrentCrit1Power = {}
local _svCurrentCrit2Power = {}
local _setValue_Crit1PowerSpellBuffMultiplier = {}
local _setValue_Crit2PowerSpellBuffMultiplier = {}

function svSetCrit1Power(unit, value, spellBuffMutiplier)
	local id = unit.id.value
	_svCurrentCrit1Power[id] = value
	_setValue_Crit1PowerSpellBuffMultiplier[id] = spellBuffMutiplier
end
function svSetCrit2Power(unit, value, spellBuffMutiplier)
	local id = unit.id.value
	_svCurrentCrit2Power[id] = value
	_setValue_Crit2PowerSpellBuffMultiplier[id] = spellBuffMutiplier
end

function svAddCrit1Power(unit, prev, value)
	local id = unit.id.value
	_svCurrentCrit1Power[id] = _svCurrentCrit1Power[id] + value
	return math.max( 0, math.min( _svCurrentCrit1Power[id], 100 ))
end

function svAddCrit2Power(unit, prev, value)
	local id = unit.id.value
	_svCurrentCrit2Power[id] = _svCurrentCrit2Power[id] + value
	return math.max( 0, math.min( _svCurrentCrit2Power[id], 100 ))
end

function svAddCrit1Power_Spell(unit, prev, value)
	local id = unit.id.value
	return svAddCrit1Power(unit, prev, value * _setValue_Crit1PowerSpellBuffMultiplier[id])
end

function svAddCrit2Power_Spell(unit, prev, value)
	local id = unit.id.value
	return svAddCrit2Power(unit, prev, value * _setValue_Crit2PowerSpellBuffMultiplier[id])
end
