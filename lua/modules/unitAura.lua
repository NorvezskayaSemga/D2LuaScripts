package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua"
unitAura={}
require('GroupInfo')
require('statscheck')
require('named_mods')
require('mapMultipliers')
require('smnsInfo')
if smnsEnabled then
	require('smnsAura')
	require('smnsAddAuraMods')
end
setValue = setValue or require('setValue')

uaExternalExpKilled = {}

G040UM0013 = Id.new('g040um0013').value
G040UM0065 = Id.new('g040um0065').value
G040UM0066 = Id.new('g040um0066').value
G040UM0067 = Id.new('g040um0067').value
G040UM0068 = Id.new('g040um0068').value
G040UM0069 = Id.new('g040um0069').value
G040UM0070 = Id.new('g040um0070').value
G040UM0071 = Id.new('g040um0071').value
G040UM0100 = Id.new('g040um0100').value
G040UM0101 = Id.new('g040um0101').value
G040UM0102 = Id.new('g040um0102').value
G040UM0103 = Id.new('g040um0103').value
G040UM0104 = Id.new('g040um0104').value
G040UM0105 = Id.new('g040um0105').value
G040UM0106 = Id.new('g040um0106').value
G040UM0107 = Id.new('g040um0107').value
G040UM0108 = Id.new('g040um0108').value
G040UM0109 = Id.new('g040um0109').value
G040UM0110 = Id.new('g040um0110').value
G040UM0111 = Id.new('g040um0111').value
G040UM0112 = Id.new('g040um0112').value
G040UM0113 = Id.new('g040um0113').value
G040UM0114 = Id.new('g040um0114').value
G040UM0115 = Id.new('g040um0115').value
G040UM0116 = Id.new('g040um0116').value
G040UM0117 = Id.new('g040um0117').value
G040UM0118 = Id.new('g040um0118').value
G040UM0119 = Id.new('g040um0119').value
G040UM0120 = Id.new('g040um0120').value
G040UM0121 = Id.new('g040um0121').value
G040UM0122 = Id.new('g040um0122').value
G040UM0123 = Id.new('g040um0123').value
G040UM0124 = Id.new('g040um0124').value
G040UM0125 = Id.new('g040um0125').value
G040UM0126 = Id.new('g040um0126').value
G040UM0127 = Id.new('g040um0127').value
G040UM0128 = Id.new('g040um0128').value
G040UM0129 = Id.new('g040um0129').value
G040UM0130 = Id.new('g040um0130').value
G040UM0131 = Id.new('g040um0131').value
G040UM0132 = Id.new('g040um0132').value
G040UM0133 = Id.new('g040um0133').value
G040UM0134 = Id.new('g040um0134').value
G040UM0135 = Id.new('g040um0135').value
G040UM0136 = Id.new('g040um0136').value
G040UM0137 = Id.new('g040um0137').value
G040UM0138 = Id.new('g040um0138').value
G040UM0139 = Id.new('g040um0139').value
G040UM0140 = Id.new('g040um0140').value
G040UM0141 = Id.new('g040um0141').value
G040UM0142 = Id.new('g040um0142').value
G040UM0143 = Id.new('g040um0143').value
G040UM0144 = Id.new('g040um0144').value
G040UM0145 = Id.new('g040um0145').value
G040UM0146 = Id.new('g040um0146').value
G040UM0147 = Id.new('g040um0147').value
G040UM0148 = Id.new('g040um0148').value
G040UM0149 = Id.new('g040um0149').value
G040UM0150 = Id.new('g040um0150').value
G040UM0151 = Id.new('g040um0151').value
G040UM0152 = Id.new('g040um0152').value

G040UM0161 = Id.new('g040um0161').value
G040UM0162 = Id.new('g040um0162').value
G040UM0163 = Id.new('g040um0163').value

G040UM0164 = Id.new('g040um0164').value
G040UM0165 = Id.new('g040um0165').value
G040UM0166 = Id.new('g040um0166').value
G040UM0167 = Id.new('g040um0167').value
G040UM0168 = Id.new('g040um0168').value
G040UM0169 = Id.new('g040um0169').value
G040UM0170 = Id.new('g040um0170').value
G040UM0171 = Id.new('g040um0171').value
G040UM0172 = Id.new('g040um0172').value
G040UM0173 = Id.new('g040um0173').value
G040UM0174 = Id.new('g040um0174').value
G040UM0175 = Id.new('g040um0175').value
G040UM0176 = Id.new('g040um0176').value
G040UM0177 = Id.new('g040um0177').value

G040UM0182 = Id.new('g040um0182').value
G040UM0183 = Id.new('g040um0183').value
G040UM0184 = Id.new('g040um0184').value
G040UM0185 = Id.new('g040um0185').value
G040UM0186 = Id.new('g040um0186').value

G040UM0187 = Id.new('g040um0187').value
G040UM0188 = Id.new('g040um0188').value
G040UM0189 = Id.new('g040um0189').value
G040UM0190 = Id.new('g040um0190').value
G040UM0191 = Id.new('g040um0191').value
G040UM0192 = Id.new('g040um0192').value
G040UM0194 = Id.new('g040um0194').value
G040UM0205 = Id.new('g040um0205').value
G040UM0208 = Id.new('g040um0208').value
G040UM0210 = Id.new('g040um0210').value
G040UM0211 = Id.new('g040um0211').value
G040UM0212 = Id.new('g040um0212').value
G040UM0213 = Id.new('g040um0213').value
G040UM0214 = Id.new('g040um0214').value
G040UM0215 = Id.new('g040um0215').value
G040UM0216 = Id.new('g040um0216').value
G040UM0217 = Id.new('g040um0217').value
G040UM0218 = Id.new('g040um0218').value
G040UM0048 = Id.new('g040um0048').value
G000UM4012 = Id.new('g000um4012').value
G201UM9040 = Id.new('g201um9040').value
G201UM9164 = Id.new('g201um9164').value
G201UM9165 = Id.new('g201um9165').value
G040UM0223 = Id.new('g040um0223').value
G040UM0224 = Id.new('g040um0224').value
G040UM0225 = Id.new('g040um0225').value
G040UM0226 = Id.new('g040um0226').value
G040UM0227 = Id.new('g040um0227').value
G040UM0228 = Id.new('g040um0228').value
G040UM0237 = Id.new('g040um0237').value
G040UM0238 = Id.new('g040um0238').value
G040UM0239 = Id.new('g040um0239').value
G040UM0240 = Id.new('g040um0240').value
G040UM0242 = Id.new('g040um0242').value
G040UM0249 = Id.new('g040um0249').value
G040UM0251 = Id.new('g040um0251').value
G040UM0257 = Id.new('g040um0257').value
G040UM0266 = Id.new('g040um0266').value
G040UM0267 = Id.new('g040um0267').value
G040UM0268 = Id.new('g040um0268').value
G040UM0269 = Id.new('g040um0269').value
G040UM0270 = Id.new('g040um0270').value
G040UM0271 = Id.new('g040um0271').value
G040UM0272 = Id.new('g040um0272').value

G201UM9121 = Id.new('g201um9121').value
G201UM9166 = Id.new('g201um9166').value
G201UM9167 = Id.new('g201um9167').value
G201UM9168 = Id.new('g201um9168').value
G201UM9169 = Id.new('g201um9169').value
G201UM9170 = Id.new('g201um9170').value
G201UM9171 = Id.new('g201um9171').value
G201UM9172 = Id.new('g201um9172').value
G201UM9173 = Id.new('g201um9173').value
G201UM9174 = Id.new('g201um9174').value
G201UM9175 = Id.new('g201um9175').value
G201UM9176 = Id.new('g201um9176').value
G201UM9177 = Id.new('g201um9177').value
G201UM9178 = Id.new('g201um9178').value
G201UM9179 = Id.new('g201um9179').value
G201UM9180 = Id.new('g201um9180').value
G201UM9181 = Id.new('g201um9181').value
G201UM9182 = Id.new('g201um9182').value
G201UM9183 = Id.new('g201um9183').value
G201UM9184 = Id.new('g201um9184').value
G201UM9185 = Id.new('g201um9185').value
G201UM9186 = Id.new('g201um9186').value
G201UM9187 = Id.new('g201um9187').value
G201UM9188 = Id.new('g201um9188').value
G201UM9189 = Id.new('g201um9189').value
G201UM9190 = Id.new('g201um9190').value
G201UM9191 = Id.new('g201um9191').value
G201UM9192 = Id.new('g201um9192').value
G201UM9193 = Id.new('g201um9193').value
G201UM9194 = Id.new('g201um9194').value
G201UM9222 = Id.new('g201um9222').value
G201UM9223 = Id.new('g201um9223').value
G201UM9224 = Id.new('g201um9224').value
G201UM9225 = Id.new('g201um9225').value
G201UM9226 = Id.new('g201um9226').value
G201UM9227 = Id.new('g201um9227').value
G201UM9228 = Id.new('g201um9228').value
G201UM9229 = Id.new('g201um9229').value
G201UM9230 = Id.new('g201um9230').value
G201UM9241 = Id.new('g201um9241').value
G201UM9242 = Id.new('g201um9242').value
G201UM9243 = Id.new('g201um9243').value
G201UM9244 = Id.new('g201um9244').value
G201UM9245 = Id.new('g201um9245').value

aG000000000 = Id.new("g000000000")
aG020AA0011 = Id.new("g020aa0011")
aG020AA0013 = Id.new("g020aa0013")
aG020AA0015 = Id.new("g020aa0015")
aG020AA0016 = Id.new("g020aa0016")
aG014AA0001 = Id.new("g014aa0001")
aG014AA0002 = Id.new("g014aa0002")
aG014AA0003 = Id.new("g014aa0003")
aG014AA0004 = Id.new("g014aa0004")
aG014AA0005 = Id.new("g014aa0005")
aG014AA0006 = Id.new("g014aa0006")
aG014AA0007 = Id.new("g014aa0007")
aG014AA0008 = Id.new("g014aa0008")

function _unitAura_HitPoint(unit, prev)
	local id = unit.id.value
	if uaNewHitPoint[id] == nil then
		uaBaseHitPoint[id] = prev
	else
		uaBaseHitPoint[id] = uaNewHitPoint[id]
	end
	
	_get_Group_and_Mods(unit)
	
	prev = uaBaseHitPoint[id]
	
	local ugroup = _GroupInfo_getCurrentGroup()

	local multiplicative = _unitAura_HitPoint_valPercent(unit)
	                     + _unitAura_HitPointOnDeath_valPercent(unit)

	local additive       = _unitAura_HitPoint_valFlat(unit)
			     + _mapMultipliers_Armor_Flat(unit)

	local SpiritCageAmount = _unitAura_EffectSumStack({G040UM0272}, 1)
	if SpiritCageAmount > 0 then
		multiplicative = multiplicative + SpiritCageAmount * _unitAura_SpiritCage_Effect(unit, ugroup)
	end
	
	if smnsEnabled then
		multiplicative = multiplicative + _smns_multiplicativeHitPointBonus(unit, prev)
	end
	
	return prev * ( 1 + 0.01 * multiplicative ) + additive
end

