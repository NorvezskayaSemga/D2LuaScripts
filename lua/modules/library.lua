
-- Created by Norvezskaya Semga

library = {}
require('selector')
require('common')
require('AttackProtection')
require('smnsInfo')
require('GroupInfo')
require('RangeInfo')
require('batInfo')
require('workshop_commonlib')
if workshopEnabled then
	require('workshop_special_mechanics')
end
if smnsEnabled then
	require('smnsRange')
end
targets_filter = targets_filter or require('targets_filter')

enableExternalModifiers = true
enableAiHelper = true


function _getTargets(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
	local result = {}
	_batInfo_setBattle(battle)
	local useRandom_PrevState = _common_get_useRandom()
	if isMarking then
		_common_set_useRandom(false)
	end
	
	-- if enableExternalModifiers and not targetsAreAllies and #targets > 0 then
	-- 	externalModifiers(attacker, targets[1])
	-- end
	if enableExternalModifiers then
		externalModifiers(battle)
	end
	
	targets = _targets_filter_Incorporeal(attacker, item, battle, targets)
	allies = _targets_filter_Incorporeal(attacker, item, battle, allies)
	
	if smnsEnabled then
		targets = _smns_ChangeTargetsInput(currentResult, methodName, attacker, selected, allies, targets, targetsAreAllies, item)
	end
	
	-- применение модификаторов на удар в другую цель, отличную от selected
	if (not isMarking) and useRandom_PrevState then
		local mods = _GroupInfo_UnitModifiers(attacker.unit)
		if _targets_filter_SelectedTargetsRandomly(mods, attacker, item, battle) then
			local targetScriptName = _RangeInfo_getTargetScriptName(_common_getImplAttack1(attacker.unit.impl).reach)
			local enableAiHelper_PrevState = enableAiHelper
			enableAiHelper = false
			local allTargets = _getChoices(targetScriptName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
			if #allTargets > 0 then
				selected = allTargets[_mRnd_RndNum(#allTargets)]
			end
			enableAiHelper = enableAiHelper_PrevState
		end
	end
	
	-- применение модификаторов на удар в цель с "насмешкой", если достаем
	
	-- выбор целей для способности
	result = _selector_getTargets(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	
	--local r = {}
	--for i = 1, #result do
	--	for j = 1, #targets do
	--		if result[i] == targets[j] then
	--            		table.insert(r, targets[j])
	--            		break
	--            	end
	--	end
	--end
	
	result = _targets_filter_AttackWithStatus(methodName, attacker, selected, allies, targets, result, targetsAreAllies, item, battle)

	result = _targets_filter_AddTrargetsChance(methodName, attacker, selected, allies, targets, targetsAreAllies, result, item, battle)
	
	result = _targets_filter_BuffsAttraction(methodName, attacker, selected, allies, targets, targetsAreAllies, result, item, battle)
	
	result = _targets_filter_AttackType(methodName, attacker, selected, allies, result, targetsAreAllies, item, battle)

	if smnsEnabled then
		result = _smns_ChangeTargets(result, methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
	end
	
	if not targetsAreAllies then
		-- применение модификаторов на изменение количества целей
		if not isMarking then
			result = _AttackProtection_ChangeTargets(attacker, targets, result, battle)
		end
	
		-- применение модификаторов на уворот
	end
	
	_common_set_useRandom(useRandom_PrevState)
	
	
	return result
end

nrounds=0
prevRound = -10000 
function _getChoices(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
	if print_round and prevRound ~= battle.currentRound then
		prevRound = battle.currentRound
		nrounds = nrounds + 1
		if math.fmod(nrounds,1) == 0 then
			log('nrounds '..nrounds)
		end
	end
	
	_batInfo_setBattle(battle)
	local result = {}
	
	if enableExternalModifiers then
		externalModifiers(battle)
	end
	
	local prevTargets = nil
	if heal_enhanced_aiming then
		targets, prevTargets = _targets_filter_TargetsForHealAndBoost(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
	end
	
	targets = _targets_filter_Incorporeal(attacker, item, battle, targets)
	allies = _targets_filter_Incorporeal(attacker, item, battle, allies)
	
	if prevTargets == nil then
	
		targets = _targets_filter_Cowardice(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	
		targets = _targets_filter_targetsSelectRestriction(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
		
		targets = _targets_filter_DoTIsMainAttack_I(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
			
		-- логика исключения из targets того, кто и так получит баф
		
		-- выбор возможных целей
		result = _selector_getChoices(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
		
		result = _targets_filter_AttackType(methodName, attacker, selected, allies, result, targetsAreAllies, item, battle)
		
		if smnsEnabled then
			result = _smns_ChangeSelect(result, methodName, attacker, selected, allies, targets, targetsAreAllies, item)
		end
		
		result = _targets_filter_DoTIsMainAttack_II(methodName, attacker, selected, allies, result, targetsAreAllies, item, battle)
		
		if workshopEnabled then
			result = Workshop_Mechanics_damageUnitsRangeRestriction(scenario, methodName, attacker, selected, allies, result, targetsAreAllies, item, battle, isMarking)
			result = Workshop_Mechanics_neutralsSelectTargetsRandomly(scenario, methodName, attacker, selected, allies, result, targetsAreAllies, item, battle, isMarking)
		end
	else
		result = targets
	end
		
	-- корректируем цели в случае ИИ
	local mods = _GroupInfo_UnitModifiers(attacker.unit)
	if enableAiHelper and not _targets_filter_SelectedTargetsRandomly(mods, attacker, item, battle) then
		local enableExternalModifiers_PrevState = enableExternalModifiers
		enableExternalModifiers = false
		result = _targets_filter_AI_Helper(result, prevTargets, methodName, attacker, allies, targets, targetsAreAllies, item, battle, isMarking)
		enableExternalModifiers = enableExternalModifiers_PrevState
	end
	
	return result
end

library.name = 'library'
return library
