

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getNameTxt(unit, prev)
	local id = unit.baseImpl.id
	if id == Id.new("g000uu7617") or id == Id.new("g001uu7617") then
		-- balduin
		return Id.new("x012tg1362")
	elseif id == Id.new("g000uu7541") or id == Id.new("g001uu7541") then
		-- balfieru
		return Id.new("x012tg1364")
	elseif id == Id.new("g000uu7597") or id == Id.new("g001uu7597") then
		-- homunculus
		return Id.new("x012tg1366")
	elseif id == Id.new("g000uu8219") or id == Id.new("g000uu8223") then
		-- ungatlick
		return Id.new("x012tg1368")
	elseif id == Id.new("g000uu6006") or id == Id.new("g000uu6106") then
		-- yara
		return Id.new("x012tg1370")
	
	end
	return prev
end

function getDescTxt(unit, prev)
	local id = unit.baseImpl.id
	if id == Id.new("g000uu7617") or id == Id.new("g001uu7617") then
		-- balduin
		return Id.new("x012tg1363")
	elseif id == Id.new("g000uu7541") or id == Id.new("g001uu7541") then
		-- balfieru
		return Id.new("x012tg1365")
	elseif id == Id.new("g000uu7597") or id == Id.new("g001uu7597") then
		-- homunculus
		return Id.new("x012tg1367")
	elseif id == Id.new("g000uu8219") or id == Id.new("g000uu8223") then
		-- ungatlick
		return Id.new("x012tg1369")
	elseif id == Id.new("g000uu6006") or id == Id.new("g000uu6106") then
		-- yara
		return Id.new("x012tg1371")
	
	end
	return prev
end
