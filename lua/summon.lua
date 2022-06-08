
-- Created by Norvezskaya Semga

package.path = ".\\Scripts\\exp\\?.lua"
require('converter')
require('bonus')

function getLevel(summoner, summonImpl)

	local summonerExp = _getUnitExp(summoner)
	-- log('summoner exp:'..summonerExp)

	local lvl = _getUnitImplLevel(summonImpl, summonerExp)
	-- log('summon exp lvl:'..lvl)

	lvl = lvl + _getBonusLevel(summoner)
	
	local result = _levelCap(lvl)

	-- log('summoner will summon lvl '..result)
	return result
end
