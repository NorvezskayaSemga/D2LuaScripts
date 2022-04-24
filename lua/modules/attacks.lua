
-- Created by Norvezskaya Semga

require('common')

function _attack_All(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	result = _common_AddRange(result, targets, 0, 2, 0, 1)
	return result
end

function _attack_AllAdjacent(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	local adjacentLine = _common_GetFrontline(targets)
	local minC = attacker.column - 1
	local maxC = attacker.column + 1
	result = _common_AddRange(result, targets, minC, maxC, adjacentLine, adjacentLine)
	return result
end

function _attack_Area2x2(attacker, selected, allies, targets, targetsAreAllies)	
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 0, 1, 1)
	
	if selected.column == 0 or selected.column == 1 then
		result = _common_AddDelta(result, selected, targets, 1, 0, 1)
		result = _common_AddDelta(result, selected, targets, 1, 1, 1)
	else
		result = _common_AddDelta(result, selected, targets, -1, 0, 1)
		result = _common_AddDelta(result, selected, targets, -1, 1, 1)	
	end
	return result
end

function _attack_Column(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 0, 1, 1)
	return result
end

function _attack_Line(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 1, 0, 1)
	result = _common_AddDelta(result, selected, targets, -1, 0, 1)
	return result
end

function _attack_SelectedTarget(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	return result
end

function _attack_SelectedTargetAndAllAdjacentToIt(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 1, 0, 0)
	result = _common_AddDelta(result, selected, targets, -1, 0, 0)
	return result
end

function _attack_SelectedTargetAndOneBehindIt(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 0, 1, 0)
	return result
end

function _attack_SelectedTargetAndOneRandom(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	result = _common_PickOneRandom(result, selected, targets, 100, 100)
	return result
end

function _attack_SelectedTargetAndOneRandomAdjacentToIt(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	result = _common_PickOneRandom(result, selected, targets, 1, 0)
	return result
end

function _attack_SelectedTargetAndTwoChainedRandom(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	result = _common_PickOneRandom(result, result[#result], targets, 1, 1)
	result = _common_PickOneRandom(result, result[#result], targets, 1, 1)
	return result
end

function _attack_SemgaAllUncovered(attacker, selected, allies, targets, targetsAreAllies, pierceChance)
	local result = {selected}
	for i = 1, #targets do
		if _common_HasCover(targets, targets[i]) == 0 then
			result = _common_AddDelta(result, targets[i], targets, 0, 0, 0)
		elseif _common_RndEvent(pierceChance, 0) then
			result = _common_AddDelta(result, targets[i], targets, 0, 0, 0)
		end
	end
	return result
end

function _attack_SemgaCheckers(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	if selected.column == 0 then
		result = _common_AddDelta(result, selected, targets, 1, 1, 1)
		result = _common_AddDelta(result, selected, targets, -1, 0, 1)
	elseif selected.column == 1 then
		result = _common_AddDelta(result, selected, targets, 1, 1, 1)
		result = _common_AddDelta(result, selected, targets, -1, -1, 1)
	elseif selected.column == 2 then
		result = _common_AddDelta(result, selected, targets, -1, -1, 1)
		result = _common_AddDelta(result, selected, targets, 1, 0, 1)
	end
	return result
end

function _attack_SemgaCross(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 0, 1, 0)
	result = _common_AddDelta(result, selected, targets, 1, 0, 0)
	result = _common_AddDelta(result, selected, targets, 0, -1, 0)
	result = _common_AddDelta(result, selected, targets, -1, 0, 0)
	return result
end

function _attack_SemgaFuryMelee(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	if 100 * attacker.unit.hp / attacker.unit.hpMax < 50 then
		local minC = attacker.column - 1
		local maxC = attacker.column + 1
		local minL = selected.line
		local maxL = selected.line
		result = _common_AddRange(result, targets, minC, maxC, minL, maxL)
	end
	return result
end

function _attack_SemgaFuryRange(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	if 100 * attacker.unit.hp / attacker.unit.hpMax < 50 then
		result = _common_AddDelta(result, selected, targets, 1, 0, 1)
		result = _common_AddDelta(result, selected, targets, -1, 0, 1)
	end
	return result
end

function _attack_SemgaNearestLineOrAll(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	if _common_IsOnFrontline(attacker, allies) then
		result = _attack_All(attacker, selected, allies, targets, targetsAreAllies)
	else
		local f = _common_GetFrontline(targets)
		result = _common_AddRange(result, targets, 0, 2, f, f)
	end
	return result
end

function _attack_SemgaPierceHit(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
 	if _common_RndEvent(50, 0) then
 		result = _common_AddDelta(result, selected, targets, 0, 1, 1)
	end
	return result
end

function _attack_SemgaPointBlank(attacker, selected, allies, targets, targetsAreAllies)
	local result = {}
	local selectedIsAdjusted = 0
	if math.abs(attacker.column - selected.column) < 2 then
		selectedIsAdjusted = 1
	end
	if _common_IsOnFrontline(attacker, allies) and selectedIsAdjusted == 1 then
		local minC = selected.column
		local maxC = selected.column
		result = _common_AddRange(result, targets, minC, maxC, 0, 0)
		result = _common_AddRange(result, targets, minC, maxC, 1, 1)
	else
		result = _common_AddDelta(result, selected, targets, 0, 0, 0)
	end
	return result
end

function _attack_SemgaSmallEnth(attacker, selected, allies, targets, targetsAreAllies)
	local result = {}
	if attacker.unit.impl.level < 5 then
		result = _attack_SelectedTarget(attacker, selected, allies, targets, targetsAreAllies)
	elseif attacker.unit.impl.level < 10 then
		result = _attack_SelectedTarget(attacker, selected, allies, targets, targetsAreAllies)
	elseif attacker.unit.impl.level < 15 then
		result = _attack_Line(attacker, selected, allies, targets, targetsAreAllies)
	else
		result = _attack_All(attacker, selected, allies, targets, targetsAreAllies)
	end
	return result
end

function _attack_SemgaTargetAndTwoRandomBackline(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	local pool = {}
	local s = -1
	
	pool = _common_AddRange(pool, targets, 0, 2, 1, 1)
	pool = _common_RemoveAddedFromPool(result, pool)
	while(#result < 3 and #pool > 0)
	do
		s = _common_RndNum(#pool, #pool)
		table.insert(result, pool[s])
		table.remove(pool, s)
	end
	if #result < 3 then
		pool = {}
		pool = _common_AddRange(pool, targets, 0, 2, 0, 0)
		pool = _common_RemoveAddedFromPool(result, pool)
		while(#result < 3 and #pool > 0)
		do
			s = _common_RndNum(#pool, #pool)
			table.insert(result, pool[s])
			table.remove(pool, s)
		end
	end
	return result
end

function _attack_SemgaTwoAnyColumns(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 0, 1, 1)
	result = _common_AddDelta(result, selected, targets, 1, 0, 1)
	result = _common_AddDelta(result, selected, targets, 1, 1, 1)	
	return result
end

function _attack_SemgaTwoAnyInLine(attacker, selected, allies, targets, targetsAreAllies)
	local result = {selected}
	result = _common_AddDelta(result, selected, targets, 1, 0, 1)
	return result
end
