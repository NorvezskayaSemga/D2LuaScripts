package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('setValue')

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getHitPoint(unit, prev)
	if not unit.impl:hasAbility(Ability.TalismanUse) then
		return svMultimplyHitPoint(unit, prev, 0.1)
	end
	return prev
end

function getArmor(unit, prev)
	if not unit.impl:hasAbility(Ability.OrbUse) then
		return prev + 10
	end
	return prev
end

function getMovement(unit, prev)
	if not unit.impl:hasAbility(Ability.TravelItemUse) then
		return svFlatEffectMovement(unit, prev, 4)
	end
	return prev
end

function getAttackInitiative(unit, prev)
	if not unit.impl:hasAbility(Ability.BannerUse) then
		return svMultimplyInitiative(unit, prev, 0.2)
	end
	return prev
end

function getAttackPower(unit, prev)
	if not unit.impl:hasAbility(Ability.WeaponArmorUse) then
		return svMultimplyPower1(unit, prev, 0.1)
	end
	return prev
end

function getAttack2Power(unit, prev)
	if not unit.impl:hasAbility(Ability.WeaponArmorUse) then
		return svMultimplyPower2(unit, prev, 0.1)
	end
	return prev
end
