
require('GroupInfo')
require('named_mods')
require('smnsInfo')

function _statsMultiplier_toIdArray(source)
	local dest = {}
	if smnsInfoHandleSpellDebuffsAsCommonMods then
		return dest
	end
	if source ~= nil and #source > 0 then
		for i = 1, #source do
			dest[i] = Id.new(source[i]).value
		end
	end
	return dest
end

local debuffDamage_10 = _statsMultiplier_toIdArray({'g040um0092'})
local debuffDamage_15 = _statsMultiplier_toIdArray({'g040um0087','g040um0090','g040um0091'})
local debuffDamage_33 = _statsMultiplier_toIdArray({'g040um0088','g040um0089'})

local debuffHeal_10 = debuffDamage_10
local debuffHeal_15 = debuffDamage_15
local debuffHeal_33 = debuffDamage_33

local debuffPower_10 = _statsMultiplier_toIdArray({'g005um0178','g000um0064'})
local debuffPower_20 = _statsMultiplier_toIdArray({'g000um7542','g000um0073'})
local debuffPower_25 = _statsMultiplier_toIdArray({'g000um0089'})
local debuffPower_33 = _statsMultiplier_toIdArray({'g000um0055'})

local debuffInitiative_10 = _statsMultiplier_toIdArray({'g001um7541','g005um0179'})
local debuffInitiative_15 = _statsMultiplier_toIdArray({'g000um0050'})
local debuffInitiative_33 = _statsMultiplier_toIdArray({'g000um0091','g000um0075'})

local debuffArmor_10 = _statsMultiplier_toIdArray({'g000um0045','g000um0065'})
local debuffArmor_15 = _statsMultiplier_toIdArray({'g005um0183'})
local debuffArmor_20 = _statsMultiplier_toIdArray({'g000um7543'})

local buffResistSource_Weapon = _statsMultiplier_toIdArray({'g040um0094', 'g040um0095', 'g040um0347', 'g040um0355'})
local buffResistSource_Mind = _statsMultiplier_toIdArray({'g040um0094', 'g040um0095', 'g040um0348', 'g040um0356'})
local buffResistSource_Death = _statsMultiplier_toIdArray({'g040um0094', 'g040um0095', 'g040um0349', 'g040um0357'})
local buffResistSource_Fire = _statsMultiplier_toIdArray({'g040um0094', 'g040um0095', 'g040um0350', 'g040um0358', 'g040um0371'})
local buffResistSource_Earth = _statsMultiplier_toIdArray({'g040um0094', 'g040um0095', 'g040um0352', 'g040um0360'})
local buffResistSource_Water = _statsMultiplier_toIdArray({'g040um0094', 'g040um0095', 'g040um0351', 'g040um0354', 'g040um0359'})
local buffResistSource_Air = _statsMultiplier_toIdArray({'g040um0094', 'g040um0095', 'g040um0353', 'g040um0361'})

local buffPlaceRod = _statsMultiplier_toIdArray({'g040um0365', 'g040um0366'})
local buffIncorruptible = _statsMultiplier_toIdArray({'g040um0364'})
local buffWandScrollUse = _statsMultiplier_toIdArray({'g040um0367'})
local buffSphereUse = _statsMultiplier_toIdArray({'g040um0368', 'g040um0370'})
local buffFastRetreat = _statsMultiplier_toIdArray({'g040um0369'})
local buffWalkForest = _statsMultiplier_toIdArray({'g040um0362'})
local buffWalkWater = _statsMultiplier_toIdArray({'g040um0363'})

function _statsMultiplier_EffectUnit_Multiplicative(unitMods, modsSearch, modValue)
	local result = 0
	for m = 1, #modsSearch do
		result = result + _GroupInfo_UnitModifierAmount(unitMods, modsSearch[m])
	end
	return modValue ^ result
end
function _statsMultiplier_EffectUnit_Additive(unitMods, modsSearch, modValue)
	local result = 0
	for m = 1, #modsSearch do
		result = result + _GroupInfo_UnitModifierAmount(unitMods, modsSearch[m])
	end
	return modValue * result
end

function _statsMultiplier_Damage1(unit, unitMods, spellDebuffLowerEffect)
	local debuffMulti = math.max(0, 1 - 0.01 * spellDebuffLowerEffect)
	return _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffDamage_10, (1 - 0.10 * debuffMulti))
	     * _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffDamage_15, (1 - 0.15 * debuffMulti))
	     * _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffDamage_33, (1 - 0.33 * debuffMulti))
end

function _statsMultiplier_Damage2(unit, unitMods, spellDebuffLowerEffect)
	return _statsMultiplier_Damage1(unit, unitMods, spellDebuffLowerEffect)
end

function _statsMultiplier_Heal1(unit, unitMods, spellDebuffLowerEffect)
	local debuffMulti = math.max(0, 1 - 0.01 * spellDebuffLowerEffect)
	return _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffHeal_10, (1 - 0.10 * debuffMulti))
	     * _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffHeal_15, (1 - 0.15 * debuffMulti))
	     * _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffHeal_33, (1 - 0.33 * debuffMulti))
end

function _statsMultiplier_Heal2(unit, unitMods, spellDebuffLowerEffect)
	return _statsMultiplier_Heal1(unit, unitMods, spellDebuffLowerEffect)
