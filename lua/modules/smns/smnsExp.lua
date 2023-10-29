package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modifiers\\drawing\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\leaderMods\\?.lua;.\\Scripts\\modifiers\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\?.lua;.\\Scripts\\modifiers\\smns\\items\\?.lua;.\\Scripts\\modifiers\\smns\\perks\\?.lua;.\\Scripts\\modifiers\\smns\\spells\\?.lua;.\\Scripts\\modifiers\\smns\\units\\?.lua;.\\Scripts\\modifiers\\spells\\?.lua;.\\Scripts\\modifiers\\units\\?.lua;.\\Scripts\\modifiers\\units\\bloodsorcerer\\?.lua;.\\Scripts\\modifiers\\units\\multiplicative_stats\\?.lua;.\\Scripts\\modifiers\\units\\torhoth\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\workshop\\?.lua;.\\Scripts\\workshop\\classes\\?.lua"
require('GroupInfo')
require('unitAura')
require('smnsInfo')
require('named_mods')

function _smnsExp_getSummonBonusLevel(summoner, summonImpl, item)
	return 0
end

function _smnsExp_getSummonExpTransferEffectiveness(summoner, summonImpl, item)
	return 0
end

function _smnsExp_getDoppelgangerBonusLevel(doppelganger, target)
	return 0
end

function _smnsExp_getDoppelgangerExpTransferEffectiveness(doppelganger, target)
	return 0
end

function _smnsExp_getTransformSelfBonusLevel(unit, transformImpl, item)
	return 0
end

function _smnsExp_getTransformSelfExpTransferEffectiveness(unit, transformImpl, item)
	return 0
end

