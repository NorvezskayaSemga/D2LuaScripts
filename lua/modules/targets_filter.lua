
targets_filter = {}
require('GroupInfo')
require('RangeInfo')
require('common')
require('statscheck')
require('named_mods')
require('mRnd')
require('smnsInfo')
if smnsEnabled then
	require('smnsRange')
end

library = library or require('library')

-- скульптор лжи
G000UU7605 = Id.new('g000uu7605')
local G000UU7605Mods = {}
for i=1, 99 do 
	G000UU7605Mods[Id.new("g024um"..1100 + i).value] = 1
end

-- торхот
G000UU7592 = Id.new('g000uu7592')
G001UU7592 = Id.new('g001uu7592')
local G000UU7592Mods = {}
for i=1, 99 do 
	G000UU7592Mods[Id.new("g024um"..1000 + i).value] = 1
end

-- карманница
G024UM0041 = Id.new('g024um0041').value
G000UU8220 = Id.new('g000uu8220')

-- красный аколит
G024UM0252 = Id.new('g024um0252').value
G000UU7619 = Id.new('g000uu7619')

--buff attractor
G040UM0232 = Id.new('g040um0232').value

--chance to attack all
G040UM0243 = Id.new('g040um0243').value
--chance to attack random per lost HP
G040UM0245 = Id.new('g040um0245').value
--chance to attack random per lost HP x3
G040UM0246 = Id.new('g040um0246').value
--chance to attack random per 2 levels
G040UM0247 = Id.new('g040um0247').value

--attack units with LowerDamage
G040UM0285 = Id.new('g040um0285').value

--attack units with LowerInitiative

--attack units with Blister
G040UM0283 = Id.new('g040um0283').value

--attack units with Frostbite
G040UM0284 = Id.new('g040um0284').value


