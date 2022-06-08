
-- шанс от 0 до 100
function _mRnd_simpleRndEvent(chance)
	if chance > 0 then
		if chance >= _mRnd_RndNum(100) then
			return true
		end
	end
	return false
end

-- вернет целое число от 1 до maxValue (включительно)
function _mRnd_RndNum(maxValue)
	return  math.random(maxValue)
end
