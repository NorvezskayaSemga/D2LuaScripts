package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')
require('unitAuraCustomDesc')

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_AttackDamageHeal_Percent(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_AttackDamageHeal_Percent(unit, prev)
end

function getHitPoint(unit, prev)
	return svMultimplyHitPoint(unit, prev, 0.1)
end

function getArmor(unit, prev)
	return prev + 10
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Weapon and prev ~= Immune.Always then
		return Immune.Once
	end
	return prev
end