function _unitAura_Regen(unit, prev)
	_get_Group_and_Mods(unit)
	local ugroup = _GroupInfo_getCurrentGroup()
	
	local result = prev
	local u
	
	-- скальд
	if unitGroup ~= nil then
		if _GroupInfo_stackHasModifierAmount(aura_regen_5_1plevel_mod) > 0 then
			local mAmount
			local unitGroupSlots = unitGroup.slots
			for i = 1, #unitGroupSlots do
				u = unitGroupSlots[i].unit
				if u ~= nil and u.hp > 0 then
					mAmount = _GroupInfo_UnitModifierAmount(_GroupInfo_UnitModifiers(u), aura_regen_5_1plevel_mod)
					if mAmount > 0 then
						result = result + mAmount * math.min( 5 + u.impl.level - u.baseImpl.level, 15 )
					end
				end
			end
		end
	end
	
	local SpiritCageAmount = _unitAura_EffectSumStack({G040UM0272}, 1)
	if SpiritCageAmount > 0 then
		result = result + SpiritCageAmount * _unitAura_SpiritCage_Effect(unit, ugroup)
	end
	
	if smnsEnabled then
		result = result + _smns_flatRegenBonus(unit, prev)
	end
	
	return result + _unitAura_Regen_valFlat(unit)
		      + _mapMultipliers_Regen_Flat(unit)
end

function _unitAura_Armor(unit, prev)
	_get_Group_and_Mods(unit)
	local result = prev
	
	local c = _GroupInfo_getCoveringUnit(unit, true)
	local mods
	if c ~= nil then
		mods = _GroupInfo_UnitModifiers(c)
		result = result + _unitAura_ArmorFlat_txtCovered(c, mods)
	end
	if _unitAura_ArmorFlat_valNearest(unit) ~= 0 then
		local nearestUnits = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		for i = 1, #nearestUnits do
			mods = _GroupInfo_UnitModifiers(nearestUnits[i])
			result = result + _unitAura_ArmorFlat_txtNearest(nearestUnits[i], mods)
		end
	end

	if smnsEnabled then
		result = result + _smns_flatArmorBonus(unit, prev)
	end
	
	return result + _unitAura_Armor_valFlat(unit) 
		      + _unitAura_MostLostHPBuff_ArmorFlat(unit)
		      + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_Armor_val(unit, _GroupInfo_UnitModifiers(unit)))
end

function _unitAura_ImmuneToAttack(unit, attack, prev)
	local result = prev
	local gotGroup = false
	if result == Immune.NotImmune then
		if attack == Attack.Frostbite then
			gotGroup = true
			_get_Group_and_Mods(unit)
			if _unitAura_FrostbiteResist_stk(unit) > 0 then
				result = Immune.Once
			end
			if result == Immune.NotImmune then
				local rEffect = _unitAura_EffectSumStack({G040UM0069}, 1)
				if rEffect > 0 then
					local leader = _GroupInfo_getCurrentGroupLeader()
					if leader == nil or not _GroupInfo_UnitIsRangedWithoutBow(leader) then
						rEffect = 0
					end
					if rEffect > 0 then
						result = Immune.Once
					end
				end
			end
		elseif attack == Attack.Blister then
			gotGroup = true
			_get_Group_and_Mods(unit)
			if _unitAura_BlisterResist_stk(unit) > 0 then
				result = Immune.Once
			end
		elseif attack == Attack.Poison then
			gotGroup = true
			_get_Group_and_Mods(unit)
			if _unitAura_PoisonResist_stk(unit) > 0 then
				result = Immune.Once
			end
		elseif attack == Attack.LowerInitiative then
			gotGroup = true
			_get_Group_and_Mods(unit)
			if _unitAura_LowerInitiativeResist_stk(unit) > 0 then
				result = Immune.Once
			end
		elseif attack == Attack.LowerDamage then
			gotGroup = true
			_get_Group_and_Mods(unit)
			if _unitAura_LowerDamageResist_stk(unit) > 0 then
				result = Immune.Once
			end
		end
		if result == Immune.NotImmune then
			if statsCheck_isCurseType(attack) then
				local c = _GroupInfo_getCoveringUnit(unit, gotGroup)
				if c ~= nil then
					local mods = _GroupInfo_UnitModifiers(c)
					if _unitAura_CurseProtection_txtCovered(c, mods) > 0 then
						result = Immune.Once
					end
				end
			end
		end
	end
	
	if smnsEnabled then
		result = _smns_ImmuneToAttack(unit, attack, prev, result)
	end
	
	return result
end

function _unitAura_ImmuneToSource(unit, source, prev)
	local alwaysWard = nil
	local onceWard   = nil
	if source == Source.Weapon then
		alwaysWard = G040UM0131
		onceWard   = G040UM0123
	elseif source == Source.Mind then
		alwaysWard = G040UM0132
		onceWard   = G040UM0124
	elseif source == Source.Life then
		alwaysWard = G040UM0133
		onceWard   = G040UM0125
	elseif source == Source.Death then
		alwaysWard = G040UM0134
		onceWard   = G040UM0126
	elseif source == Source.Fire then
		alwaysWard = G040UM0135
		onceWard   = G040UM0127
	elseif source == Source.Water then
		alwaysWard = G040UM0136
		onceWard   = G040UM0128
	elseif source == Source.Earth then
		alwaysWard = G040UM0137
		onceWard   = G040UM0129
	elseif source == Source.Air then
		alwaysWard = G040UM0138
		onceWard   = G040UM0130
	end
	local result =  _GroupInfo_checkWard(unit, prev, alwaysWard, onceWard, true)
	
	if smnsEnabled then
		result = _smns_ImmuneToSource(unit, source, prev, result)
	end
	
	return result
end
function _unitAura_hasOnceImmuneToSource(unit, source)
	local mods = _GroupInfo_UnitModifiers(unit)
	local onceWard   = nil
	if source == Source.Weapon then
		onceWard   = G040UM0123
	elseif source == Source.Mind then
		onceWard   = G040UM0124
	elseif source == Source.Life then
		onceWard   = G040UM0125
	elseif source == Source.Death then
		onceWard   = G040UM0126
	elseif source == Source.Fire then
		onceWard   = G040UM0127
	elseif source == Source.Water then
		onceWard   = G040UM0128
	elseif source == Source.Earth then
		onceWard   = G040UM0129
	elseif source == Source.Air then
		onceWard   = G040UM0130
	end
	if _GroupInfo_UnitModifierAmount(mods, onceWard) > 0 then
		return true
	else
		return false
	end
end
function _unitAura_hasAlwaysImmuneToSource(unit, source)
	local mods = _GroupInfo_UnitModifiers(unit)
	local alwaysWard = nil
	if source == Source.Weapon then
		alwaysWard = G040UM0131
	elseif source == Source.Mind then
		alwaysWard = G040UM0132
	elseif source == Source.Life then
		alwaysWard = G040UM0133
	elseif source == Source.Death then
		alwaysWard = G040UM0134
	elseif source == Source.Fire then
		alwaysWard = G040UM0135
	elseif source == Source.Water then
		alwaysWard = G040UM0136
	elseif source == Source.Earth then
		alwaysWard = G040UM0137
	elseif source == Source.Air then
		alwaysWard = G040UM0138
	end
	if _GroupInfo_UnitModifierAmount(mods, alwaysWard) > 0 then
		return true
	else
		return false
	end
end

function _unitAura_AttackInitiative(unit, prev)
	local id = unit.id.value
	if uaNewInitiative[id] == nil then
		uaBaseInitiative[id] = prev
	else
		uaBaseInitiative[id] = uaNewInitiative[id]
	end
	_get_Group_and_Mods(unit)
	uaBaseInitiative[id] = uaBaseInitiative[id] * _mapMultipliers_Initiative_Multi(unit)

	local mods = _GroupInfo_UnitModifiers(unit)
	
	uaBaseInitiative[id] = _unitAura_ChainsOfSacrifice_Effect(unit, mods, uaBaseInitiative[id], true)
	
	local multiplicative = _unitAura_AttackInitiative_valPercent(unit)
		             + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackInitiative_val(unit, mods))
	
	local onFullHPEffect = _unitAura_AttackDamageInitiativeOnFullLife_val(unit, mods)
	if onFullHPEffect ~= 0 and scenario:getUnit(unit.id).hpMax == unit.hp then
		multiplicative = multiplicative + onFullHPEffect
	end
	
	local additive = 0
	if smnsEnabled then
		additive = additive + _smns_flatInitiativeBonus(unit, uaBaseInitiative[id])
		multiplicative = multiplicative + _smns_percentInitiativeBonus(unit, uaBaseInitiative[id])
	end
	
	return (uaBaseInitiative[id] + additive) * ( 1 + 0.01 * multiplicative )
end

function _unitAura_AttackPower1(unit, prev)
	local id = unit.id.value
	if uaNewPower1[id] == nil then
		uaBasePower1[id] = prev
	else
		uaBasePower1[id] = uaNewPower1[id]
	end
	_get_Group_and_Mods(unit)
	uaBasePower1[id] = uaBasePower1[id] * _mapMultipliers_Power1_Multi(unit)
	return _unitAura_PowerModsEffect(unit, uaBasePower1[id])
end
function _unitAura_AttackPower2(unit, prev)
	local id = unit.id.value
	if uaNewPower2[id] == nil then
		uaBasePower2[id] = prev
	else
		uaBasePower2[id] = uaNewPower2[id]
	end
	_get_Group_and_Mods(unit)
	uaBasePower2[id] = uaBasePower2[id] * _mapMultipliers_Power2_Multi(unit)
	if not smnsInfoApplyAccuracyBuffToAttack2 then
		return uaBasePower2[id]
	end
	return _unitAura_PowerModsEffect(unit, uaBasePower2[id])
end

