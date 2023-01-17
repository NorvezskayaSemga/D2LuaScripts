package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('RangeInfo')
require('smallEnthInfo')

X010TG1769 = Id.new('x010tg1769')
X010TG1770 = Id.new('x010tg1770')
X010TG1771 = Id.new('x010tg1771')

function getModifierDisplay(unit, prev)
	if unit.impl.level < 15 then
		return prev
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	local level = unit.impl.level
	if level < 5 then
		return X010TG1769
	elseif level < 10 then
		return X010TG1770
	elseif level < 15 then
		return X010TG1771
	else
		return prev
	end
end

function getAttackReach(unit, prev)
	local r = _smallEnthInfo_aReach(unit)
	if prev == _RangeInfo_changeToRanged(prev) then
		r = _RangeInfo_changeToRanged(r)
	end
	return r
end
