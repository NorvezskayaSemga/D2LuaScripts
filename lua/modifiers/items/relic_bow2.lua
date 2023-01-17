package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')
require('setValue')
require('statscheck')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackReach(unit, prev)
	return _RangeInfo_changeToRanged(prev)
end

function getAttackInitiative(unit, prev)
	if _GroupInfo_UnitIsRangedWithoutBow(unit) then
		return prev
	else
		return svMultimplyInitiative(unit, prev, -0.25)
	end
end

function getImmuneToAttack(unit, attack, prev)
	if attack == Attack.LowerDamage and prev ~= Immune.Always then
		if _GroupInfo_UnitIsRangedWithoutBow(unit) then
			return Immune.Once
		end
	end
	return prev
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Fire and prev ~= Immune.Always then
		if _GroupInfo_UnitIsRangedWithoutBow(unit) then
			return Immune.Once
		end
	end
	return prev
end

function getAttack2Source(unit, prev)
	if statsCheck_isDirectDmgAttack(unit.impl.attack2) then
		return Source.Fire
	else
		return prev
	end
end
