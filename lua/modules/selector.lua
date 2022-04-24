
-- Created by Norvezskaya Semga

require('attacks')
require('targets')

function _selector_getTargets(methodName, attacker, selected, allies, targets, targetsAreAllies)
	local result = {}
	if methodName == "_attack_All" then
		result = _attack_All(attacker, selected, allies, targets, targetsAreAllies)
	elseif methodName == "_attack_AllAdjacent" then
		result = _attack_AllAdjacent(attacker, selected, allies, targets, targetsAreAllies)
	elseif methodName == "_attack_Area2x2" then
		result = _attack_Area2x2(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_Column" then
		result = _attack_Column(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_Line" then
		result = _attack_Line(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SelectedTarget" then
		result = _attack_SelectedTarget(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SelectedTargetAndAllAdjacentToIt" then
		result = _attack_SelectedTargetAndAllAdjacentToIt(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SelectedTargetAndOneBehindIt" then
		result = _attack_SelectedTargetAndOneBehindIt(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SelectedTargetAndOneRandom" then
		result = _attack_SelectedTargetAndOneRandom(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SelectedTargetAndOneRandomAdjacentToIt" then
		result = _attack_SelectedTargetAndOneRandomAdjacentToIt(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SelectedTargetAndTwoChainedRandom" then
		result = _attack_SelectedTargetAndTwoChainedRandom(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SemgaAllUncovered" then
		result = _attack_SemgaAllUncovered(attacker, selected, allies, targets, targetsAreAllies, 0)
	elseif  methodName == "_attack_SemgaAllUncoveredPierce" then
		result = _attack_SemgaAllUncovered(attacker, selected, allies, targets, targetsAreAllies, 50)
	elseif  methodName == "_attack_SemgaCheckers" then
		result = _attack_SemgaCheckers(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SemgaCross" then
		result = _attack_SemgaCross(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SemgaFuryMelee" then
		result = _attack_SemgaFuryMelee(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SemgaFuryRange" then
		result = _attack_SemgaFuryRange(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SemgaNearestLineOrAll" then
		result = _attack_SemgaNearestLineOrAll(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SemgaPierceHit" then
		result = _attack_SemgaPierceHit(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SemgaPointBlank" then
		result = _attack_SemgaPointBlank(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SemgaSacrifice" then
	elseif  methodName == "_attack_SemgaSmallEnth" then
		result = _attack_SemgaSmallEnth(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SemgaTargetAndTwoRandomBackline" then
		result = _attack_SemgaTargetAndTwoRandomBackline(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SemgaTwoAnyColumns" then
		result = _attack_SemgaTwoAnyColumns(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_attack_SemgaTwoAnyInLine" then
		result = _attack_SemgaTwoAnyInLine(attacker, selected, allies, targets, targetsAreAllies)
	end
	return result
end

function _selector_getChoices(methodName, attacker, selected, allies, targets, targetsAreAllies)
	local result = {}
	if  methodName == "_target_Adjacent" then
		result = _target_Adjacent(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_target_All" then
		result = _target_All(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_target_SemgaAdjacentAndUncovered" then
		result = _target_SemgaAdjacentAndUncovered(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_target_SemgaAllIfFronline" then
		result = _target_SemgaAllIfFronline(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_target_SemgaAllUncovered" then
		result = _target_SemgaAllUncovered(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_target_SemgaCatAgility" then
		result = _target_SemgaCatAgility(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_target_SemgaNearestLineOrAll" then
		result = _target_SemgaNearestLineOrAll(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_target_SemgaSemiarcher" then
		result = _target_SemgaSemiarcher(attacker, selected, allies, targets, targetsAreAllies)
	elseif  methodName == "_target_SemgaSmallEnth" then
		result = _target_SemgaSmallEnth(attacker, selected, allies, targets, targetsAreAllies)
	end
	return result
end
