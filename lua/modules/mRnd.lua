
-- ���� �� 0 �� 100
function _mRnd_simpleRndEvent(chance)
	if chance > 0 then
		if chance >= _mRnd_RndNum(100) then
			return true
		end
	end
	return false
end

-- ������ ����� ����� �� 1 �� maxValue (������������)
function _mRnd_RndNum(maxValue)
	return  math.random(maxValue)
end
