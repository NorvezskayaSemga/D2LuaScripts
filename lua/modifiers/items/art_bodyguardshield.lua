package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('statscheck')

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_ArmorFlat_Covered(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_ArmorFlat_Covered(unit, prev)
end

function getImmuneToAttack(unit, attack, prev)
	if prev == Immune.NotImmune and (attack == Attack.Poison or attack == Attack.LowerDamage) then
		return Immune.Once
	end
	return prev
end

function getArmor(unit, prev)
	return prev + 10
end
