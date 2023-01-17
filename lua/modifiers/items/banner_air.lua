

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getImmuneToSource(unit, source, prev)
	if source == Source.Air and prev ~= Immune.Always then
		return Immune.Once
	end
	return prev
end