function _unitAura_AttackDamage1(unit, prev)
	local id = unit.id.value
	if uaNewDamage1[id] == nil then
		uaBaseDamage1[id] = prev
	else
		uaBaseDamage1[id] = uaNewDamage1[id]
	end
	_get_Group_and_Mods(unit)
	uaBaseDamage1[id] = uaBaseDamage1[id] * _mapMultipliers_Damage1_Multi(unit)
	
	local ugroup = _GroupInfo_getCurrentGroup()
	local unitMods = _GroupInfo_UnitModifiers(unit)
	
	if _GroupInfo_UnitModifierAmount(unitMods, runestone_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, runemaul_mod) > 0 then
		uaBaseDamage1[id] = uaBaseDamage1[id] + 5
	end
		
	local harvastCupsAmount = _GroupInfo_UnitModifierAmount(unitMods, harvestcup_mod)
	if harvastCupsAmount > 0 then
		uaBaseDamage1[id] = uaBaseDamage1[id] + math.floor(unit.hp * harvastCupsAmount / 20)
	end
	if _GroupInfo_stackHasModifierAmount(harvestarmor_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(harvestcup_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(harvestdagger_mod) > 0 then
		local cLeader = _GroupInfo_getCurrentGroupLeader()
		if cLeader ~= nil then
			uaBaseDamage1[id] = uaBaseDamage1[id] + math.floor(cLeader.hp / 25)
		end
	end
	
	local ChainsOfHumilityAmount = _unitAura_EffectSumStack({chainsofhumility_mod}, 1)
	if ChainsOfHumilityAmount > 0 then
		uaBaseDamage1[id] = uaBaseDamage1[id] + ChainsOfHumilityAmount * _unitAura_ChainsOfHumility_Effect(unit, ugroup)
	end
	
	local result = _unitAura_DamageModsEffect(unit, uaBaseDamage1[id], 1, false)
	
	uaAddedDamageCached[id] = nil
	uaAddedDamageType[id] = nil
		
	if uaBaseDamage1[id] ~= 0 then
		local eff = _unitAura_AddedDamageSum(unit)
		if eff > 0 then
			uaAddedDamageCached[id] = uaBaseDamage1[id] * eff * 0.01
			if _unitAura_EffectSumStack({G040UM0070}, 1) > 0 then
				uaAddedDamageType[id] = aG020AA0013
			else
				uaAddedDamageType[id] = aG020AA0015
			end
		end
	end
	if _unitAura_EffectSumStack({G040UM0068}, 1) > 0 then
		uaAddedDamageType[id] = aG020AA0011
		uaAddedDamageCached[id] = 1
	end
	if _GroupInfo_UnitModifierAmount(unitMods, mortistear_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, thanatosskull_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, thanatosblade_mod) > 0 then
		uaAddedDamageType[id] = aG020AA0016
		uaAddedDamageCached[id] = 1
	end
	
	-- если ничего не добавлено предметами, то проверяем рисованные
	if uaAddedDamageType[id] == nil then
		if _GroupInfo_UnitModifierAmount(unitMods, G201UM9223) > 0 then
			uaAddedDamageType[id] = aG014AA0001
			uaAddedDamageCached[id] = 1
		elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9224) > 0 then
			uaAddedDamageType[id] = aG014AA0002
			uaAddedDamageCached[id] = 1
		elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9225) > 0 then
			uaAddedDamageType[id] = aG014AA0003
			uaAddedDamageCached[id] = 1
		elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9226) > 0 then
			uaAddedDamageType[id] = aG014AA0004
			uaAddedDamageCached[id] = 1
		elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9227) > 0 then
			uaAddedDamageType[id] = aG014AA0005
			uaAddedDamageCached[id] = 1
		elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9228) > 0 then
			uaAddedDamageType[id] = aG014AA0006
			uaAddedDamageCached[id] = 1
		elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9229) > 0 then
			uaAddedDamageType[id] = aG014AA0007
			uaAddedDamageCached[id] = 1
		elseif _GroupInfo_UnitModifierAmount(unitMods, G201UM9230) > 0 then
			uaAddedDamageType[id] = aG014AA0008
			uaAddedDamageCached[id] = 1
		end
	end
	
	return result
end
function _unitAura_AttackDamage2(unit, prev)
	local id = unit.id.value
	if uaNewDamage2[id] == nil then
		uaBaseDamage2[id] = prev
	else
		uaBaseDamage2[id] = uaNewDamage2[id]
	end
	_get_Group_and_Mods(unit)
	uaBaseDamage2[id] = uaBaseDamage2[id] * _mapMultipliers_Damage2_Multi(unit)

	local ugroup = _GroupInfo_getCurrentGroup()
	if uaAddedDamageCached[id] ~= nil then
		uaBaseDamage2[id] = uaBaseDamage2[id] + math.max(uaAddedDamageCached[id] + uaAddedDamageBias[id], 0)
	end
	return _unitAura_DamageModsEffect(unit, uaBaseDamage2[id], 2, false)
end

function _unitAura_AttackHeal1(unit, prev)
	local id = unit.id.value
	if uaNewHeal1[id] == nil then
		uaBaseHeal1[id] = prev
	else
		uaBaseHeal1[id] = uaNewHeal1[id]
	end
	_get_Group_and_Mods(unit)
	uaBaseHeal1[id] = uaBaseHeal1[id] * _mapMultipliers_Heal1_Multi(unit)
	
	local ugroup = _GroupInfo_getCurrentGroup()
	local ChainsOfHumilityAmount = _unitAura_EffectSumStack({chainsofhumility_mod}, 1)
	if ChainsOfHumilityAmount > 0 then
		uaBaseHeal1[id] = uaBaseHeal1[id] + ChainsOfHumilityAmount * _unitAura_ChainsOfHumility_Effect(unit, ugroup)
	end
	
	if smnsInfoApplyDmgBuffToHeal then
		return _unitAura_HealModsEffect(unit, uaBaseHeal1[id], 1, false)
	else
		return uaBaseHeal1[id]
	end
end
function _unitAura_AttackHeal2(unit, prev)
	local id = unit.id.value
	if uaNewHeal2[id] == nil then
		uaBaseHeal2[id] = prev
	else
		uaBaseHeal2[id] = uaNewHeal2[id]
	end
	_get_Group_and_Mods(unit)
	uaBaseHeal2[id] = uaBaseHeal2[id] * _mapMultipliers_Heal2_Multi(unit)
	
	local ugroup = _GroupInfo_getCurrentGroup()	
	local ChainsOfHumilityAmount = _unitAura_EffectSumStack({chainsofhumility_mod}, 1)
	if ChainsOfHumilityAmount > 0 then
		uaBaseHeal2[id] = uaBaseHeal2[id] + ChainsOfHumilityAmount * _unitAura_ChainsOfHumility_Effect(unit, ugroup)
	end
	
	if smnsInfoApplyDmgBuffToHeal then
		return _unitAura_HealModsEffect(unit, uaBaseHeal2[id], 2, false)
	else
		return uaBaseHeal2[id]
	end
end

function _unitAura_DamageModsEffect(unit, prev, attackN, callGetGroupAndMods)
	if prev == 0 then
		return prev
	end
	if callGetGroupAndMods then
		_get_Group_and_Mods(unit)
	end
	
	local mods = _GroupInfo_UnitModifiers(unit)

	local multiplicative = _unitAura_AttackDamageHeal_valPercent(unit)
                             + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackDamageHeal_val(unit, mods))
                             + _unitAura_RingOfHeavenWill_Effect(unit, mods, true)

	if smnsEnabled then
		multiplicative = multiplicative + _smns_multiplicativeDamageHealBonus(unit, prev, attackN, mods)
	end

	local onFullHPEffect = _unitAura_AttackDamageInitiativeOnFullLife_val(unit, mods)
	if onFullHPEffect ~= 0 and scenario:getUnit(unit.id).hpMax == unit.hp then
		multiplicative = multiplicative + onFullHPEffect
	end
	
	if multiplicative ~= 0 then
		local multiplier = 1 + 0.01 * multiplicative
		local attk = nil
		if attackN == 1 then
			attk = unit.impl.attack1
		elseif attackN == 2 then
			attk = unit.impl.attack2
		end
		if attk == nil or attk.type ~= Attack.Shatter then
			return prev * multiplier
		else
			return prev
		end
	else
		return prev
	end
end

function _unitAura_HealModsEffect(unit, prev, attackN, callGetGroupAndMods)
	return _unitAura_DamageModsEffect(unit, prev, attackN, callGetGroupAndMods)
end

function _unitAura_PowerModsEffect(unit, prev)
	local mods = _GroupInfo_UnitModifiers(unit)

	local onFullHPEffect = _unitAura_AttackLessPowerOnFullLife_val(unit, mods)
	local lessPower
	if onFullHPEffect ~= 0 and scenario:getUnit(unit.id).hpMax == unit.hp then
		lessPower = onFullHPEffect
	else
		lessPower = 0
	end	

	if prev * ( 1 - 0.01 * lessPower ) >= 100 then
		return prev
	end

	local multiplicative = _unitAura_AttackPower_valPercent(unit) 
	                     + _unitAura_MostLostHPBuff_PowerPercent(unit)
                             + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackPower_val(unit, mods))
                             - lessPower

	return prev * ( 1 + 0.01 * multiplicative )
end

function _unitAura_AttackDrain(unit, damage, prev)
	if damage == 0 then
		return prev
	end
	_get_Group_and_Mods(unit)
	local ugroup = _GroupInfo_getCurrentGroup()
	
	local multiplicative = _unitAura_AttackDrain_valFlat(unit)
                             + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackDrain_val(unit, _GroupInfo_UnitModifiers(unit)))
                             + _unitAura_AttackDrainOnDeath_valPercent(unit)
                             + _mapMultipliers_Drain1_Flat(unit)
        
	local SpiritCageAmount = _unitAura_EffectSumStack({G040UM0272}, 1)
	if SpiritCageAmount > 0 then
		multiplicative = multiplicative + SpiritCageAmount * _unitAura_SpiritCage_Effect(unit, ugroup)
	end
	
	return prev + damage * 0.01 * multiplicative
end

function _unitAura_Attack2Drain(unit, damage, prev)
	if damage == 0 then
		return prev
	end
	_get_Group_and_Mods(unit)
	local ugroup = _GroupInfo_getCurrentGroup()
	
	local multiplicative = _unitAura_AttackDrain_valFlat(unit)
                             + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackDrain_val(unit, _GroupInfo_UnitModifiers(unit)))
                             + _unitAura_AttackDrainOnDeath_valPercent(unit)
                             + _mapMultipliers_Drain2_Flat(unit)
        
	local SpiritCageAmount = _unitAura_EffectSumStack({G040UM0272}, 1)
	if SpiritCageAmount > 0 then
		multiplicative = multiplicative + SpiritCageAmount * _unitAura_SpiritCage_Effect(unit, ugroup)
	end
	
	return prev + damage * 0.01 * multiplicative
end

function _unitAura_getMovement(unit, prev)
	svSetMovementFloatPart(unit, 0)
	if prev == 0 then
		return prev
	end

	local unitMods = _GroupInfo_UnitModifiers(unit)
	local movementMultiplier = _unitAura_movementMultiplier(unit, unitMods)
	if movementMultiplier == 0 then
		return 0
	end

	local result = prev
	_get_Group_and_Mods(unit)
	
	result = result + _mapMultipliers_MovementPoints_Flat(unit)
	
	if _GroupInfo_UnitModifierAmount(unitMods, itemsmasterperk_mod) > 0 then
		result = result + _unitAura_ItemsMasterPerk_Effect(unit)
	end
	
	if smnsEnabled then
		result = result + _smns_flatMovementBonus(unit, prev, result)
	end
	return svRoundMovement(unit, result * movementMultiplier)
end

function _unitAura_getFastRetreat(unit, prev)
	local result = prev
	if smnsEnabled then
		_get_Group_and_Mods(unit)
	end
		
	if smnsEnabled then
		result = _smns_getFastRetreat(unit, prev, result)
	end
	return result
end

function _unitAura_getNegotiate(unit, prev)
	local result = prev
	local id = unit.id.value
	if uaNewNegotiate[id] == nil then
		uaBaseNegotiate[id] = prev
	else
		uaBaseNegotiate[id] = uaNewNegotiate[id]
	end
	_get_Group_and_Mods(unit)
	uaBaseNegotiate[id] = uaBaseNegotiate[id] + _mapMultipliers_Negotiate_Flat(unit)

	local result = uaBaseNegotiate[id]
		
	if smnsEnabled then
		result = result + _smns_getNegotiate(unit, prev, result)
	end
	return result
end

function _unitAura_getScout(unit, prev)
	local result = prev
	if smnsEnabled then
		_get_Group_and_Mods(unit)
	end
		
	if smnsEnabled then
		result = result + _smns_getScout(unit, prev, result)
	end
	return result
end

function _unitAura_hasMovementBonus(unit, ground, prev)
	local result = prev
	if smnsEnabled then
		_get_Group_and_Mods(unit)
		result = _smns_hasMovementBonus(unit, ground, prev, result)
	end
	return result
end

