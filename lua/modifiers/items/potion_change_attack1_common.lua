package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('statscheck')
require('unitAura')

G000000000 = Id.new("g000000000")
_setSplit = {}

function _changeAttackClass_Dmg1(unit, prev)
	local id = unit.id.value
	_setSplit[id] = nil
	if not statsCheck_isDirectDmgType(prev) and  
	   not statsCheck_isDoTType(prev) and 
	   not statsCheck_isShatterType(prev) then
		local impl = unit.impl
		local bimpl = unit.baseImpl
		local attack1 = impl.attack1
		local a1heal = attack1.heal
		local overlevel = impl.level - bimpl.level
		
		if a1heal > 0 then
			_unitAura_SetNewDamage1(unit, a1heal)
		else
			local attack2 = impl.attack2
			if attack2 == nil or attack2.heal == 0 then
				attack2 = _unitAura_GetAddedDamageReaplacedAttack2(id)
			end
			if attack2 ~= nil and attack2.heal > 0 then
				_unitAura_SetNewDamage1(unit, attack2.heal)
			else
				local baseDmg = 20 + 0.04 * math.max(impl.xpNext, bimpl.xpNext)
				if unit.leveledImpl.attacksTwice then
					baseDmg = baseDmg * 0.5
				end
				_unitAura_SetNewDamage1(unit, baseDmg * (1 + 0.1 * overlevel))
				_setSplit[id] = true
			end
		end
		_unitAura_SetNewPower1(unit, 80 + math.min(overlevel, 10))
	end
	return 0
end

function _changeAttackClass_Dmg1_Attack2(unit, prev)
	if statsCheck_isHealAttack(prev) then
		return G000000000
	else
		return prev
	end
end

function _changeAttackClass_Dmg1_Split(unit, prev)
	local id = unit.id.value
	if _setSplit[id] == nil then
		return prev
	else
		return _setSplit[id]
	end
end

function _changeAttackClass_Heal1(unit, prev)
	local id = unit.id.value
	_setSplit[id] = nil
	if not statsCheck_isHealType(prev) or unit.impl.attack1.heal == 0 then
		local impl = unit.impl
		local bimpl = unit.baseImpl
		local attack1 = impl.attack1
		local attack2 = impl.attack2
		local a1damage = attack1.damage
		local a2effect = 0
		if attack2 ~= nil then
			-- a2effect = 0.01 * attack2.damage * attack2.power
			local a2Power
			local baseA2 = bimpl.attack2
			if baseA2 ~= nil then
				a2Power = baseA2.power
			else
				a2Power = 75
			end
			a2effect = 0.01 * attack2.damage * a2Power
		end
		local overlevel = impl.level - bimpl.level
		
		if a1damage > 1 then
			-- _unitAura_SetNewHeal1(unit, (a1damage + a2effect) * 0.01 * attack1.power)
			local a1Power
			local baseA1 = bimpl.attack1
			if baseA1 ~= nil then
				a1Power = baseA1.power
			else
				a1Power = 75
			end
			_unitAura_SetNewHeal1(unit, (a1damage + a2effect) * 0.01 * a1Power)
		else
			--local attack2 = impl.attack2
			--if attack2 == nil or attack2.heal == 0 then
			--	attack2 = _unitAura_GetAddedDamageReaplacedAttack2(id)
			--end
			--if attack2 ~= nil and attack2.damage > 0 then
			--	_unitAura_SetNewDamage1(unit, attack2.heal)
			--else
				local baseHeal = 15 + 0.03 * math.max(impl.xpNext, bimpl.xpNext) + a2effect
				if unit.leveledImpl.attacksTwice then
					baseHeal = baseHeal * 0.5
				end
				_unitAura_SetNewHeal1(unit, baseHeal * (1 + 0.1 * overlevel))
				_setSplit[id] = true
			--end
		end
		--_unitAura_SetNewPower1(unit, 100)
	end
	return 0
end

function _changeAttackClass_Heal1_Attack2(unit, prev)
	if not statsCheck_isHealAttack(prev) then
		return G000000000
	else
		return prev
	end
end

function _changeAttackClass_Heal1_Split(unit, prev)
	local id = unit.id.value
	if _setSplit[id] == nil then
		return prev
	else
		return _setSplit[id]
	end
end

