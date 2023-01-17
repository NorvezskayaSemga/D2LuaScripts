package.path = ".\\Scripts\\modules\\?.lua"
require('GroupInfo')

G040UM0155 = Id.new('g040um0155').value
G020AA0011 = Id.new('g020aa0011')
StormCentaurId = Id.new('g001uu8240').value

function getLevel(attacker, target, item)
    -- transform into unit with its level minus 1 and minus attacker over-level
    local lvl = target.impl.level
    local drain
    local targetMods = _GroupInfo_UnitModifiers(target)
    if item then
    	drain = 1
    else
    	local a2 = attacker.impl.attack2
    	if a2 ~= nil and a2.id == G020AA0011 then
    		drain = 1
    	else
	    	drain = math.min(10, 1 + math.floor( (attacker.impl.level - attacker.baseImpl.level) / 3))
    	end
    end
    
    local resistanceValue = _unitAura_DrainLevelResistance_val(target, targetMods)
    if resistanceValue > 0 then
    	    drain = math.max(1, math.ceil(drain * (100 - resistanceValue) * 0.01))
    end
    
    if _GroupInfo_UnitModifierAmount(targetMods, G040UM0155) > 0 then
    	    return math.max(target.baseImpl.level, lvl - drain)
    elseif target.impl.id.value == StormCentaurId then
    	    return math.max(target.baseImpl.level - 1, lvl - drain)
    else
	    return math.max(1, lvl - drain)
    end
end
