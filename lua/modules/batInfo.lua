
require('game_constants')

_battle = nil
_scenario = nil

function _batInfo_setBattle(battle)
	_battle = battle
	return 0
end
function _batInfo_getBattle()
	return _battle
end
function _batInfo_setScenario(scenario)
	_scenario = scenario
	return 0
end

unitIsInAttackerGroup = {}
function _batInfo_isControlledByAI(unit, battle)
	if battle.autoBattle then
		return true
	end
	local owner, ownerType = _batInfo_unitGroupOwner(unit, battle)
	local player =  owner.owner
	if player ~= nil then
		return (not player.human)
	else
		return true
	end
end

function _batInfo_unitGroup(unit, battle)
	if unitIsInAttackerGroup[unit.id.value] then
		if battle.attacker.group:hasUnit(unit) then
			unitIsInAttackerGroup[unit.id.value] = true
			return battle.attacker.group
		else
			unitIsInAttackerGroup[unit.id.value] = false
			return battle.defender
		end
	else
		if battle.defender:hasUnit(unit) then
			unitIsInAttackerGroup[unit.id.value] = false
			return battle.defender
		else
			unitIsInAttackerGroup[unit.id.value] = true
			return battle.attacker.group
		end
	end
end

function _batInfo_unitGroupOwner(unit, battle)
	if unitIsInAttackerGroup[unit.id.value] then
		if battle.attacker.group:hasUnit(unit) then
			unitIsInAttackerGroup[unit.id.value] = true
			return _batInfo_GroupOwner_Attackers(battle)
		else
			unitIsInAttackerGroup[unit.id.value] = false
			return _batInfo_GroupOwner_Defenders(battle)
		end
	else
		if battle.defender:hasUnit(unit) then
			unitIsInAttackerGroup[unit.id.value] = false
			return _batInfo_GroupOwner_Defenders(battle)
		else
			unitIsInAttackerGroup[unit.id.value] = true
			return _batInfo_GroupOwner_Attackers(battle)
		end
	end
end
function _batInfo_GroupOwner_Attackers(battle)
	return battle.attacker, OwnerTypeStack
end
function _batInfo_GroupOwner_Defenders(battle)
	local groupId = battle.defender.id
	local owner = _scenario:getStack(groupId)
	if owner ~= nil then
		return owner, OwnerTypeStack
	end
	owner = _scenario:getFort(groupId)
	if owner ~= nil then
		return owner, OwnerTypeFort
	end
	return _scenario:getRuin(groupId), OwnerTypeRuin
end