function _unitAura_hasAbility(unit, ability, prev)
	local result = prev
	if ability == Ability.WandScrollUse then
		_get_Group_and_Mods(unit)
		result = _GroupInfo_stackHasModifier(G040UM0161)
	elseif ability == Ability.TalismanUse then
		_get_Group_and_Mods(unit)
		result = _GroupInfo_stackHasModifier(G040UM0161)
		      or _GroupInfo_stackHasModifier(G040UM0205)
	end
	
	if smnsEnabled then
		_get_Group_and_Mods(unit)
		result = _smns_hasAbility(unit, ability, prev, result)
	end
	
	return result
end

function _unitAura_XpKilled(unit, prev)
	local id = unit.id.value
	if uaNewXpKilled[id] == nil then
		uaBaseXpKilled[id] = prev
	else
		uaBaseXpKilled[id] = uaNewXpKilled[id]
	end
        local e = uaExternalExpKilled[unit.id.value]
	if e ~= nil then
		return uaBaseXpKilled[id] * e
	end
	return uaBaseXpKilled[id]
end

function _unitAura_AttackCritHit(unit, prev)
	if prev then
		return true
	end
	_get_Group_and_Mods(unit)
	local effect = _unitAura_MostLostHPBuff_CritFlat(unit)
	             + _unitAura_AttackCrit_valFlat(unit)
                     + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackCrit_val(unit, _GroupInfo_UnitModifiers(unit)))
	if effect > 0 then
		return true
	end
	return prev
end

function _unitAura_AttackCritDamage(unit, prev)
	_get_Group_and_Mods(unit)
	local effect = _unitAura_MostLostHPBuff_CritFlat(unit)
	             + _unitAura_AttackCrit_valFlat(unit)
                     + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackCrit_val(unit, _GroupInfo_UnitModifiers(unit)))
	local result
	if unit.leveledImpl.attack1.crit then
		result = prev + effect
	else
		result = effect
	end
	svSetCrit1InitialDamage(unit, result)
	return result
end

function _unitAura_Attack2CritHit(unit, prev)
	if prev then
		return true
	end
	_get_Group_and_Mods(unit)
	local effect = _unitAura_MostLostHPBuff_CritFlat(unit)
	             + _unitAura_AttackCrit_valFlat(unit)
                     + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackCrit_val(unit, _GroupInfo_UnitModifiers(unit)))
	if effect > 0 then
		return true
	end
	return prev
end

function _unitAura_Attack2CritDamage(unit, prev)
	_get_Group_and_Mods(unit)
	local effect = _unitAura_MostLostHPBuff_CritFlat(unit)
	             + _unitAura_AttackCrit_valFlat(unit)
                     + _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_AttackCrit_val(unit, _GroupInfo_UnitModifiers(unit)))
	local result
	local a = unit.leveledImpl.attack2
	if a ~= nil and a.crit then
		result = prev + effect
	else
		result = effect
	end
	svSetCrit2InitialDamage(unit, result)
	return result
end

function _unitAura_AtckTwice(unit, prev)
	local twice = prev
	local mods = _GroupInfo_UnitModifiers(unit)
	if twice and _GroupInfo_UnitModifierAmount(mods, G201UM9121) > 0 then
 		twice = false
	end 
	if not twice then
		local effect = _unitAura_LostHPEffect(unit, _unitAura_PerLostHP_DoubleAttack_val(unit, mods))
		if effect > 0 then
			twice = _mRnd_simpleRndEvent(effect)
		end
	end	
	return twice
end

uaAddedDamageType             = {}
uaAddedDamageCached           = {}
uaAddedDamageBias             = {}
uaAddedDamageReaplacedAttack2 = {}
function _unitAura_Attack2Id(unit, prev)
	local id = unit.id.value
	uaAddedDamageReaplacedAttack2[id] = nil
	if uaAddedDamageCached[id] ~= nil then
		local uimpl = unit.impl
		if prev == aG000000000 or statsCheck_isHealAttack(uimpl.attack2) then
			uaAddedDamageReaplacedAttack2[id] = uimpl.attack2
			uaAddedDamageBias[id] = -1
			return uaAddedDamageType[id]
		end
	end
	uaAddedDamageBias[id] = 0
	return prev
end
function _unitAura_GetAddedDamageReaplacedAttack2(unitValueID)
	return uaAddedDamageReaplacedAttack2[unitValueID]
end

uaNewDamage1  = {}
uaBaseDamage1 = {}
function _unitAura_SetNewDamage1(unit, value)
	local id = unit.id.value
	uaNewDamage1[id] = _unitAura_SetMax(uaNewDamage1[id], value)
	return 0
end
function _unitAura_GetBaseDamage1(unitValueID)
	return uaBaseDamage1[unitValueID]
end

uaNewHeal1  = {}
uaBaseHeal1 = {}
function _unitAura_SetNewHeal1(unit, value)
	local id = unit.id.value
	uaNewHeal1[id] = _unitAura_SetMax(uaNewHeal1[id], value)
	return 0
end
function _unitAura_GetBaseHeal1(unitValueID)
	return uaBaseHeal1[unitValueID]
end

uaNewPower1  = {}
uaBasePower1 = {}
function _unitAura_SetNewPower1(unit, value)
	local id = unit.id.value
	uaNewPower1[id] = _unitAura_SetMax(uaNewPower1[id], value)
	return 0
end
function _unitAura_GetBasePower1(unitValueID)
	return uaBasePower1[unitValueID]
end

uaNewDamage2  = {}
uaBaseDamage2 = {}
function _unitAura_SetNewDamage2(unit, value)
	local id = unit.id.value
	uaNewDamage2[id] = _unitAura_SetMax(uaNewDamage2[id], value)
	return 0
end
function _unitAura_GetBaseDamage2(unitValueID)
	return uaBaseDamage2[unitValueID]
end

uaNewHeal2  = {}
uaBaseHeal2 = {}
function _unitAura_SetNewHeal2(unit, value)
	local id = unit.id.value
	uaNewHeal2[id] = _unitAura_SetMax(uaNewHeal2[id], value)
	return 0
end
function _unitAura_GetBaseHeal2(unitValueID)
	return uaBaseHeal2[unitValueID]
end

uaNewPower2  = {}
uaBasePower2 = {}
function _unitAura_SetNewPower2(unit, value)
	local id = unit.id.value
	uaNewPower2[id] = _unitAura_SetMax(uaNewPower2[id], value)
	return 0
end
function _unitAura_GetBasePower2(unitValueID)
	return uaBasePower2[unitValueID]
end

uaNewRegen  = {}
uaBaseRegen = {}
function _unitAura_SetNewRegen(unit, value)
	local id = unit.id.value
	uaNewRegen[id] = _unitAura_SetMax(uaNewRegen[id], value)
	return 0
end
function _unitAura_GetBaseRegen(unitValueID)
	return uaBaseRegen[unitValueID]
end

uaNewInitiative  = {}
uaBaseInitiative = {}
function _unitAura_SetNewInitiative(unit, value)
	local id = unit.id.value
	uaNewInitiative[id] = _unitAura_SetMax(uaNewInitiative[id], value)
	return 0
end
function _unitAura_GetBaseInitiative(unitValueID)
	return uaBaseInitiative[unitValueID]
end

uaNewXpKilled  = {}
uaBaseXpKilled = {}
function _unitAura_SetNewXpKilled(unit, value)
	local id = unit.id.value
	uaNewXpKilled[id] = _unitAura_SetMax(uaNewXpKilled[id], value)
	return 0
end
function _unitAura_GetBaseXpKilled(unitValueID)
	return uaBaseXpKilled[unitValueID]
end

uaNewNegotiate  = {}
uaBaseNegotiate = {}
function _unitAura_SetNewNegotiate(unit, value)
	local id = unit.id.value
	uaNewNegotiate[id] = _unitAura_SetMax(uaNewNegotiate[id], value)
	return 0
end
function _unitAura_GetBaseNegotiate(unitValueID)
	return uaBaseNegotiate[unitValueID]
end

uaNewHitPoint  = {}
uaBaseHitPoint = {}
function _unitAura_SetNewHitPoint(unit, value)
	local id = unit.id.value
	uaNewHitPoint[id] = _unitAura_SetMax(uaNewHitPoint[id], value)
	return 0
end
function _unitAura_GetBaseHitPoint(unitValueID)
	return uaBaseHitPoint[unitValueID]
end

function _unitAura_SetNewClear(unitIDValue)
	uaNewRegen[unitIDValue] = nil
	uaNewDamage1[unitIDValue] = nil
	uaNewHeal1[unitIDValue] = nil
	uaNewPower1[unitIDValue] = nil
	uaNewDamage2[unitIDValue] = nil
	uaNewHeal2[unitIDValue] = nil
	uaNewPower2[unitIDValue] = nil
	uaNewInitiative[unitIDValue] = nil
	uaNewXpKilled[unitIDValue] = nil
	uaNewHitPoint[unitIDValue] = nil
	return 0
end
function _unitAura_SetMax(oldValue, newValue)
	if oldValue == nil then
		return newValue
	else
		return math.max(oldValue, newValue)
	end
end

scenario = nil
function _unitAura_SetScenario(scen)
	scenario = scen
	_mapMultipliers_SetScenario(scen)
	return _GroupInfo_SetScenario(scen)
end
function _unitAura_GetScenario()
	return scenario
end

