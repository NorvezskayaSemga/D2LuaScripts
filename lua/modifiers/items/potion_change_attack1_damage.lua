package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('potion_change_attack1_common')

AttackNameID = Id.new("x010tg1928")
AttackClass  = Attack.Damage
changeAttackName = {}

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getAttackNameTxt(unit, prev)
	local id = unit.id.value
	if changeAttackName[id] == nil or changeAttackName[id] then
		return AttackNameID
	end
	return prev
end

function getAttackClass(unit, prev)
	changeAttackName[unit.id.value] = (unit.impl.attack1.type ~= AttackClass)
	_changeAttackClass_Dmg1(unit, prev)
	return AttackClass
end

function getAttack2Id(unit, prev)
	return _changeAttackClass_Dmg1_Attack2(unit, prev)
end

function getAttackDrSplit(unit, prev)
	return _changeAttackClass_Dmg1_Split(unit, prev)
end
