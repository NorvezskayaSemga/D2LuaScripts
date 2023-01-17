package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua"
require('GroupInfo')
require('unitAura')

G014UM1068 = Id.new('g014um1068').value
G040UM0187 = Id.new('g040um0187').value
G040UM0209 = Id.new('g040um0209').value
G040UM0231 = Id.new('g040um0231').value
G040UM0236 = Id.new('g040um0236').value

function _getSummonBonusLevel(summoner, summonImpl, item)
	_get_Group_and_Mods(summoner)
	local mods = _GroupInfo_UnitModifiers(summoner)
	return _unitAura_SummonBonusLevel_val(summoner, mods)
	     + _unitAura_SummonTransform_valFlat(summoner)
	     + _GroupInfo_UnitModifierAmount(mods, G014UM1068) * 2
end
function _getSummonExpTransferEffectiveness(summoner, summonImpl, item)
	local eff
	_get_Group_and_Mods(summoner)
	local mods = _GroupInfo_UnitModifiers(summoner)
	if item then
		-- Не отрицательное число. Увеличиваем, чтобы повысить эффективность заливки опыта для слабых юнитов
		local denominatorShift = 100		
		-- Не отрицательное число. Увеличиваем, чтобы снизить общую эффективность заливки опыта
		local dividerShift = 0
		eff = math.sqrt((summonImpl.xpNext+denominatorShift)/(10000+dividerShift))
	else
		eff = 1
	end
	local amount =  _GroupInfo_UnitModifierAmount(mods, G040UM0187)
	if amount > 0 then
		eff = eff + math.min(0.5, 0.05 * ( summoner.impl.level - summoner.baseImpl.level ))
	end
	eff = eff + 0.01 * _unitAura_SummonTransform_Exp(summoner)
	return eff
end

function _getDoppelgangerBonusLevel(doppelganger, target)
	_get_Group_and_Mods(doppelganger)
	local mods = _GroupInfo_UnitModifiers(doppelganger)
	return _unitAura_SummonTransform_valFlat(doppelganger)
             + _GroupInfo_UnitModifierAmount(mods, G040UM0231) * 2
	     + _GroupInfo_UnitModifierAmount(mods, G014UM1068) * 2
end
function _getDoppelgangerExpTransferEffectiveness(doppelganger, target)
	_get_Group_and_Mods(doppelganger)
	local mods = _GroupInfo_UnitModifiers(doppelganger)
	return 1 + 0.01 * _unitAura_SummonTransform_Exp(doppelganger)
                 + 0.35 * _GroupInfo_UnitModifierAmount(mods, G040UM0231)
                 - 0.35 * _GroupInfo_UnitModifierAmount(mods, G040UM0236)
end

function _getTransformSelfBonusLevel(unit, transformImpl)
	_get_Group_and_Mods(unit)
	local mods = _GroupInfo_UnitModifiers(unit)
	return _unitAura_SummonTransform_valFlat(unit)
             + _GroupInfo_UnitModifierAmount(mods, G040UM0209) * 4
	     + _GroupInfo_UnitModifierAmount(mods, G014UM1068) * 2
end
function _getTransformSelfExpTransferEffectiveness(unit, transformImpl)
	_get_Group_and_Mods(unit)
	return 1 + 0.01 * _unitAura_SummonTransform_Exp(unit)
end
