package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require "unitAuraCustomDesc"
require "setValue"

function getModifierDisplay(unit, prev)
	return _modifDisplay_HitPoint_Flat(unit, prev)
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_HitPoint_Flat(unit, prev)
end
