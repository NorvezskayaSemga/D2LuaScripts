package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackPower(unit, prev)
	return svMultimplyPower1(unit, prev, 0.15)
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2(unit, prev, 0.15)
end

function getAttackReach(unit, prev)
	local r = prev
	if unit.impl.race ~= Race.Neutral then
		if r == 25 then
			r = 34
		elseif r == 34 then
			r = 102
		end
	end
	if prev ~= r then
		svAddConcentrationDegree(unit, 1)
	else
		svAddConcentrationDegree(unit, 0)
	end
	return r
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, 0.15 + svGetConcentrationDegree(unit))
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, 0.15 + svGetConcentrationDegree(unit))
end
