package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('mRnd')
require('setValue')

local newAttackType = {}
local baronessParalizeTxt = Id.new("x000tg5078")
local baronessPerkTxt1 = Id.new("x010tg1807")
local baronessPerkTxt2 = Id.new("x010tg1808")

function getModifierDisplay(unit, prev)
	local uimpl = getScenario():getUnit(unit.id).impl
	local atype = uimpl.attack1.type
	if atype == Attack.Fear then
		return prev
	elseif atype == Attack.Paralyze then
		if 10 * ( uimpl.level - unit.baseImpl.level ) < 100 then
			return prev
		end
	end
	return false
end
function getModifierDescTxt(unit, prev)
	local uimpl = getScenario():getUnit(unit.id).impl
	local atype = uimpl.attack1.type
	if atype == Attack.Fear or atype == Attack.Paralyze then
		if uimpl.level > 2 then
			return baronessPerkTxt2
		else
			return baronessPerkTxt1
		end
	end
	return prev
end

function getAttackClass(unit, prev)
	local id = unit.id.value
	if unit.impl.level > 2 and prev == Attack.Fear then
		newAttackType[id] = Attack.Paralyze
		return Attack.Paralyze
	end
	newAttackType[id] = -1
	return prev
end

function getAttackInfinite(unit, prev)
	local id = unit.id.value
	if newAttackType[id] == Attack.Paralyze then
		local chance = 10 * ( unit.impl.level - unit.baseImpl.level )
		return _mRnd_simpleRndEvent(chance)
	end
	return prev
end

function getAttackPower(unit, prev)
	local id = unit.id.value
	if newAttackType[id] == Attack.Paralyze then
		return svMultimplyPower1(unit, prev, -0.125)
	end
	return prev
end

function getAttackNameTxt(unit, prev)
	local id = unit.id.value
	if newAttackType[id] == Attack.Paralyze then
		return baronessParalizeTxt
	end
	return prev
end