end

function _statsMultiplier_Power1(unit, unitMods, spellDebuffLowerEffect)
	local debuffMulti = math.max(0, 1 - 0.01 * spellDebuffLowerEffect)
	return _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffPower_10, (1 - 0.10 * debuffMulti))
	     * _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffPower_20, (1 - 0.20 * debuffMulti))
	     * _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffPower_25, (1 - 0.25 * debuffMulti))
	     * _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffPower_33, (1 - 0.33 * debuffMulti))
end

function _statsMultiplier_Power2(unit, unitMods, spellDebuffLowerEffect)
	return _statsMultiplier_Power1(unit, unitMods, spellDebuffLowerEffect)
end

function _statsMultiplier_Initiative(unit, unitMods, spellDebuffLowerEffect)
	local debuffMulti = math.max(0, 1 - 0.01 * spellDebuffLowerEffect)
	return _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffInitiative_10, (1 - 0.10 * debuffMulti))
	     * _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffInitiative_15, (1 - 0.15 * debuffMulti))
	     * _statsMultiplier_EffectUnit_Multiplicative(unitMods, debuffInitiative_33, (1 - 0.33 * debuffMulti))
end

function _statsMultiplier_Armor(unit, unitMods, spellDebuffLowerEffect)
	local debuffMulti = math.max(0, 1 - 0.01 * spellDebuffLowerEffect)
	return _statsMultiplier_EffectUnit_Additive(unitMods, debuffArmor_10, -10 * debuffMulti)
	     + _statsMultiplier_EffectUnit_Additive(unitMods, debuffArmor_15, -15 * debuffMulti)
	     + _statsMultiplier_EffectUnit_Additive(unitMods, debuffArmor_20, -20 * debuffMulti)
end

function _statsMultiplier_Movement(unit, unitMods, spellDebuffLowerEffect)
	local n100 = _GroupInfo_UnitModifierAmount(unitMods, spell_paraseus_mod)
		   + _GroupInfo_UnitModifierAmount(unitMods, drawing_nomove_mod)
	if n100 > 0 then
		return 0
	end
	
	if _GroupInfo_stackHasModifierAmount(luteofcharming_mod) > 0 
	and _GroupInfo_stackHasModifierAmount(oceanheart_mod) > 0 then
		return 1.0
	end
	
	local debuffMulti = math.max(0, 1 - 0.01 * spellDebuffLowerEffect)
	
	local n99  = _GroupInfo_UnitModifierAmount(unitMods, spell_mutilation_mod)
	local n50  = _GroupInfo_UnitModifierAmount(unitMods, spell_severeblizzard_mod)
		   + _GroupInfo_UnitModifierAmount(unitMods, spell_deathpsalm_mod)
	local n30  = _GroupInfo_UnitModifierAmount(unitMods, spell_entanglement_mod)

	return ((1 - 0.99 * debuffMulti)^n99)
	     * ((1 - 0.50 * debuffMulti)^n50)
	     * ((1 - 0.30 * debuffMulti)^n30)
end


function _statsMultiplier_FastRetreat(unit, unitMods, spellBuffMultiplier)
	if _statsMultiplier_EffectUnit_Additive(unitMods, buffFastRetreat, spellBuffMultiplier) > 0 then
		return true
	else
		return false
	end
end

function _statsMultiplier_WalkAbility(unit, unitMods, ground, spellBuffMultiplier)
	local arr
	if ground == Ground.Forest then
		arr = buffWalkForest
	elseif ground == Ground.Water then
		arr = buffWalkWater
	else
		arr = {}
	end
	if _statsMultiplier_EffectUnit_Additive(unitMods, arr, spellBuffMultiplier) > 0 then
		return true
	else
		return false
	end
end

function _statsMultiplier_Ability(unit, unitMods, ability, spellBuffMultiplier)
	local arr
	if ability == Ability.Incorruptible then
		arr = buffIncorruptible
	elseif ability == Ability.WandScrollUse then
		arr = buffWandScrollUse
	elseif ability == Ability.Rod then
		arr = buffPlaceRod
	elseif ability == Ability.OrbUse then
		arr = buffSphereUse
	else
		arr = {}
	end
	if _statsMultiplier_EffectUnit_Additive(unitMods, arr, spellBuffMultiplier) > 0 then
		return true
	else
		return false
	end
end

function _statsMultiplier_ResistanceSource(unit, unitMods, source, spellBuffMultiplier)
	local arr
	if source == Source.Weapon then
		arr = buffResistSource_Weapon
	elseif source == Source.Mind then
		arr = buffResistSource_Mind
	elseif source == Source.Death then
		arr = buffResistSource_Death
	elseif source == Source.Fire then
		arr = buffResistSource_Fire
	elseif source == Source.Water then
		arr = buffResistSource_Water
	elseif source == Source.Earth then
		arr = buffResistSource_Earth
	elseif source == Source.Air then
		arr = buffResistSource_Air
	else
		arr = {}
	end
	if _statsMultiplier_EffectUnit_Additive(unitMods, arr, spellBuffMultiplier) > 0 then
		return Immune.Once
	else
		return Immune.NotImmune
	end
end

