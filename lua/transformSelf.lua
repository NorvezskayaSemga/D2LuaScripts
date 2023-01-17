
-- Created by Norvezskaya Semga

package.path = ".\\Scripts\\exp\\?.lua"
require('converter')
require('bonus')

function getLevel(unit, transformImpl)

	local unitExp = _getUnitExp(unit)
		* _getTransformSelfExpTransferEffectiveness(unit, transformImpl)
	-- log('transforming unit exp:'..unitExp)

	local bonusLvl = _getTransformSelfBonusLevel(unit, transformImpl)
	local lvl = _getUnitImplLevel(transformImpl, unitExp, bonusLvl)
	-- log('transform exp lvl:'..lvl)
	
	local result = _levelCap(lvl)

	-- log('unit will transform into lvl '..result)
	return result
end
