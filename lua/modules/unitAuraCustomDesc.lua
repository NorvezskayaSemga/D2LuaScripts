package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require "unitAura"
require "GroupInfo"

_HitPoint_Percent_UnitMods              = {}
_HitPoint_Percent_DisplayCalls          = {}
_HitPoint_Percent_DescTxtCalls          = {}
_expected_HitPoint_Percent_DisplayCalls = {}
_expected_HitPoint_Percent_DescTxtCalls = {}

function _modifDisplay_HitPoint_Percent(unit, prev)
	local v = unit.id.value
	if _expected_HitPoint_Percent_DisplayCalls[v] == nil then
		_HitPoint_Percent_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _HitPoint_Percent_DisplayCalls[v] == 0 then
		if _unitAura_HitPoint_txtPercent(unit, _HitPoint_Percent_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_HitPoint_Percent_UnitMods[v]	   = nil
			_expected_HitPoint_Percent_DisplayCalls[v] = nil
			_HitPoint_Percent_DisplayCalls[v]          = nil
			_expected_HitPoint_Percent_DescTxtCalls[v] = nil
			_HitPoint_Percent_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_HitPoint_Percent_DisplayCalls[v] = _HitPoint_Percent_DisplayCalls[v] + 1
	if _expected_HitPoint_Percent_DisplayCalls[v] <= _HitPoint_Percent_DisplayCalls[v] then
		if _expected_HitPoint_Percent_DescTxtCalls[v] == nil then
			_HitPoint_Percent_UnitMods[v]	   = nil
		end
		_expected_HitPoint_Percent_DisplayCalls[v] = nil
		_HitPoint_Percent_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_HitPoint_Percent(unit, prev)
	local v = unit.id.value
	if _expected_HitPoint_Percent_DescTxtCalls[v] == nil then
		_HitPoint_Percent_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _HitPoint_Percent_DescTxtCalls[v] == 0 then
		if _HitPoint_Percent_UnitMods[v]  == nil then
			_HitPoint_Percent_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_HitPoint_txtPercent(unit, _HitPoint_Percent_UnitMods[v])
		result = Id.new('x030tg'..tostring(6000 + eff))
	else
		result = prev
	end
	_HitPoint_Percent_DescTxtCalls[v] = _HitPoint_Percent_DescTxtCalls[v] + 1
	if _expected_HitPoint_Percent_DescTxtCalls[v] <= _HitPoint_Percent_DescTxtCalls[v] then
		if _expected_HitPoint_Percent_DisplayCalls[v] == nil then
			_HitPoint_Percent_UnitMods[v]	   = nil
		end
		_expected_HitPoint_Percent_DescTxtCalls[v] = nil
		_HitPoint_Percent_DescTxtCalls[v]          = nil
	end
	return result
end

function _HitPoint_Percent_modifCustomDescTxt_init(unit, unitIndex)
		if _HitPoint_Percent_UnitMods[unitIndex]  == nil then
			_HitPoint_Percent_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_HitPoint_Percent_DisplayCalls[unitIndex]    = _unitAura_HitPoint_cntPercent(unit, _HitPoint_Percent_UnitMods[unitIndex])
		_HitPoint_Percent_DisplayCalls[unitIndex]             = 0
		_expected_HitPoint_Percent_DescTxtCalls[unitIndex]    = 1
		_HitPoint_Percent_DescTxtCalls[unitIndex]             = 0
		return 0
end

_HitPoint_Flat_UnitMods              = {}
_HitPoint_Flat_DisplayCalls          = {}
_HitPoint_Flat_DescTxtCalls          = {}
_expected_HitPoint_Flat_DisplayCalls = {}
_expected_HitPoint_Flat_DescTxtCalls = {}

function _modifDisplay_HitPoint_Flat(unit, prev)
	local v = unit.id.value
	if _expected_HitPoint_Flat_DisplayCalls[v] == nil then
		_HitPoint_Flat_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _HitPoint_Flat_DisplayCalls[v] == 0 then
		if _unitAura_HitPoint_txtFlat(unit, _HitPoint_Flat_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_HitPoint_Flat_UnitMods[v]	   = nil
			_expected_HitPoint_Flat_DisplayCalls[v] = nil
			_HitPoint_Flat_DisplayCalls[v]          = nil
			_expected_HitPoint_Flat_DescTxtCalls[v] = nil
			_HitPoint_Flat_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_HitPoint_Flat_DisplayCalls[v] = _HitPoint_Flat_DisplayCalls[v] + 1
	if _expected_HitPoint_Flat_DisplayCalls[v] <= _HitPoint_Flat_DisplayCalls[v] then
		if _expected_HitPoint_Flat_DescTxtCalls[v] == nil then
			_HitPoint_Flat_UnitMods[v]	   = nil
		end
		_expected_HitPoint_Flat_DisplayCalls[v] = nil
		_HitPoint_Flat_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_HitPoint_Flat(unit, prev)
	local v = unit.id.value
	if _expected_HitPoint_Flat_DescTxtCalls[v] == nil then
		_HitPoint_Flat_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _HitPoint_Flat_DescTxtCalls[v] == 0 then
		if _HitPoint_Flat_UnitMods[v]  == nil then
			_HitPoint_Flat_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_HitPoint_txtFlat(unit, _HitPoint_Flat_UnitMods[v])
		result = Id.new('x030tg'..tostring(8000 + eff))
	else
		result = prev
	end
	_HitPoint_Flat_DescTxtCalls[v] = _HitPoint_Flat_DescTxtCalls[v] + 1
	if _expected_HitPoint_Flat_DescTxtCalls[v] <= _HitPoint_Flat_DescTxtCalls[v] then
		if _expected_HitPoint_Flat_DisplayCalls[v] == nil then
			_HitPoint_Flat_UnitMods[v]	   = nil
		end
		_expected_HitPoint_Flat_DescTxtCalls[v] = nil
		_HitPoint_Flat_DescTxtCalls[v]          = nil
	end
	return result
end

function _HitPoint_Flat_modifCustomDescTxt_init(unit, unitIndex)
		if _HitPoint_Flat_UnitMods[unitIndex]  == nil then
			_HitPoint_Flat_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_HitPoint_Flat_DisplayCalls[unitIndex]    = _unitAura_HitPoint_cntFlat(unit, _HitPoint_Flat_UnitMods[unitIndex])
		_HitPoint_Flat_DisplayCalls[unitIndex]             = 0
		_expected_HitPoint_Flat_DescTxtCalls[unitIndex]    = 1
		_HitPoint_Flat_DescTxtCalls[unitIndex]             = 0
		return 0
end

_Regen_Flat_UnitMods              = {}
_Regen_Flat_DisplayCalls          = {}
_Regen_Flat_DescTxtCalls          = {}
_expected_Regen_Flat_DisplayCalls = {}
_expected_Regen_Flat_DescTxtCalls = {}

function _modifDisplay_Regen_Flat(unit, prev)
	local v = unit.id.value
	if _expected_Regen_Flat_DisplayCalls[v] == nil then
		_Regen_Flat_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _Regen_Flat_DisplayCalls[v] == 0 then
		if _unitAura_Regen_txtFlat(unit, _Regen_Flat_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_Regen_Flat_UnitMods[v]	   = nil
			_expected_Regen_Flat_DisplayCalls[v] = nil
			_Regen_Flat_DisplayCalls[v]          = nil
			_expected_Regen_Flat_DescTxtCalls[v] = nil
			_Regen_Flat_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_Regen_Flat_DisplayCalls[v] = _Regen_Flat_DisplayCalls[v] + 1
	if _expected_Regen_Flat_DisplayCalls[v] <= _Regen_Flat_DisplayCalls[v] then
		if _expected_Regen_Flat_DescTxtCalls[v] == nil then
			_Regen_Flat_UnitMods[v]	   = nil
		end
		_expected_Regen_Flat_DisplayCalls[v] = nil
		_Regen_Flat_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_Regen_Flat(unit, prev)
	local v = unit.id.value
	if _expected_Regen_Flat_DescTxtCalls[v] == nil then
		_Regen_Flat_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _Regen_Flat_DescTxtCalls[v] == 0 then
		if _Regen_Flat_UnitMods[v]  == nil then
			_Regen_Flat_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_Regen_txtFlat(unit, _Regen_Flat_UnitMods[v])
		result = Id.new('x030tg'..tostring(2000 + eff))
	else
		result = prev
	end
	_Regen_Flat_DescTxtCalls[v] = _Regen_Flat_DescTxtCalls[v] + 1
	if _expected_Regen_Flat_DescTxtCalls[v] <= _Regen_Flat_DescTxtCalls[v] then
		if _expected_Regen_Flat_DisplayCalls[v] == nil then
			_Regen_Flat_UnitMods[v]	   = nil
		end
		_expected_Regen_Flat_DescTxtCalls[v] = nil
		_Regen_Flat_DescTxtCalls[v]          = nil
	end
	return result
end

function _Regen_Flat_modifCustomDescTxt_init(unit, unitIndex)
		if _Regen_Flat_UnitMods[unitIndex]  == nil then
			_Regen_Flat_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_Regen_Flat_DisplayCalls[unitIndex]    = _unitAura_Regen_cntFlat(unit, _Regen_Flat_UnitMods[unitIndex])
		_Regen_Flat_DisplayCalls[unitIndex]             = 0
		_expected_Regen_Flat_DescTxtCalls[unitIndex]    = 1
		_Regen_Flat_DescTxtCalls[unitIndex]             = 0
		return 0
end

_Armor_Flat_UnitMods              = {}
_Armor_Flat_DisplayCalls          = {}
_Armor_Flat_DescTxtCalls          = {}
_expected_Armor_Flat_DisplayCalls = {}
_expected_Armor_Flat_DescTxtCalls = {}

function _modifDisplay_Armor_Flat(unit, prev)
	local v = unit.id.value
	if _expected_Armor_Flat_DisplayCalls[v] == nil then
		_Armor_Flat_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _Armor_Flat_DisplayCalls[v] == 0 then
		if _unitAura_Armor_txtFlat(unit, _Armor_Flat_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_Armor_Flat_UnitMods[v]	   = nil
			_expected_Armor_Flat_DisplayCalls[v] = nil
			_Armor_Flat_DisplayCalls[v]          = nil
			_expected_Armor_Flat_DescTxtCalls[v] = nil
			_Armor_Flat_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_Armor_Flat_DisplayCalls[v] = _Armor_Flat_DisplayCalls[v] + 1
	if _expected_Armor_Flat_DisplayCalls[v] <= _Armor_Flat_DisplayCalls[v] then
		if _expected_Armor_Flat_DescTxtCalls[v] == nil then
			_Armor_Flat_UnitMods[v]	   = nil
		end
		_expected_Armor_Flat_DisplayCalls[v] = nil
		_Armor_Flat_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_Armor_Flat(unit, prev)
	local v = unit.id.value
	if _expected_Armor_Flat_DescTxtCalls[v] == nil then
		_Armor_Flat_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _Armor_Flat_DescTxtCalls[v] == 0 then
		if _Armor_Flat_UnitMods[v]  == nil then
			_Armor_Flat_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_Armor_txtFlat(unit, _Armor_Flat_UnitMods[v])
		result = Id.new('x030tg'..tostring(1000 + eff))
	else
		result = prev
	end
	_Armor_Flat_DescTxtCalls[v] = _Armor_Flat_DescTxtCalls[v] + 1
	if _expected_Armor_Flat_DescTxtCalls[v] <= _Armor_Flat_DescTxtCalls[v] then
		if _expected_Armor_Flat_DisplayCalls[v] == nil then
			_Armor_Flat_UnitMods[v]	   = nil
		end
		_expected_Armor_Flat_DescTxtCalls[v] = nil
		_Armor_Flat_DescTxtCalls[v]          = nil
	end
	return result
end

function _Armor_Flat_modifCustomDescTxt_init(unit, unitIndex)
		if _Armor_Flat_UnitMods[unitIndex]  == nil then
			_Armor_Flat_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_Armor_Flat_DisplayCalls[unitIndex]    = _unitAura_Armor_cntFlat(unit, _Armor_Flat_UnitMods[unitIndex])
		_Armor_Flat_DisplayCalls[unitIndex]             = 0
		_expected_Armor_Flat_DescTxtCalls[unitIndex]    = 1
		_Armor_Flat_DescTxtCalls[unitIndex]             = 0
		return 0
end

_AttackInitiative_Percent_UnitMods              = {}
_AttackInitiative_Percent_DisplayCalls          = {}
_AttackInitiative_Percent_DescTxtCalls          = {}
_expected_AttackInitiative_Percent_DisplayCalls = {}
_expected_AttackInitiative_Percent_DescTxtCalls = {}

function _modifDisplay_AttackInitiative_Percent(unit, prev)
	local v = unit.id.value
	if _expected_AttackInitiative_Percent_DisplayCalls[v] == nil then
		_AttackInitiative_Percent_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackInitiative_Percent_DisplayCalls[v] == 0 then
		if _unitAura_AttackInitiative_txtPercent(unit, _AttackInitiative_Percent_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_AttackInitiative_Percent_UnitMods[v]	   = nil
			_expected_AttackInitiative_Percent_DisplayCalls[v] = nil
			_AttackInitiative_Percent_DisplayCalls[v]          = nil
			_expected_AttackInitiative_Percent_DescTxtCalls[v] = nil
			_AttackInitiative_Percent_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_AttackInitiative_Percent_DisplayCalls[v] = _AttackInitiative_Percent_DisplayCalls[v] + 1
	if _expected_AttackInitiative_Percent_DisplayCalls[v] <= _AttackInitiative_Percent_DisplayCalls[v] then
		if _expected_AttackInitiative_Percent_DescTxtCalls[v] == nil then
			_AttackInitiative_Percent_UnitMods[v]	   = nil
		end
		_expected_AttackInitiative_Percent_DisplayCalls[v] = nil
		_AttackInitiative_Percent_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_AttackInitiative_Percent(unit, prev)
	local v = unit.id.value
	if _expected_AttackInitiative_Percent_DescTxtCalls[v] == nil then
		_AttackInitiative_Percent_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackInitiative_Percent_DescTxtCalls[v] == 0 then
		if _AttackInitiative_Percent_UnitMods[v]  == nil then
			_AttackInitiative_Percent_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_AttackInitiative_txtPercent(unit, _AttackInitiative_Percent_UnitMods[v])
		result = Id.new('x030tg'..tostring(5000 + eff))
	else
		result = prev
	end
	_AttackInitiative_Percent_DescTxtCalls[v] = _AttackInitiative_Percent_DescTxtCalls[v] + 1
	if _expected_AttackInitiative_Percent_DescTxtCalls[v] <= _AttackInitiative_Percent_DescTxtCalls[v] then
		if _expected_AttackInitiative_Percent_DisplayCalls[v] == nil then
			_AttackInitiative_Percent_UnitMods[v]	   = nil
		end
		_expected_AttackInitiative_Percent_DescTxtCalls[v] = nil
		_AttackInitiative_Percent_DescTxtCalls[v]          = nil
	end
	return result
end

function _AttackInitiative_Percent_modifCustomDescTxt_init(unit, unitIndex)
		if _AttackInitiative_Percent_UnitMods[unitIndex]  == nil then
			_AttackInitiative_Percent_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_AttackInitiative_Percent_DisplayCalls[unitIndex]    = _unitAura_AttackInitiative_cntPercent(unit, _AttackInitiative_Percent_UnitMods[unitIndex])
		_AttackInitiative_Percent_DisplayCalls[unitIndex]             = 0
		_expected_AttackInitiative_Percent_DescTxtCalls[unitIndex]    = 1
		_AttackInitiative_Percent_DescTxtCalls[unitIndex]             = 0
		return 0
end

_AttackDamageHeal_Percent_UnitMods              = {}
_AttackDamageHeal_Percent_DisplayCalls          = {}
_AttackDamageHeal_Percent_DescTxtCalls          = {}
_expected_AttackDamageHeal_Percent_DisplayCalls = {}
_expected_AttackDamageHeal_Percent_DescTxtCalls = {}

function _modifDisplay_AttackDamageHeal_Percent(unit, prev)
	local v = unit.id.value
	if _expected_AttackDamageHeal_Percent_DisplayCalls[v] == nil then
		_AttackDamageHeal_Percent_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackDamageHeal_Percent_DisplayCalls[v] == 0 then
		if _unitAura_AttackDamageHeal_txtPercent(unit, _AttackDamageHeal_Percent_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_AttackDamageHeal_Percent_UnitMods[v]	   = nil
			_expected_AttackDamageHeal_Percent_DisplayCalls[v] = nil
			_AttackDamageHeal_Percent_DisplayCalls[v]          = nil
			_expected_AttackDamageHeal_Percent_DescTxtCalls[v] = nil
			_AttackDamageHeal_Percent_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_AttackDamageHeal_Percent_DisplayCalls[v] = _AttackDamageHeal_Percent_DisplayCalls[v] + 1
	if _expected_AttackDamageHeal_Percent_DisplayCalls[v] <= _AttackDamageHeal_Percent_DisplayCalls[v] then
		if _expected_AttackDamageHeal_Percent_DescTxtCalls[v] == nil then
			_AttackDamageHeal_Percent_UnitMods[v]	   = nil
		end
		_expected_AttackDamageHeal_Percent_DisplayCalls[v] = nil
		_AttackDamageHeal_Percent_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_AttackDamageHeal_Percent(unit, prev)
	local v = unit.id.value
	if _expected_AttackDamageHeal_Percent_DescTxtCalls[v] == nil then
		_AttackDamageHeal_Percent_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackDamageHeal_Percent_DescTxtCalls[v] == 0 then
		if _AttackDamageHeal_Percent_UnitMods[v]  == nil then
			_AttackDamageHeal_Percent_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_AttackDamageHeal_txtPercent(unit, _AttackDamageHeal_Percent_UnitMods[v])
		result = Id.new('x030tg'..tostring(3000 + eff))
	else
		result = prev
	end
	_AttackDamageHeal_Percent_DescTxtCalls[v] = _AttackDamageHeal_Percent_DescTxtCalls[v] + 1
	if _expected_AttackDamageHeal_Percent_DescTxtCalls[v] <= _AttackDamageHeal_Percent_DescTxtCalls[v] then
		if _expected_AttackDamageHeal_Percent_DisplayCalls[v] == nil then
			_AttackDamageHeal_Percent_UnitMods[v]	   = nil
		end
		_expected_AttackDamageHeal_Percent_DescTxtCalls[v] = nil
		_AttackDamageHeal_Percent_DescTxtCalls[v]          = nil
	end
	return result
end

function _AttackDamageHeal_Percent_modifCustomDescTxt_init(unit, unitIndex)
		if _AttackDamageHeal_Percent_UnitMods[unitIndex]  == nil then
			_AttackDamageHeal_Percent_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_AttackDamageHeal_Percent_DisplayCalls[unitIndex]    = _unitAura_AttackDamageHeal_cntPercent(unit, _AttackDamageHeal_Percent_UnitMods[unitIndex])
		_AttackDamageHeal_Percent_DisplayCalls[unitIndex]             = 0
		_expected_AttackDamageHeal_Percent_DescTxtCalls[unitIndex]    = 1
		_AttackDamageHeal_Percent_DescTxtCalls[unitIndex]             = 0
		return 0
end

_AttackPower_Percent_UnitMods              = {}
_AttackPower_Percent_DisplayCalls          = {}
_AttackPower_Percent_DescTxtCalls          = {}
_expected_AttackPower_Percent_DisplayCalls = {}
_expected_AttackPower_Percent_DescTxtCalls = {}

function _modifDisplay_AttackPower_Percent(unit, prev)
	local v = unit.id.value
	if _expected_AttackPower_Percent_DisplayCalls[v] == nil then
		_AttackPower_Percent_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackPower_Percent_DisplayCalls[v] == 0 then
		if _unitAura_AttackPower_txtPercent(unit, _AttackPower_Percent_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_AttackPower_Percent_UnitMods[v]	   = nil
			_expected_AttackPower_Percent_DisplayCalls[v] = nil
			_AttackPower_Percent_DisplayCalls[v]          = nil
			_expected_AttackPower_Percent_DescTxtCalls[v] = nil
			_AttackPower_Percent_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_AttackPower_Percent_DisplayCalls[v] = _AttackPower_Percent_DisplayCalls[v] + 1
	if _expected_AttackPower_Percent_DisplayCalls[v] <= _AttackPower_Percent_DisplayCalls[v] then
		if _expected_AttackPower_Percent_DescTxtCalls[v] == nil then
			_AttackPower_Percent_UnitMods[v]	   = nil
		end
		_expected_AttackPower_Percent_DisplayCalls[v] = nil
		_AttackPower_Percent_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_AttackPower_Percent(unit, prev)
	local v = unit.id.value
	if _expected_AttackPower_Percent_DescTxtCalls[v] == nil then
		_AttackPower_Percent_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackPower_Percent_DescTxtCalls[v] == 0 then
		if _AttackPower_Percent_UnitMods[v]  == nil then
			_AttackPower_Percent_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_AttackPower_txtPercent(unit, _AttackPower_Percent_UnitMods[v])
		result = Id.new('x030tg'..tostring(4000 + eff))
	else
		result = prev
	end
	_AttackPower_Percent_DescTxtCalls[v] = _AttackPower_Percent_DescTxtCalls[v] + 1
	if _expected_AttackPower_Percent_DescTxtCalls[v] <= _AttackPower_Percent_DescTxtCalls[v] then
		if _expected_AttackPower_Percent_DisplayCalls[v] == nil then
			_AttackPower_Percent_UnitMods[v]	   = nil
		end
		_expected_AttackPower_Percent_DescTxtCalls[v] = nil
		_AttackPower_Percent_DescTxtCalls[v]          = nil
	end
	return result
end

function _AttackPower_Percent_modifCustomDescTxt_init(unit, unitIndex)
		if _AttackPower_Percent_UnitMods[unitIndex]  == nil then
			_AttackPower_Percent_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_AttackPower_Percent_DisplayCalls[unitIndex]    = _unitAura_AttackPower_cntPercent(unit, _AttackPower_Percent_UnitMods[unitIndex])
		_AttackPower_Percent_DisplayCalls[unitIndex]             = 0
		_expected_AttackPower_Percent_DescTxtCalls[unitIndex]    = 1
		_AttackPower_Percent_DescTxtCalls[unitIndex]             = 0
		return 0
end

_AttackDrain_Flat_UnitMods              = {}
_AttackDrain_Flat_DisplayCalls          = {}
_AttackDrain_Flat_DescTxtCalls          = {}
_expected_AttackDrain_Flat_DisplayCalls = {}
_expected_AttackDrain_Flat_DescTxtCalls = {}

function _modifDisplay_AttackDrain_Flat(unit, prev)
	local v = unit.id.value
	if _expected_AttackDrain_Flat_DisplayCalls[v] == nil then
		_AttackDrain_Flat_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackDrain_Flat_DisplayCalls[v] == 0 then
		if _unitAura_AttackDrain_txtFlat(unit, _AttackDrain_Flat_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_AttackDrain_Flat_UnitMods[v]	   = nil
			_expected_AttackDrain_Flat_DisplayCalls[v] = nil
			_AttackDrain_Flat_DisplayCalls[v]          = nil
			_expected_AttackDrain_Flat_DescTxtCalls[v] = nil
			_AttackDrain_Flat_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_AttackDrain_Flat_DisplayCalls[v] = _AttackDrain_Flat_DisplayCalls[v] + 1
	if _expected_AttackDrain_Flat_DisplayCalls[v] <= _AttackDrain_Flat_DisplayCalls[v] then
		if _expected_AttackDrain_Flat_DescTxtCalls[v] == nil then
			_AttackDrain_Flat_UnitMods[v]	   = nil
		end
		_expected_AttackDrain_Flat_DisplayCalls[v] = nil
		_AttackDrain_Flat_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_AttackDrain_Flat(unit, prev)
	local v = unit.id.value
	if _expected_AttackDrain_Flat_DescTxtCalls[v] == nil then
		_AttackDrain_Flat_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackDrain_Flat_DescTxtCalls[v] == 0 then
		if _AttackDrain_Flat_UnitMods[v]  == nil then
			_AttackDrain_Flat_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_AttackDrain_txtFlat(unit, _AttackDrain_Flat_UnitMods[v])
		result = Id.new('x030tg'..tostring(7000 + eff))
	else
		result = prev
	end
	_AttackDrain_Flat_DescTxtCalls[v] = _AttackDrain_Flat_DescTxtCalls[v] + 1
	if _expected_AttackDrain_Flat_DescTxtCalls[v] <= _AttackDrain_Flat_DescTxtCalls[v] then
		if _expected_AttackDrain_Flat_DisplayCalls[v] == nil then
			_AttackDrain_Flat_UnitMods[v]	   = nil
		end
		_expected_AttackDrain_Flat_DescTxtCalls[v] = nil
		_AttackDrain_Flat_DescTxtCalls[v]          = nil
	end
	return result
end

function _AttackDrain_Flat_modifCustomDescTxt_init(unit, unitIndex)
		if _AttackDrain_Flat_UnitMods[unitIndex]  == nil then
			_AttackDrain_Flat_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_AttackDrain_Flat_DisplayCalls[unitIndex]    = _unitAura_AttackDrain_cntFlat(unit, _AttackDrain_Flat_UnitMods[unitIndex])
		_AttackDrain_Flat_DisplayCalls[unitIndex]             = 0
		_expected_AttackDrain_Flat_DescTxtCalls[unitIndex]    = 1
		_AttackDrain_Flat_DescTxtCalls[unitIndex]             = 0
		return 0
end

_AttackCrit_Flat_UnitMods              = {}
_AttackCrit_Flat_DisplayCalls          = {}
_AttackCrit_Flat_DescTxtCalls          = {}
_expected_AttackCrit_Flat_DisplayCalls = {}
_expected_AttackCrit_Flat_DescTxtCalls = {}

function _modifDisplay_AttackCrit_Flat(unit, prev)
	local v = unit.id.value
	if _expected_AttackCrit_Flat_DisplayCalls[v] == nil then
		_AttackCrit_Flat_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackCrit_Flat_DisplayCalls[v] == 0 then
		if _unitAura_AttackCrit_txtFlat(unit, _AttackCrit_Flat_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_AttackCrit_Flat_UnitMods[v]	   = nil
			_expected_AttackCrit_Flat_DisplayCalls[v] = nil
			_AttackCrit_Flat_DisplayCalls[v]          = nil
			_expected_AttackCrit_Flat_DescTxtCalls[v] = nil
			_AttackCrit_Flat_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_AttackCrit_Flat_DisplayCalls[v] = _AttackCrit_Flat_DisplayCalls[v] + 1
	if _expected_AttackCrit_Flat_DisplayCalls[v] <= _AttackCrit_Flat_DisplayCalls[v] then
		if _expected_AttackCrit_Flat_DescTxtCalls[v] == nil then
			_AttackCrit_Flat_UnitMods[v]	   = nil
		end
		_expected_AttackCrit_Flat_DisplayCalls[v] = nil
		_AttackCrit_Flat_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_AttackCrit_Flat(unit, prev)
	local v = unit.id.value
	if _expected_AttackCrit_Flat_DescTxtCalls[v] == nil then
		_AttackCrit_Flat_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackCrit_Flat_DescTxtCalls[v] == 0 then
		if _AttackCrit_Flat_UnitMods[v]  == nil then
			_AttackCrit_Flat_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_AttackCrit_txtFlat(unit, _AttackCrit_Flat_UnitMods[v])
		result = Id.new('x030tg'..tostring(9000 + eff))
	else
		result = prev
	end
	_AttackCrit_Flat_DescTxtCalls[v] = _AttackCrit_Flat_DescTxtCalls[v] + 1
	if _expected_AttackCrit_Flat_DescTxtCalls[v] <= _AttackCrit_Flat_DescTxtCalls[v] then
		if _expected_AttackCrit_Flat_DisplayCalls[v] == nil then
			_AttackCrit_Flat_UnitMods[v]	   = nil
		end
		_expected_AttackCrit_Flat_DescTxtCalls[v] = nil
		_AttackCrit_Flat_DescTxtCalls[v]          = nil
	end
	return result
end

function _AttackCrit_Flat_modifCustomDescTxt_init(unit, unitIndex)
		if _AttackCrit_Flat_UnitMods[unitIndex]  == nil then
			_AttackCrit_Flat_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_AttackCrit_Flat_DisplayCalls[unitIndex]    = _unitAura_AttackCrit_cntFlat(unit, _AttackCrit_Flat_UnitMods[unitIndex])
		_AttackCrit_Flat_DisplayCalls[unitIndex]             = 0
		_expected_AttackCrit_Flat_DescTxtCalls[unitIndex]    = 1
		_AttackCrit_Flat_DescTxtCalls[unitIndex]             = 0
		return 0
end

_SummonTransform_Flat_UnitMods              = {}
_SummonTransform_Flat_DisplayCalls          = {}
_SummonTransform_Flat_DescTxtCalls          = {}
_expected_SummonTransform_Flat_DisplayCalls = {}
_expected_SummonTransform_Flat_DescTxtCalls = {}

function _modifDisplay_SummonTransform_Flat(unit, prev)
	local v = unit.id.value
	if _expected_SummonTransform_Flat_DisplayCalls[v] == nil then
		_SummonTransform_Flat_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _SummonTransform_Flat_DisplayCalls[v] == 0 then
		if _unitAura_SummonTransform_txtFlat(unit, _SummonTransform_Flat_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_SummonTransform_Flat_UnitMods[v]	   = nil
			_expected_SummonTransform_Flat_DisplayCalls[v] = nil
			_SummonTransform_Flat_DisplayCalls[v]          = nil
			_expected_SummonTransform_Flat_DescTxtCalls[v] = nil
			_SummonTransform_Flat_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_SummonTransform_Flat_DisplayCalls[v] = _SummonTransform_Flat_DisplayCalls[v] + 1
	if _expected_SummonTransform_Flat_DisplayCalls[v] <= _SummonTransform_Flat_DisplayCalls[v] then
		if _expected_SummonTransform_Flat_DescTxtCalls[v] == nil then
			_SummonTransform_Flat_UnitMods[v]	   = nil
		end
		_expected_SummonTransform_Flat_DisplayCalls[v] = nil
		_SummonTransform_Flat_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_SummonTransform_Flat(unit, prev)
	local v = unit.id.value
	if _expected_SummonTransform_Flat_DescTxtCalls[v] == nil then
		_SummonTransform_Flat_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _SummonTransform_Flat_DescTxtCalls[v] == 0 then
		if _SummonTransform_Flat_UnitMods[v]  == nil then
			_SummonTransform_Flat_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_SummonTransform_txtFlat(unit, _SummonTransform_Flat_UnitMods[v])
		result = Id.new('x030tg'..tostring(1500 + eff))
	else
		result = prev
	end
	_SummonTransform_Flat_DescTxtCalls[v] = _SummonTransform_Flat_DescTxtCalls[v] + 1
	if _expected_SummonTransform_Flat_DescTxtCalls[v] <= _SummonTransform_Flat_DescTxtCalls[v] then
		if _expected_SummonTransform_Flat_DisplayCalls[v] == nil then
			_SummonTransform_Flat_UnitMods[v]	   = nil
		end
		_expected_SummonTransform_Flat_DescTxtCalls[v] = nil
		_SummonTransform_Flat_DescTxtCalls[v]          = nil
	end
	return result
end

function _SummonTransform_Flat_modifCustomDescTxt_init(unit, unitIndex)
		if _SummonTransform_Flat_UnitMods[unitIndex]  == nil then
			_SummonTransform_Flat_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_SummonTransform_Flat_DisplayCalls[unitIndex]    = _unitAura_SummonTransform_cntFlat(unit, _SummonTransform_Flat_UnitMods[unitIndex])
		_SummonTransform_Flat_DisplayCalls[unitIndex]             = 0
		_expected_SummonTransform_Flat_DescTxtCalls[unitIndex]    = 1
		_SummonTransform_Flat_DescTxtCalls[unitIndex]             = 0
		return 0
end

_CurseProtection_Covered_UnitMods              = {}
_CurseProtection_Covered_DisplayCalls          = {}
_CurseProtection_Covered_DescTxtCalls          = {}
_expected_CurseProtection_Covered_DisplayCalls = {}
_expected_CurseProtection_Covered_DescTxtCalls = {}

function _modifDisplay_CurseProtection_Covered(unit, prev)
	local v = unit.id.value
	if _expected_CurseProtection_Covered_DisplayCalls[v] == nil then
		_CurseProtection_Covered_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _CurseProtection_Covered_DisplayCalls[v] == 0 then
		if _unitAura_CurseProtection_txtCovered(unit, _CurseProtection_Covered_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_CurseProtection_Covered_UnitMods[v]	   = nil
			_expected_CurseProtection_Covered_DisplayCalls[v] = nil
			_CurseProtection_Covered_DisplayCalls[v]          = nil
			_expected_CurseProtection_Covered_DescTxtCalls[v] = nil
			_CurseProtection_Covered_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_CurseProtection_Covered_DisplayCalls[v] = _CurseProtection_Covered_DisplayCalls[v] + 1
	if _expected_CurseProtection_Covered_DisplayCalls[v] <= _CurseProtection_Covered_DisplayCalls[v] then
		if _expected_CurseProtection_Covered_DescTxtCalls[v] == nil then
			_CurseProtection_Covered_UnitMods[v]	   = nil
		end
		_expected_CurseProtection_Covered_DisplayCalls[v] = nil
		_CurseProtection_Covered_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_CurseProtection_Covered(unit, prev)
	local v = unit.id.value
	if _expected_CurseProtection_Covered_DescTxtCalls[v] == nil then
		_CurseProtection_Covered_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _CurseProtection_Covered_DescTxtCalls[v] == 0 then
		if _CurseProtection_Covered_UnitMods[v]  == nil then
			_CurseProtection_Covered_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_CurseProtection_txtCovered(unit, _CurseProtection_Covered_UnitMods[v])
		result = Id.new('x030tg'..tostring(2500 + eff))
	else
		result = prev
	end
	_CurseProtection_Covered_DescTxtCalls[v] = _CurseProtection_Covered_DescTxtCalls[v] + 1
	if _expected_CurseProtection_Covered_DescTxtCalls[v] <= _CurseProtection_Covered_DescTxtCalls[v] then
		if _expected_CurseProtection_Covered_DisplayCalls[v] == nil then
			_CurseProtection_Covered_UnitMods[v]	   = nil
		end
		_expected_CurseProtection_Covered_DescTxtCalls[v] = nil
		_CurseProtection_Covered_DescTxtCalls[v]          = nil
	end
	return result
end

function _CurseProtection_Covered_modifCustomDescTxt_init(unit, unitIndex)
		if _CurseProtection_Covered_UnitMods[unitIndex]  == nil then
			_CurseProtection_Covered_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_CurseProtection_Covered_DisplayCalls[unitIndex]    = _unitAura_CurseProtection_cntCovered(unit, _CurseProtection_Covered_UnitMods[unitIndex])
		_CurseProtection_Covered_DisplayCalls[unitIndex]             = 0
		_expected_CurseProtection_Covered_DescTxtCalls[unitIndex]    = 1
		_CurseProtection_Covered_DescTxtCalls[unitIndex]             = 0
		return 0
end

_ArmorFlat_Covered_UnitMods              = {}
_ArmorFlat_Covered_DisplayCalls          = {}
_ArmorFlat_Covered_DescTxtCalls          = {}
_expected_ArmorFlat_Covered_DisplayCalls = {}
_expected_ArmorFlat_Covered_DescTxtCalls = {}

function _modifDisplay_ArmorFlat_Covered(unit, prev)
	local v = unit.id.value
	if _expected_ArmorFlat_Covered_DisplayCalls[v] == nil then
		_ArmorFlat_Covered_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _ArmorFlat_Covered_DisplayCalls[v] == 0 then
		if _unitAura_ArmorFlat_txtCovered(unit, _ArmorFlat_Covered_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_ArmorFlat_Covered_UnitMods[v]	   = nil
			_expected_ArmorFlat_Covered_DisplayCalls[v] = nil
			_ArmorFlat_Covered_DisplayCalls[v]          = nil
			_expected_ArmorFlat_Covered_DescTxtCalls[v] = nil
			_ArmorFlat_Covered_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_ArmorFlat_Covered_DisplayCalls[v] = _ArmorFlat_Covered_DisplayCalls[v] + 1
	if _expected_ArmorFlat_Covered_DisplayCalls[v] <= _ArmorFlat_Covered_DisplayCalls[v] then
		if _expected_ArmorFlat_Covered_DescTxtCalls[v] == nil then
			_ArmorFlat_Covered_UnitMods[v]	   = nil
		end
		_expected_ArmorFlat_Covered_DisplayCalls[v] = nil
		_ArmorFlat_Covered_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_ArmorFlat_Covered(unit, prev)
	local v = unit.id.value
	if _expected_ArmorFlat_Covered_DescTxtCalls[v] == nil then
		_ArmorFlat_Covered_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _ArmorFlat_Covered_DescTxtCalls[v] == 0 then
		if _ArmorFlat_Covered_UnitMods[v]  == nil then
			_ArmorFlat_Covered_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_ArmorFlat_txtCovered(unit, _ArmorFlat_Covered_UnitMods[v])
		result = Id.new('x030tg'..tostring(3500 + eff))
	else
		result = prev
	end
	_ArmorFlat_Covered_DescTxtCalls[v] = _ArmorFlat_Covered_DescTxtCalls[v] + 1
	if _expected_ArmorFlat_Covered_DescTxtCalls[v] <= _ArmorFlat_Covered_DescTxtCalls[v] then
		if _expected_ArmorFlat_Covered_DisplayCalls[v] == nil then
			_ArmorFlat_Covered_UnitMods[v]	   = nil
		end
		_expected_ArmorFlat_Covered_DescTxtCalls[v] = nil
		_ArmorFlat_Covered_DescTxtCalls[v]          = nil
	end
	return result
end

function _ArmorFlat_Covered_modifCustomDescTxt_init(unit, unitIndex)
		if _ArmorFlat_Covered_UnitMods[unitIndex]  == nil then
			_ArmorFlat_Covered_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_ArmorFlat_Covered_DisplayCalls[unitIndex]    = _unitAura_ArmorFlat_cntCovered(unit, _ArmorFlat_Covered_UnitMods[unitIndex])
		_ArmorFlat_Covered_DisplayCalls[unitIndex]             = 0
		_expected_ArmorFlat_Covered_DescTxtCalls[unitIndex]    = 1
		_ArmorFlat_Covered_DescTxtCalls[unitIndex]             = 0
		return 0
end

_HitPointOnDeath_Percent_UnitMods              = {}
_HitPointOnDeath_Percent_DisplayCalls          = {}
_HitPointOnDeath_Percent_DescTxtCalls          = {}
_expected_HitPointOnDeath_Percent_DisplayCalls = {}
_expected_HitPointOnDeath_Percent_DescTxtCalls = {}

function _modifDisplay_HitPointOnDeath_Percent(unit, prev)
	local v = unit.id.value
	if _expected_HitPointOnDeath_Percent_DisplayCalls[v] == nil then
		_HitPointOnDeath_Percent_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _HitPointOnDeath_Percent_DisplayCalls[v] == 0 then
		if _unitAura_HitPointOnDeath_txtPercent(unit, _HitPointOnDeath_Percent_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_HitPointOnDeath_Percent_UnitMods[v]	   = nil
			_expected_HitPointOnDeath_Percent_DisplayCalls[v] = nil
			_HitPointOnDeath_Percent_DisplayCalls[v]          = nil
			_expected_HitPointOnDeath_Percent_DescTxtCalls[v] = nil
			_HitPointOnDeath_Percent_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_HitPointOnDeath_Percent_DisplayCalls[v] = _HitPointOnDeath_Percent_DisplayCalls[v] + 1
	if _expected_HitPointOnDeath_Percent_DisplayCalls[v] <= _HitPointOnDeath_Percent_DisplayCalls[v] then
		if _expected_HitPointOnDeath_Percent_DescTxtCalls[v] == nil then
			_HitPointOnDeath_Percent_UnitMods[v]	   = nil
		end
		_expected_HitPointOnDeath_Percent_DisplayCalls[v] = nil
		_HitPointOnDeath_Percent_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_HitPointOnDeath_Percent(unit, prev)
	local v = unit.id.value
	if _expected_HitPointOnDeath_Percent_DescTxtCalls[v] == nil then
		_HitPointOnDeath_Percent_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _HitPointOnDeath_Percent_DescTxtCalls[v] == 0 then
		if _HitPointOnDeath_Percent_UnitMods[v]  == nil then
			_HitPointOnDeath_Percent_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_HitPointOnDeath_txtPercent(unit, _HitPointOnDeath_Percent_UnitMods[v])
		result = Id.new('x030tg'..tostring(4500 + eff))
	else
		result = prev
	end
	_HitPointOnDeath_Percent_DescTxtCalls[v] = _HitPointOnDeath_Percent_DescTxtCalls[v] + 1
	if _expected_HitPointOnDeath_Percent_DescTxtCalls[v] <= _HitPointOnDeath_Percent_DescTxtCalls[v] then
		if _expected_HitPointOnDeath_Percent_DisplayCalls[v] == nil then
			_HitPointOnDeath_Percent_UnitMods[v]	   = nil
		end
		_expected_HitPointOnDeath_Percent_DescTxtCalls[v] = nil
		_HitPointOnDeath_Percent_DescTxtCalls[v]          = nil
	end
	return result
end

function _HitPointOnDeath_Percent_modifCustomDescTxt_init(unit, unitIndex)
		if _HitPointOnDeath_Percent_UnitMods[unitIndex]  == nil then
			_HitPointOnDeath_Percent_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_HitPointOnDeath_Percent_DisplayCalls[unitIndex]    = _unitAura_HitPointOnDeath_cntPercent(unit, _HitPointOnDeath_Percent_UnitMods[unitIndex])
		_HitPointOnDeath_Percent_DisplayCalls[unitIndex]             = 0
		_expected_HitPointOnDeath_Percent_DescTxtCalls[unitIndex]    = 1
		_HitPointOnDeath_Percent_DescTxtCalls[unitIndex]             = 0
		return 0
end

_AttackDrainOnDeath_Percent_UnitMods              = {}
_AttackDrainOnDeath_Percent_DisplayCalls          = {}
_AttackDrainOnDeath_Percent_DescTxtCalls          = {}
_expected_AttackDrainOnDeath_Percent_DisplayCalls = {}
_expected_AttackDrainOnDeath_Percent_DescTxtCalls = {}

function _modifDisplay_AttackDrainOnDeath_Percent(unit, prev)
	local v = unit.id.value
	if _expected_AttackDrainOnDeath_Percent_DisplayCalls[v] == nil then
		_AttackDrainOnDeath_Percent_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackDrainOnDeath_Percent_DisplayCalls[v] == 0 then
		if _unitAura_AttackDrainOnDeath_txtPercent(unit, _AttackDrainOnDeath_Percent_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_AttackDrainOnDeath_Percent_UnitMods[v]	   = nil
			_expected_AttackDrainOnDeath_Percent_DisplayCalls[v] = nil
			_AttackDrainOnDeath_Percent_DisplayCalls[v]          = nil
			_expected_AttackDrainOnDeath_Percent_DescTxtCalls[v] = nil
			_AttackDrainOnDeath_Percent_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_AttackDrainOnDeath_Percent_DisplayCalls[v] = _AttackDrainOnDeath_Percent_DisplayCalls[v] + 1
	if _expected_AttackDrainOnDeath_Percent_DisplayCalls[v] <= _AttackDrainOnDeath_Percent_DisplayCalls[v] then
		if _expected_AttackDrainOnDeath_Percent_DescTxtCalls[v] == nil then
			_AttackDrainOnDeath_Percent_UnitMods[v]	   = nil
		end
		_expected_AttackDrainOnDeath_Percent_DisplayCalls[v] = nil
		_AttackDrainOnDeath_Percent_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_AttackDrainOnDeath_Percent(unit, prev)
	local v = unit.id.value
	if _expected_AttackDrainOnDeath_Percent_DescTxtCalls[v] == nil then
		_AttackDrainOnDeath_Percent_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackDrainOnDeath_Percent_DescTxtCalls[v] == 0 then
		if _AttackDrainOnDeath_Percent_UnitMods[v]  == nil then
			_AttackDrainOnDeath_Percent_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_AttackDrainOnDeath_txtPercent(unit, _AttackDrainOnDeath_Percent_UnitMods[v])
		result = Id.new('x030tg'..tostring(5500 + eff))
	else
		result = prev
	end
	_AttackDrainOnDeath_Percent_DescTxtCalls[v] = _AttackDrainOnDeath_Percent_DescTxtCalls[v] + 1
	if _expected_AttackDrainOnDeath_Percent_DescTxtCalls[v] <= _AttackDrainOnDeath_Percent_DescTxtCalls[v] then
		if _expected_AttackDrainOnDeath_Percent_DisplayCalls[v] == nil then
			_AttackDrainOnDeath_Percent_UnitMods[v]	   = nil
		end
		_expected_AttackDrainOnDeath_Percent_DescTxtCalls[v] = nil
		_AttackDrainOnDeath_Percent_DescTxtCalls[v]          = nil
	end
	return result
end

function _AttackDrainOnDeath_Percent_modifCustomDescTxt_init(unit, unitIndex)
		if _AttackDrainOnDeath_Percent_UnitMods[unitIndex]  == nil then
			_AttackDrainOnDeath_Percent_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_AttackDrainOnDeath_Percent_DisplayCalls[unitIndex]    = _unitAura_AttackDrainOnDeath_cntPercent(unit, _AttackDrainOnDeath_Percent_UnitMods[unitIndex])
		_AttackDrainOnDeath_Percent_DisplayCalls[unitIndex]             = 0
		_expected_AttackDrainOnDeath_Percent_DescTxtCalls[unitIndex]    = 1
		_AttackDrainOnDeath_Percent_DescTxtCalls[unitIndex]             = 0
		return 0
end

_PoisonResist_UnitMods              = {}
_PoisonResist_DisplayCalls          = {}
_PoisonResist_DescTxtCalls          = {}
_expected_PoisonResist_DisplayCalls = {}
_expected_PoisonResist_DescTxtCalls = {}

function _modifDisplay_PoisonResist(unit, prev)
	local v = unit.id.value
	if _expected_PoisonResist_DisplayCalls[v] == nil then
		_PoisonResist_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PoisonResist_DisplayCalls[v] == 0 then
		if _unitAura_PoisonResist_val(unit, _PoisonResist_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_PoisonResist_UnitMods[v]	   = nil
			_expected_PoisonResist_DisplayCalls[v] = nil
			_PoisonResist_DisplayCalls[v]          = nil
			_expected_PoisonResist_DescTxtCalls[v] = nil
			_PoisonResist_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_PoisonResist_DisplayCalls[v] = _PoisonResist_DisplayCalls[v] + 1
	if _expected_PoisonResist_DisplayCalls[v] <= _PoisonResist_DisplayCalls[v] then
		if _expected_PoisonResist_DescTxtCalls[v] == nil then
			_PoisonResist_UnitMods[v]	   = nil
		end
		_expected_PoisonResist_DisplayCalls[v] = nil
		_PoisonResist_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_PoisonResist(unit, prev)
	local v = unit.id.value
	if _expected_PoisonResist_DescTxtCalls[v] == nil then
		_PoisonResist_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PoisonResist_DescTxtCalls[v] == 0 then
		if _PoisonResist_UnitMods[v]  == nil then
			_PoisonResist_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_PoisonResist_val(unit, _PoisonResist_UnitMods[v])
		result = Id.new('x010tg1713')
	else
		result = prev
	end
	_PoisonResist_DescTxtCalls[v] = _PoisonResist_DescTxtCalls[v] + 1
	if _expected_PoisonResist_DescTxtCalls[v] <= _PoisonResist_DescTxtCalls[v] then
		if _expected_PoisonResist_DisplayCalls[v] == nil then
			_PoisonResist_UnitMods[v]	   = nil
		end
		_expected_PoisonResist_DescTxtCalls[v] = nil
		_PoisonResist_DescTxtCalls[v]          = nil
	end
	return result
end

function _PoisonResist_modifCustomDescTxt_init(unit, unitIndex)
		if _PoisonResist_UnitMods[unitIndex]  == nil then
			_PoisonResist_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_PoisonResist_DisplayCalls[unitIndex]    = _unitAura_PoisonResist_cnt(unit, _PoisonResist_UnitMods[unitIndex])
		_PoisonResist_DisplayCalls[unitIndex]             = 0
		_expected_PoisonResist_DescTxtCalls[unitIndex]    = 1
		_PoisonResist_DescTxtCalls[unitIndex]             = 0
		return 0
end

_FrostbiteResist_UnitMods              = {}
_FrostbiteResist_DisplayCalls          = {}
_FrostbiteResist_DescTxtCalls          = {}
_expected_FrostbiteResist_DisplayCalls = {}
_expected_FrostbiteResist_DescTxtCalls = {}

function _modifDisplay_FrostbiteResist(unit, prev)
	local v = unit.id.value
	if _expected_FrostbiteResist_DisplayCalls[v] == nil then
		_FrostbiteResist_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _FrostbiteResist_DisplayCalls[v] == 0 then
		if _unitAura_FrostbiteResist_val(unit, _FrostbiteResist_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_FrostbiteResist_UnitMods[v]	   = nil
			_expected_FrostbiteResist_DisplayCalls[v] = nil
			_FrostbiteResist_DisplayCalls[v]          = nil
			_expected_FrostbiteResist_DescTxtCalls[v] = nil
			_FrostbiteResist_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_FrostbiteResist_DisplayCalls[v] = _FrostbiteResist_DisplayCalls[v] + 1
	if _expected_FrostbiteResist_DisplayCalls[v] <= _FrostbiteResist_DisplayCalls[v] then
		if _expected_FrostbiteResist_DescTxtCalls[v] == nil then
			_FrostbiteResist_UnitMods[v]	   = nil
		end
		_expected_FrostbiteResist_DisplayCalls[v] = nil
		_FrostbiteResist_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_FrostbiteResist(unit, prev)
	local v = unit.id.value
	if _expected_FrostbiteResist_DescTxtCalls[v] == nil then
		_FrostbiteResist_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _FrostbiteResist_DescTxtCalls[v] == 0 then
		if _FrostbiteResist_UnitMods[v]  == nil then
			_FrostbiteResist_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_FrostbiteResist_val(unit, _FrostbiteResist_UnitMods[v])
		result = Id.new('x010tg1712')
	else
		result = prev
	end
	_FrostbiteResist_DescTxtCalls[v] = _FrostbiteResist_DescTxtCalls[v] + 1
	if _expected_FrostbiteResist_DescTxtCalls[v] <= _FrostbiteResist_DescTxtCalls[v] then
		if _expected_FrostbiteResist_DisplayCalls[v] == nil then
			_FrostbiteResist_UnitMods[v]	   = nil
		end
		_expected_FrostbiteResist_DescTxtCalls[v] = nil
		_FrostbiteResist_DescTxtCalls[v]          = nil
	end
	return result
end

function _FrostbiteResist_modifCustomDescTxt_init(unit, unitIndex)
		if _FrostbiteResist_UnitMods[unitIndex]  == nil then
			_FrostbiteResist_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_FrostbiteResist_DisplayCalls[unitIndex]    = _unitAura_FrostbiteResist_cnt(unit, _FrostbiteResist_UnitMods[unitIndex])
		_FrostbiteResist_DisplayCalls[unitIndex]             = 0
		_expected_FrostbiteResist_DescTxtCalls[unitIndex]    = 1
		_FrostbiteResist_DescTxtCalls[unitIndex]             = 0
		return 0
end

_BlisterResist_UnitMods              = {}
_BlisterResist_DisplayCalls          = {}
_BlisterResist_DescTxtCalls          = {}
_expected_BlisterResist_DisplayCalls = {}
_expected_BlisterResist_DescTxtCalls = {}

function _modifDisplay_BlisterResist(unit, prev)
	local v = unit.id.value
	if _expected_BlisterResist_DisplayCalls[v] == nil then
		_BlisterResist_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _BlisterResist_DisplayCalls[v] == 0 then
		if _unitAura_BlisterResist_val(unit, _BlisterResist_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_BlisterResist_UnitMods[v]	   = nil
			_expected_BlisterResist_DisplayCalls[v] = nil
			_BlisterResist_DisplayCalls[v]          = nil
			_expected_BlisterResist_DescTxtCalls[v] = nil
			_BlisterResist_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_BlisterResist_DisplayCalls[v] = _BlisterResist_DisplayCalls[v] + 1
	if _expected_BlisterResist_DisplayCalls[v] <= _BlisterResist_DisplayCalls[v] then
		if _expected_BlisterResist_DescTxtCalls[v] == nil then
			_BlisterResist_UnitMods[v]	   = nil
		end
		_expected_BlisterResist_DisplayCalls[v] = nil
		_BlisterResist_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_BlisterResist(unit, prev)
	local v = unit.id.value
	if _expected_BlisterResist_DescTxtCalls[v] == nil then
		_BlisterResist_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _BlisterResist_DescTxtCalls[v] == 0 then
		if _BlisterResist_UnitMods[v]  == nil then
			_BlisterResist_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_BlisterResist_val(unit, _BlisterResist_UnitMods[v])
		result = Id.new('x010tg1711')
	else
		result = prev
	end
	_BlisterResist_DescTxtCalls[v] = _BlisterResist_DescTxtCalls[v] + 1
	if _expected_BlisterResist_DescTxtCalls[v] <= _BlisterResist_DescTxtCalls[v] then
		if _expected_BlisterResist_DisplayCalls[v] == nil then
			_BlisterResist_UnitMods[v]	   = nil
		end
		_expected_BlisterResist_DescTxtCalls[v] = nil
		_BlisterResist_DescTxtCalls[v]          = nil
	end
	return result
end

function _BlisterResist_modifCustomDescTxt_init(unit, unitIndex)
		if _BlisterResist_UnitMods[unitIndex]  == nil then
			_BlisterResist_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_BlisterResist_DisplayCalls[unitIndex]    = _unitAura_BlisterResist_cnt(unit, _BlisterResist_UnitMods[unitIndex])
		_BlisterResist_DisplayCalls[unitIndex]             = 0
		_expected_BlisterResist_DescTxtCalls[unitIndex]    = 1
		_BlisterResist_DescTxtCalls[unitIndex]             = 0
		return 0
end

_LowerInitiativeResist_UnitMods              = {}
_LowerInitiativeResist_DisplayCalls          = {}
_LowerInitiativeResist_DescTxtCalls          = {}
_expected_LowerInitiativeResist_DisplayCalls = {}
_expected_LowerInitiativeResist_DescTxtCalls = {}

function _modifDisplay_LowerInitiativeResist(unit, prev)
	local v = unit.id.value
	if _expected_LowerInitiativeResist_DisplayCalls[v] == nil then
		_LowerInitiativeResist_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _LowerInitiativeResist_DisplayCalls[v] == 0 then
		if _unitAura_LowerInitiativeResist_val(unit, _LowerInitiativeResist_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_LowerInitiativeResist_UnitMods[v]	   = nil
			_expected_LowerInitiativeResist_DisplayCalls[v] = nil
			_LowerInitiativeResist_DisplayCalls[v]          = nil
			_expected_LowerInitiativeResist_DescTxtCalls[v] = nil
			_LowerInitiativeResist_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_LowerInitiativeResist_DisplayCalls[v] = _LowerInitiativeResist_DisplayCalls[v] + 1
	if _expected_LowerInitiativeResist_DisplayCalls[v] <= _LowerInitiativeResist_DisplayCalls[v] then
		if _expected_LowerInitiativeResist_DescTxtCalls[v] == nil then
			_LowerInitiativeResist_UnitMods[v]	   = nil
		end
		_expected_LowerInitiativeResist_DisplayCalls[v] = nil
		_LowerInitiativeResist_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_LowerInitiativeResist(unit, prev)
	local v = unit.id.value
	if _expected_LowerInitiativeResist_DescTxtCalls[v] == nil then
		_LowerInitiativeResist_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _LowerInitiativeResist_DescTxtCalls[v] == 0 then
		if _LowerInitiativeResist_UnitMods[v]  == nil then
			_LowerInitiativeResist_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_LowerInitiativeResist_val(unit, _LowerInitiativeResist_UnitMods[v])
		result = Id.new('x010tg1714')
	else
		result = prev
	end
	_LowerInitiativeResist_DescTxtCalls[v] = _LowerInitiativeResist_DescTxtCalls[v] + 1
	if _expected_LowerInitiativeResist_DescTxtCalls[v] <= _LowerInitiativeResist_DescTxtCalls[v] then
		if _expected_LowerInitiativeResist_DisplayCalls[v] == nil then
			_LowerInitiativeResist_UnitMods[v]	   = nil
		end
		_expected_LowerInitiativeResist_DescTxtCalls[v] = nil
		_LowerInitiativeResist_DescTxtCalls[v]          = nil
	end
	return result
end

function _LowerInitiativeResist_modifCustomDescTxt_init(unit, unitIndex)
		if _LowerInitiativeResist_UnitMods[unitIndex]  == nil then
			_LowerInitiativeResist_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_LowerInitiativeResist_DisplayCalls[unitIndex]    = _unitAura_LowerInitiativeResist_cnt(unit, _LowerInitiativeResist_UnitMods[unitIndex])
		_LowerInitiativeResist_DisplayCalls[unitIndex]             = 0
		_expected_LowerInitiativeResist_DescTxtCalls[unitIndex]    = 1
		_LowerInitiativeResist_DescTxtCalls[unitIndex]             = 0
		return 0
end

_LowerDamageResist_UnitMods              = {}
_LowerDamageResist_DisplayCalls          = {}
_LowerDamageResist_DescTxtCalls          = {}
_expected_LowerDamageResist_DisplayCalls = {}
_expected_LowerDamageResist_DescTxtCalls = {}

function _modifDisplay_LowerDamageResist(unit, prev)
	local v = unit.id.value
	if _expected_LowerDamageResist_DisplayCalls[v] == nil then
		_LowerDamageResist_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _LowerDamageResist_DisplayCalls[v] == 0 then
		if _unitAura_LowerDamageResist_val(unit, _LowerDamageResist_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_LowerDamageResist_UnitMods[v]	   = nil
			_expected_LowerDamageResist_DisplayCalls[v] = nil
			_LowerDamageResist_DisplayCalls[v]          = nil
			_expected_LowerDamageResist_DescTxtCalls[v] = nil
			_LowerDamageResist_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_LowerDamageResist_DisplayCalls[v] = _LowerDamageResist_DisplayCalls[v] + 1
	if _expected_LowerDamageResist_DisplayCalls[v] <= _LowerDamageResist_DisplayCalls[v] then
		if _expected_LowerDamageResist_DescTxtCalls[v] == nil then
			_LowerDamageResist_UnitMods[v]	   = nil
		end
		_expected_LowerDamageResist_DisplayCalls[v] = nil
		_LowerDamageResist_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_LowerDamageResist(unit, prev)
	local v = unit.id.value
	if _expected_LowerDamageResist_DescTxtCalls[v] == nil then
		_LowerDamageResist_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _LowerDamageResist_DescTxtCalls[v] == 0 then
		if _LowerDamageResist_UnitMods[v]  == nil then
			_LowerDamageResist_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_LowerDamageResist_val(unit, _LowerDamageResist_UnitMods[v])
		result = Id.new('x010tg1715')
	else
		result = prev
	end
	_LowerDamageResist_DescTxtCalls[v] = _LowerDamageResist_DescTxtCalls[v] + 1
	if _expected_LowerDamageResist_DescTxtCalls[v] <= _LowerDamageResist_DescTxtCalls[v] then
		if _expected_LowerDamageResist_DisplayCalls[v] == nil then
			_LowerDamageResist_UnitMods[v]	   = nil
		end
		_expected_LowerDamageResist_DescTxtCalls[v] = nil
		_LowerDamageResist_DescTxtCalls[v]          = nil
	end
	return result
end

function _LowerDamageResist_modifCustomDescTxt_init(unit, unitIndex)
		if _LowerDamageResist_UnitMods[unitIndex]  == nil then
			_LowerDamageResist_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_LowerDamageResist_DisplayCalls[unitIndex]    = _unitAura_LowerDamageResist_cnt(unit, _LowerDamageResist_UnitMods[unitIndex])
		_LowerDamageResist_DisplayCalls[unitIndex]             = 0
		_expected_LowerDamageResist_DescTxtCalls[unitIndex]    = 1
		_LowerDamageResist_DescTxtCalls[unitIndex]             = 0
		return 0
end

_PerLostHP_Armor_UnitMods              = {}
_PerLostHP_Armor_DisplayCalls          = {}
_PerLostHP_Armor_DescTxtCalls          = {}
_expected_PerLostHP_Armor_DisplayCalls = {}
_expected_PerLostHP_Armor_DescTxtCalls = {}

function _modifDisplay_PerLostHP_Armor(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_Armor_DisplayCalls[v] == nil then
		_PerLostHP_Armor_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_Armor_DisplayCalls[v] == 0 then
		if _unitAura_PerLostHP_Armor_val(unit, _PerLostHP_Armor_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_PerLostHP_Armor_UnitMods[v]	   = nil
			_expected_PerLostHP_Armor_DisplayCalls[v] = nil
			_PerLostHP_Armor_DisplayCalls[v]          = nil
			_expected_PerLostHP_Armor_DescTxtCalls[v] = nil
			_PerLostHP_Armor_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_PerLostHP_Armor_DisplayCalls[v] = _PerLostHP_Armor_DisplayCalls[v] + 1
	if _expected_PerLostHP_Armor_DisplayCalls[v] <= _PerLostHP_Armor_DisplayCalls[v] then
		if _expected_PerLostHP_Armor_DescTxtCalls[v] == nil then
			_PerLostHP_Armor_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_Armor_DisplayCalls[v] = nil
		_PerLostHP_Armor_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_PerLostHP_Armor(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_Armor_DescTxtCalls[v] == nil then
		_PerLostHP_Armor_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_Armor_DescTxtCalls[v] == 0 then
		if _PerLostHP_Armor_UnitMods[v]  == nil then
			_PerLostHP_Armor_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_PerLostHP_Armor_val(unit, _PerLostHP_Armor_UnitMods[v])
		result = Id.new('x020tg'..tostring(1000 + eff))
	else
		result = prev
	end
	_PerLostHP_Armor_DescTxtCalls[v] = _PerLostHP_Armor_DescTxtCalls[v] + 1
	if _expected_PerLostHP_Armor_DescTxtCalls[v] <= _PerLostHP_Armor_DescTxtCalls[v] then
		if _expected_PerLostHP_Armor_DisplayCalls[v] == nil then
			_PerLostHP_Armor_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_Armor_DescTxtCalls[v] = nil
		_PerLostHP_Armor_DescTxtCalls[v]          = nil
	end
	return result
end

function _PerLostHP_Armor_modifCustomDescTxt_init(unit, unitIndex)
		if _PerLostHP_Armor_UnitMods[unitIndex]  == nil then
			_PerLostHP_Armor_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_PerLostHP_Armor_DisplayCalls[unitIndex]    = _unitAura_PerLostHP_Armor_cnt(unit, _PerLostHP_Armor_UnitMods[unitIndex])
		_PerLostHP_Armor_DisplayCalls[unitIndex]             = 0
		_expected_PerLostHP_Armor_DescTxtCalls[unitIndex]    = 1
		_PerLostHP_Armor_DescTxtCalls[unitIndex]             = 0
		return 0
end

_PerLostHP_AttackInitiative_UnitMods              = {}
_PerLostHP_AttackInitiative_DisplayCalls          = {}
_PerLostHP_AttackInitiative_DescTxtCalls          = {}
_expected_PerLostHP_AttackInitiative_DisplayCalls = {}
_expected_PerLostHP_AttackInitiative_DescTxtCalls = {}

function _modifDisplay_PerLostHP_AttackInitiative(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_AttackInitiative_DisplayCalls[v] == nil then
		_PerLostHP_AttackInitiative_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_AttackInitiative_DisplayCalls[v] == 0 then
		if _unitAura_PerLostHP_AttackInitiative_val(unit, _PerLostHP_AttackInitiative_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_PerLostHP_AttackInitiative_UnitMods[v]	   = nil
			_expected_PerLostHP_AttackInitiative_DisplayCalls[v] = nil
			_PerLostHP_AttackInitiative_DisplayCalls[v]          = nil
			_expected_PerLostHP_AttackInitiative_DescTxtCalls[v] = nil
			_PerLostHP_AttackInitiative_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_PerLostHP_AttackInitiative_DisplayCalls[v] = _PerLostHP_AttackInitiative_DisplayCalls[v] + 1
	if _expected_PerLostHP_AttackInitiative_DisplayCalls[v] <= _PerLostHP_AttackInitiative_DisplayCalls[v] then
		if _expected_PerLostHP_AttackInitiative_DescTxtCalls[v] == nil then
			_PerLostHP_AttackInitiative_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_AttackInitiative_DisplayCalls[v] = nil
		_PerLostHP_AttackInitiative_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_PerLostHP_AttackInitiative(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_AttackInitiative_DescTxtCalls[v] == nil then
		_PerLostHP_AttackInitiative_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_AttackInitiative_DescTxtCalls[v] == 0 then
		if _PerLostHP_AttackInitiative_UnitMods[v]  == nil then
			_PerLostHP_AttackInitiative_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_PerLostHP_AttackInitiative_val(unit, _PerLostHP_AttackInitiative_UnitMods[v])
		result = Id.new('x020tg'..tostring(2000 + eff))
	else
		result = prev
	end
	_PerLostHP_AttackInitiative_DescTxtCalls[v] = _PerLostHP_AttackInitiative_DescTxtCalls[v] + 1
	if _expected_PerLostHP_AttackInitiative_DescTxtCalls[v] <= _PerLostHP_AttackInitiative_DescTxtCalls[v] then
		if _expected_PerLostHP_AttackInitiative_DisplayCalls[v] == nil then
			_PerLostHP_AttackInitiative_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_AttackInitiative_DescTxtCalls[v] = nil
		_PerLostHP_AttackInitiative_DescTxtCalls[v]          = nil
	end
	return result
end

function _PerLostHP_AttackInitiative_modifCustomDescTxt_init(unit, unitIndex)
		if _PerLostHP_AttackInitiative_UnitMods[unitIndex]  == nil then
			_PerLostHP_AttackInitiative_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_PerLostHP_AttackInitiative_DisplayCalls[unitIndex]    = _unitAura_PerLostHP_AttackInitiative_cnt(unit, _PerLostHP_AttackInitiative_UnitMods[unitIndex])
		_PerLostHP_AttackInitiative_DisplayCalls[unitIndex]             = 0
		_expected_PerLostHP_AttackInitiative_DescTxtCalls[unitIndex]    = 1
		_PerLostHP_AttackInitiative_DescTxtCalls[unitIndex]             = 0
		return 0
end

_PerLostHP_AttackDamageHeal_UnitMods              = {}
_PerLostHP_AttackDamageHeal_DisplayCalls          = {}
_PerLostHP_AttackDamageHeal_DescTxtCalls          = {}
_expected_PerLostHP_AttackDamageHeal_DisplayCalls = {}
_expected_PerLostHP_AttackDamageHeal_DescTxtCalls = {}

function _modifDisplay_PerLostHP_AttackDamageHeal(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_AttackDamageHeal_DisplayCalls[v] == nil then
		_PerLostHP_AttackDamageHeal_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_AttackDamageHeal_DisplayCalls[v] == 0 then
		if _unitAura_PerLostHP_AttackDamageHeal_val(unit, _PerLostHP_AttackDamageHeal_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_PerLostHP_AttackDamageHeal_UnitMods[v]	   = nil
			_expected_PerLostHP_AttackDamageHeal_DisplayCalls[v] = nil
			_PerLostHP_AttackDamageHeal_DisplayCalls[v]          = nil
			_expected_PerLostHP_AttackDamageHeal_DescTxtCalls[v] = nil
			_PerLostHP_AttackDamageHeal_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_PerLostHP_AttackDamageHeal_DisplayCalls[v] = _PerLostHP_AttackDamageHeal_DisplayCalls[v] + 1
	if _expected_PerLostHP_AttackDamageHeal_DisplayCalls[v] <= _PerLostHP_AttackDamageHeal_DisplayCalls[v] then
		if _expected_PerLostHP_AttackDamageHeal_DescTxtCalls[v] == nil then
			_PerLostHP_AttackDamageHeal_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_AttackDamageHeal_DisplayCalls[v] = nil
		_PerLostHP_AttackDamageHeal_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_PerLostHP_AttackDamageHeal(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_AttackDamageHeal_DescTxtCalls[v] == nil then
		_PerLostHP_AttackDamageHeal_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_AttackDamageHeal_DescTxtCalls[v] == 0 then
		if _PerLostHP_AttackDamageHeal_UnitMods[v]  == nil then
			_PerLostHP_AttackDamageHeal_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_PerLostHP_AttackDamageHeal_val(unit, _PerLostHP_AttackDamageHeal_UnitMods[v])
		result = Id.new('x020tg'..tostring(3000 + eff))
	else
		result = prev
	end
	_PerLostHP_AttackDamageHeal_DescTxtCalls[v] = _PerLostHP_AttackDamageHeal_DescTxtCalls[v] + 1
	if _expected_PerLostHP_AttackDamageHeal_DescTxtCalls[v] <= _PerLostHP_AttackDamageHeal_DescTxtCalls[v] then
		if _expected_PerLostHP_AttackDamageHeal_DisplayCalls[v] == nil then
			_PerLostHP_AttackDamageHeal_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_AttackDamageHeal_DescTxtCalls[v] = nil
		_PerLostHP_AttackDamageHeal_DescTxtCalls[v]          = nil
	end
	return result
end

function _PerLostHP_AttackDamageHeal_modifCustomDescTxt_init(unit, unitIndex)
		if _PerLostHP_AttackDamageHeal_UnitMods[unitIndex]  == nil then
			_PerLostHP_AttackDamageHeal_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_PerLostHP_AttackDamageHeal_DisplayCalls[unitIndex]    = _unitAura_PerLostHP_AttackDamageHeal_cnt(unit, _PerLostHP_AttackDamageHeal_UnitMods[unitIndex])
		_PerLostHP_AttackDamageHeal_DisplayCalls[unitIndex]             = 0
		_expected_PerLostHP_AttackDamageHeal_DescTxtCalls[unitIndex]    = 1
		_PerLostHP_AttackDamageHeal_DescTxtCalls[unitIndex]             = 0
		return 0
end

_PerLostHP_AttackPower_UnitMods              = {}
_PerLostHP_AttackPower_DisplayCalls          = {}
_PerLostHP_AttackPower_DescTxtCalls          = {}
_expected_PerLostHP_AttackPower_DisplayCalls = {}
_expected_PerLostHP_AttackPower_DescTxtCalls = {}

function _modifDisplay_PerLostHP_AttackPower(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_AttackPower_DisplayCalls[v] == nil then
		_PerLostHP_AttackPower_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_AttackPower_DisplayCalls[v] == 0 then
		if _unitAura_PerLostHP_AttackPower_val(unit, _PerLostHP_AttackPower_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_PerLostHP_AttackPower_UnitMods[v]	   = nil
			_expected_PerLostHP_AttackPower_DisplayCalls[v] = nil
			_PerLostHP_AttackPower_DisplayCalls[v]          = nil
			_expected_PerLostHP_AttackPower_DescTxtCalls[v] = nil
			_PerLostHP_AttackPower_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_PerLostHP_AttackPower_DisplayCalls[v] = _PerLostHP_AttackPower_DisplayCalls[v] + 1
	if _expected_PerLostHP_AttackPower_DisplayCalls[v] <= _PerLostHP_AttackPower_DisplayCalls[v] then
		if _expected_PerLostHP_AttackPower_DescTxtCalls[v] == nil then
			_PerLostHP_AttackPower_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_AttackPower_DisplayCalls[v] = nil
		_PerLostHP_AttackPower_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_PerLostHP_AttackPower(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_AttackPower_DescTxtCalls[v] == nil then
		_PerLostHP_AttackPower_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_AttackPower_DescTxtCalls[v] == 0 then
		if _PerLostHP_AttackPower_UnitMods[v]  == nil then
			_PerLostHP_AttackPower_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_PerLostHP_AttackPower_val(unit, _PerLostHP_AttackPower_UnitMods[v])
		result = Id.new('x020tg'..tostring(4000 + eff))
	else
		result = prev
	end
	_PerLostHP_AttackPower_DescTxtCalls[v] = _PerLostHP_AttackPower_DescTxtCalls[v] + 1
	if _expected_PerLostHP_AttackPower_DescTxtCalls[v] <= _PerLostHP_AttackPower_DescTxtCalls[v] then
		if _expected_PerLostHP_AttackPower_DisplayCalls[v] == nil then
			_PerLostHP_AttackPower_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_AttackPower_DescTxtCalls[v] = nil
		_PerLostHP_AttackPower_DescTxtCalls[v]          = nil
	end
	return result
end

function _PerLostHP_AttackPower_modifCustomDescTxt_init(unit, unitIndex)
		if _PerLostHP_AttackPower_UnitMods[unitIndex]  == nil then
			_PerLostHP_AttackPower_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_PerLostHP_AttackPower_DisplayCalls[unitIndex]    = _unitAura_PerLostHP_AttackPower_cnt(unit, _PerLostHP_AttackPower_UnitMods[unitIndex])
		_PerLostHP_AttackPower_DisplayCalls[unitIndex]             = 0
		_expected_PerLostHP_AttackPower_DescTxtCalls[unitIndex]    = 1
		_PerLostHP_AttackPower_DescTxtCalls[unitIndex]             = 0
		return 0
end

_PerLostHP_AttackDrain_UnitMods              = {}
_PerLostHP_AttackDrain_DisplayCalls          = {}
_PerLostHP_AttackDrain_DescTxtCalls          = {}
_expected_PerLostHP_AttackDrain_DisplayCalls = {}
_expected_PerLostHP_AttackDrain_DescTxtCalls = {}

function _modifDisplay_PerLostHP_AttackDrain(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_AttackDrain_DisplayCalls[v] == nil then
		_PerLostHP_AttackDrain_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_AttackDrain_DisplayCalls[v] == 0 then
		if _unitAura_PerLostHP_AttackDrain_val(unit, _PerLostHP_AttackDrain_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_PerLostHP_AttackDrain_UnitMods[v]	   = nil
			_expected_PerLostHP_AttackDrain_DisplayCalls[v] = nil
			_PerLostHP_AttackDrain_DisplayCalls[v]          = nil
			_expected_PerLostHP_AttackDrain_DescTxtCalls[v] = nil
			_PerLostHP_AttackDrain_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_PerLostHP_AttackDrain_DisplayCalls[v] = _PerLostHP_AttackDrain_DisplayCalls[v] + 1
	if _expected_PerLostHP_AttackDrain_DisplayCalls[v] <= _PerLostHP_AttackDrain_DisplayCalls[v] then
		if _expected_PerLostHP_AttackDrain_DescTxtCalls[v] == nil then
			_PerLostHP_AttackDrain_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_AttackDrain_DisplayCalls[v] = nil
		_PerLostHP_AttackDrain_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_PerLostHP_AttackDrain(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_AttackDrain_DescTxtCalls[v] == nil then
		_PerLostHP_AttackDrain_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_AttackDrain_DescTxtCalls[v] == 0 then
		if _PerLostHP_AttackDrain_UnitMods[v]  == nil then
			_PerLostHP_AttackDrain_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_PerLostHP_AttackDrain_val(unit, _PerLostHP_AttackDrain_UnitMods[v])
		result = Id.new('x020tg'..tostring(5000 + eff))
	else
		result = prev
	end
	_PerLostHP_AttackDrain_DescTxtCalls[v] = _PerLostHP_AttackDrain_DescTxtCalls[v] + 1
	if _expected_PerLostHP_AttackDrain_DescTxtCalls[v] <= _PerLostHP_AttackDrain_DescTxtCalls[v] then
		if _expected_PerLostHP_AttackDrain_DisplayCalls[v] == nil then
			_PerLostHP_AttackDrain_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_AttackDrain_DescTxtCalls[v] = nil
		_PerLostHP_AttackDrain_DescTxtCalls[v]          = nil
	end
	return result
end

function _PerLostHP_AttackDrain_modifCustomDescTxt_init(unit, unitIndex)
		if _PerLostHP_AttackDrain_UnitMods[unitIndex]  == nil then
			_PerLostHP_AttackDrain_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_PerLostHP_AttackDrain_DisplayCalls[unitIndex]    = _unitAura_PerLostHP_AttackDrain_cnt(unit, _PerLostHP_AttackDrain_UnitMods[unitIndex])
		_PerLostHP_AttackDrain_DisplayCalls[unitIndex]             = 0
		_expected_PerLostHP_AttackDrain_DescTxtCalls[unitIndex]    = 1
		_PerLostHP_AttackDrain_DescTxtCalls[unitIndex]             = 0
		return 0
end

_PerLostHP_AttackCrit_UnitMods              = {}
_PerLostHP_AttackCrit_DisplayCalls          = {}
_PerLostHP_AttackCrit_DescTxtCalls          = {}
_expected_PerLostHP_AttackCrit_DisplayCalls = {}
_expected_PerLostHP_AttackCrit_DescTxtCalls = {}

function _modifDisplay_PerLostHP_AttackCrit(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_AttackCrit_DisplayCalls[v] == nil then
		_PerLostHP_AttackCrit_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_AttackCrit_DisplayCalls[v] == 0 then
		if _unitAura_PerLostHP_AttackCrit_val(unit, _PerLostHP_AttackCrit_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_PerLostHP_AttackCrit_UnitMods[v]	   = nil
			_expected_PerLostHP_AttackCrit_DisplayCalls[v] = nil
			_PerLostHP_AttackCrit_DisplayCalls[v]          = nil
			_expected_PerLostHP_AttackCrit_DescTxtCalls[v] = nil
			_PerLostHP_AttackCrit_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_PerLostHP_AttackCrit_DisplayCalls[v] = _PerLostHP_AttackCrit_DisplayCalls[v] + 1
	if _expected_PerLostHP_AttackCrit_DisplayCalls[v] <= _PerLostHP_AttackCrit_DisplayCalls[v] then
		if _expected_PerLostHP_AttackCrit_DescTxtCalls[v] == nil then
			_PerLostHP_AttackCrit_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_AttackCrit_DisplayCalls[v] = nil
		_PerLostHP_AttackCrit_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_PerLostHP_AttackCrit(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_AttackCrit_DescTxtCalls[v] == nil then
		_PerLostHP_AttackCrit_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_AttackCrit_DescTxtCalls[v] == 0 then
		if _PerLostHP_AttackCrit_UnitMods[v]  == nil then
			_PerLostHP_AttackCrit_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_PerLostHP_AttackCrit_val(unit, _PerLostHP_AttackCrit_UnitMods[v])
		result = Id.new('x020tg'..tostring(6000 + eff))
	else
		result = prev
	end
	_PerLostHP_AttackCrit_DescTxtCalls[v] = _PerLostHP_AttackCrit_DescTxtCalls[v] + 1
	if _expected_PerLostHP_AttackCrit_DescTxtCalls[v] <= _PerLostHP_AttackCrit_DescTxtCalls[v] then
		if _expected_PerLostHP_AttackCrit_DisplayCalls[v] == nil then
			_PerLostHP_AttackCrit_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_AttackCrit_DescTxtCalls[v] = nil
		_PerLostHP_AttackCrit_DescTxtCalls[v]          = nil
	end
	return result
end

function _PerLostHP_AttackCrit_modifCustomDescTxt_init(unit, unitIndex)
		if _PerLostHP_AttackCrit_UnitMods[unitIndex]  == nil then
			_PerLostHP_AttackCrit_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_PerLostHP_AttackCrit_DisplayCalls[unitIndex]    = _unitAura_PerLostHP_AttackCrit_cnt(unit, _PerLostHP_AttackCrit_UnitMods[unitIndex])
		_PerLostHP_AttackCrit_DisplayCalls[unitIndex]             = 0
		_expected_PerLostHP_AttackCrit_DescTxtCalls[unitIndex]    = 1
		_PerLostHP_AttackCrit_DescTxtCalls[unitIndex]             = 0
		return 0
end

_PerLostHP_DoubleAttack_UnitMods              = {}
_PerLostHP_DoubleAttack_DisplayCalls          = {}
_PerLostHP_DoubleAttack_DescTxtCalls          = {}
_expected_PerLostHP_DoubleAttack_DisplayCalls = {}
_expected_PerLostHP_DoubleAttack_DescTxtCalls = {}

function _modifDisplay_PerLostHP_DoubleAttack(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_DoubleAttack_DisplayCalls[v] == nil then
		_PerLostHP_DoubleAttack_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_DoubleAttack_DisplayCalls[v] == 0 then
		if _unitAura_PerLostHP_DoubleAttack_val(unit, _PerLostHP_DoubleAttack_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_PerLostHP_DoubleAttack_UnitMods[v]	   = nil
			_expected_PerLostHP_DoubleAttack_DisplayCalls[v] = nil
			_PerLostHP_DoubleAttack_DisplayCalls[v]          = nil
			_expected_PerLostHP_DoubleAttack_DescTxtCalls[v] = nil
			_PerLostHP_DoubleAttack_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_PerLostHP_DoubleAttack_DisplayCalls[v] = _PerLostHP_DoubleAttack_DisplayCalls[v] + 1
	if _expected_PerLostHP_DoubleAttack_DisplayCalls[v] <= _PerLostHP_DoubleAttack_DisplayCalls[v] then
		if _expected_PerLostHP_DoubleAttack_DescTxtCalls[v] == nil then
			_PerLostHP_DoubleAttack_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_DoubleAttack_DisplayCalls[v] = nil
		_PerLostHP_DoubleAttack_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_PerLostHP_DoubleAttack(unit, prev)
	local v = unit.id.value
	if _expected_PerLostHP_DoubleAttack_DescTxtCalls[v] == nil then
		_PerLostHP_DoubleAttack_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _PerLostHP_DoubleAttack_DescTxtCalls[v] == 0 then
		if _PerLostHP_DoubleAttack_UnitMods[v]  == nil then
			_PerLostHP_DoubleAttack_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_PerLostHP_DoubleAttack_val(unit, _PerLostHP_DoubleAttack_UnitMods[v])
		result = Id.new('x020tg'..tostring(7000 + eff))
	else
		result = prev
	end
	_PerLostHP_DoubleAttack_DescTxtCalls[v] = _PerLostHP_DoubleAttack_DescTxtCalls[v] + 1
	if _expected_PerLostHP_DoubleAttack_DescTxtCalls[v] <= _PerLostHP_DoubleAttack_DescTxtCalls[v] then
		if _expected_PerLostHP_DoubleAttack_DisplayCalls[v] == nil then
			_PerLostHP_DoubleAttack_UnitMods[v]	   = nil
		end
		_expected_PerLostHP_DoubleAttack_DescTxtCalls[v] = nil
		_PerLostHP_DoubleAttack_DescTxtCalls[v]          = nil
	end
	return result
end

function _PerLostHP_DoubleAttack_modifCustomDescTxt_init(unit, unitIndex)
		if _PerLostHP_DoubleAttack_UnitMods[unitIndex]  == nil then
			_PerLostHP_DoubleAttack_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_PerLostHP_DoubleAttack_DisplayCalls[unitIndex]    = _unitAura_PerLostHP_DoubleAttack_cnt(unit, _PerLostHP_DoubleAttack_UnitMods[unitIndex])
		_PerLostHP_DoubleAttack_DisplayCalls[unitIndex]             = 0
		_expected_PerLostHP_DoubleAttack_DescTxtCalls[unitIndex]    = 1
		_PerLostHP_DoubleAttack_DescTxtCalls[unitIndex]             = 0
		return 0
end

_AttackDamageInitiativeOnFullLife_UnitMods              = {}
_AttackDamageInitiativeOnFullLife_DisplayCalls          = {}
_AttackDamageInitiativeOnFullLife_DescTxtCalls          = {}
_expected_AttackDamageInitiativeOnFullLife_DisplayCalls = {}
_expected_AttackDamageInitiativeOnFullLife_DescTxtCalls = {}

function _modifDisplay_AttackDamageInitiativeOnFullLife(unit, prev)
	local v = unit.id.value
	if _expected_AttackDamageInitiativeOnFullLife_DisplayCalls[v] == nil then
		_AttackDamageInitiativeOnFullLife_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackDamageInitiativeOnFullLife_DisplayCalls[v] == 0 then
		if _unitAura_AttackDamageInitiativeOnFullLife_val(unit, _AttackDamageInitiativeOnFullLife_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_AttackDamageInitiativeOnFullLife_UnitMods[v]	   = nil
			_expected_AttackDamageInitiativeOnFullLife_DisplayCalls[v] = nil
			_AttackDamageInitiativeOnFullLife_DisplayCalls[v]          = nil
			_expected_AttackDamageInitiativeOnFullLife_DescTxtCalls[v] = nil
			_AttackDamageInitiativeOnFullLife_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_AttackDamageInitiativeOnFullLife_DisplayCalls[v] = _AttackDamageInitiativeOnFullLife_DisplayCalls[v] + 1
	if _expected_AttackDamageInitiativeOnFullLife_DisplayCalls[v] <= _AttackDamageInitiativeOnFullLife_DisplayCalls[v] then
		if _expected_AttackDamageInitiativeOnFullLife_DescTxtCalls[v] == nil then
			_AttackDamageInitiativeOnFullLife_UnitMods[v]	   = nil
		end
		_expected_AttackDamageInitiativeOnFullLife_DisplayCalls[v] = nil
		_AttackDamageInitiativeOnFullLife_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_AttackDamageInitiativeOnFullLife(unit, prev)
	local v = unit.id.value
	if _expected_AttackDamageInitiativeOnFullLife_DescTxtCalls[v] == nil then
		_AttackDamageInitiativeOnFullLife_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackDamageInitiativeOnFullLife_DescTxtCalls[v] == 0 then
		if _AttackDamageInitiativeOnFullLife_UnitMods[v]  == nil then
			_AttackDamageInitiativeOnFullLife_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_AttackDamageInitiativeOnFullLife_val(unit, _AttackDamageInitiativeOnFullLife_UnitMods[v])
		result = Id.new('x020tg'..tostring(8000 + eff))
	else
		result = prev
	end
	_AttackDamageInitiativeOnFullLife_DescTxtCalls[v] = _AttackDamageInitiativeOnFullLife_DescTxtCalls[v] + 1
	if _expected_AttackDamageInitiativeOnFullLife_DescTxtCalls[v] <= _AttackDamageInitiativeOnFullLife_DescTxtCalls[v] then
		if _expected_AttackDamageInitiativeOnFullLife_DisplayCalls[v] == nil then
			_AttackDamageInitiativeOnFullLife_UnitMods[v]	   = nil
		end
		_expected_AttackDamageInitiativeOnFullLife_DescTxtCalls[v] = nil
		_AttackDamageInitiativeOnFullLife_DescTxtCalls[v]          = nil
	end
	return result
end

function _AttackDamageInitiativeOnFullLife_modifCustomDescTxt_init(unit, unitIndex)
		if _AttackDamageInitiativeOnFullLife_UnitMods[unitIndex]  == nil then
			_AttackDamageInitiativeOnFullLife_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_AttackDamageInitiativeOnFullLife_DisplayCalls[unitIndex]    = _unitAura_AttackDamageInitiativeOnFullLife_cnt(unit, _AttackDamageInitiativeOnFullLife_UnitMods[unitIndex])
		_AttackDamageInitiativeOnFullLife_DisplayCalls[unitIndex]             = 0
		_expected_AttackDamageInitiativeOnFullLife_DescTxtCalls[unitIndex]    = 1
		_AttackDamageInitiativeOnFullLife_DescTxtCalls[unitIndex]             = 0
		return 0
end

_AttackLessPowerOnFullLife_UnitMods              = {}
_AttackLessPowerOnFullLife_DisplayCalls          = {}
_AttackLessPowerOnFullLife_DescTxtCalls          = {}
_expected_AttackLessPowerOnFullLife_DisplayCalls = {}
_expected_AttackLessPowerOnFullLife_DescTxtCalls = {}

function _modifDisplay_AttackLessPowerOnFullLife(unit, prev)
	local v = unit.id.value
	if _expected_AttackLessPowerOnFullLife_DisplayCalls[v] == nil then
		_AttackLessPowerOnFullLife_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackLessPowerOnFullLife_DisplayCalls[v] == 0 then
		if _unitAura_AttackLessPowerOnFullLife_val(unit, _AttackLessPowerOnFullLife_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_AttackLessPowerOnFullLife_UnitMods[v]	   = nil
			_expected_AttackLessPowerOnFullLife_DisplayCalls[v] = nil
			_AttackLessPowerOnFullLife_DisplayCalls[v]          = nil
			_expected_AttackLessPowerOnFullLife_DescTxtCalls[v] = nil
			_AttackLessPowerOnFullLife_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_AttackLessPowerOnFullLife_DisplayCalls[v] = _AttackLessPowerOnFullLife_DisplayCalls[v] + 1
	if _expected_AttackLessPowerOnFullLife_DisplayCalls[v] <= _AttackLessPowerOnFullLife_DisplayCalls[v] then
		if _expected_AttackLessPowerOnFullLife_DescTxtCalls[v] == nil then
			_AttackLessPowerOnFullLife_UnitMods[v]	   = nil
		end
		_expected_AttackLessPowerOnFullLife_DisplayCalls[v] = nil
		_AttackLessPowerOnFullLife_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_AttackLessPowerOnFullLife(unit, prev)
	local v = unit.id.value
	if _expected_AttackLessPowerOnFullLife_DescTxtCalls[v] == nil then
		_AttackLessPowerOnFullLife_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackLessPowerOnFullLife_DescTxtCalls[v] == 0 then
		if _AttackLessPowerOnFullLife_UnitMods[v]  == nil then
			_AttackLessPowerOnFullLife_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_AttackLessPowerOnFullLife_val(unit, _AttackLessPowerOnFullLife_UnitMods[v])
		result = Id.new('x020tg'..tostring(9000 + eff))
	else
		result = prev
	end
	_AttackLessPowerOnFullLife_DescTxtCalls[v] = _AttackLessPowerOnFullLife_DescTxtCalls[v] + 1
	if _expected_AttackLessPowerOnFullLife_DescTxtCalls[v] <= _AttackLessPowerOnFullLife_DescTxtCalls[v] then
		if _expected_AttackLessPowerOnFullLife_DisplayCalls[v] == nil then
			_AttackLessPowerOnFullLife_UnitMods[v]	   = nil
		end
		_expected_AttackLessPowerOnFullLife_DescTxtCalls[v] = nil
		_AttackLessPowerOnFullLife_DescTxtCalls[v]          = nil
	end
	return result
end

function _AttackLessPowerOnFullLife_modifCustomDescTxt_init(unit, unitIndex)
		if _AttackLessPowerOnFullLife_UnitMods[unitIndex]  == nil then
			_AttackLessPowerOnFullLife_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_AttackLessPowerOnFullLife_DisplayCalls[unitIndex]    = _unitAura_AttackLessPowerOnFullLife_cnt(unit, _AttackLessPowerOnFullLife_UnitMods[unitIndex])
		_AttackLessPowerOnFullLife_DisplayCalls[unitIndex]             = 0
		_expected_AttackLessPowerOnFullLife_DescTxtCalls[unitIndex]    = 1
		_AttackLessPowerOnFullLife_DescTxtCalls[unitIndex]             = 0
		return 0
end

_AttackProtection_UnitMods              = {}
_AttackProtection_DisplayCalls          = {}
_AttackProtection_DescTxtCalls          = {}
_expected_AttackProtection_DisplayCalls = {}
_expected_AttackProtection_DescTxtCalls = {}

function _modifDisplay_AttackProtection(unit, prev)
	local v = unit.id.value
	if _expected_AttackProtection_DisplayCalls[v] == nil then
		_AttackProtection_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackProtection_DisplayCalls[v] == 0 then
		if _unitAura_AttackProtection_val(unit, _AttackProtection_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_AttackProtection_UnitMods[v]	   = nil
			_expected_AttackProtection_DisplayCalls[v] = nil
			_AttackProtection_DisplayCalls[v]          = nil
			_expected_AttackProtection_DescTxtCalls[v] = nil
			_AttackProtection_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_AttackProtection_DisplayCalls[v] = _AttackProtection_DisplayCalls[v] + 1
	if _expected_AttackProtection_DisplayCalls[v] <= _AttackProtection_DisplayCalls[v] then
		if _expected_AttackProtection_DescTxtCalls[v] == nil then
			_AttackProtection_UnitMods[v]	   = nil
		end
		_expected_AttackProtection_DisplayCalls[v] = nil
		_AttackProtection_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_AttackProtection(unit, prev)
	local v = unit.id.value
	if _expected_AttackProtection_DescTxtCalls[v] == nil then
		_AttackProtection_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _AttackProtection_DescTxtCalls[v] == 0 then
		if _AttackProtection_UnitMods[v]  == nil then
			_AttackProtection_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_AttackProtection_val(unit, _AttackProtection_UnitMods[v])
		result = Id.new('x010tg'..tostring(4300 + eff))
	else
		result = prev
	end
	_AttackProtection_DescTxtCalls[v] = _AttackProtection_DescTxtCalls[v] + 1
	if _expected_AttackProtection_DescTxtCalls[v] <= _AttackProtection_DescTxtCalls[v] then
		if _expected_AttackProtection_DisplayCalls[v] == nil then
			_AttackProtection_UnitMods[v]	   = nil
		end
		_expected_AttackProtection_DescTxtCalls[v] = nil
		_AttackProtection_DescTxtCalls[v]          = nil
	end
	return result
end

function _AttackProtection_modifCustomDescTxt_init(unit, unitIndex)
		if _AttackProtection_UnitMods[unitIndex]  == nil then
			_AttackProtection_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_AttackProtection_DisplayCalls[unitIndex]    = _unitAura_AttackProtection_cnt(unit, _AttackProtection_UnitMods[unitIndex])
		_AttackProtection_DisplayCalls[unitIndex]             = 0
		_expected_AttackProtection_DescTxtCalls[unitIndex]    = 1
		_AttackProtection_DescTxtCalls[unitIndex]             = 0
		return 0
end

_CowardiceBig_UnitMods              = {}
_CowardiceBig_DisplayCalls          = {}
_CowardiceBig_DescTxtCalls          = {}
_expected_CowardiceBig_DisplayCalls = {}
_expected_CowardiceBig_DescTxtCalls = {}

function _modifDisplay_CowardiceBig(unit, prev)
	local v = unit.id.value
	if _expected_CowardiceBig_DisplayCalls[v] == nil then
		_CowardiceBig_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _CowardiceBig_DisplayCalls[v] == 0 then
		if _unitAura_CowardiceBig_val(unit, _CowardiceBig_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_CowardiceBig_UnitMods[v]	   = nil
			_expected_CowardiceBig_DisplayCalls[v] = nil
			_CowardiceBig_DisplayCalls[v]          = nil
			_expected_CowardiceBig_DescTxtCalls[v] = nil
			_CowardiceBig_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_CowardiceBig_DisplayCalls[v] = _CowardiceBig_DisplayCalls[v] + 1
	if _expected_CowardiceBig_DisplayCalls[v] <= _CowardiceBig_DisplayCalls[v] then
		if _expected_CowardiceBig_DescTxtCalls[v] == nil then
			_CowardiceBig_UnitMods[v]	   = nil
		end
		_expected_CowardiceBig_DisplayCalls[v] = nil
		_CowardiceBig_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_CowardiceBig(unit, prev)
	local v = unit.id.value
	if _expected_CowardiceBig_DescTxtCalls[v] == nil then
		_CowardiceBig_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _CowardiceBig_DescTxtCalls[v] == 0 then
		if _CowardiceBig_UnitMods[v]  == nil then
			_CowardiceBig_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_CowardiceBig_val(unit, _CowardiceBig_UnitMods[v])
		result = Id.new('x010tg2000')
	else
		result = prev
	end
	_CowardiceBig_DescTxtCalls[v] = _CowardiceBig_DescTxtCalls[v] + 1
	if _expected_CowardiceBig_DescTxtCalls[v] <= _CowardiceBig_DescTxtCalls[v] then
		if _expected_CowardiceBig_DisplayCalls[v] == nil then
			_CowardiceBig_UnitMods[v]	   = nil
		end
		_expected_CowardiceBig_DescTxtCalls[v] = nil
		_CowardiceBig_DescTxtCalls[v]          = nil
	end
	return result
end

function _CowardiceBig_modifCustomDescTxt_init(unit, unitIndex)
		if _CowardiceBig_UnitMods[unitIndex]  == nil then
			_CowardiceBig_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_CowardiceBig_DisplayCalls[unitIndex]    = _unitAura_CowardiceBig_cnt(unit, _CowardiceBig_UnitMods[unitIndex])
		_CowardiceBig_DisplayCalls[unitIndex]             = 0
		_expected_CowardiceBig_DescTxtCalls[unitIndex]    = 1
		_CowardiceBig_DescTxtCalls[unitIndex]             = 0
		return 0
end

_Cannibalism_UnitMods              = {}
_Cannibalism_DisplayCalls          = {}
_Cannibalism_DescTxtCalls          = {}
_expected_Cannibalism_DisplayCalls = {}
_expected_Cannibalism_DescTxtCalls = {}

function _modifDisplay_Cannibalism(unit, prev)
	local v = unit.id.value
	if _expected_Cannibalism_DisplayCalls[v] == nil then
		_Cannibalism_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _Cannibalism_DisplayCalls[v] == 0 then
		if _unitAura_Cannibalism_val(unit, _Cannibalism_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_Cannibalism_UnitMods[v]	   = nil
			_expected_Cannibalism_DisplayCalls[v] = nil
			_Cannibalism_DisplayCalls[v]          = nil
			_expected_Cannibalism_DescTxtCalls[v] = nil
			_Cannibalism_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_Cannibalism_DisplayCalls[v] = _Cannibalism_DisplayCalls[v] + 1
	if _expected_Cannibalism_DisplayCalls[v] <= _Cannibalism_DisplayCalls[v] then
		if _expected_Cannibalism_DescTxtCalls[v] == nil then
			_Cannibalism_UnitMods[v]	   = nil
		end
		_expected_Cannibalism_DisplayCalls[v] = nil
		_Cannibalism_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_Cannibalism(unit, prev)
	local v = unit.id.value
	if _expected_Cannibalism_DescTxtCalls[v] == nil then
		_Cannibalism_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _Cannibalism_DescTxtCalls[v] == 0 then
		if _Cannibalism_UnitMods[v]  == nil then
			_Cannibalism_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_Cannibalism_val(unit, _Cannibalism_UnitMods[v])
		result = Id.new('x010tg'..tostring(3000 + eff))
	else
		result = prev
	end
	_Cannibalism_DescTxtCalls[v] = _Cannibalism_DescTxtCalls[v] + 1
	if _expected_Cannibalism_DescTxtCalls[v] <= _Cannibalism_DescTxtCalls[v] then
		if _expected_Cannibalism_DisplayCalls[v] == nil then
			_Cannibalism_UnitMods[v]	   = nil
		end
		_expected_Cannibalism_DescTxtCalls[v] = nil
		_Cannibalism_DescTxtCalls[v]          = nil
	end
	return result
end

function _Cannibalism_modifCustomDescTxt_init(unit, unitIndex)
		if _Cannibalism_UnitMods[unitIndex]  == nil then
			_Cannibalism_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_Cannibalism_DisplayCalls[unitIndex]    = _unitAura_Cannibalism_cnt(unit, _Cannibalism_UnitMods[unitIndex])
		_Cannibalism_DisplayCalls[unitIndex]             = 0
		_expected_Cannibalism_DescTxtCalls[unitIndex]    = 1
		_Cannibalism_DescTxtCalls[unitIndex]             = 0
		return 0
end

_VampirismPerCorpse_UnitMods              = {}
_VampirismPerCorpse_DisplayCalls          = {}
_VampirismPerCorpse_DescTxtCalls          = {}
_expected_VampirismPerCorpse_DisplayCalls = {}
_expected_VampirismPerCorpse_DescTxtCalls = {}

function _modifDisplay_VampirismPerCorpse(unit, prev)
	local v = unit.id.value
	if _expected_VampirismPerCorpse_DisplayCalls[v] == nil then
		_VampirismPerCorpse_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _VampirismPerCorpse_DisplayCalls[v] == 0 then
		if _unitAura_VampirismPerCorpse_val(unit, _VampirismPerCorpse_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_VampirismPerCorpse_UnitMods[v]	   = nil
			_expected_VampirismPerCorpse_DisplayCalls[v] = nil
			_VampirismPerCorpse_DisplayCalls[v]          = nil
			_expected_VampirismPerCorpse_DescTxtCalls[v] = nil
			_VampirismPerCorpse_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_VampirismPerCorpse_DisplayCalls[v] = _VampirismPerCorpse_DisplayCalls[v] + 1
	if _expected_VampirismPerCorpse_DisplayCalls[v] <= _VampirismPerCorpse_DisplayCalls[v] then
		if _expected_VampirismPerCorpse_DescTxtCalls[v] == nil then
			_VampirismPerCorpse_UnitMods[v]	   = nil
		end
		_expected_VampirismPerCorpse_DisplayCalls[v] = nil
		_VampirismPerCorpse_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_VampirismPerCorpse(unit, prev)
	local v = unit.id.value
	if _expected_VampirismPerCorpse_DescTxtCalls[v] == nil then
		_VampirismPerCorpse_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _VampirismPerCorpse_DescTxtCalls[v] == 0 then
		if _VampirismPerCorpse_UnitMods[v]  == nil then
			_VampirismPerCorpse_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_VampirismPerCorpse_val(unit, _VampirismPerCorpse_UnitMods[v])
		result = Id.new('x010tg'..tostring(4000 + eff))
	else
		result = prev
	end
	_VampirismPerCorpse_DescTxtCalls[v] = _VampirismPerCorpse_DescTxtCalls[v] + 1
	if _expected_VampirismPerCorpse_DescTxtCalls[v] <= _VampirismPerCorpse_DescTxtCalls[v] then
		if _expected_VampirismPerCorpse_DisplayCalls[v] == nil then
			_VampirismPerCorpse_UnitMods[v]	   = nil
		end
		_expected_VampirismPerCorpse_DescTxtCalls[v] = nil
		_VampirismPerCorpse_DescTxtCalls[v]          = nil
	end
	return result
end

function _VampirismPerCorpse_modifCustomDescTxt_init(unit, unitIndex)
		if _VampirismPerCorpse_UnitMods[unitIndex]  == nil then
			_VampirismPerCorpse_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_VampirismPerCorpse_DisplayCalls[unitIndex]    = _unitAura_VampirismPerCorpse_cnt(unit, _VampirismPerCorpse_UnitMods[unitIndex])
		_VampirismPerCorpse_DisplayCalls[unitIndex]             = 0
		_expected_VampirismPerCorpse_DescTxtCalls[unitIndex]    = 1
		_VampirismPerCorpse_DescTxtCalls[unitIndex]             = 0
		return 0
end

_DrainLevelResistance_UnitMods              = {}
_DrainLevelResistance_DisplayCalls          = {}
_DrainLevelResistance_DescTxtCalls          = {}
_expected_DrainLevelResistance_DisplayCalls = {}
_expected_DrainLevelResistance_DescTxtCalls = {}

function _modifDisplay_DrainLevelResistance(unit, prev)
	local v = unit.id.value
	if _expected_DrainLevelResistance_DisplayCalls[v] == nil then
		_DrainLevelResistance_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _DrainLevelResistance_DisplayCalls[v] == 0 then
		if _unitAura_DrainLevelResistance_val(unit, _DrainLevelResistance_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_DrainLevelResistance_UnitMods[v]	   = nil
			_expected_DrainLevelResistance_DisplayCalls[v] = nil
			_DrainLevelResistance_DisplayCalls[v]          = nil
			_expected_DrainLevelResistance_DescTxtCalls[v] = nil
			_DrainLevelResistance_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_DrainLevelResistance_DisplayCalls[v] = _DrainLevelResistance_DisplayCalls[v] + 1
	if _expected_DrainLevelResistance_DisplayCalls[v] <= _DrainLevelResistance_DisplayCalls[v] then
		if _expected_DrainLevelResistance_DescTxtCalls[v] == nil then
			_DrainLevelResistance_UnitMods[v]	   = nil
		end
		_expected_DrainLevelResistance_DisplayCalls[v] = nil
		_DrainLevelResistance_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_DrainLevelResistance(unit, prev)
	local v = unit.id.value
	if _expected_DrainLevelResistance_DescTxtCalls[v] == nil then
		_DrainLevelResistance_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _DrainLevelResistance_DescTxtCalls[v] == 0 then
		if _DrainLevelResistance_UnitMods[v]  == nil then
			_DrainLevelResistance_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_DrainLevelResistance_val(unit, _DrainLevelResistance_UnitMods[v])
		result = Id.new('x010tg'..tostring(4800 + eff))
	else
		result = prev
	end
	_DrainLevelResistance_DescTxtCalls[v] = _DrainLevelResistance_DescTxtCalls[v] + 1
	if _expected_DrainLevelResistance_DescTxtCalls[v] <= _DrainLevelResistance_DescTxtCalls[v] then
		if _expected_DrainLevelResistance_DisplayCalls[v] == nil then
			_DrainLevelResistance_UnitMods[v]	   = nil
		end
		_expected_DrainLevelResistance_DescTxtCalls[v] = nil
		_DrainLevelResistance_DescTxtCalls[v]          = nil
	end
	return result
end

function _DrainLevelResistance_modifCustomDescTxt_init(unit, unitIndex)
		if _DrainLevelResistance_UnitMods[unitIndex]  == nil then
			_DrainLevelResistance_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_DrainLevelResistance_DisplayCalls[unitIndex]    = _unitAura_DrainLevelResistance_cnt(unit, _DrainLevelResistance_UnitMods[unitIndex])
		_DrainLevelResistance_DisplayCalls[unitIndex]             = 0
		_expected_DrainLevelResistance_DescTxtCalls[unitIndex]    = 1
		_DrainLevelResistance_DescTxtCalls[unitIndex]             = 0
		return 0
end

_HitPointPerCorpse_UnitMods              = {}
_HitPointPerCorpse_DisplayCalls          = {}
_HitPointPerCorpse_DescTxtCalls          = {}
_expected_HitPointPerCorpse_DisplayCalls = {}
_expected_HitPointPerCorpse_DescTxtCalls = {}

function _modifDisplay_HitPointPerCorpse(unit, prev)
	local v = unit.id.value
	if _expected_HitPointPerCorpse_DisplayCalls[v] == nil then
		_HitPointPerCorpse_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _HitPointPerCorpse_DisplayCalls[v] == 0 then
		if _unitAura_HitPointPerCorpse_val(unit, _HitPointPerCorpse_UnitMods[v]) > 0 then
			result = true
		else
			result = false
			_HitPointPerCorpse_UnitMods[v]	   = nil
			_expected_HitPointPerCorpse_DisplayCalls[v] = nil
			_HitPointPerCorpse_DisplayCalls[v]          = nil
			_expected_HitPointPerCorpse_DescTxtCalls[v] = nil
			_HitPointPerCorpse_DescTxtCalls[v]          = nil
			return result
		end
	else
		result = false
	end
	_HitPointPerCorpse_DisplayCalls[v] = _HitPointPerCorpse_DisplayCalls[v] + 1
	if _expected_HitPointPerCorpse_DisplayCalls[v] <= _HitPointPerCorpse_DisplayCalls[v] then
		if _expected_HitPointPerCorpse_DescTxtCalls[v] == nil then
			_HitPointPerCorpse_UnitMods[v]	   = nil
		end
		_expected_HitPointPerCorpse_DisplayCalls[v] = nil
		_HitPointPerCorpse_DisplayCalls[v]          = nil
	end
	return result
end

function _modifCustomTxt_HitPointPerCorpse(unit, prev)
	local v = unit.id.value
	if _expected_HitPointPerCorpse_DescTxtCalls[v] == nil then
		_HitPointPerCorpse_modifCustomDescTxt_init(unit, v)
	end
	local result
	if _HitPointPerCorpse_DescTxtCalls[v] == 0 then
		if _HitPointPerCorpse_UnitMods[v]  == nil then
			_HitPointPerCorpse_UnitMods[v]  = _GroupInfo_UnitModifiers(unit)
		end
		local eff = _unitAura_HitPointPerCorpse_val(unit, _HitPointPerCorpse_UnitMods[v])
		result = Id.new('x010tg'..tostring(4500 + eff))
	else
		result = prev
	end
	_HitPointPerCorpse_DescTxtCalls[v] = _HitPointPerCorpse_DescTxtCalls[v] + 1
	if _expected_HitPointPerCorpse_DescTxtCalls[v] <= _HitPointPerCorpse_DescTxtCalls[v] then
		if _expected_HitPointPerCorpse_DisplayCalls[v] == nil then
			_HitPointPerCorpse_UnitMods[v]	   = nil
		end
		_expected_HitPointPerCorpse_DescTxtCalls[v] = nil
		_HitPointPerCorpse_DescTxtCalls[v]          = nil
	end
	return result
end

function _HitPointPerCorpse_modifCustomDescTxt_init(unit, unitIndex)
		if _HitPointPerCorpse_UnitMods[unitIndex]  == nil then
			_HitPointPerCorpse_UnitMods[unitIndex]  = _GroupInfo_UnitModifiers(unit)
		end
		_expected_HitPointPerCorpse_DisplayCalls[unitIndex]    = _unitAura_HitPointPerCorpse_cnt(unit, _HitPointPerCorpse_UnitMods[unitIndex])
		_HitPointPerCorpse_DisplayCalls[unitIndex]             = 0
		_expected_HitPointPerCorpse_DescTxtCalls[unitIndex]    = 1
		_HitPointPerCorpse_DescTxtCalls[unitIndex]             = 0
		return 0
end

function _modifDisplay_Clear(idValue)
	_HitPoint_Percent_UnitMods[idValue] = nil
	_HitPoint_Percent_DisplayCalls[idValue] = nil
	_HitPoint_Percent_DescTxtCalls[idValue] = nil
	_expected_HitPoint_Percent_DisplayCalls[idValue] = nil
	_expected_HitPoint_Percent_DescTxtCalls[idValue] = nil
	_HitPoint_Flat_UnitMods[idValue] = nil
	_HitPoint_Flat_DisplayCalls[idValue] = nil
	_HitPoint_Flat_DescTxtCalls[idValue] = nil
	_expected_HitPoint_Flat_DisplayCalls[idValue] = nil
	_expected_HitPoint_Flat_DescTxtCalls[idValue] = nil
	_Regen_Flat_UnitMods[idValue] = nil
	_Regen_Flat_DisplayCalls[idValue] = nil
	_Regen_Flat_DescTxtCalls[idValue] = nil
	_expected_Regen_Flat_DisplayCalls[idValue] = nil
	_expected_Regen_Flat_DescTxtCalls[idValue] = nil
	_Armor_Flat_UnitMods[idValue] = nil
	_Armor_Flat_DisplayCalls[idValue] = nil
	_Armor_Flat_DescTxtCalls[idValue] = nil
	_expected_Armor_Flat_DisplayCalls[idValue] = nil
	_expected_Armor_Flat_DescTxtCalls[idValue] = nil
	_AttackInitiative_Percent_UnitMods[idValue] = nil
	_AttackInitiative_Percent_DisplayCalls[idValue] = nil
	_AttackInitiative_Percent_DescTxtCalls[idValue] = nil
	_expected_AttackInitiative_Percent_DisplayCalls[idValue] = nil
	_expected_AttackInitiative_Percent_DescTxtCalls[idValue] = nil
	_AttackDamageHeal_Percent_UnitMods[idValue] = nil
	_AttackDamageHeal_Percent_DisplayCalls[idValue] = nil
	_AttackDamageHeal_Percent_DescTxtCalls[idValue] = nil
	_expected_AttackDamageHeal_Percent_DisplayCalls[idValue] = nil
	_expected_AttackDamageHeal_Percent_DescTxtCalls[idValue] = nil
	_AttackPower_Percent_UnitMods[idValue] = nil
	_AttackPower_Percent_DisplayCalls[idValue] = nil
	_AttackPower_Percent_DescTxtCalls[idValue] = nil
	_expected_AttackPower_Percent_DisplayCalls[idValue] = nil
	_expected_AttackPower_Percent_DescTxtCalls[idValue] = nil
	_AttackDrain_Flat_UnitMods[idValue] = nil
	_AttackDrain_Flat_DisplayCalls[idValue] = nil
	_AttackDrain_Flat_DescTxtCalls[idValue] = nil
	_expected_AttackDrain_Flat_DisplayCalls[idValue] = nil
	_expected_AttackDrain_Flat_DescTxtCalls[idValue] = nil
	_AttackCrit_Flat_UnitMods[idValue] = nil
	_AttackCrit_Flat_DisplayCalls[idValue] = nil
	_AttackCrit_Flat_DescTxtCalls[idValue] = nil
	_expected_AttackCrit_Flat_DisplayCalls[idValue] = nil
	_expected_AttackCrit_Flat_DescTxtCalls[idValue] = nil
	_SummonTransform_Flat_UnitMods[idValue] = nil
	_SummonTransform_Flat_DisplayCalls[idValue] = nil
	_SummonTransform_Flat_DescTxtCalls[idValue] = nil
	_expected_SummonTransform_Flat_DisplayCalls[idValue] = nil
	_expected_SummonTransform_Flat_DescTxtCalls[idValue] = nil
	_CurseProtection_Covered_UnitMods[idValue] = nil
	_CurseProtection_Covered_DisplayCalls[idValue] = nil
	_CurseProtection_Covered_DescTxtCalls[idValue] = nil
	_expected_CurseProtection_Covered_DisplayCalls[idValue] = nil
	_expected_CurseProtection_Covered_DescTxtCalls[idValue] = nil
	_ArmorFlat_Covered_UnitMods[idValue] = nil
	_ArmorFlat_Covered_DisplayCalls[idValue] = nil
	_ArmorFlat_Covered_DescTxtCalls[idValue] = nil
	_expected_ArmorFlat_Covered_DisplayCalls[idValue] = nil
	_expected_ArmorFlat_Covered_DescTxtCalls[idValue] = nil
	_HitPointOnDeath_Percent_UnitMods[idValue] = nil
	_HitPointOnDeath_Percent_DisplayCalls[idValue] = nil
	_HitPointOnDeath_Percent_DescTxtCalls[idValue] = nil
	_expected_HitPointOnDeath_Percent_DisplayCalls[idValue] = nil
	_expected_HitPointOnDeath_Percent_DescTxtCalls[idValue] = nil
	_AttackDrainOnDeath_Percent_UnitMods[idValue] = nil
	_AttackDrainOnDeath_Percent_DisplayCalls[idValue] = nil
	_AttackDrainOnDeath_Percent_DescTxtCalls[idValue] = nil
	_expected_AttackDrainOnDeath_Percent_DisplayCalls[idValue] = nil
	_expected_AttackDrainOnDeath_Percent_DescTxtCalls[idValue] = nil
	_PoisonResist_UnitMods[idValue] = nil
	_PoisonResist_DisplayCalls[idValue] = nil
	_PoisonResist_DescTxtCalls[idValue] = nil
	_expected_PoisonResist_DisplayCalls[idValue] = nil
	_expected_PoisonResist_DescTxtCalls[idValue] = nil
	_FrostbiteResist_UnitMods[idValue] = nil
	_FrostbiteResist_DisplayCalls[idValue] = nil
	_FrostbiteResist_DescTxtCalls[idValue] = nil
	_expected_FrostbiteResist_DisplayCalls[idValue] = nil
	_expected_FrostbiteResist_DescTxtCalls[idValue] = nil
	_BlisterResist_UnitMods[idValue] = nil
	_BlisterResist_DisplayCalls[idValue] = nil
	_BlisterResist_DescTxtCalls[idValue] = nil
	_expected_BlisterResist_DisplayCalls[idValue] = nil
	_expected_BlisterResist_DescTxtCalls[idValue] = nil
	_LowerInitiativeResist_UnitMods[idValue] = nil
	_LowerInitiativeResist_DisplayCalls[idValue] = nil
	_LowerInitiativeResist_DescTxtCalls[idValue] = nil
	_expected_LowerInitiativeResist_DisplayCalls[idValue] = nil
	_expected_LowerInitiativeResist_DescTxtCalls[idValue] = nil
	_LowerDamageResist_UnitMods[idValue] = nil
	_LowerDamageResist_DisplayCalls[idValue] = nil
	_LowerDamageResist_DescTxtCalls[idValue] = nil
	_expected_LowerDamageResist_DisplayCalls[idValue] = nil
	_expected_LowerDamageResist_DescTxtCalls[idValue] = nil
	_PerLostHP_Armor_UnitMods[idValue] = nil
	_PerLostHP_Armor_DisplayCalls[idValue] = nil
	_PerLostHP_Armor_DescTxtCalls[idValue] = nil
	_expected_PerLostHP_Armor_DisplayCalls[idValue] = nil
	_expected_PerLostHP_Armor_DescTxtCalls[idValue] = nil
	_PerLostHP_AttackInitiative_UnitMods[idValue] = nil
	_PerLostHP_AttackInitiative_DisplayCalls[idValue] = nil
	_PerLostHP_AttackInitiative_DescTxtCalls[idValue] = nil
	_expected_PerLostHP_AttackInitiative_DisplayCalls[idValue] = nil
	_expected_PerLostHP_AttackInitiative_DescTxtCalls[idValue] = nil
	_PerLostHP_AttackDamageHeal_UnitMods[idValue] = nil
	_PerLostHP_AttackDamageHeal_DisplayCalls[idValue] = nil
	_PerLostHP_AttackDamageHeal_DescTxtCalls[idValue] = nil
	_expected_PerLostHP_AttackDamageHeal_DisplayCalls[idValue] = nil
	_expected_PerLostHP_AttackDamageHeal_DescTxtCalls[idValue] = nil
	_PerLostHP_AttackPower_UnitMods[idValue] = nil
	_PerLostHP_AttackPower_DisplayCalls[idValue] = nil
	_PerLostHP_AttackPower_DescTxtCalls[idValue] = nil
	_expected_PerLostHP_AttackPower_DisplayCalls[idValue] = nil
	_expected_PerLostHP_AttackPower_DescTxtCalls[idValue] = nil
	_PerLostHP_AttackDrain_UnitMods[idValue] = nil
	_PerLostHP_AttackDrain_DisplayCalls[idValue] = nil
	_PerLostHP_AttackDrain_DescTxtCalls[idValue] = nil
	_expected_PerLostHP_AttackDrain_DisplayCalls[idValue] = nil
	_expected_PerLostHP_AttackDrain_DescTxtCalls[idValue] = nil
	_PerLostHP_AttackCrit_UnitMods[idValue] = nil
	_PerLostHP_AttackCrit_DisplayCalls[idValue] = nil
	_PerLostHP_AttackCrit_DescTxtCalls[idValue] = nil
	_expected_PerLostHP_AttackCrit_DisplayCalls[idValue] = nil
	_expected_PerLostHP_AttackCrit_DescTxtCalls[idValue] = nil
	_PerLostHP_DoubleAttack_UnitMods[idValue] = nil
	_PerLostHP_DoubleAttack_DisplayCalls[idValue] = nil
	_PerLostHP_DoubleAttack_DescTxtCalls[idValue] = nil
	_expected_PerLostHP_DoubleAttack_DisplayCalls[idValue] = nil
	_expected_PerLostHP_DoubleAttack_DescTxtCalls[idValue] = nil
	_AttackDamageInitiativeOnFullLife_UnitMods[idValue] = nil
	_AttackDamageInitiativeOnFullLife_DisplayCalls[idValue] = nil
	_AttackDamageInitiativeOnFullLife_DescTxtCalls[idValue] = nil
	_expected_AttackDamageInitiativeOnFullLife_DisplayCalls[idValue] = nil
	_expected_AttackDamageInitiativeOnFullLife_DescTxtCalls[idValue] = nil
	_AttackLessPowerOnFullLife_UnitMods[idValue] = nil
	_AttackLessPowerOnFullLife_DisplayCalls[idValue] = nil
	_AttackLessPowerOnFullLife_DescTxtCalls[idValue] = nil
	_expected_AttackLessPowerOnFullLife_DisplayCalls[idValue] = nil
	_expected_AttackLessPowerOnFullLife_DescTxtCalls[idValue] = nil
	_AttackProtection_UnitMods[idValue] = nil
	_AttackProtection_DisplayCalls[idValue] = nil
	_AttackProtection_DescTxtCalls[idValue] = nil
	_expected_AttackProtection_DisplayCalls[idValue] = nil
	_expected_AttackProtection_DescTxtCalls[idValue] = nil
	_CowardiceBig_UnitMods[idValue] = nil
	_CowardiceBig_DisplayCalls[idValue] = nil
	_CowardiceBig_DescTxtCalls[idValue] = nil
	_expected_CowardiceBig_DisplayCalls[idValue] = nil
	_expected_CowardiceBig_DescTxtCalls[idValue] = nil
	_Cannibalism_UnitMods[idValue] = nil
	_Cannibalism_DisplayCalls[idValue] = nil
	_Cannibalism_DescTxtCalls[idValue] = nil
	_expected_Cannibalism_DisplayCalls[idValue] = nil
	_expected_Cannibalism_DescTxtCalls[idValue] = nil
	_VampirismPerCorpse_UnitMods[idValue] = nil
	_VampirismPerCorpse_DisplayCalls[idValue] = nil
	_VampirismPerCorpse_DescTxtCalls[idValue] = nil
	_expected_VampirismPerCorpse_DisplayCalls[idValue] = nil
	_expected_VampirismPerCorpse_DescTxtCalls[idValue] = nil
	_DrainLevelResistance_UnitMods[idValue] = nil
	_DrainLevelResistance_DisplayCalls[idValue] = nil
	_DrainLevelResistance_DescTxtCalls[idValue] = nil
	_expected_DrainLevelResistance_DisplayCalls[idValue] = nil
	_expected_DrainLevelResistance_DescTxtCalls[idValue] = nil
	_HitPointPerCorpse_UnitMods[idValue] = nil
	_HitPointPerCorpse_DisplayCalls[idValue] = nil
	_HitPointPerCorpse_DescTxtCalls[idValue] = nil
	_expected_HitPointPerCorpse_DisplayCalls[idValue] = nil
	_expected_HitPointPerCorpse_DescTxtCalls[idValue] = nil
	return 0
end
