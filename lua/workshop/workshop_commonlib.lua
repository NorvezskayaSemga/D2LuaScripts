
-- ����� �������� ���������� ��������, ����� �������� workshopEnabled = true
-- ��� ���������� ����� workshopEnabled = false
workshopEnabled = false

-- ������ ����

----------------------------
-- ��� ������ ������� �� ����
----------------------------
require('workshop_enums')
require('workshop_spread')

if not workshopEnabled then
	return nil
end

require('workshop_player_settings_class')

function Workshop_CreatePlayer()
	local p = WorkshopPlayer:new(nil)
	p:init()
	return p
end

local player1 = Workshop_CreatePlayer()
local player2 = Workshop_CreatePlayer()
local player3 = Workshop_CreatePlayer()
local player4 = Workshop_CreatePlayer()
local player5 = Workshop_CreatePlayer()
local player6 = Workshop_CreatePlayer()
local player7 = Workshop_CreatePlayer()
local player8 = Workshop_CreatePlayer()
local player9 = Workshop_CreatePlayer()

local playersArray = nil
function Workshop_GetPlayer(race)
	if playersArray == nil then
		playersArray = {}
		local players = {player1, player2, player3, player4, player5, player6, player7, player8, player9}
		for i=1, #players do
			if players[i]:get_race() ~= nil then
				playersArray[players[i]:get_race()] = players[i]
			end
		end
	end
	return playersArray[race]
end

----------------------------
-- ������ ����� ���-�� ������
----------------------------

-- ���� ����� ���������� ��������� ��� �������
-- � workshop_example.txt �������� ������ �������� ��� ���� �������

-- ���� � ���, ��� ��� ������ ���� (������) ��������� �������� ��������
-- ���� ���� ���������� player1, player2, player3, player4 � player5
-- �������� ����� (����� ����� player2) � ���������, ��� ��� ��������� ����� ���������� � ���� ������ � ������� set_race(value), ������� player2:set_race(Race.Undead)
-- ��� ������ ������ ����, ������ � info_player_settings.txt

-- ����� ����� ������� ������ ��� ������� (��� ��� ����� �������� �� ����� ��������)
-- � ���������� �������� �������� ��� ������, ��������:
-- player2:get_yourTerrainStatsBonus():set_baseNegotiate_Flat(15)
-- ��� ��� ������:
-- ������ ������ 2:�������� �� ����� ����������:����� � ������������� ��������� ����� � ������� 15
-- [�� �������� ��������� � ������]

-- � info_player_settings.txt ����� ����������, ����� ������� � ���� ������� ��������
-- ��� �� ����� �������� �������, ����� ������ ���� � ��� �� ��������

-- � �����, ��������� ������� ������ ������� �� info_player_settings.txt, info_unit_stats_settings.txt � info_special_settings.txt,
-- ����� ��������� ����, ����� � � ���� ������ ���� ������


-- {Race.Human, Race.Undead, Race.Heretic, Race.Dwarf, Race.Elf, Race.Neutral}

local b_initiative = 0.75
local b_power = 0.5
local b_armor = 0.5
local b_drain = 1.5
local b_critdmg = 1.0
local b_sresist_1 = {[Source.Water] = 0.1, [Source.Earth] = 0.05}
local b_sresist_2 = {[Source.Air] = 0.1, [Source.Fire] = 0.05}
local b_leadership = 0.25
local b_regen = 1.5

-----------------------

player1:set_race(Race.Human)
player2:set_race(Race.Undead)

-----------------------

player1:get_perGroupLevelsSumBonus(GroupLeaderType.Fighter):set_baseAttackInitiative_Percent(b_initiative)
player1:get_perGroupLevelsSumBonus(GroupLeaderType.Fighter):set_baseAttack1Power_Percent(b_power)
player1:get_perGroupLevelsSumBonus(GroupLeaderType.Fighter):set_baseAttack2Power_Percent(b_power)

player1:get_perGroupLevelsSumBonus(GroupLeaderType.Mage):set_baseArmor_Flat(b_armor)
player1:get_perGroupLevelsSumBonus(GroupLeaderType.Mage):set_Attack1Drain_Flat(b_drain)
player1:get_perGroupLevelsSumBonus(GroupLeaderType.Mage):set_Attack2Drain_Flat(b_drain)

player1:get_perGroupLevelsSumBonus(GroupLeaderType.Explorer):set_Attack1CritDamage_Flat(b_critdmg)
player1:get_perGroupLevelsSumBonus(GroupLeaderType.Explorer):set_Attack2CritDamage_Flat(b_critdmg)
player1:get_perGroupLevelsSumBonus(GroupLeaderType.Explorer):set_ImmuneToSource_Once(b_sresist_1)

player1:get_perGroupLevelsSumBonus(GroupLeaderType.Rod):set_Leadership_Flat(b_leadership)
player1:get_perGroupLevelsSumBonus(GroupLeaderType.Rod):set_baseRegen_Flat(b_regen)

-----------------------

player2:get_perGroupLevelsSumBonus(GroupLeaderType.Fighter):set_baseAttackInitiative_Percent(b_initiative)
player2:get_perGroupLevelsSumBonus(GroupLeaderType.Fighter):set_baseAttack1Power_Percent(b_power)
player2:get_perGroupLevelsSumBonus(GroupLeaderType.Fighter):set_baseAttack2Power_Percent(b_power)

player2:get_perGroupLevelsSumBonus(GroupLeaderType.Mage):set_baseArmor_Flat(b_armor)
player2:get_perGroupLevelsSumBonus(GroupLeaderType.Mage):set_Attack1Drain_Flat(b_drain)
player2:get_perGroupLevelsSumBonus(GroupLeaderType.Mage):set_Attack2Drain_Flat(b_drain)

player2:get_perGroupLevelsSumBonus(GroupLeaderType.Explorer):set_Attack1CritDamage_Flat(b_critdmg)
player2:get_perGroupLevelsSumBonus(GroupLeaderType.Explorer):set_Attack2CritDamage_Flat(b_critdmg)
player2:get_perGroupLevelsSumBonus(GroupLeaderType.Explorer):set_ImmuneToSource_Once(b_sresist_2)

player2:get_perGroupLevelsSumBonus(GroupLeaderType.Rod):set_Leadership_Flat(b_leadership)
player2:get_perGroupLevelsSumBonus(GroupLeaderType.Rod):set_baseRegen_Flat(b_regen)

