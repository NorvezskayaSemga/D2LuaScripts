package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('GroupInfo')
require('setValue')
require('named_mods')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getArmor(unit, prev)
	return prev + 25
end

function getRegen(unit, prev)
	return prev + 10
end

function getScout(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)
	return prev + _GroupInfo_UnitModifierAmount(mods, luckybone_mod)
end
