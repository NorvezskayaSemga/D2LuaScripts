--[[
For complete API reference see
https://github.com/VladimirMakeev/D2ModdingToolset/blob/master/luaApi.md

If the script is used as SEL_SCRIPT, no unit is selected yet (selected.position == -1).

Unit positions on a battlefield are mirrored.
Frontline positions are even, backline - odd.
1 0    0 1
3 2 vs 2 3
5 4    4 5
--]]

-- Created by Norvezskaya Semga

package.path = ".\\Scripts\\modules\\?.lua"
require('library')

function getTargets(attacker, selected, allies, targets, targetsAreAllies)
	local result = _getChoices("_target_All", attacker, selected, allies, targets, targetsAreAllies)
	return result
end
