package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('smnsInfo')
require('RangeInfo')
require('GroupInfo')
require('mRnd')
require('common')
require('statscheck')
require('game_constants')

-- changes targets list before applying range scripts
-- currentResult - who already selected as target
-- methodName - what damage range is used
-- attacker, selected, allies, targets, targetsAreAllies - see mss32 manual
function _smns_ChangeTargetsInput(currentResult, methodName, attacker, selected, allies, targets, targetsAreAllies, item)
	local newTargets = targets
	return newTargets
end

-- changes targets list
-- currentResult - who already selected as target
-- methodName - what damage range is used
-- attacker, selected, allies, targets, targetsAreAllies - see mss32 manual
function _smns_ChangeTargets(currentResult, methodName, attacker, selected, allies, targets, targetsAreAllies, item)
	return currentResult
end

-- changes list of what player can select as primary target
-- currentResult - who already selected
-- methodName - what damage range is used
-- attacker, selected, allies, targets, targetsAreAllies - see mss32 manual
function _smns_ChangeSelect(currentResult, methodName, attacker, selected, allies, targets, targetsAreAllies, item)
	return currentResult
end
