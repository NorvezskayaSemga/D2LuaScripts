
-- Created by Norvezskaya Semga

require('selector')
require('common')

function _getTargets(methodName, attacker, selected, allies, targets, targetsAreAllies)
	local result = {}
	
	-- ���������� ������������� �� ���� � ������ ����, �������� �� selected
	
	-- ���������� ������������� �� ���� � ���� � "���������", ���� �������
	
	-- ����� ����� ��� �����������
	result = _selector_getTargets(methodName, attacker, selected, allies, targets, targetsAreAllies)
	
	-- ���������� ������������� �� ��������� ���������� �����
	
	-- ���������� ������������� �� ������
	
	return result
end

function _getChoices(methodName, attacker, selected, allies, targets, targetsAreAllies)
	local result = {}
	
	-- ������ ���������� ��� ����������
	
	-- ������ ���������� �� targets ����, ��� � ��� ������� ���
	
	-- ���������� ������������� �� ����� ���������
	
	-- ����� ��������� �����
	result = _selector_getChoices(methodName, attacker, selected, allies, targets, targetsAreAllies)
	
	-- ������������ ���� � ������ ��
	
	return result
end
