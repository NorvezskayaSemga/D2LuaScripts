
-- Created by Norvezskaya Semga

package.path = ".\\Scripts\\exp\\?.lua"
require('converter')
require('bonus')

function getLevel(doppelganger, target)

	local utype = target.impl.type
	if utype == Unit.Summon or utype == Unit.Noble or utype == Unit.Guardian then
		return target.baseImpl.level
	end
	
	local doppelExp = _getUnitExp(doppelganger)
		* _getDoppelgangerExpTransferEffectiveness(doppelganger, target)
	-- log('Doppelganger exp:'..doppelExp)

	local bonusLvl = _getDoppelgangerBonusLevel(doppelganger, target)
	local lvl = _getUnitImplLevel(target.baseImpl, doppelExp, bonusLvl)
	-- log('Doppelganger exp lvl '..lvl)
		
	local result = _levelCap(lvl)
	
	-- log('Doppelganger will transform into lvl '..result)
	return result
end