uaHitPoint_valPercent5               = {G040UM0144, G040UM0145, G040UM0146, G040UM0149, G201UM9175}
uaHitPoint_valFlat5                  = {G040UM0141, G201UM9169}
uaHitPoint_valFlat10                 = {G040UM0142}
uaHitPoint_valFlat25                 = {G040UM0143}
uaRegen_valFlat5                     = {G040UM0108, G040UM0109, G040UM0110, G201UM9171}
uaRegen_valFlat10                    = {G040UM0150}
uaArmor_valFlat5                     = {G040UM0100, G040UM0120, G040UM0121, G040UM0122, G040UM0151, G201UM9166}
uaAttackInitiative_valPercent5       = {G040UM0117, G040UM0118, G040UM0119, G040UM0152, G201UM9168}
uaAttackInitiative_valPercent10      = {G040UM0257}
uaAttackDamageHeal_valPercent5       = {G040UM0111, G040UM0112, G040UM0113, G040UM0148, G201UM9167}
uaAttackDamageHeal_valPercent20      = {G040UM0239}
uaAttackDamageHeal_valPercent25      = {G040UM0238}
uaAttackPower_valPercent5            = {G040UM0114, G040UM0115, G040UM0116, G040UM0147, G201UM9176}
uaAttackPower_valPercent5_ranged     = {G040UM0067}
uaAttackDrain_valFlat10              = {G040UM0139, G040UM0240, G201UM9170}
uaAttackDrain_valFlat20              = {G040UM0140}
uaAttackDrain_valFlat35              = {G040UM0237}
uaAttackCrit_valFlat5                = {G040UM0188, G040UM0189, G040UM0190, G201UM9172, G040UM0251}
uaAttackCrit_valFlat10               = {G040UM0191}
umAttackProtection5                  = {G201UM9245}
umAttackProtection25                 = {G040UM0164, G040UM0168, G040UM0171, G040UM0192, G040UM0224, G201UM9182}
umAttackProtection35                 = {}
umAttackProtection50                 = {G040UM0165, G040UM0169, G040UM0172, G040UM0174}
umAttackProtection75                 = {G040UM0166, G040UM0170, G040UM0173}
umAttackProtection100                = {G040UM0167}
umSummonBonusLevel1                  = {G040UM0182}
umSummonBonusLevel2                  = {G040UM0183}
umSummonBonusLevel3                  = {G040UM0184}
umSummonBonusLevel4                  = {G040UM0185}
umSummonBonusLevel5                  = {G040UM0186}
uaSummonTransform_valFlat1           = {G040UM0208, G040UM0212, G040UM0213, G040UM0214, G201UM9173}
uaSummonTransform_valFlat2           = {G040UM0210, G040UM0211}
uaExpKill_valFlat10m                 = {G201UM9165}
uaExpKill_valFlat25m                 = {G040UM0194}
uaExpKill_valFlat10                  = {G040UM0215, G040UM0217, G040UM0048}
uaExpKill_valFlat15                  = {G040UM0216, G040UM0218, G000UM4012, G201UM9164}
uaExpKill_valFlat25                  = {G201UM9040}
uaCurseProtection_valCovered1        = {G040UM0163, G040UM0223, G201UM9174}
uaArmorFlat_valCovered10             = {G040UM0227, G040UM0228, G201UM9183}
uaArmorFlat_valCovered15             = {G040UM0225}
uaArmorFlat_valCovered20             = {G040UM0226}
uaBlisterResist                      = {G040UM0101, G201UM9177}
uaFrostbiteResist                    = {G040UM0102, G201UM9178}
uaPoisonResist                       = {G040UM0103, G201UM9179}
uaLowerDamageResist                  = {G040UM0105, G201UM9180}
uaLowerInitiativeResist              = {G040UM0104, G201UM9181}
umPerLostHP_Armor1                   = {G201UM9184}
umPerLostHP_AttackInitiative1        = {G201UM9185}
umPerLostHP_AttackDamageHeal1        = {G201UM9186}
umPerLostHP_AttackPower1             = {G201UM9187}
umPerLostHP_AttackDrain1             = {G201UM9188}
umPerLostHP_AttackCrit1              = {G201UM9189}
umPerLostHP_DoubleAttack1            = {G201UM9190}
umAttackDamageInitiativeOnFullLife10 = {G201UM9191}
umAttackLessPowerOnFullLife10        = {G201UM9192}
umCowardiceBig                       = {G201UM9193, G040UM0242}
umVampirismPerCorpse                 = {G201UM9222, G040UM0013, G040UM0268}
umHitPointPerCorpse                  = {G201UM9242, G040UM0269}
umCannibalism10                      = {G201UM9194}
uaArmorFlat_valNearest5              = {G040UM0249}
umDrainLevelResistance50             = {G040UM0266, G040UM0267, G201UM9241}
uaHitPointOnDeath_valPercent10       = {G201UM9244}
uaHitPointOnDeath_valPercent20       = {G040UM0271}
uaAttackDrainOnDeath_valPercent10    = {G201UM9243}
uaAttackDrainOnDeath_valPercent20    = {G040UM0270}

function _unitAura_HitPoint_valPercent(unit)
	local warmasterSet = 0
	if _GroupInfo_stackHasModifierAmount(warmasterhelmet_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack:getEquippedItem(Equipment.Banner) ~= nil then
			warmasterSet = 5
		end
	end
	local mjolnirSet = 0
	if _GroupInfo_stackHasModifierAmount(mjolnircrown_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack:getEquippedItem(Equipment.Banner) ~= nil then
			mjolnirSet = 10
		end
	end
	return _unitAura_EffectSumStack(uaHitPoint_valPercent5, 5)
	     + warmasterSet
	     + mjolnirSet
end
function _unitAura_HitPoint_txtPercent(unit, unitMods)
	local warmasterSet = 0
	if _GroupInfo_UnitModifierAmount(unitMods, warmasterhelmet_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack:getEquippedItem(Equipment.Banner) ~= nil then
			warmasterSet = 5
		end
	end
	local mjolnirSet = 0
	if _GroupInfo_UnitModifierAmount(unitMods, mjolnircrown_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack:getEquippedItem(Equipment.Banner) ~= nil then
			mjolnirSet = 10
		end
	end
	return _unitAura_EffectSumUnit(unitMods, uaHitPoint_valPercent5, 5)
	     + warmasterSet
	     + mjolnirSet
end
function _unitAura_HitPoint_cntPercent(unit, unitMods)
	local warmasterSet = 0
	if _GroupInfo_UnitModifierAmount(unitMods, warmasterhelmet_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack:getEquippedItem(Equipment.Banner) ~= nil then
			warmasterSet = 1
		end
	end
	local mjolnirSet = 0
	if _GroupInfo_UnitModifierAmount(unitMods, mjolnircrown_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack:getEquippedItem(Equipment.Banner) ~= nil then
			mjolnirSet = 1
		end
	end
	return _unitAura_EffectSumUnit(unitMods, uaHitPoint_valPercent5, 1)
	     + warmasterSet
	     + mjolnirSet
end

function _unitAura_HitPoint_valFlat(unit)
	return _unitAura_EffectSumStack(uaHitPoint_valFlat5, 5)
	     + _unitAura_EffectSumStack(uaHitPoint_valFlat10, 10)
	     + _unitAura_EffectSumStack(uaHitPoint_valFlat25, 25)
end
function _unitAura_HitPoint_txtFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaHitPoint_valFlat5, 5)
	     + _unitAura_EffectSumUnit(unitMods, uaHitPoint_valFlat10, 10)
	     + _unitAura_EffectSumUnit(unitMods, uaHitPoint_valFlat25, 25)
end
function _unitAura_HitPoint_cntFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaHitPoint_valFlat5, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaHitPoint_valFlat10, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaHitPoint_valFlat25, 1)
end

function _unitAura_Regen_valFlat(unit)
	local harvestSet = 0
	if _GroupInfo_stackHasModifierAmount(harvestarmor_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(harvestcup_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(harvestdagger_mod) > 0 then
		harvestSet = 10
	end
	local runeset = 0
	if _GroupInfo_stackHasModifierAmount(runicshield_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(runestone_mod) > 0 then
		runeset = 5
	end
	local bootsofhomelands = 0
	if _GroupInfo_stackHasModifierAmount(bootsofhomelands_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack ~= nil then
			local player = stack.owner
			if player ~= nil then
				local pos = stack.position
				local tile = scenario:getTile(pos.x, pos.y)
				if _terrainToPlayerRace[tile.terrain] ~= player.race then
					bootsofhomelands = 10
				end
			end
		end
	end
	return _unitAura_EffectSumStack(uaRegen_valFlat5, 5)
	     + _unitAura_EffectSumStack(uaRegen_valFlat10, 10)
	     + harvestSet
	     + runeset
	     + bootsofhomelands
end
function _unitAura_Regen_txtFlat(unit, unitMods)
	local harvestSet = 0
	if _GroupInfo_UnitModifierAmount(unitMods, harvestarmor_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, harvestcup_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, harvestdagger_mod) > 0 then
		harvestSet = 10
	end
	local runeset = 0
	if _GroupInfo_UnitModifierAmount(unitMods, runicshield_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, runestone_mod) > 0 then
		runeset = 5
	end
	local bootsofhomelands = 0
	if _GroupInfo_UnitModifierAmount(unitMods, bootsofhomelands_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack ~= nil then
			local player = stack.owner
			if player ~= nil then
				local pos = stack.position
				local tile = scenario:getTile(pos.x, pos.y)
				if _terrainToPlayerRace[tile.terrain] ~= player.race then
					bootsofhomelands = 10
				end
			end
		end
	end
	return _unitAura_EffectSumUnit(unitMods, uaRegen_valFlat5, 5)
	     + _unitAura_EffectSumUnit(unitMods, uaRegen_valFlat10, 10)
	     + harvestSet
	     + runeset
	     + bootsofhomelands
end
function _unitAura_Regen_cntFlat(unit, unitMods)
	local harvestSet = _GroupInfo_UnitModifierAmount(unitMods, harvestdagger_mod)
	local runeset = _GroupInfo_UnitModifierAmount(unitMods, runestone_mod)
	local bootsofhomelands = _GroupInfo_UnitModifierAmount(unitMods, bootsofhomelands_mod)
	return _unitAura_EffectSumUnit(unitMods, uaRegen_valFlat5, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaRegen_valFlat10, 1)
	     + harvestSet
	     + runeset
	     + bootsofhomelands
end

function _unitAura_Armor_valFlat(unit)
	local holyset = 0
	if _GroupInfo_stackHasModifierAmount(holychalice_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(saintblood_mod) > 0 then
		holyset = 5
	end
	return _unitAura_EffectSumStack(uaArmor_valFlat5, 5)
	     + holyset
end
function _unitAura_Armor_txtFlat(unit, unitMods)
	local holyset = 0
	if _GroupInfo_UnitModifierAmount(unitMods, holychalice_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, saintblood_mod) > 0 then
		holyset = 5
	end
	return _unitAura_EffectSumUnit(unitMods, uaArmor_valFlat5, 5)
	     + holyset
end
function _unitAura_Armor_cntFlat(unit, unitMods)
	local holyset = _GroupInfo_UnitModifierAmount(unitMods, holychalice_mod)
	return _unitAura_EffectSumUnit(unitMods, uaArmor_valFlat5, 1)
	     + holyset
end

function _unitAura_AttackInitiative_valPercent(unit)
	return _unitAura_EffectSumStack(uaAttackInitiative_valPercent5, 5)
	     + _unitAura_EffectSumStack(uaAttackInitiative_valPercent10, 10)
end
function _unitAura_AttackInitiative_txtPercent(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackInitiative_valPercent5, 5)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackInitiative_valPercent10, 10)
end
function _unitAura_AttackInitiative_cntPercent(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackInitiative_valPercent5, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackInitiative_valPercent10, 1)
end

function _unitAura_AttackDamageHeal_valPercent(unit)
	local skullset = 0
	if _GroupInfo_stackHasModifierAmount(devilchalice_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(skullbracers_mod) > 0 then
		skullset = 5
	end
	local damnedset = 0
	if _GroupInfo_stackHasModifierAmount(helmetofthedamned_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(overlordblood_mod) > 0 and
	   _GroupInfo_stackHasModifierAmount(bladeofexalted_mod) > 0 then
		damnedset = 10
	end
	return _unitAura_EffectSumStack(uaAttackDamageHeal_valPercent5, 5)
	     + _unitAura_EffectSumStack(uaAttackDamageHeal_valPercent20, 20)
	     + _unitAura_EffectSumStack(uaAttackDamageHeal_valPercent25, 25)
	     + skullset
	     + damnedset
end
function _unitAura_AttackDamageHeal_txtPercent(unit, unitMods)
	local skullset = 0
	if _GroupInfo_UnitModifierAmount(unitMods, devilchalice_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, skullbracers_mod) > 0 then
		skullset = 5
	end
	local damnedset = 0
	if _GroupInfo_UnitModifierAmount(unitMods, helmetofthedamned_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, overlordblood_mod) > 0 and
	   _GroupInfo_UnitModifierAmount(unitMods, bladeofexalted_mod) > 0 then
		damnedset = 10
	end
	return _unitAura_EffectSumUnit(unitMods, uaAttackDamageHeal_valPercent5, 5)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDamageHeal_valPercent20, 20)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDamageHeal_valPercent25, 25)
	     + skullset
	     + damnedset
end
function _unitAura_AttackDamageHeal_cntPercent(unit, unitMods)
	local skullset = _GroupInfo_UnitModifierAmount(unitMods, skullbracers_mod)
	local damnedset = _GroupInfo_UnitModifierAmount(unitMods, helmetofthedamned_mod)
	return _unitAura_EffectSumUnit(unitMods, uaAttackDamageHeal_valPercent5, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDamageHeal_valPercent20, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDamageHeal_valPercent25, 1)
	     + skullset
	     + damnedset
end

function _unitAura_AttackPower_valPercent(unit)
	local rEffect = _unitAura_EffectSumStack(uaAttackPower_valPercent5_ranged, 5)
	if rEffect > 0 then
		local leader = _GroupInfo_getCurrentGroupLeader()
		if leader == nil or not _GroupInfo_UnitIsRangedWithoutBow(leader) then
			rEffect = 0
		end
	end
	return _unitAura_EffectSumStack(uaAttackPower_valPercent5, 5) + rEffect
end
function _unitAura_AttackPower_txtPercent(unit, unitMods)
	local rEffect = _unitAura_EffectSumUnit(unitMods, uaAttackPower_valPercent5_ranged, 5)
	if rEffect > 0 and not _GroupInfo_UnitIsRangedWithoutBow(unit) then
		rEffect = 0
	end
	return _unitAura_EffectSumUnit(unitMods, uaAttackPower_valPercent5, 5) + rEffect
end
function _unitAura_AttackPower_cntPercent(unit, unitMods)
	local rEffect = _unitAura_EffectSumUnit(unitMods, uaAttackPower_valPercent5_ranged, 1)
	--if rEffect > 0 and not _GroupInfo_UnitIsRangedWithoutBow(unit) then
	--	rEffect = 0
	--end
	return _unitAura_EffectSumUnit(unitMods, uaAttackPower_valPercent5, 1) + rEffect
end

function _unitAura_AttackDrain_valFlat(unit)
	return _unitAura_EffectSumStack(uaAttackDrain_valFlat10, 10)
	     + _unitAura_EffectSumStack(uaAttackDrain_valFlat20, 20)
	     + _unitAura_EffectSumStack(uaAttackDrain_valFlat35, 35)
end
function _unitAura_AttackDrain_txtFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackDrain_valFlat10, 10)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDrain_valFlat20, 20)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDrain_valFlat35, 35)
end
function _unitAura_AttackDrain_cntFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackDrain_valFlat10, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDrain_valFlat20, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDrain_valFlat35, 1)
end

function _unitAura_AttackCrit_valFlat(unit)
	return _unitAura_EffectSumStack(uaAttackCrit_valFlat5, 5)
	     + _unitAura_EffectSumStack(uaAttackCrit_valFlat10, 10)
end
function _unitAura_AttackCrit_txtFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackCrit_valFlat5, 5)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackCrit_valFlat10, 10)
end
function _unitAura_AttackCrit_cntFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackCrit_valFlat5, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackCrit_valFlat10, 1)
end

function _unitAura_BlisterResist_stk(unit)
	return _unitAura_EffectSumStack(uaBlisterResist, 1)
end
function _unitAura_BlisterResist_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaBlisterResist, 1)
end
function _unitAura_BlisterResist_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaBlisterResist, 1)
end

