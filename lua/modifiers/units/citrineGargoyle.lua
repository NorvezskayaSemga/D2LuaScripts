package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('converter')
require('GroupInfo')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackDamage(unit, prev)
	if prev > 0 then
		local value =  _getCitrineGargoyleAttackBonus(unit)
		return svFlatEffectDamage1(unit, prev, value)
	end
	return prev
end

function getAttackHeal(unit, prev)
	if prev > 0 then
		local value = _getCitrineGargoyleAttackBonus(unit) * unit.impl.attack1.power
		return svFlatEffectHeal1(unit, prev, value)
	end
	return prev
end

function _getCitrineGargoyleAttackBonus(unit)
	-- 0.25 * ������(����_������*(���������_�����+1))
	local overlevel = unit.impl.level - unit.baseImpl.level
	local exp
	
	local stack = _GroupInfo_getUnitStack(unit)
	if stack ~= nil then
		local leader = _GroupInfo_getGroupLeader(stack.group)
		if leader ~= nil and leader.hp > 0 then
			exp = _getUnitExp(leader)
		else
			exp = 0
		end
	else
		exp = _getUnitExp(unit)
	end
	return 0.25 * math.sqrt( exp * ( overlevel + 1 ))
end
