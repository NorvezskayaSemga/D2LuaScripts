package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
setRequire={}
require('smnsInfo')
require('GroupInfo')
require('named_mods')
unitAura = unitAura or require('unitAura')


function svMultimplyDamage1(unit, prev, multiplier)
	local v = _unitAura_GetBaseDamage1(unit.id.value)
	if v ~= nil and v > 0 then
		local attk = unit.impl.attack1
		if attk.type ~= Attack.Shatter then
			return math.max( prev + v * multiplier, smnsInfoDebuffed_Damege_LowerBound_Percent * v )
		end
	end
	return prev
end

function svMultimplyDamage2(unit, prev, multiplier)
	local v = _unitAura_GetBaseDamage2(unit.id.value)
	if v ~= nil and v > 0 then
		local attk = unit.impl.attack2
		if attk ~= nil and attk.type ~= Attack.Shatter then
			return math.max( prev + v * multiplier, smnsInfoDebuffed_Damege_LowerBound_Percent * v )
		end
	end
	return prev
end

function svMultimplyHeal1(unit, prev, multiplier)
	if not smnsInfoApplyDmgBuffToHeal then
		return prev
	end
	local v = _unitAura_GetBaseHeal1(unit.id.value)
	if v ~= nil then
		return math.max( prev + v * multiplier, smnsInfoDebuffed_Heal_LowerBound_Percent * v )
	end
	return prev
end

function svMultimplyHeal2(unit, prev, multiplier)
	if not smnsInfoApplyDmgBuffToHeal then
		return prev
	end
	local v = _unitAura_GetBaseHeal2(unit.id.value)
	if v ~= nil then
		return math.max( prev + v * multiplier, smnsInfoDebuffed_Heal_LowerBound_Percent * v )
	end
	return prev
end

function svMultimplyPower1(unit, prev, multiplier)
	local v = _unitAura_GetBasePower1(unit.id.value)
	if v ~= nil then
		return math.max( prev + v * multiplier, smnsInfoDebuffed_Accuracy_LowerBound_Percent * v )
	end
	return prev
end

function svMultimplyPower2(unit, prev, multiplier)
	if not smnsInfoApplyAccuracyBuffToAttack2 then
		return prev
	end
	local v = _unitAura_GetBasePower2(unit.id.value)
	if v ~= nil then
		return math.max( prev + v * multiplier, smnsInfoDebuffed_Accuracy_LowerBound_Percent * v )
	end
	return prev
end

function svMultimplyInitiative(unit, prev, multiplier)
	local v = _unitAura_GetBaseInitiative(unit.id.value)
	if v ~= nil then
		return prev + v * multiplier
	end
	return prev
end

function svMultimplyHitPoint(unit, prev, multiplier)
	local v = _unitAura_GetBaseHitPoint(unit.id.value)
	if v ~= nil then
		return prev + v * multiplier
	end
	return prev
end

function svMultimplyXpNext(unit, prev, multiplier)
	return prev + unit.leveledImpl.xpNext * multiplier
end

function svMultimplyXpKilled(unit, prev, multiplier)
	local v = _unitAura_GetBaseXpKilled(unit.id.value)
	if v ~= nil then
		return prev + v * multiplier
	end
	return prev
end

_svCurrentCrit1Value = {}
_svCurrentCrit2Value = {}
function svSetCrit1InitialDamage(unit, value)
	_svCurrentCrit1Value[unit.id.value] = value
end
function svSetCrit2InitialDamage(unit, value)
	_svCurrentCrit2Value[unit.id.value] = value
end
function svAddCrit1Damage(unit, prev, value)
	local id = unit.id.value
	_svCurrentCrit1Value[id] = _svCurrentCrit1Value[id] + value
	return _svCurrentCrit1Value[id]
end
function svAddCrit2Damage(unit, prev, value)
	local id = unit.id.value
	_svCurrentCrit2Value[id] = _svCurrentCrit2Value[id] + value
	return _svCurrentCrit2Value[id]
end
function svAddCrit1Power(unit, prev, value)
	return prev + value
end
function svAddCrit2Power(unit, prev, value)
	return prev + value
end

function svAddDrain1(unit, prev, damage, multiplier)
	return prev + damage * multiplier
end
function svAddDrain2(unit, prev, damage, multiplier)
	return prev + damage * multiplier
end

function svMultimplicativeEffectDamage1(unit, prev, multiplier)
	local attk = unit.impl.attack1
	if attk.type ~= Attack.Shatter then
		return prev * multiplier
	end
	return prev
end

