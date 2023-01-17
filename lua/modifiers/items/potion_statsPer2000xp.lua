package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('converter')
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getHitPoint(unit, prev)
	return svMultimplyHitPoint(unit, prev, potion_stats_bonus(unit))
end

function getArmor(unit, prev)
	return prev + potion_stats_bonus_additive(unit)
end

function getAttackInitiative(unit, prev)
	return svMultimplyInitiative(unit, prev, potion_stats_bonus(unit))
end

function getAttackPower(unit, prev)
	return svMultimplyPower1(unit, prev, potion_stats_bonus(unit))
end

function getAttackDamage(unit, prev)
	return svMultimplyDamage1(unit, prev, potion_stats_bonus(unit))
end

function getAttackHeal(unit, prev)
	return svMultimplyHeal1(unit, prev, potion_stats_bonus(unit))
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2(unit, prev, potion_stats_bonus(unit))
end

function getAttack2Damage(unit, prev)
	return svMultimplyDamage2(unit, prev, potion_stats_bonus(unit))
end

function getAttack2Heal(unit, prev)
	return svMultimplyHeal2(unit, prev, potion_stats_bonus(unit))
end

function potion_stats_bonus(unit)
	return 0.01 * potion_stats_bonus_additive(unit)
end

function potion_stats_bonus_additive(unit)
	return math.min(math.floor(_getUnitExp(unit) / 2000), 15)
end

