package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require "unitAuraCustomDesc"
require "setValue"

function getModifierDisplay(unit, prev)
	return _modifDisplay_VampirismPerCorpse(unit, prev)
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_VampirismPerCorpse(unit, prev)
end

function getAttackDrain(unit, damage, prev)
    return svAddDrain1(unit, prev, damage, _getCadaverBonus(unit))
end

function getAttack2Drain(unit, damage, prev)
    return svAddDrain2(unit, prev, damage, _getCadaverBonus(unit))
end

function _getCadaverBonus(unit)
	local group = _GroupInfo_getUnitGroup(unit)
	local units = group.units
	local result = 0
	for i = 1, #units do
		u = units[i]
		if u.hp == 0 then
			result = result + 0.1
		end
	end
	return result
end
