package.path = ".\\Scripts\\?.lua;.\\Scripts\\exp\\?.lua;.\\Scripts\\modules\\?.lua;.\\Scripts\\modifiers\\?.lua;.\\Scripts\\modules\\smns\\?.lua;.\\Scripts\\modifiers\\items\\?.lua;.\\Scripts\\modifiers\\units\\?.lua"
require('statscheck')
require('aura_hpm00_CurseProtection_Covered')

function _unitAura_ImmuneToAttack(unit, attack, prev)
	if prev == Immune.NotImmune and statsCheck_isCurseType(attack) then
		return Immune.Once
	end
	return prev
end
