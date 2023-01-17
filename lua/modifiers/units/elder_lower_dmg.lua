package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('mRnd')

function getModifierDisplay(unit, prev)
	local uimpl = getScenario():getUnit(unit.id).impl
	local a = uimpl.attack2
	if a ~= nil and a.type == Attack.LowerDamage then
		local chance = 5 * ( uimpl.level - unit.baseImpl.level )
		if chance < 100 then
			return prev
		else
			return false
		end
	end
	return false
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttack2Level(unit, prev)
	if prev > 1 then
		return prev
	end
	local uimpl = unit.impl
	local a = uimpl.attack2
	if a == nil or a.type ~= Attack.LowerDamage then
		return prev
	end
	local chance = 5 * ( uimpl.level - unit.baseImpl.level )
	if _mRnd_simpleRndEvent(chance) then
		return prev + 1
	end
	return prev
end
