package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
require('smnsInfo')
require('RangeInfo')
require('GroupInfo')
require('mRnd')
require('common')
require('statscheck')
require('game_constants')

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