function svMultimplicativeEffectDamage2(unit, prev, multiplier)
	local attk = unit.impl.attack2
	if attk ~= nil and attk.type ~= Attack.Shatter then
		return prev * multiplier
	end
	return prev
end

function svMultimplicativeEffectHeal1(unit, prev, multiplier)
	if not smnsInfoApplyDmgBuffToHeal then
		return prev
	end
	return prev * multiplier
end

function svMultimplicativeEffectHeal2(unit, prev, multiplier)
	if not smnsInfoApplyDmgBuffToHeal then
		return prev
	end
	return prev * multiplier
end

function svMultimplicativeEffectPower1(unit, prev, multiplier)
	return prev * multiplier
end

function svMultimplicativeEffectPower2(unit, prev, multiplier)
	if not smnsInfoApplyAccuracyBuffToAttack2 then
		return prev
	end
	return prev * multiplier
end

function svMultimplicativeEffectInitiative(unit, prev, multiplier)
	return prev * multiplier
end

function svMultimplicativeEffectHitPoint(unit, prev, multiplier)
	return prev * multiplier
end

function svMultimplicativeEffectXpNext(unit, prev, multiplier)
	return prev * multiplier
end

function svMultimplicativeEffectXpKilled(unit, prev, multiplier)
	return prev * multiplier
end

function svFlatEffectDamage1(unit, prev, value)
	local attk = unit.impl.attack1
	if attk.type ~= Attack.Shatter then
		return prev + value
	end
	return prev
end

function svFlatEffectDamage2(unit, prev, value)
	local attk = unit.impl.attack2
	if attk ~= nil and attk.type ~= Attack.Shatter then
		return prev + value
	end
	return prev
end

function svFlatEffectShatter1(unit, prev, value)
	local attk = unit.impl.attack1
	if attk.type == Attack.Shatter then
		return prev + value
	end
	return prev
end

function svFlatEffectShatter2(unit, prev, value)
	local attk = unit.impl.attack2
	if attk ~= nil and attk.type == Attack.Shatter then
		return prev + value
	end
	return prev
end

function svFlatEffectHeal1(unit, prev, value)
	if not smnsInfoApplyDmgBuffToHeal then
		return prev
	end
	return prev + value
end

function svFlatEffectHeal2(unit, prev, value)
	if not smnsInfoApplyDmgBuffToHeal then
		return prev
	end
	return prev + value
end

function svFlatEffectPower1(unit, prev, value)
	return prev + value
end

function svFlatEffectPower2(unit, prev, value)
	if not smnsInfoApplyAccuracyBuffToAttack2 then
		return prev
	end
	return prev + value
end

function svFlatEffectInitiative(unit, prev, value)
	return prev + value
end

function svFlatEffectHitPoint(unit, prev, value)
	return prev + value
end

function svFlatEffectXpNext(unit, prev, value)
	return prev + value
end

function svFlatEffectXpKilled(unit, prev, value)
	return prev + value
end

_setValue_movementFloatPart = {}
function svSetMovementFloatPart(unit, value)
	local uid = unit.id.value
	_setValue_movementFloatPart[uid] = value
	return 0
end
function svRoundMovement(unit, value)
	local uid = unit.id.value
	_setValue_movementFloatPart[uid] = _setValue_movementFloatPart[uid] + value
	if _setValue_movementFloatPart[uid] > 0 then
		local intPart = math.floor(_setValue_movementFloatPart[uid])
		_setValue_movementFloatPart[uid] = _setValue_movementFloatPart[uid] - intPart
		return intPart
	else
		return 0
	end
end

function svFlatEffectMovement(unit, prev, value)
	if prev == 0 then
		return prev
	end
	local unitMods = _GroupInfo_UnitModifiers(unit)

	return prev + svRoundMovement(unit, value * _unitAura_movementMultiplier(unit, unitMods))
end

_ConcentrationDegree        = {}
_ConcentrationDegreeDivider = {}
function svResetConcentrationDegree(unit)
	local uid = unit.id.value
	_ConcentrationDegree[uid] = 0
	_ConcentrationDegreeDivider[uid] = 0
	return 0
end
function svAddConcentrationDegree(unit, value)
	local uid = unit.id.value
	_ConcentrationDegree[uid] = _ConcentrationDegree[uid] + value
	_ConcentrationDegreeDivider[uid] = _ConcentrationDegreeDivider[uid] + 1
	return 0
end
function svGetConcentrationDegree(unit)
	local uid = unit.id.value
	return _ConcentrationDegree[uid] / _ConcentrationDegreeDivider[uid]
end

setRequire.name = 'setRequire'
return setRequire
