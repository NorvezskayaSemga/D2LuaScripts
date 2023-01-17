package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDescTxt(unit, prev)
	return prev
end

function getModifierDisplay(unit, prev)
	if unit.impl.level > 5 then
		return false
	end
	return prev
end

function getLeadership(unit, prev)
	return prev + 1
end

function getMovement(unit, prev)
	local level = unit.impl.level
	if level < 6 then
		return svFlatEffectMovement(unit, prev, -10)
	else
		return prev
	end
end

function getRegen(unit, prev)
	return prev + perk_stats_bonus_additive(unit)
end

function getHitPoint(unit, prev)
	return svMultimplyHitPoint(unit, prev, perk_stats_bonus(unit))
end

function getAttackInitiative(unit, prev)
	return svMultimplyInitiative(unit, prev, perk_stats_bonus(unit))
end

function getAttackPower(unit, prev)
	return svMultimplyPower1(unit, prev, perk_stats_bonus(unit))
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, perk_stats_bonus(unit))
end

function getAttackHeal(unit, prev)
	return svMultimplyHeal1(unit, prev, perk_stats_bonus(unit))
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2(unit, prev, perk_stats_bonus(unit))
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, perk_stats_bonus(unit))
end

function getAttack2Heal(unit, prev)
	return svMultimplyHeal2(unit, prev, perk_stats_bonus(unit))
end

function perk_stats_bonus(unit)
	return 0.01 * perk_stats_bonus_additive(unit)
end

function perk_stats_bonus_additive(unit)
	local level = unit.impl.level
	if level < 6 then
		return 0
	else
		return 5
	end
end

