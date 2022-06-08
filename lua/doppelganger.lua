
-- Created by Norvezskaya Semga

package.path = ".\\Scripts\\exp\\?.lua"
require('converter')
require('bonus')

function getLevel(doppelganger, target)

	local doppelExp = _getUnitExp(doppelganger)
	-- log('Doppelganger exp:'..doppelExp)

	local lvl = _getUnitImplLevel(target.baseImpl, doppelExp)
	-- log('Doppelganger exp lvl '..lvl)
	
	-- lvl = lvl + _getBonusLevel(doppelganger)
	
	local result = _levelCap(lvl)

	-- log('Doppelganger will transform into lvl '..result)
	return result
end
