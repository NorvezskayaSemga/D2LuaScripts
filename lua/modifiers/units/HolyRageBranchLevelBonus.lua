package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDescTxt(unit, prev)
	return prev
end

function getModifierDisplay(unit, prev)
	local value = unit.impl.level - 10
	if value < 10 then
		return prev
	else
		return false
	end
end

function getAttack2Power(unit, prev)
	local value = unit.impl.level - 10
	if value < 0 then
		value = 0
	elseif value > 10 then
		value = 10
	end
	return svFlatEffectPower2(unit, prev, value)
end
