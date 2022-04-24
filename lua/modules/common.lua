
-- Created by Norvezskaya Semga

function _common_IsAddedFilter(result, target)
	local notAdded = 1
	for k = 1, #result do
		if result[k] == target then
			notAdded = 0
			break
		end
	end
	return notAdded
end

function _common_RemoveAddedFromPool(added, pool)
	local newpool = {}
	for k = 1, #pool do
		if _common_IsAddedFilter(added, pool[k]) == 1 then
			table.insert(newpool, pool[k])
		end
	end
	return newpool
end

function _common_AddDelta(result, selected, targets, deltaColumn, deltaLine, transfer)
	local sc = selected.column + deltaColumn
	local sl = selected.line + deltaLine
	
	if transfer == 1 then
		if sc < 0 then
			sc = sc + 3
		elseif sc > 2 then
			sc = sc - 3
		end
		if sl < 0 then
			sl = sl + 2		
		elseif sl > 1 then
			sl = sl - 2
		end
	end
	
	for i = 1, #targets do
		local add = 0
		if targets[i].unit.impl.small then
			if sc == targets[i].column and sl == targets[i].line then
				add = 1
			end
		else
			if sc == targets[i].column then
				add = 1
			end
		end
		if add == 1 then
			add = _common_IsAddedFilter(result, targets[i])
		end
		if add == 1 then
			table.insert(result, targets[i])
		end
	end
	return result
end

function _common_AddRange(result, targets, minColumn, maxColumn, minLine, maxLine)
	for i = 1, #targets do
		local add = 0
		local c = targets[i].column
		local l = targets[i].line
		if targets[i].unit.impl.small then
			if c >= minColumn and c <= maxColumn and l >= minLine and l <= maxLine then
				add = 1
			end
		else
			if c >= minColumn and c <= maxColumn then
				add = 1
			end
		end
		if add == 1 then
			add = _common_IsAddedFilter(result, targets[i])
		end
		if add == 1 then
			table.insert(result, targets[i])	
		end
	end
	return result
end

function _common_PickOneRandom(result, selected, targets, maxDeltaColumn, maxDeltaLine)

    local others = {}
    local add = 1
    for i = 1, #targets do
    	add = 1
    	if targets[i].unit.impl.small then
    		if math.abs(targets[i].line - selected.line) > maxDeltaLine then
    			add = 0
    		end
    	end
    	if add == 1 then
    		if math.abs(targets[i].column - selected.column) > maxDeltaColumn then
    			add = 0
    		end
    	end
    	if add == 1 then
		add = _common_IsAddedFilter(result, targets[i])
    	end
    	if add == 1 then
        	table.insert(others, i)
        	if not targets[i].unit.impl.small and maxDeltaLine > 0 then
            		table.insert(others, i)
	        end
    	end
    end

    if #others > 0 then
        local selectedOther = _common_RndNum(#others, #others)
        local other = targets[others[selectedOther]]
        table.insert(result, other)
    end

    return result
end

function _common_GetFrontline(targets)
	local nearestLine = 99
	for i = 1, #targets do
		nearestLine = math.min(nearestLine, targets[i].line)
	end
	return nearestLine
end

function _common_HasCover(targets, target)
	local result = 0
	for i = 1, #targets do
		if targets[i].column == target.column then	
			if targets[i].line < target.line then
				result = 1
				break
			end
		end
	end
	return result
end

function _common_IsOnFrontline(unit, allies)
	local result = true
	if unit.backline then
		for i = 1, #allies do
			if allies[i].line < unit.line then
				result = false
				break
			end
		end
	end
	return result
end

set_randomseed = true
use_forceRndNum = false
function _common_RndEvent(chance, forceRndNum)
	local result = false
	if chance > 0 then
		if chance >= common_RndNum(100, forceRndNum) then
			result = true
		end
	end
	return result
end

-- вернет целое число от 1 до maxValue (включительно)
function _common_RndNum(maxValue, forceRndNum)
	local r = 0
	if use_forceRndNum then
		r = forceRndNum
	else
		r = math.random(maxValue)
	end
	-- log('random value: ' .. r .. ' max: ' .. maxValue)
	return r
end
function _common_SetSeed(addThis, attacker, allies, targets)
	local myseed = 0
	if set_randomseed then
		local myseed = os.time() + addThis
		myseed = myseed + _common_StatsSumArray(allies)
		myseed = myseed + _common_StatsSumArray(targets)
		myseed = myseed + _common_StatsSumItem(attacker)
		myseed = myseed + 712697 * attacker.column 
		                +  53383 * attacker.line
		
		-- log('random seed: ' .. myseed)
		math.randomseed(myseed)
		set_randomseed = false
	end
	return myseed
end

function _common_StatsSumArray(units)
	local result = 0
	for i = 1, #units do
		result = result + _common_StatsSumItem(units[i])
	end
	return result
end
function _common_StatsSumItem(unit)
	local u = unit.unit
	local i = u.impl
	local a = i.attack1
	
	local statsSum = 921 * u.hp
		       +  34 * i.armor
		       + 377 * i.level
	               +  19 * a.initiative
	               + 125 * a.power 
	               +  91 * a.damage 
	               + 162 * a.heal
	              
	local posSum   = 3 * (unit.column + 1) + 29 * (unit.line + 1)
	
	return  statsSum * posSum
end

