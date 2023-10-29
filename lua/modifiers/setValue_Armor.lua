
local _setValue_armorFloatPart  = {}

local _setValue_armorSpellBuffMultiplier = {}

function svSetArmorInit(unit, value, spellBuffMutiplier)
	local uid = unit.id.value
	_setValue_armorFloatPart[uid] = value
	_setValue_armorSpellBuffMultiplier[uid] = spellBuffMutiplier
	return 0
end
function svRoundArmor(unit, value, prev)
	local uid = unit.id.value
	local sum = _setValue_armorFloatPart[uid] + prev + value
	local intPart, floatPart = _valueCap_Armor(unit, sum)
	_setValue_armorFloatPart[uid] = floatPart
	return intPart
end

function svFlatEffectArmor(unit, prev, value)
	return svRoundArmor(unit, value, prev)
end

function svFlatEffectArmor_Spell(unit, prev, value)
	local uid = unit.id.value
	return svFlatEffectArmor(unit, prev, value * _setValue_armorSpellBuffMultiplier[uid])
end
