

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getNameTxt(unit, prev)
	local id = unit.baseImpl.id
	if id == Id.new("g000uu8027") or id == Id.new("g000uu8241") then
		-- archont
		return Id.new("x012tg1323")
	elseif id == Id.new("g000uu5025") or id == Id.new("g000uu0151") or id == Id.new("g000uu8214") or id == Id.new("g000uu8215") then
		-- gorgone, soothsayer, driolissa
		return Id.new("x012tg1325")
	elseif id == Id.new("g000uu5026") or id == Id.new("g000uu5126") or id == Id.new("g000uu5021") or id == Id.new("g000uu5121") then
		-- mermaid, blue dragon
		return Id.new("x012tg1327")
	elseif id == Id.new("g000uu8006") or id == Id.new("g000uu8106") then
		-- elf seer
		return Id.new("x012tg1329")
	elseif id == Id.new("g000uu6109") or id == Id.new("g000uu6009") then
		-- woman necromancer
		return Id.new("x012tg1331")
	elseif id == Id.new("g001uu7602") or id == Id.new("g000uu7602") then
		-- spy
		return Id.new("x012tg1333")
	elseif id == Id.new("g001uu0046") or id == Id.new("g000uu8249") then
		-- scientist
		return Id.new("x012tg1335")
	elseif id == Id.new("g001uu0021") or id == Id.new("g000uu8248") then
		-- archmage
		return Id.new("x012tg1337")
	elseif id == Id.new("g000uu0163") or id == Id.new("g000uu5363") then
		-- hermit
		return Id.new("x012tg1339")
	elseif id == Id.new("g000uu6105") or id == Id.new("g000uu6005") or id == Id.new("g000uu8101") or id == Id.new("g000uu8001") then
		-- hugin, nebiros
		return Id.new("x012tg1341")
	end
	return prev
end

function getDescTxt(unit, prev)
	local id = unit.baseImpl.id
	if id == Id.new("g000uu8027") or id == Id.new("g000uu8241") then
		-- archont
		return Id.new("x012tg1324")
	elseif id == Id.new("g000uu5025") or id == Id.new("g000uu0151") or id == Id.new("g000uu8214") or id == Id.new("g000uu8215") then
		-- gorgone, soothsayer, driolissa
		return Id.new("x012tg1326")
	elseif id == Id.new("g000uu5026") or id == Id.new("g000uu5126") or id == Id.new("g000uu5021") or id == Id.new("g000uu5121") then
		-- mermaid, blue dragon
		return Id.new("x012tg1328")
	elseif id == Id.new("g000uu8006") or id == Id.new("g000uu8106") then
		-- elf seer
		return Id.new("x012tg1330")
	elseif id == Id.new("g000uu6109") or id == Id.new("g000uu6009") then
		-- woman necromancer
		return Id.new("x012tg1332")
	elseif id == Id.new("g001uu7602") or id == Id.new("g000uu7602") then
		-- spy
		return Id.new("x012tg1334")
	elseif id == Id.new("g001uu0046") or id == Id.new("g000uu8249") then
		-- scientist
		return Id.new("x012tg1336")
	elseif id == Id.new("g001uu0021") or id == Id.new("g000uu8248") then
		-- archmage
		return Id.new("x012tg1338")
	elseif id == Id.new("g000uu0163") or id == Id.new("g000uu5363") then
		-- hermit
		return Id.new("x012tg1340")
	elseif id == Id.new("g000uu6105") or id == Id.new("g000uu6005") or id == Id.new("g000uu8101") or id == Id.new("g000uu8001") then
		-- hugin, nebiros
		return Id.new("x012tg1342")
	end
	return prev
end
