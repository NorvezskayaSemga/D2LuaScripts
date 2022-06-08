
-- Created by Norvezskaya Semga

require('selector')
require('common')

function _getTargets(methodName, attacker, selected, allies, targets, targetsAreAllies)
	local result = {}
	
	-- применение модификаторов на удар в другую цель, отличную от selected
	
	-- применение модификаторов на удар в цель с "насмешкой", если достаем
	
	-- выбор целей для способности
	result = _selector_getTargets(methodName, attacker, selected, allies, targets, targetsAreAllies)
	
	-- применение модификаторов на изменение количества целей
	
	-- применение модификаторов на уворот
	
	return result
end

function _getChoices(methodName, attacker, selected, allies, targets, targetsAreAllies)
	local result = {}
	
	-- логика исключения для карманницы
	
	-- логика исключения из targets того, кто и так получит баф
	
	-- применение модификаторов на смену дальности
	
	-- выбор возможных целей
	result = _selector_getChoices(methodName, attacker, selected, allies, targets, targetsAreAllies)
	
	-- корректируем цели в случае ИИ
	
	return result
end