function _unitAura_FrostbiteResist_stk(unit)
	return _unitAura_EffectSumStack(uaFrostbiteResist, 1)
end
function _unitAura_FrostbiteResist_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaFrostbiteResist, 1)
end
function _unitAura_FrostbiteResist_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaFrostbiteResist, 1)
end

function _unitAura_PoisonResist_stk(unit)
	return _unitAura_EffectSumStack(uaPoisonResist, 1)
end
function _unitAura_PoisonResist_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaPoisonResist, 1)
end
function _unitAura_PoisonResist_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaPoisonResist, 1)
end

function _unitAura_LowerDamageResist_stk(unit)
	return _unitAura_EffectSumStack(uaLowerDamageResist, 1)
end
function _unitAura_LowerDamageResist_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaLowerDamageResist, 1)
end
function _unitAura_LowerDamageResist_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaLowerDamageResist, 1)
end

function _unitAura_LowerInitiativeResist_stk(unit)
	return _unitAura_EffectSumStack(uaLowerInitiativeResist, 1)
end
function _unitAura_LowerInitiativeResist_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaLowerInitiativeResist, 1)
end
function _unitAura_LowerInitiativeResist_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaLowerInitiativeResist, 1)
end

function _unitAura_movementMultiplier(unit, unitMods)
	local n100 = _GroupInfo_UnitModifierAmount(unitMods, spell_paraseus_mod)
	if n100 > 0 then
		return 0
	end
	local n99  = _GroupInfo_UnitModifierAmount(unitMods, spell_mutilation_mod)
	local n50  = _GroupInfo_UnitModifierAmount(unitMods, spell_severeblizzard_mod)
		   + _GroupInfo_UnitModifierAmount(unitMods, spell_deathpsalm_mod)
	local n30  = _GroupInfo_UnitModifierAmount(unitMods, spell_entanglement_mod)

	return (0.01^n99) * (0.5^n50) * (0.7^n30)
end

function _unitAura_AttackProtection_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackProtection5, 5)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection25, 25)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection35, 35)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection50, 50)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection75, 75)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection100, 100)
end
function _unitAura_AttackProtection_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackProtection5, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection25, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection35, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection50, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection75, 1)
	     + _unitAura_EffectSumUnit(unitMods, umAttackProtection100, 1)
end

function _unitAura_CowardiceBig_val(unit, unitMods)
	local r = _unitAura_EffectSumUnit(unitMods, umCowardiceBig, 1)
	if r > 0 then
		-- scenario:getUnit(unit.id).impl.attack1.type
		local attackType = scenario:getUnit(unit.id).impl.attack1.type
		if not (statsCheck_isDirectDmgType(attackType)
		     or statsCheck_isCurseType(attackType)
		     or statsCheck_isDoTType(attackType)) then
			r = 0
		end
	end
	return r
end
function _unitAura_CowardiceBig_cnt(unit, unitMods)
	local r = _unitAura_EffectSumUnit(unitMods, umCowardiceBig, 1)
	if r > 0 then
		local attackType = scenario:getUnit(unit.id).impl.attack1.type
		if not (statsCheck_isDirectDmgType(attackType)
		     or statsCheck_isCurseType(attackType)
		     or statsCheck_isDoTType(attackType)) then
			r = 0
		end
	end
	return r
end

function _unitAura_Cannibalism_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umCannibalism10, 10)
end
function _unitAura_Cannibalism_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umCannibalism10, 1)
end

function _unitAura_VampirismPerCorpse_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umVampirismPerCorpse, 10)
end
function _unitAura_VampirismPerCorpse_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umVampirismPerCorpse, 1)
end

function _unitAura_HitPointPerCorpse_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umHitPointPerCorpse, 10)
end
function _unitAura_HitPointPerCorpse_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umHitPointPerCorpse, 1)
end

function _unitAura_DrainLevelResistance_val(unit, unitMods)
	local n = _unitAura_EffectSumUnit(unitMods, umDrainLevelResistance50, 1)
	return math.min(99, math.floor(100 * ( 1 - 0.5^n)))
end
function _unitAura_DrainLevelResistance_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umDrainLevelResistance50, 1)
end

function _unitAura_PerLostHP_Armor_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_Armor1, 1)
end
function _unitAura_PerLostHP_Armor_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_Armor1, 1)
end

function _unitAura_PerLostHP_AttackInitiative_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackInitiative1, 1)
end
function _unitAura_PerLostHP_AttackInitiative_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackInitiative1, 1)
end

function _unitAura_PerLostHP_AttackDamageHeal_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackDamageHeal1, 1)
end
function _unitAura_PerLostHP_AttackDamageHeal_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackDamageHeal1, 1)
end

function _unitAura_PerLostHP_AttackPower_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackPower1, 1)
end
function _unitAura_PerLostHP_AttackPower_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackPower1, 1)
end

function _unitAura_PerLostHP_AttackDrain_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackDrain1, 1)
end
function _unitAura_PerLostHP_AttackDrain_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackDrain1, 1)
end

function _unitAura_PerLostHP_AttackCrit_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackCrit1, 1)
end
function _unitAura_PerLostHP_AttackCrit_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_AttackCrit1, 1)
end

function _unitAura_PerLostHP_DoubleAttack_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_DoubleAttack1, 1)
end
function _unitAura_PerLostHP_DoubleAttack_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umPerLostHP_DoubleAttack1, 1)
end

function _unitAura_AttackDamageInitiativeOnFullLife_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackDamageInitiativeOnFullLife10, 10)
end
function _unitAura_AttackDamageInitiativeOnFullLife_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackDamageInitiativeOnFullLife10, 1)
end

function _unitAura_AttackLessPowerOnFullLife_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackLessPowerOnFullLife10, 10)
end
function _unitAura_AttackLessPowerOnFullLife_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umAttackLessPowerOnFullLife10, 1)
end

function _unitAura_SummonBonusLevel_val(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel1, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel2, 2)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel3, 3)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel4, 4)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel5, 5)
end
function _unitAura_SummonBonusLevel_cnt(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel1, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel2, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel3, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel4, 1)
	     + _unitAura_EffectSumUnit(unitMods, umSummonBonusLevel5, 1)
end

function _unitAura_SummonTransform_valFlat(unit)
	return _unitAura_EffectSumStack(uaSummonTransform_valFlat1, 1)
	     + _unitAura_EffectSumStack(uaSummonTransform_valFlat2, 2)
end
function _unitAura_SummonTransform_txtFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaSummonTransform_valFlat1, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaSummonTransform_valFlat2, 2)
end
function _unitAura_SummonTransform_cntFlat(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaSummonTransform_valFlat1, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaSummonTransform_valFlat2, 1)
end
function _unitAura_SummonTransform_Exp(unit)
	return 10 * _unitAura_SummonTransform_valFlat(unit)
end

function _unitAura_ExpKill_valFlat(mods)
	return _unitAura_EffectSum(mods, uaExpKill_valFlat10, 10)
	     + _unitAura_EffectSum(mods, uaExpKill_valFlat15, 15)
	     + _unitAura_EffectSum(mods, uaExpKill_valFlat25, 25)
	     + _unitAura_EffectSum(mods, uaExpKill_valFlat10m, -10)
	     + _unitAura_EffectSum(mods, uaExpKill_valFlat25m, -25)
end

function _unitAura_CurseProtection_valCovered(unit)
	return _unitAura_EffectSumStack(uaCurseProtection_valCovered1, 1)
end
function _unitAura_CurseProtection_txtCovered(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaCurseProtection_valCovered1, 1)
end
function _unitAura_CurseProtection_cntCovered(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaCurseProtection_valCovered1, 1)
end

function _unitAura_ArmorFlat_valCovered(unit)
	return _unitAura_EffectSumStack(uaArmorFlat_valCovered10, 10)
	     + _unitAura_EffectSumStack(uaArmorFlat_valCovered15, 15)
	     + _unitAura_EffectSumStack(uaArmorFlat_valCovered20, 20)
end
function _unitAura_ArmorFlat_txtCovered(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valCovered10, 10)
	     + _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valCovered15, 15)
	     + _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valCovered20, 20)
end
function _unitAura_ArmorFlat_cntCovered(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valCovered10, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valCovered15, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valCovered20, 1)
end

function _unitAura_ArmorFlat_valNearest(unit)
	return _unitAura_EffectSumStack(uaArmorFlat_valNearest5, 5)
