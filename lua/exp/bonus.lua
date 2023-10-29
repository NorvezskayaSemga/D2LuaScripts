package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')
require('unitAura')
require('smnsInfo')
require('named_mods')
if smnsEnabled then
	require('smnsExp')
end

G014UM1068 = Id.new('g014um1068').value
G040UM0187 = Id.new('g040um0187').value
G040UM0209 = Id.new('g040um0209').value
G040UM0236 = Id.new('g040um0236').value

function _getSummonBonusLevel(summoner, summonImpl, item)
	_get_Group_and_Mods(summoner)
	local mods = _GroupInfo_UnitModifiers(summoner)
	local result = _unitAura_SummonBonusLevel_val(summoner, mods)
		     + _unitAura_SummonTransform_valFlat(summoner)
		     + _GroupInfo_UnitModifierAmount(mods, G014UM1068) * 2
	if smnsEnabled then
		result = result + _smnsExp_getSummonBonusLevel(summoner, summonImpl, item)
	end
	return result
end
function _getSummonExpTransferEffectiveness(summoner, summonImpl, item)
	local eff
	_get_Group_and_Mods(summoner)
	local mods = _GroupInfo_UnitModifiers(summoner)
	local globalMultiplier
	if item then
		-- Не отрицательное число. Увеличиваем, чтобы повысить эффективность заливки опыта для слабых юнитов
		local denominatorShift = 100		
		-- Не отрицательное число. Увеличиваем, чтобы снизить общую эффективность заливки опыта
		local dividerShift = 0
		eff = math.sqrt((summonImpl.xpNext+denominatorShift)/(10000+dividerShift))
		globalMultiplier = smnsInfoExpTransferEffectiveness_Summon_Item
	else
		eff = 1
		globalMultiplier = smnsInfoExpTransferEffectiveness_Summon
	end
	local amount =  _GroupInfo_UnitModifierAmount(mods, G040UM0187)
	if amount > 0 then
		eff = eff + math.min(0.5, 0.05 * ( summoner.impl.level - summoner.baseImpl.level ))
	end
	eff = eff + 0.01 * _unitAura_SummonTransform_Exp(summoner)
	if smnsEnabled then
		eff = eff + _smnsExp_getSummonExpTransferEffectiveness(summoner, summonImpl, item)
	end
	return eff * globalMultiplier
end

function _getDoppelgangerBonusLevel(doppelganger, target)
	_get_Group_and_Mods(doppelganger)
	local mods = _GroupInfo_UnitModifiers(doppelganger)
	local result = _unitAura_SummonTransform_valFlat(doppelganger)
             	     + _GroupInfo_UnitModifierAmount(mods, linaret_mod) * 2
	     	     + _GroupInfo_UnitModifierAmount(mods, G014UM1068) * 2
	if smnsEnabled then
		result = result + _smnsExp_getDoppelgangerBonusLevel(doppelganger, target)
	end
	return result
end
function _getDoppelgangerExpTransferEffectiveness(doppelganger, target)
	_get_Group_and_Mods(doppelganger)
	local mods = _GroupInfo_UnitModifiers(doppelganger)
	local eff = 1 + 0.01 * _unitAura_SummonTransform_Exp(doppelganger)
                      + 0.25 * _GroupInfo_UnitModifierAmount(mods, linaret_mod)
                      - 0.35 * _GroupInfo_UnitModifierAmount(mods, G040UM0236)
	if smnsEnabled then
		eff = eff + _smnsExp_getDoppelgangerExpTransferEffectiveness(doppelganger, target)
	end
	return eff * smnsInfoExpTransferEffectiveness_Doppelganger
end

function _getTransformSelfBonusLevel(unit, transformImpl, item)
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	local result = _GroupInfo_UnitModifierAmount(mods, G040UM0209) * 4
		     + _GroupInfo_UnitModifierAmount(mods, G014UM1068) * 2
	if _GroupInfo_UnitModifierAmount(mods, no_exp_bonus_with_selftransform) == 0 or item then
		result = result + _unitAura_SummonTransform_valFlat(unit)
	end
	if smnsEnabled then
		result = result + _smnsExp_getTransformSelfBonusLevel(unit, transformImpl, item)
	end
	return result
end
function _getTransformSelfExpTransferEffectiveness(unit, transformImpl, item)
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	if _GroupInfo_UnitModifierAmount(mods, no_exp_bonus_with_selftransform) == 0 or item then
		local eff = 1 + 0.01 * _unitAura_SummonTransform_Exp(unit)
		if smnsEnabled then
			eff = eff + _smnsExp_getTransformSelfExpTransferEffectiveness(unit, transformImpl, item)
		end
		return eff * smnsInfoExpTransferEffectiveness_TransformSelf
	else
		return 1.0
	end
end
