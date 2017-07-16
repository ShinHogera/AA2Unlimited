local stringrefs = {

[0x2D154] = "None",
[0xF054] = "None",
[0xEFE9] = "None",

[0x55322] = "Club Tournament",
[0x55329] = "Physical test",
[0x55330] = "Academic test",

[0xDBE64] = "Track",
[0xF4DE4] = "Track",
[0xF4E21] = "Swimming",
[0xDBF06] = "Swimming",
[0xF4E52] = "Baseball",
[0xDBFA6] = "Baseball",
[0xF4E94] = "Volley",
[0xDC04C] = "Volley",
[0xF4ECD] = "Dojo",
[0xDC0F2] = "Dojo",
[0xF4EE5] = "Fine arts",
[0xDC198] = "fine arts",
[0xF4F27] = "Culture",
[0xDC23B] = "Culture",
[0xF4F47] = "Other",
[0xDC2EA] = "Other",

[0xE1206] = "Outside Station",
[0xE100E] = "School route",
[0xE0FE4] = "School gates",
[0xE1053] = "Lockers",
[0xE107E] = "Outside classroom",
[0xE10EE] = "Classroom",
[0xE10E0] = "Library",
[0xE1142] = "Courtyard",
[0xE1061] = "Outside lounge",
[0xE10C4] = "Teachers lounge",
[0xE10D2] = "Infirmary",
[0xE108C] = "Rooftop access",
[0xE1117] = "Rooftop",
[0xE1126] = "Outside counsel",
[0xE1134] = "Outside cafeteria",
[0xE11F8] = "Cafeteria",
[0xE1070] = "Outside toilets",
[0xE10FC] = "Mens Toilets",
[0xE110A] = "Girls Toilets",
[0xE11E9] = "Outside dojo",
[0xE1196] = "Dojo",
[0xE11DC] = "Behind Dojo",
[0xE1000] = "Outside gymnasium",
[0xE11A4] = "Gymnaisum",
[0xE116C] = "Swimming pool",
[0xE117A] = "Track",
[0xE1188] = "Sports facility",
[0xE0FF2] = "Back street",
[0xE109A] = "Old building 1st floor",
[0xE101C] = "Mens changing room",
[0xE1038] = "Mens shower",
[0xE102A] = "Girls changing room",
[0xE1046] = "Girls shower",
[0xE10A8] = "Old building 2nd floor",
[0xE1150] = "2nd floor hallway",
[0xE10B6] = "Old building 3rd floor",
[0xE115E] = "3rd floor passage",
[0xE11B2] = "Arts room",
[0xE11C0] = "Multipurpose room",

}

return function()
	local buf = PagesX(16384)
	local str = ""
	for k,v in pairs(stringrefs) do
		GPokeD(k, buf + #str)
		str = str .. v:gsub(".", "%1\x00") .. "\x00\x00"
	end
	Poke(buf, str)
end



