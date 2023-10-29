
smnsEnabled = false
smnsInfoApplyDmgBuffToHeal = true
smnsInfoApplyAccuracyBuffToAttack2 = true
smnsInfoHandleSpellDebuffsAsCommonMods = false

smnsInfoDebuffed_Damage_LowerBound_Percent = 0.2
smnsInfoDebuffed_Heal_LowerBound_Percent = 0.2
smnsInfoDebuffed_Accuracy_LowerBound_Percent = 0.2

smnsInfoCriticalHit_DamageCap_Percent = 50
smnsInfoCriticalHit_ClassicalIncrease = false

smnsInfo_HealCap_Percent = 75

smnsInfoExpTransferEffectiveness_Summon = 0.75
smnsInfoExpTransferEffectiveness_Summon_Item = 0.75
smnsInfoExpTransferEffectiveness_Doppelganger = 0.75
smnsInfoExpTransferEffectiveness_TransformSelf = 1.0

smnsInfo_LowerCostCap_Percent = 100

smnsInfo_GalleansBoonHitPointBonus = 50

function smnsInfo_SetApplyDmgBuffToHeal(value)
	smnsInfoApplyDmgBuffToHeal = value
	return 0
end

function smnsInfo_SetApplyAccuracyBuffToAttack2(value)
	smnsInfoApplyAccuracyBuffToAttack2 = value
	return 0
end
