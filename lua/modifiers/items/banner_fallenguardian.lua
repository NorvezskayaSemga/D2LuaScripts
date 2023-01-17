package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('statscheck')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getRegen(unit, prev)
	local a1 = unit.impl.attack1
	local a2 = unit.impl.attack2
	if statsCheck_isHealAttack(a1)
	or statsCheck_isHealAttack(a2)
	or statsCheck_isCurseAttack(a1)
	or statsCheck_isCurseAttack(a2) then
		return prev + 5
	else
		return prev
	end
end

function getImmuneToAttack(unit, attack, prev)
	if statsCheck_isCurseType(attack) and attack ~= Attack.LowerDamage then
		if statsCheck_isHealAttack(unit.impl.attack1)
		or statsCheck_isHealAttack(unit.impl.attack2) then
			return Immune.Always
		end
	end
	return prev
end

function getAttackPower(unit, prev)
	if statsCheck_isCurseAttack(unit.impl.attack1) then
		return svMultimplyPower1(unit, prev, 0.2)
	else
		return prev
	end
end

function getAttack2Power(unit, prev)
	if statsCheck_isCurseAttack(unit.impl.attack2) then
		return svMultimplyPower2(unit, prev, 0.2)
	else
		return prev
	end
end
