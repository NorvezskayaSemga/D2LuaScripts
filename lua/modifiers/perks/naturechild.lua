package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('GroupInfo')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

myModValue = Id.new('g200um0015').value
function canApplyToUnit(unitImpl)
	_GroupInfo_SetScenario(getScenario())
	return _GroupInfo_CanTakeUberperk(unitImpl, myModValue)
end

function getHitPoint(unit, prev)
	return svFlatEffectHitPoint(unit, prev, 75)
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Earth and prev ~= Immune.Always then
		return Immune.Once
	end
	return prev
end

function getRegen(unit, prev)
	return prev + 20
end
