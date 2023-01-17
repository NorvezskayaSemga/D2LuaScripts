package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require "unitAura"
require "setValue"
require "GroupInfo"
require "unitAuraCustomDesc"

math.randomseed(os.time() + 12345678)
-- math.randomseed(12345678)

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getHitPoint(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_HitPoint(unit, prev)
end

function getRegen(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_Regen(unit, prev)
end

function getArmor(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_Armor(unit, prev)
end

function getImmuneToAttack(unit, attack, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_ImmuneToAttack(unit, attack, prev)
end

function getImmuneToSource(unit, source, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_ImmuneToSource(unit, source, prev)
end

function getAttack2Id(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_Attack2Id(unit, prev)
end

function getAttackInitiative(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_AttackInitiative(unit, prev)
end

function getAttackPower(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_AttackPower1(unit, prev)
end

function getAttackDamage(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_AttackDamage1(unit, prev)
end

function getAttackHeal(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_AttackHeal1(unit, prev)
end

function getAttackDrain(unit, damage, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_AttackDrain(unit, damage, prev)
end

function getAttack2Power(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_AttackPower2(unit, prev)
end

function getAttack2Damage(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_AttackDamage2(unit, prev)
end

function getAttack2Heal(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_AttackHeal2(unit, prev)
end

function getAttack2Drain(unit, damage, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_Attack2Drain(unit, damage, prev)
end

function hasAbility(unit, ability, prev)
	if unit.type == -1 or prev == true then
		return prev
	end
	_unitAura_SetScenario(getScenario())
	return _unitAura_hasAbility(unit, ability, prev)
end

function getAttackCritHit(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_AttackCritHit(unit, prev)
end

function getAttackCritDamage(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_AttackCritDamage(unit, prev)
end

function getAttack2CritHit(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_Attack2CritHit(unit, prev)
end

function getAttack2CritDamage(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_Attack2CritDamage(unit, prev)
end

function getXpKilled(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_XpKilled(unit, prev)
end

function getAttackReach(unit, prev)
	svResetConcentrationDegree(unit)
	return prev
end

function getAtckTwice(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_AtckTwice(unit, prev)
end

function getMovement(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_getMovement(unit, prev)
end

function hasMovementBonus(unit, ground, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_hasMovementBonus(unit, ground, prev)
end

function getFastRetreat(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_getFastRetreat(unit, prev)
end

function getNegotiate(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_getNegotiate(unit, prev)
end

function getScout(unit, prev)
	_unitAura_SetScenario(getScenario())
	return _unitAura_getScout(unit, prev)
end

function onModifiersChanged(unit)
	-- log('cache mods of '..tostring(unit.impl.id)..' '..tostring(unit.impl.race))
	local idValue = unit.id.value
	_modifDisplay_Clear(idValue)
	_GroupInfo_cacheModifiers(unit, idValue)
	return 0
end

function modifiersChanged(unit)
	return onModifiersChanged(unit)
end

function onModifierAdded(unit, modifier)
	-- log('modifier added '..tostring(modifier.id))
	return onModifiersChanged(unit)
end

function onModifierRemoved(unit, modifier)
	-- log('modifier removed '..tostring(modifier.id))
	return onModifiersChanged(unit)
end
