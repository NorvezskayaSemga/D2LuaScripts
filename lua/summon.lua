
-- Created by Norvezskaya Semga

package.path = ".\\Scripts\\exp\\?.lua"
require('converter')
require('bonus')

function getLevel(summoner, summonImpl, item)

	local summonerExp = _getUnitExp(summoner) 
		* _getSummonExpTransferEffectiveness(summoner, summonImpl, item)
	-- log('summoner exp:'..summonerExp)

	local bonusLvl = _getSummonBonusLevel(summoner, summonImpl, item)
	local lvl = _getUnitImplLevel(summonImpl, summonerExp, bonusLvl)
	-- log('summon exp lvl:'..lvl)
	
	local result = _levelCap(lvl)

	-- log('summoner will summon lvl '..result)
	return result
end
