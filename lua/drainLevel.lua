function getLevel(attacker, target, item)
    -- transform into unit with its level minus 1 and minus attacker over-level
    local lvl = 0
    if item then
    	lvl = target.impl.level - 1
    else
    	lvl = target.impl.level - 1 - math.floor( (attacker.impl.level - attacker.baseImpl.level) / 3)
    end
    return math.max(1, lvl)
end
