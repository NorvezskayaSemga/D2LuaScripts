
function _smallEnthInfo_aReach(unit)
	local level = unit.impl.level
	if level < 5 then
		return 103
	elseif level < 10 then
		return 102
	elseif level < 15 then
		return 10
	else
		return 101
	end
end
