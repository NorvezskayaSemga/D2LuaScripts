package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function canApplyAsLowerSpell()
	return false
end

function canApplyAsBoostSpell()
	return true
end

function getAttackPower(unit, prev)
	return svMultimplyPower1_Spell(unit, prev, 0.1)
end

function getAttack2Power(unit, prev)
	return svMultimplyPower2_Spell(unit, prev, 0.1)
end

function getAttackCritHit(unit, prev)
    if prev then
    	return prev
    end
    _get_Group_and_Mods(unit)
    local mods = _GroupInfo_UnitModifiers(unit)	
    local spellDebuffLowerEffect = _unitAura_SpellDebuffResistance_total(unit, mods)
    local spellBuffMultiplier = _unitAura_SpellBuffLowerEffect_multiplier(unit, mods, spellDebuffLowerEffect)
    if spellBuffMultiplier > 0 then
    	return true
    else
    	return prev
    end
end

function getAttackCritDamage(unit, prev)
    return svAddCrit1Damage_Spell(unit, prev, 10)
end

function getAttack2CritHit(unit, prev)
    if prev then
    	return prev
    end
    _get_Group_and_Mods(unit)
    local mods = _GroupInfo_UnitModifiers(unit)	
    local spellDebuffLowerEffect = _unitAura_SpellDebuffResistance_total(unit, mods)
    local spellBuffMultiplier = _unitAura_SpellBuffLowerEffect_multiplier(unit, mods, spellDebuffLowerEffect)
    if spellBuffMultiplier > 0 then
    	return true
    else
    	return prev
    end
end

function getAttack2CritDamage(unit, prev)
    return svAddCrit2Damage_Spell(unit, prev, 10)
end