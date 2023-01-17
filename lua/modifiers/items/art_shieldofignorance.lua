package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require "statscheck"
require "unitAuraCustomDesc"
require "setValue"

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_CurseProtection_Covered(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_CurseProtection_Covered(unit, prev)
end

function getHitPoint(unit, prev)
	return svMultimplyHitPoint(unit, prev, 0.1)
end

function getImmuneToAttack(unit, attack, prev)
	if prev == Immune.NotImmune and statsCheck_isCurseType(attack) then
		return Immune.Once
	end
	return prev
end
