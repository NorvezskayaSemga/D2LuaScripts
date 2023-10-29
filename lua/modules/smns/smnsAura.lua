package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')
require('RangeInfo')
require('mRnd')
require('common')
require('statscheck')
require('game_constants')
require('smnsInfo')

local smns_scenario = nil
function _smnsAura_SetScenario(scen)
    smns_scenario = scen
    return smns_scenario
end

-- changes hit points
-- prev - numeric value of hit points
function _smns_multiplicativeHitPointBonus(unit, prev)
	return 0
end

-- changes regen
-- prev - numeric value of regeneration
function _smns_flatRegenBonus(unit, prev)
	return 0
end

-- changes armor
-- prev - numeric value of armor
function _smns_flatArmorBonus(unit, prev)
	return 0
end

-- changes damage and heal
-- prev - numeric value of attack
-- attackN = 1 or 2. 1 - primary attack, 2 - secondary attack
-- unitMods - list of modifiers
function _smns_multiplicativeDamageHealBonus(unit, prev, attackN, unitMods)
	return 0
end

-- changes accuracy
-- prev - numeric value of attack
-- attackN = 1 or 2. 1 - primary attack, 2 - secondary attack
-- unitMods - list of modifiers
function _smns_multiplicativePower(unit, prev, attackN, unitMods)
	return 0
end

-- changes accuracy
-- prev - numeric value of attack
-- attackN = 1 or 2. 1 - primary attack, 2 - secondary attack
-- unitMods - list of modifiers
function _smns_flatPower(unit, prev, attackN, unitMods)
	return 0
end

-- changes initiative
-- prev - numeric value of initiative
function _smns_flatInitiativeBonus(unit, prev)
	return 0
end

-- changes initiative
-- prev - numeric value of initiative
function _smns_percentInitiativeBonus(unit, prev)
	return 0
end

-- change immunity to attack class
-- attack - attack class
-- prev - previous value
function _smns_ImmuneToAttack(unit, attack, prev, currentValue)
	return currentValue
end

-- change immunity to attack source
-- attack - attack source
-- prev - previous value
function _smns_ImmuneToSource(unit, source, prev, currentValue)
	return currentValue
end

-- change leader ability
-- attack - attack class
-- prev - previous value
function _smns_hasAbility(unit, ability, prev, currentValue)
	return currentValue
end

-- changes movepoints
-- prev - numeric value of movepoints
function _smns_flatMovementBonus(unit, prev, currentValue)
	return 0
end

-- changes merchant discount
-- prev - numeric value of movepoints
function _smns_flatLowerCostBonus(unit, prev, currentValue)
	return 0
end

-- changes surface movement: water, roads, forest etc.
-- ground - surface type
-- prev - previous value
function _smns_hasMovementBonus(unit, ground, prev, currentValue)
	return currentValue
end
function _smns_getScout(unit, prev, currentValue)
	return 0
end
function _smns_getNegotiate(unit, prev, currentValue)
	return 0
end
function _smns_getFastRetreat(unit, prev, currentValue)
	return currentValue
end

-- specify what is unit attack drain level value without modifiers
function _smns_getUnitAttackDrainLevelBaseValue(attacker, target)
	return 1
end
