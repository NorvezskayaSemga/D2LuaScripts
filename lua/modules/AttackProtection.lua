package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
require('GroupInfo')
require('mRnd')
require('unitAura')
require('common')
require('named_mods')

function _AttackProtection_ChangeTargets(attacker, targets, selectedTargets, battle)
	local attackerMods = _GroupInfo_UnitModifiers(attacker.unit)
	if _GroupInfo_UnitModifierAmount(attackerMods, ignoreprotection_mod) > 0 then
		return selectedTargets
	end

	local targetsArray, targetsIndex = _AttackProtection_To2DArray(targets)
	local selectedTargetsArray, selectedTargetsIndex = _AttackProtection_To2DArray(selectedTargets)
	local unit
	local protector
	local mods
	local chance
	local useRnd = _common_get_useRandom()
	for c = 0, 2 do
		unit      = selectedTargetsArray[1][c]
		protector = selectedTargetsArray[0][c]
		if unit ~= nil and protector == nil then
			protector = targetsArray[0][c]
			if protector ~= nil then
				mods = _GroupInfo_UnitModifiers(protector)
				chance = _unitAura_AttackProtection_val(unit, mods)
				if (useRnd or chance >= 100) and _mRnd_simpleRndEvent(chance) then
					selectedTargets[selectedTargetsIndex[1][c]] = targets[targetsIndex[0][c]]
				end
			end
		end
	end
	return selectedTargets
end

function _AttackProtection_To2DArray(targets)
	local slot
	local upos = {}
	upos[0] = {}
	upos[1] = {}
	local indx = {}
	indx[0] = {}
	indx[1] = {}
	for i = 1, #targets do
		slot = targets[i]
		upos[slot.line][slot.column] = slot.unit
		indx[slot.line][slot.column] = i
	end
	return upos, indx
end

function _AttackProtection_ModsAmount(unitMods, modsSearch)
	local result = 0
	for m = 1, #modsSearch do
		result = result + _GroupInfo_UnitModifierAmount(unitMods, modsSearch[m])
	end
	return result
end