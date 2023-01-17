package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

myModValue = Id.new('g200um0014').value
function canApplyToUnit(unitImpl)
	_GroupInfo_SetScenario(getScenario())
	return _GroupInfo_CanTakeUberperk(unitImpl, myModValue)
end

function getAttackInitiative(unit, prev)
	return svMultimplyInitiative(unit, prev, 0.15)
end

function getAttackPower(unit, prev)
	return svMultimplyPower1(unit, prev, 0.15)
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2(unit, prev, 0.15)
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, 0.15)
end

function getAttackHeal(unit, prev)
	return svMultimplyHeal1(unit, prev, 0.15)
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.15)
end

function getAttack2Heal(unit, prev)
	return svMultimplyHeal2(unit, prev, 0.15)
end