end
function _unitAura_ArmorFlat_txtNearest(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valNearest5, 5)
end
function _unitAura_ArmorFlat_cntNearest(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaArmorFlat_valNearest5, 1)
end

function _unitAura_HitPointOnDeath_valPercent(unit)
	return _unitAura_EffectSumStack_Dead(uaHitPointOnDeath_valPercent10, 10)
	     + _unitAura_EffectSumStack_Dead(uaHitPointOnDeath_valPercent20, 20)
end
function _unitAura_HitPointOnDeath_txtPercent(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaHitPointOnDeath_valPercent10, 10)
	     + _unitAura_EffectSumUnit(unitMods, uaHitPointOnDeath_valPercent20, 20)
end
function _unitAura_HitPointOnDeath_cntPercent(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaHitPointOnDeath_valPercent10, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaHitPointOnDeath_valPercent20, 1)
end

function _unitAura_AttackDrainOnDeath_valPercent(unit)
	return _unitAura_EffectSumStack_Dead(uaAttackDrainOnDeath_valPercent10, 10)
	     + _unitAura_EffectSumStack_Dead(uaAttackDrainOnDeath_valPercent20, 20)
end
function _unitAura_AttackDrainOnDeath_txtPercent(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackDrainOnDeath_valPercent10, 10)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDrainOnDeath_valPercent20, 20)
end
function _unitAura_AttackDrainOnDeath_cntPercent(unit, unitMods)
	return _unitAura_EffectSumUnit(unitMods, uaAttackDrainOnDeath_valPercent10, 1)
	     + _unitAura_EffectSumUnit(unitMods, uaAttackDrainOnDeath_valPercent20, 1)
end

function _unitAura_EffectSum(modsArray, modsSearch, modValue)
	local result = 0
	for m = 1, #modsSearch do
		if modsArray[modsSearch[m]] ~= nil then
			result = result + modsArray[modsSearch[m]]
		end
	end
	return modValue * result
end
function _unitAura_EffectSumStack(modsSearch, modValue)
	local result = 0
	for m = 1, #modsSearch do
		result = result + _GroupInfo_stackHasModifierAmount(modsSearch[m])
	end
	return modValue * result
end
function _unitAura_EffectSumStack_Dead(modsSearch, modValue)
	local result = 0
	for m = 1, #modsSearch do
		result = result + _GroupInfo_stackHasModifierAmount_Dead(modsSearch[m])
	end
	return modValue * result
end
function _unitAura_EffectSumUnit(unitMods, modsSearch, modValue)
	local result = 0
	for m = 1, #modsSearch do
		result = result + _GroupInfo_UnitModifierAmount(unitMods, modsSearch[m])
	end
	return modValue * result
end

ua_mlh_ArmorFlat20    = {G040UM0175, G040UM0177}
ua_mlh_PowerPercent20 = {G040UM0177}
ua_mlh_CritFlat20     = {G040UM0176}

function _unitAura_MostLostHPBuff_ArmorFlat(unit)
	local effect = _unitAura_EffectSumStack(ua_mlh_ArmorFlat20, 20)
	return _unitAura_MostLostHPBuff_Calc(unit, effect, true, true, true, true, true)
end
function _unitAura_MostLostHPBuff_PowerPercent(unit)
	local effect = _unitAura_EffectSumStack(ua_mlh_PowerPercent20, 20)
	return _unitAura_MostLostHPBuff_Calc(unit, effect, false, true, true, true, false)
end
function _unitAura_MostLostHPBuff_CritFlat(unit)
	local effect = _unitAura_EffectSumStack(ua_mlh_CritFlat20, 20)
	return _unitAura_MostLostHPBuff_Calc(unit, effect, false, true, false, false, false)
end
	
function _unitAura_MostLostHPBuff_Calc(unit, effect, ignoreForFilter, forDirectDmg, forDotDmg, forCurse, forHeal)
	if effect == 0 or unit.hp == 0 then
		return 0
	end
	local myID       = unit.id
	local myHPPart   = nil
	local minHPPart  = 1
	local minHPCount = 0
	local p
	local u
	local uid
	local prev_uid = nil
	local uhp
	local apply
	local unitImpl
	local a1
	local a2
	local unitGroupSlots = unitGroup.slots
	for i=1, #unitGroupSlots do
	    u = unitGroupSlots[i].unit
	    if u ~= nil then
	     	uhp = u.hp
	     	if uhp > 0 then
	            uid = u.id
	            if uid ~= prev_uid then
	            	    prev_uid = uid
			    unitImpl = scenario:getUnit(uid).impl
			    a1 = unitImpl.attack1
			    a2 = unitImpl.attack2
			    
			    apply = ignoreForFilter
			    if not apply and forDirectDmg and (statsCheck_isDirectDmgAttack(a1) or statsCheck_isDirectDmgAttack(a2)) then
			    	apply = true
			    end
			    if not apply and forDotDmg and (statsCheck_isDoTAttack(a1) or statsCheck_isDoTAttack(a2)) then
			    	apply = true
			    end
			    if not apply and forCurse and (statsCheck_isCurseAttack(a1) or statsCheck_isCurseAttack(a2)) then
			    	apply = true
			    end
			    if not apply and forHeal and (statsCheck_isHealAttack(a1) or statsCheck_isHealAttack(a2)) then
			    	apply = true
			    end
			    if apply then
			        p = uhp / unitImpl.hp
			        if uid == myID then
			            if p > minHPPart then
			                return 0
			            end
			            myHPPart = p
			        end
			        if p == minHPPart then
			            minHPCount = minHPCount + 1
			        elseif p < minHPPart then
			            minHPPart  = p
			            minHPCount = 1
			            if myHPPart ~= nil and myHPPart > minHPPart then
			                return 0
			            end
			        end
			    else
			        if uid == myID then
			           return 0
			        end
			    end
			end
		end
	    end
	end
	if myHPPart == minHPPart then
		return math.max(math.floor(effect / minHPCount), 1)
	else
		return 0
	end
end

ua_AddedDamagePercent10 = {G040UM0070}
ua_AddedDamagePercent30 = {G040UM0066, G040UM0071}
ua_AddedDamagePercent35 = {G040UM0069}
ua_AddedDamagePercent45 = {}
function _unitAura_AddedDamageSum(unit)
	if unit.impl.leaderType == -1 then
		return 0
	end
	return _unitAura_EffectSumStack(ua_AddedDamagePercent10, 10)
	     + _unitAura_EffectSumStack(ua_AddedDamagePercent30, 30)
	     + _unitAura_EffectSumStack(ua_AddedDamagePercent35, 35)
	     + _unitAura_EffectSumStack(ua_AddedDamagePercent45, 45)
end

function externalModifiers(attacker, target)
	-- _get_Group_and_Mods(attacker.unit)
	local aGroup, aOwner, aOwnerType = _GroupInfo_getUnitGroup(attacker.unit)
	local aGroupM, aGroupMD = _GroupInfo_GroupModifires(aGroupM, attacker.unit)
	local aPlayer = _GroupInfo_getPlayer(aOwnerType, aOwner)
	local aLeader = _GroupInfo_getGroupLeader(aGroup)
	local aExpMul = _mapMultipliers_XpGain_Multi(attacker.unit)
	-- _get_Group_and_Mods(target.unit)
	local tGroup, tOwner, tOwnerType = _GroupInfo_getUnitGroup(target.unit)
	local tGroupM, tGroupMD = _GroupInfo_GroupModifires(tGroupM, target.unit)
	local tPlayer = _GroupInfo_getPlayer(tOwnerType, tOwner)
	local tLeader = _GroupInfo_getGroupLeader(tGroup)
	local tExpMul = _mapMultipliers_XpGain_Multi(target.unit)
	
	externalModifiersApply(aGroup, aPlayer, aLeader, aGroupM, aExpMul,
	                       tGroup, tPlayer, tLeader, tGroupM, tExpMul)
	externalModifiersApply(tGroup, tPlayer, tLeader, tGroupM, tExpMul,
	                       aGroup, aPlayer, aLeader, aGroupM, aExpMul)
	return 0
end
function externalModifiersApply(g1, p1, l1, m1, e1,
                                g2, p2, l2, m2, e2)
	local ExpKilled = 1
	if p1 ~= nil and p1.race ~= Race.Neutral and p1.lord == Lord.Warrior then
		ExpKilled = ExpKilled + 0.05
	end
	if l1 ~= nil then
		local mods = _GroupInfo_UnitModifiers(l1)
		ExpKilled = ExpKilled + 0.01 * _unitAura_ExpKill_valFlat(mods)
		if _GroupInfo_UnitModifierAmount(mods, harvestarmor_mod) > 0 and
		   _GroupInfo_UnitModifierAmount(mods, harvestcup_mod) > 0 and
		   _GroupInfo_UnitModifierAmount(mods, harvestdagger_mod) > 0 then
			ExpKilled = ExpKilled + 0.15
		end
		if _GroupInfo_UnitModifierAmount(mods, itemsmasterperk_mod) > 0 then
			ExpKilled = ExpKilled + 0.01 * _unitAura_ItemsMasterPerk_Effect(l1)
		end
	end
	ExpKilled = ExpKilled * e1
	
	local units = g2.units
	local v
	for i = 1, #units do
		v = units[i].id.value
		uaExternalExpKilled[v] = ExpKilled
	end
	return 0
end

function _unitAura_LostHPEffect(unit, effectMultiplier)
	if effectMultiplier == 0 then
		return 0
	end
	local maxHP = scenario:getUnit(unit.id).hpMax
	return effectMultiplier * 100 * ( maxHP - math.min(maxHP, unit.hp) ) / ( 2 * maxHP )
end

function _unitAura_SpiritCage_Effect(unit, group)
	local units = group.units
	local expSum = 0
	for i = 1, #units do
		u = units[i]
		if u.hp == 0 then
			expSum = expSum + u.leveledImpl.xpKilled
		end
	end
	return math.floor( 0.1 * expSum)
end

function _unitAura_ChainsOfHumility_Effect(unit, group)
	local leader = _GroupInfo_getGroupLeader(group)
	if leader ~= nil then
		local impl = leader.impl 
		return impl.level + 10 * (impl.leadership - leader.baseImpl.leadership)
	end
	return 0
end

