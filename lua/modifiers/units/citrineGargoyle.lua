package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('converter')
require('GroupInfo')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	local baseLvl = unit.baseImpl.level
	if baseLvl == 3 then
		return Id.new('x010tg1768')
	end
	return Id.new('x012tg1344')
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
		local value = _getCitrineGargoyleAttackBonus(unit) * _common_getImplAttack1(unit.impl).power
		return svFlatEffectHeal1(unit, prev, value)
	end
	return prev
end

function _getCitrineGargoyleAttackBonus(unit)
	-- 0.25 * ������(����_������*(����������_��������+1))
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
