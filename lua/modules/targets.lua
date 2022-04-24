
-- Created by Norvezskaya Semga

require('common')

function _target_Adjacent(attacker, selected, allies, targets, targetsAreAllies)
	local result = {}
	if not targetsAreAllies and not _common_IsOnFrontline(attacker, allies) then
		return result
	end

	local adjacentLine = _common_GetFrontline(targets)
	local minC = attacker.column - 1
	local maxC = attacker.column + 1
	result = _common_AddRange(result, targets, minC, maxC, adjacentLine, adjacentLine)
	if #result == 0 then
		minC = minC - 1
		maxC = maxC + 1
		result = _common_AddRange(result, targets, minC, maxC, adjacentLine, adjacentLine)
	end
	return result
end

function _target_All(attacker, selected, allies, targets, targetsAreAllies)
  return targets
end

function _target_SemgaAdjacentAndUncovered(attacker, selected, allies, targets, targetsAreAllies)
	local result = {}
	if not targetsAreAllies and not _common_IsOnFrontline(attacker, allies) then
		return result
	end
	
	local minC = attacker.column - 1
	local maxC = attacker.column + 1
	result = _common_AddRange(result, targets, minC, maxC, 0, 0)
	if #result == 0 then
		minC = minC - 1
		maxC = maxC + 1
		result = _common_AddRange(result, targets, minC, maxC, 0, 0)
	end
	
	minC = attacker.column - 1
	maxC = attacker.column + 1
	pool = {}
	pool = _common_AddRange(pool, targets, minC, maxC, 1, 1)
	for i = 1, #pool do
		if not _common_HasCover(targets, pool[i]) then
			result = _common_AddDelta(result, pool[i], targets, 0, 0, 0)
		end
	end
	if #result == 0 then
		minC = minC - 1
		maxC = maxC + 1
		result = _common_AddRange(result, targets, minC, maxC, 1, 1)
	end
	return result
end

function _target_SemgaAllIfFronline(attacker, selected, allies, targets, targetsAreAllies)
	if not targetsAreAllies and not _common_IsOnFrontline(attacker, allies) then
		return {}
	end
	return targets
end

function _target_SemgaAllUncovered(attacker, selected, allies, targets, targetsAreAllies)
	local result = {}
	for i = 1, #targets do
		if not _common_HasCover(targets, targets[i]) then
			result = _common_AddDelta(result, targets[i], targets, 0, 0, 0)
		end
	end
	return result
end

function _target_SemgaCatAgility(attacker, selected, allies, targets, targetsAreAllies)
	local result = {}
	if not targetsAreAllies and not _common_IsOnFrontline(attacker, allies) then
		return result
	end
	
	local nearestLine = _common_GetFrontline(targets)
	result = _target_Adjacent(attacker, selected, allies, targets, targetsAreAllies)
	if nearestLine == 0 then
		local frontlineTargets = {}
		frontlineTargets = _common_AddRange(frontlineTargets, targets, 0, 2, nearestLine, nearestLine)
		local maxEnemyIni = 0
		for i = 1, #frontlineTargets do
			maxEnemyIni = math.max(maxEnemyIni, frontlineTargets[i].unit.impl.attack1.initiative)
		end
		
	        -- log('ini: '..attacker.unit.impl.attack1.initiative)
	        -- log('max ini: '..maxEnemyIni)
	        -- log('nearestLine: '..nearestLine)
		if attacker.unit.impl.attack1.initiative > maxEnemyIni then
			local minC = attacker.column - 1
			local maxC = attacker.column + 1
			result = _common_AddRange(result, targets, minC, maxC, 1, 1)
		end
	end
	return result
end

function _target_SemgaNearestLineOrAll(attacker, selected, allies, targets, targetsAreAllies)
	if targetsAreAllies then
		return targets
	else
		if _common_IsOnFrontline(attacker, allies) then
			return targets
		else
			local result = {}
			local adjacentLine = _common_GetFrontline(targets)
			result = _common_AddRange(result, targets, 0, 2, adjacentLine, adjacentLine)
			return result
		end
	end
end

function _target_SemgaSmallEnth(attacker, selected, allies, targets, targetsAreAllies)
    if attacker.unit.impl.level < 5 then
	return _target_Adjacent(attacker, selected, allies, targets, targetsAreAllies)
    else
    	return _target_All(attacker, selected, allies, targets, targetsAreAllies)
    end
end
