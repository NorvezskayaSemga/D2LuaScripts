
-- Created by Norvezskaya Semga

package.path = ".\\Scripts\\exp\\?.lua"
require('converter')
require('bonus')

function getLevel(unit, transformImpl)

	local unitExp = _getUnitExp(unit)
	-- log('transforming unit exp:'..unitExp)

	local lvl = _getUnitImplLevel(transformImpl, unitExp)
	-- log('transform exp lvl:'..lvl)
	
	lvl = lvl + _getBonusLevel(unit)
	
	local result = _levelCap(lvl)

	-- log('unit will transform into lvl '..result)
	return result
end