function _unitAura_ChainsOfSacrifice_Effect(unit, unitMods, baseValue, gotGroup)
	-- use it only as wearable item modifier
	if not gotGroup then
		_get_Group_and_Mods(unit)
	end
	if _GroupInfo_stackHasModifierAmount(chainsofsacrifice_mod) > 0 then
		local nearestUnits = _GroupInfo_getLeftAndRightNearestUnits(unit, true)
		if #nearestUnits > 0 then
			local unitChainsMCount = _GroupInfo_UnitModifierAmount(unitMods, chainsofsacrifice_mod)
			if unitChainsMCount > 0 then
				return math.floor( baseValue * ( 1 - 0.2 * unitChainsMCount ) )
			else
				local umCount
				for i = 1, #nearestUnits do
					umCount = _GroupInfo_UnitModifierAmount(_GroupInfo_UnitModifiers(nearestUnits[i]), chainsofsacrifice_mod)
					if umCount > 0 then
						local modOwnerBaseValue
						if uaNewInitiative[id] == nil then
							modOwnerBaseValue = nearestUnits[i].leveledImpl.attack1.initiative
						else
							modOwnerBaseValue = uaNewInitiative[id]
						end
						local nearestToOwner = _GroupInfo_getLeftAndRightNearestUnits(nearestUnits[i], true)
						local ownerEffect = math.floor( modOwnerBaseValue * ( 1 - 0.2 * umCount ) )
						return baseValue + math.ceil( ( modOwnerBaseValue - ownerEffect ) / #nearestToOwner )
					end
				end
			end 
		end
	end
	return baseValue
end

function _unitAura_RingOfHeavenWill_Effect(unit, unitMods, group)
	-- use it only as wearable item modifier
	if _GroupInfo_stackHasModifierAmount(ringofheavenwill_mod) > 0 then
		local stack = _GroupInfo_getUnitStack(unit)
		if stack == nil then
			return 0
		end
		
		local group = _GroupInfo_getCurrentGroup()
		local leader = _GroupInfo_getGroupLeader(group)
		if leader == nil then
			return 0
		end
		
		local result = 0
		local leadership = leader.impl.leadership
		local uHeavenwill = _GroupInfo_UnitModifierAmount(unitMods, ringofheavenwill_mod)
		
		local art1 = stack:getEquippedItem(Equipment.Artifact1)
		local art2 = stack:getEquippedItem(Equipment.Artifact2)
		if art1 ~= nil then
			if art1.base.id.value == ringofheavenwill_itm and uHeavenwill > 0 then
				result = result + 6 * leadership
			end
		end
		if art2 ~= nil then
			if art2.base.id.value == ringofheavenwill_itm and uHeavenwill == 0 then
				result = result + 2 * leadership
			end
		end
		return result
	end
	return 0
end

function _unitAura_ItemsMasterPerk_Effect(unit)
	local stack = _GroupInfo_getUnitStack(unit)
	local item
	local totalCost = 0
	local checkTypes = {Equipment.Artifact1, Equipment.Artifact2, Equipment.Boots, Equipment.Banner, Equipment.Tome}
	for i = 1, #checkTypes do
		item = stack:getEquippedItem(checkTypes[i])		
		if item ~= nil then
			totalCost = totalCost + item.base.value.gold
		end
	end
	return math.floor(totalCost / 3000)
end

if smnsEnabled then
	uaHitPoint_valPercent5 = _smns_addMod_uaHitPoint_valPercent5(uaHitPoint_valPercent5)
	uaHitPoint_valFlat5 = _smns_addMod_uaHitPoint_valFlat5(uaHitPoint_valFlat5)
	uaHitPoint_valFlat10 = _smns_addMod_uaHitPoint_valFlat10(uaHitPoint_valFlat10)
	uaHitPoint_valFlat25 = _smns_addMod_uaHitPoint_valFlat25(uaHitPoint_valFlat25)
	uaRegen_valFlat5 = _smns_addMod_uaRegen_valFlat5(uaRegen_valFlat5)
	uaArmor_valFlat5 = _smns_addMod_uaArmor_valFlat5(uaArmor_valFlat5)
	uaAttackInitiative_valPercent5 = _smns_addMod_uaAttackInitiative_valPercent5(uaAttackInitiative_valPercent5)
	uaAttackInitiative_valPercent10 = _smns_addMod_uaAttackInitiative_valPercent10(uaAttackInitiative_valPercent10)
	uaAttackDamageHeal_valPercent5 = _smns_addMod_uaAttackDamageHeal_valPercent5(uaAttackDamageHeal_valPercent5)
	uaAttackDamageHeal_valPercent20 = _smns_addMod_uaAttackDamageHeal_valPercent20(uaAttackDamageHeal_valPercent20)
	uaAttackDamageHeal_valPercent25 = _smns_addMod_uaAttackDamageHeal_valPercent25(uaAttackDamageHeal_valPercent25)
	uaAttackPower_valPercent5 = _smns_addMod_uaAttackPower_valPercent5(uaAttackPower_valPercent5)
	uaAttackPower_valPercent5_ranged = _smns_addMod_uaAttackPower_valPercent5_ranged(uaAttackPower_valPercent5_ranged)
	uaAttackDrain_valFlat10 = _smns_addMod_uaAttackDrain_valFlat10(uaAttackDrain_valFlat10)
	uaAttackDrain_valFlat20 = _smns_addMod_uaAttackDrain_valFlat20(uaAttackDrain_valFlat20)
	uaAttackDrain_valFlat35 = _smns_addMod_uaAttackDrain_valFlat35(uaAttackDrain_valFlat35)
	uaAttackCrit_valFlat5 = _smns_addMod_uaAttackCrit_valFlat5(uaAttackCrit_valFlat5)
	uaAttackCrit_valFlat10 = _smns_addMod_uaAttackCrit_valFlat10(uaAttackCrit_valFlat10)
	umAttackProtection5 = _smns_addMod_umAttackProtection25(umAttackProtection5)
	umAttackProtection25 = _smns_addMod_umAttackProtection25(umAttackProtection25)
	umAttackProtection35 = _smns_addMod_umAttackProtection25(umAttackProtection35)
	umAttackProtection50 = _smns_addMod_umAttackProtection50(umAttackProtection50)
	umAttackProtection75 = _smns_addMod_umAttackProtection75(umAttackProtection75)
	umAttackProtection100 = _smns_addMod_umAttackProtection100(umAttackProtection100)
	umSummonBonusLevel1 = _smns_addMod_umSummonBonusLevel1(umSummonBonusLevel1)
	umSummonBonusLevel2 = _smns_addMod_umSummonBonusLevel2(umSummonBonusLevel2)
	umSummonBonusLevel3 = _smns_addMod_umSummonBonusLevel3(umSummonBonusLevel3)
	umSummonBonusLevel4 = _smns_addMod_umSummonBonusLevel4(umSummonBonusLevel4)
	umSummonBonusLevel5 = _smns_addMod_umSummonBonusLevel5(umSummonBonusLevel5)
	uaSummonTransform_valFlat1 = _smns_addMod_uaSummonTransform_valFlat1(uaSummonTransform_valFlat1)
	uaSummonTransform_valFlat2 = _smns_addMod_uaSummonTransform_valFlat2(uaSummonTransform_valFlat2)
	uaExpKill_valFlat10m = _smns_addMod_uaExpKill_valFlat10m(uaExpKill_valFlat10m)
	uaExpKill_valFlat25m = _smns_addMod_uaExpKill_valFlat25m(uaExpKill_valFlat25m)
	uaExpKill_valFlat10 = _smns_addMod_uaExpKill_valFlat10(uaExpKill_valFlat10)
	uaExpKill_valFlat15 = _smns_addMod_uaExpKill_valFlat15(uaExpKill_valFlat15)
	uaExpKill_valFlat25 = _smns_addMod_uaExpKill_valFlat25(uaExpKill_valFlat25)
	uaCurseProtection_valCovered1 = _smns_addMod_uaCurseProtection_valCovered1(uaCurseProtection_valCovered1)
	uaArmorFlat_valCovered10 = _smns_addMod_uaArmorFlat_valCovered10(uaArmorFlat_valCovered10)
	uaArmorFlat_valCovered15 = _smns_addMod_uaArmorFlat_valCovered15(uaArmorFlat_valCovered15)
	uaArmorFlat_valCovered20 = _smns_addMod_uaArmorFlat_valCovered20(uaArmorFlat_valCovered20)
	uaBlisterResist = _smns_addMod_uaBlisterResist(uaBlisterResist)
	uaFrostbiteResist = _smns_addMod_uaFrostbiteResist(uaFrostbiteResist)
	uaPoisonResist = _smns_addMod_uaPoisonResist(uaPoisonResist)
	uaLowerDamageResist = _smns_addMod_uaLowerDamageResist(uaLowerDamageResist)
	uaLowerInitiativeResist = _smns_addMod_uaLowerInitiativeResist(uaLowerInitiativeResist)
	umPerLostHP_Armor1 = _smns_addMod_umPerLostHP_Armor1(umPerLostHP_Armor1)
	umPerLostHP_AttackInitiative1 = _smns_addMod_umPerLostHP_AttackInitiative1(umPerLostHP_AttackInitiative1)
	umPerLostHP_AttackDamageHeal1 = _smns_addMod_umPerLostHP_AttackDamageHeal1(umPerLostHP_AttackDamageHeal1)
	umPerLostHP_AttackPower1 = _smns_addMod_umPerLostHP_AttackPower1(umPerLostHP_AttackPower1)
	umPerLostHP_AttackDrain1 = _smns_addMod_umPerLostHP_AttackDrain1(umPerLostHP_AttackDrain1)
	umPerLostHP_AttackCrit1 = _smns_addMod_umPerLostHP_AttackCrit1(umPerLostHP_AttackCrit1)
	umPerLostHP_DoubleAttack1 = _smns_addMod_umPerLostHP_DoubleAttack1(umPerLostHP_DoubleAttack1)
	umAttackDamageInitiativeOnFullLife10 = _smns_addMod_umAttackDamageInitiativeOnFullLife10(umAttackDamageInitiativeOnFullLife10)
	umAttackLessPowerOnFullLife10 = _smns_addMod_umAttackLessPowerOnFullLife10(umAttackLessPowerOnFullLife10)
	umCowardiceBig = _smns_addMod_umCowardiceBig(umCowardiceBig)
	umVampirismPerCorpse = _smns_addMod_umVampirismPerCorpse(umVampirismPerCorpse)
	umCannibalism10 = _smns_addMod_umCannibalism10(umCannibalism10)
	uaArmorFlat_valNearest5 = _smns_addMod_uaArmorFlat_valNearest5(uaArmorFlat_valNearest5)
	ua_mlh_ArmorFlat20 = _smns_addMod_ua_mlh_ArmorFlat20(ua_mlh_ArmorFlat20)
	ua_mlh_PowerPercent20 = _smns_addMod_ua_mlh_PowerPercent20(ua_mlh_PowerPercent20)
	ua_mlh_CritFlat20 = _smns_addMod_ua_mlh_CritFlat20(ua_mlh_CritFlat20)
	ua_AddedDamagePercent10 = _smns_addMod_ua_AddedDamagePercent10(ua_AddedDamagePercent10)
	ua_AddedDamagePercent30 = _smns_addMod_ua_AddedDamagePercent35(ua_AddedDamagePercent30)
	ua_AddedDamagePercent35 = _smns_addMod_ua_AddedDamagePercent35(ua_AddedDamagePercent35)
	ua_AddedDamagePercent45 = _smns_addMod_ua_AddedDamagePercent45(ua_AddedDamagePercent45)
	umDrainLevelResistance50 = _smns_addMod_umDrainLevelResistance50(umDrainLevelResistance50)
	uaHitPointOnDeath_valPercent10 = _smns_addMod_uaHitPointOnDeath_valPercent10(uaHitPointOnDeath_valPercent10)
	uaHitPointOnDeath_valPercent20 = _smns_addMod_uaHitPointOnDeath_valPercent20(uaHitPointOnDeath_valPercent20)
	uaAttackDrainOnDeath_valPercent10 = _smns_addMod_uaAttackDrainOnDeath_valPercent10(uaAttackDrainOnDeath_valPercent10)
	uaAttackDrainOnDeath_valPercent20 = _smns_addMod_uaAttackDrainOnDeath_valPercent20(uaAttackDrainOnDeath_valPercent20)
	umHitPointPerCorpse = _smns_addMod_umHitPointPerCorpse(umHitPointPerCorpse)
end

unitAura.name = 'unitAura'
return unitAura