function _targets_filter_AttackType(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	local r = _targets_filter_ModifBuffer(attacker, targets, targetsAreAllies, item, battle)
	r = _targets_filter_Alchemist(attacker, r, targetsAreAllies, item, battle)
	-- r = _targets_filter_DoTIsMainAttack(methodName, attacker, selected, allies, r, targetsAreAllies, item, battle)
	return r
end	

function _targets_filter_Alchemist(attacker, targets, targetsAreAllies, item, battle)
	if not targetsAreAllies then
		return targets
	end
	local aunit = attacker.unit
	local aimpl = aunit.impl
	local apply = false
	local a
	local atype = _targets_filter_GetAttack1Type(attacker, item, battle)
	if atype == Attack.GiveAttack then
		apply = true
	else
		atype = _targets_filter_GetAttack2Type(attacker, item, battle)
		if atype ~= nil and atype == Attack.GiveAttack then
			apply = true
		end
	end
	if apply then
		local exclude
		local result = {}
		for i=1, #targets do
			exclude = false
			aimpl = targets[i].unit.impl
			if aimpl.attack1.type == Attack.GiveAttack then
				exclude = true
			else
				a = aimpl.attack2
				if a ~= nil and a.type == Attack.GiveAttack then
					exclude = true
				end
			end
			if not exclude then
				table.insert(result, targets[i])
			end
		end
		return result
	end
	return targets
end

function _targets_filter_DoTIsMainAttack_I(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if item then
		return targets
	end
	if targetsAreAllies or not statsCheck_isDoTType(attacker.unit.impl.attack1.type) or #targets < 1 then
		return targets
	end
	
	local aunit = attacker.unit
	local slots = _GroupInfo_getUnitGroup(targets[1].unit).slots
	local filteredslots = {}
	local inBattle
	local uid
	for i = 1, #slots do
		if slots[i].unit ~= nil then
			inBattle = true
			uid = slots[i].unit.id
			if slots[i].unit.hp == 0
			or battle:getUnitStatus(uid, BattleStatus.Retreated)
			or battle:getUnitStatus(uid, BattleStatus.Hidden)
			or _GroupInfo_UnitHasModifierValue(slots[i].unit, incorporeality_mod) then
				inBattle = false
			end
			if inBattle then
				table.insert(filteredslots, slots[i])
			end
		end
	end
	local trueTargets = _selector_getChoices(methodName, attacker, selected, allies, filteredslots, targetsAreAllies, item, battle)
	-- local result = {}
	-- for i = 1, #targets do
	-- 	if not _common_IsAddedFilter(trueTargets, targets[i]) then
	-- 		table.insert(result, targets[i])
	--	end
	-- end
	-- return result
	return trueTargets
end

function _targets_filter_DoTIsMainAttack_II(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if item then
		return targets
	end
	if targetsAreAllies or not statsCheck_isDoTType(attacker.unit.impl.attack1.type) or #targets < 1 then
		return targets
	end
	
	local filtered = {}
	for i = 1, #targets do
		if not battle:getUnitStatus(targets[i].unit.id, BattleStatus.Retreat) then
			table.insert(filtered, targets[i])
		end
	end
	return filtered
end


function _targets_filter_ModifBuffer(attacker, targets, targetsAreAllies, item, battle)
	if not targetsAreAllies then
		return targets
	end
	local aunit = attacker.unit
	if aunit == nil then
		return targets
	end
	local uid = aunit.baseImpl.id
	if uid == G000UU7605 then
		local add
		local u
		local uimpl
		local attack
		local mods
		local result = {}
		for i = 1, #targets do
			u = targets[i].unit
			uimpl = u.impl
			attack = uimpl.attack1.type
			add = statsCheck_isDirectDmgType(attack)
			   or statsCheck_isSelfTransformType(attack)
			if not add then
				attack = uimpl.attack2
				if attack ~= nil then
					attack = attack.type
					add = statsCheck_isDirectDmgType(attack)
					   or statsCheck_isSelfTransformType(attack)
				end
			end
			if add then
				mods = u.modifiers
				for k = 1, #mods do
					if G000UU7605Mods[mods[k].id.value] ~= nil then
						add = false
						break
					end
				end
			end
			if add then
				table.insert(result, targets[i])
			end
		end
		return result
	elseif uid == G000UU7592 or uid == G001UU7592 then
		local add
		local mods
		local result = {}
		for i = 1, #targets do
			add = true
			mods = targets[i].unit.modifiers
			for k = 1, #mods do
				if G000UU7592Mods[mods[k].id.value] ~= nil then
					add = false
					break
				end
			end
			if add then
				table.insert(result, targets[i])
			end
		end
		return result
	elseif uid == G000UU8220 then
		local result = {}
		for i = 1, #targets do
			if not _GroupInfo_UnitHasModifierValue(targets[i].unit, G024UM0041) then
				table.insert(result, targets[i])
			end
		end
		return result
	elseif uid == G000UU7619 then
		local result = {}
		for i = 1, #targets do
			if not _GroupInfo_UnitHasModifierValue(targets[i].unit, G024UM0252) then
				table.insert(result, targets[i])
			end
		end
		return result
	end
	return targets
end

function _targets_filter_AI_Helper(methodName, attacker, allies, targets, targetsAreAllies, item, battle, isMarking)

	if smnsEnabled then
		return _smns_AI_Helper(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle, isMarking)
	end

	_common_set_useRandom(false)
	local player = _GroupInfo_getUnitPlayer(attacker.unit)
	if player ~= nil and player.human then
		_common_set_useRandom(true)
		return targets
	end
	local usedAttack = _targets_filter_GetAttack1(attacker, item, battle)
	local areaScript = _RangeInfo_getAttackScriptName(usedAttack.reach)
	local selectedTargets
	local effect    = {}
	local effectSum = {}
	local result    = {}
	for i = 1, #targets do
		--эфф_урон это т1*(а1+т2*а2)
		--нужно переводить бафы/дебафы в урон
		--эфф_здоровье это текущ_хп/(1-0.01*броню)
		
		-- приоритет_атаки = эфф_урон / эфф_хп
		-- effect[i] = приоритет_атаки * эффект_нашего_действи€
		-- если убиваем, то effect[i] = effect[i] * 2
		
		-- при этом, если атака со сплешем, то делаем два расчета
		-- если юнит - перва€ цель и если не перва€
		if targetsAreAllies then
			--считаем эффективность бафа союзников
			effect[i] = 1
		else
			--считаем эффективность атаки врага
			effect[i] = 1
		end
	end
	for i = 1, #targets do
		selectedTargets = _getTargets(areaScript, attacker, targets[i], allies, targets, targetsAreAllies, item, battle, false)
		-- суммируем эф‘ект с учетом делени€ на кол-во целей и сплеша
		effectSum[i] = 0
		for j = 1, #selectedTargets do
			for k = 1, #targets do
				if selectedTargets[j] == targets[k] then
					effectSum[i] = effectSum[i] + effect[k]
					break
				end
			end
		end
	end
	
	local effectThreshold = 0
	for i = 1, #targets do
		if effectThreshold < effectSum[i] then
			effectThreshold = effectSum[i]
		end
	end
	effectThreshold = effectThreshold * 0.9
	for i = 1, #targets do
		if effectSum[i] >= effectThreshold then
			table.insert(result, targets[i])
		end
	end
	_common_set_useRandom(true)
	return result
end

function _targets_filter_BuffsAttraction(methodName, attacker, selected, allies, targets, targetsAreAllies, result, item, battle)
	if not targetsAreAllies or not statsCheck_isHealType(_targets_filter_GetAttack1Type(attacker, item, battle)) then
		return result
	end
	local mods
	for i = 1, #targets do
		if _common_IsAddedFilter(result, targets[i]) then
			mods = _GroupInfo_UnitModifiers(targets[i].unit)
			if _GroupInfo_UnitModifierAmount(mods, G040UM0232) > 0 then
				table.insert(result, targets[i])
			end
		end
	end
	return result
end


function _targets_filter_Cowardice(methodName, attacker, selected, allies, targets, targetsAreAllies, item, battle)
	if targetsAreAllies or #targets < 1 then
		return targets
	end
	local aunit = attacker.unit
	local mods = _GroupInfo_UnitModifiers(aunit)
	if _unitAura_CowardiceBig_val(aunit, mods) > 0 then
		local acolumn = attacker.column
		local slots = _GroupInfo_getUnitGroup(targets[1].unit).slots
		local inBattle
		local uid
		for i = 1, #slots do
			if slots[i].column == acolumn then
				local u = slots[i].unit
				if u ~= nil then
					if u.impl.small then
						return targets
					else
						inBattle = true
						uid = u.id
						if battle:getUnitStatus(uid, BattleStatus.Retreated)
						or battle:getUnitStatus(uid, BattleStatus.Retreat)
						or battle:getUnitStatus(uid, BattleStatus.Hidden)
						or _GroupInfo_UnitHasModifierValue(u, incorporeality_mod) then
							inBattle = false
						end
						if inBattle then
							local umods = _GroupInfo_UnitModifiers(u)
							if u.hp == 0 or _unitAura_CowardiceBig_val(u, umods) > 0 then
								return targets
							else
								return {}
							end
						else
							return targets
						end
					end
				end
			end
		end
	end
	return targets
end

function _targets_filter_Incorporeal(attacker, slots)
	local result = {}
	if #slots < 1 or _GroupInfo_UnitHasModifierValue(attacker.unit, incorporeality_mod) then
		return result
	end
	for i=1, #slots do
		if slots[i].unit ~= nil then
			if not _GroupInfo_UnitHasModifierValue(slots[i].unit, incorporeality_mod) then
				table.insert(result, slots[i])
			end
		else
			table.insert(result, slots[i])
		end
	end
	return result
end

function _targets_filter_AddTrargetsChance(methodName, attacker, selected, allies, targets, targetsAreAllies, result, item, battle)
	if item or #targets <= #result then
		return result
	end
	local useRnd = _common_get_useRandom()
	local unit = attacker.unit
	local mods = _GroupInfo_UnitModifiers(unit)
	local a
	if _GroupInfo_UnitModifierAmount(mods, G040UM0243) > 0 then
		local maxHP = _unitAura_GetScenario():getUnit(unit.id).hpMax
		local chance = 200 * ( maxHP - unit.hp ) / maxHP
		if (useRnd or chance >= 100) and _mRnd_simpleRndEvent(chance) then
			for i = 1, #targets do
				if _common_IsAddedFilter(result, targets[i]) then
					table.insert(result, targets[i])
				end
			end
		end
	end
	a = _GroupInfo_UnitModifierAmount(mods, G040UM0245)
	if useRnd and a > 0 then
		local hpMax = unit.hpMax
		local chance = 100 * a * ( hpMax - unit.hp ) / hpMax
		result = _common_PickNRandomsWithChance(result, selected, targets, 100, 100, chance)
	end
	a = _GroupInfo_UnitModifierAmount(mods, G040UM0246)
	if useRnd and a > 0 then
		local hpMax = unit.hpMax
		local chance = 300 * a * ( hpMax - unit.hp ) / hpMax
		result = _common_PickNRandomsWithChance(result, selected, targets, 100, 100, chance)
	end
	a = _GroupInfo_UnitModifierAmount(mods, G040UM0247)
	if useRnd and a > 0 then
		local overlevels = unit.impl.level - unit.baseImpl.level
		local chance = 100 * a * math.floor(overlevels / 2)
		result = _common_PickNRandomsWithChance(result, selected, targets, 100, 100, chance)
	end
	return result
end

function _targets_filter_AttackWithStatus(methodName, attacker, selected, allies, targets, result, targetsAreAllies, item, battle)
	local u
	local uid
	local attackerMods = _GroupInfo_UnitModifiers(attacker.unit)

	-- LowerDamage
	if _GroupInfo_UnitModifierAmount(attackerMods, G040UM0285) > 0 then
		for i = 1, #targets do
			u = targets[i].unit
			if u.hp > 0 and _common_IsAddedFilter(result, targets[i]) then
				uid = u.id
				if  not battle:getUnitStatus(uid, BattleStatus.Retreated)
				and not battle:getUnitStatus(uid, BattleStatus.Hidden)
				and not _GroupInfo_UnitHasModifierValue(u, incorporeality_mod)
				and (   battle:getUnitStatus(uid, BattleStatus.LowerDamageLvl1)
				     or	battle:getUnitStatus(uid, BattleStatus.LowerDamageLvl2)
				     or	battle:getUnitStatus(uid, BattleStatus.LowerDamageLong) ) then
					table.insert(result, targets[i])
				end
			end
		end
	end

	-- Blister
	if _GroupInfo_UnitModifierAmount(attackerMods, G040UM0283) > 0 then
		for i = 1, #targets do
			u = targets[i].unit
			if u.hp > 0 and _common_IsAddedFilter(result, targets[i]) then
				uid = u.id
				if  not battle:getUnitStatus(uid, BattleStatus.Retreated)
				and not battle:getUnitStatus(uid, BattleStatus.Hidden)
				and not _GroupInfo_UnitHasModifierValue(u, incorporeality_mod)
				and (   battle:getUnitStatus(uid, BattleStatus.Blister)
				     or	battle:getUnitStatus(uid, BattleStatus.BlisterLong) ) then
					table.insert(result, targets[i])
				end
			end
		end
	end

	-- Frostbite
	if _GroupInfo_UnitModifierAmount(attackerMods, G040UM0284) > 0 then
		for i = 1, #targets do
			u = targets[i].unit
			if u.hp > 0 and _common_IsAddedFilter(result, targets[i]) then
				uid = u.id
				if  not battle:getUnitStatus(uid, BattleStatus.Retreated)
				and not battle:getUnitStatus(uid, BattleStatus.Hidden)
				and not _GroupInfo_UnitHasModifierValue(u, incorporeality_mod)
				and (   battle:getUnitStatus(uid, BattleStatus.Frostbite)
				     or	battle:getUnitStatus(uid, BattleStatus.FrostbiteLong) ) then
					table.insert(result, targets[i])
				end
			end
		end
	end

	return result
end

function _targets_filter_SlotsListForSummoning(attacker, targets, item, battle)
	if _targets_filter_GetAttack1Type(attacker, item, battle) ~= Attack.Summon then
		return targets
	end
	local slots = _GroupInfo_getUnitGroup(attacker.unit).slots
	local result = {}
	local u
	local uid
	local add
	for i = 1, #slots do
		u = slots[i].unit
		add = false
		if u ~= nil then
			if u.hp == 0 then
				add = true
			else
				uid = u.id
				if  battle:getUnitStatus(uid, BattleStatus.Retreated)
				or  battle:getUnitStatus(uid, BattleStatus.Hidden) then
					add = true
				end
			end
		else
			add = true
		end
		if add then
			table.insert(result, slots[i])
		end
	end
	return result
end

function _targets_filter_GetAttack1(attacker, item, battle)
	if item then
		return item.base.attack
	else
		return attacker.unit.impl.attack1
	end
end
function _targets_filter_GetAttack2(attacker, item, battle)
	if item then
		return nil
	else
		return attacker.unit.impl.attack2
	end
end
function _targets_filter_GetAttack1Type(attacker, item, battle)
	if item then
		return item.base.attack.type
	else
		return attacker.unit.impl.attack1.type
	end
end
function _targets_filter_GetAttack2Type(attacker, item, battle)
	if item then
		return nil
	else
		local a = attacker.unit.impl.attack2
		if a ~= nil then
			return a.type
		end
	end
end

targets_filter.name = 'targets_filter'
return targets_filter
