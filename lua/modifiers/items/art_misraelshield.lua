package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require "unitAuraCustomDesc"
require "setValue"

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_AttackProtection(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_AttackProtection(unit, prev)
end

function getHitPoint(unit, prev)
   return svMultimplyHitPoint(unit, prev, 0.25)
end

function getRegen(unit, prev)
	return prev + 10
end
