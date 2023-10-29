package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require "unitAura"
require "GroupInfo"
require "unitAuraCustomDesc"
require "setValue"

function getModifierDisplay(unit, prev)
	local r = _modifDisplay_Regen_Flat(unit, prev)
	if unit.hp > 0 then
		return r
	else
		return false
	end
end

function getModifierDescTxt(unit, prev)
	return _modifCustomTxt_Regen_Flat(unit, prev)
end

function getMovement(unit, prev)
	local result = 10
	local stack = _GroupInfo_getUnitStack(unit)
	if stack ~= nil then
		local player = stack.owner
		if player ~= nil then
			local pos = stack.position
			local tile = getScenario():getTile(pos.x, pos.y)
			if _terrainToPlayerRace[tile.terrain] == player.race then
				result = result + 4
			end
		end
	end
	return svFlatEffectMovement(unit, prev, result)
end
