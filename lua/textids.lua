--[[ Text ids for Disciples 2 Rise of the Elves v3.01 mss32 proxy dll ]]--

textids = {
	-- Interface text ids from either TApp.dbf or TAppEdit.dbf
	interf = {
		-- Defines text id to use as "sell all valuables" message.
		-- The text must contain keyword "%PRICE%".
		-- Fallback text is "Do you want to sell all valuables? Revenue will be:\n%PRICE%"
		sellAllValuables = "X015TA0001",

		-- Defines text id to use as "sell all items" message.
		-- The text must contain keyword "%PRICE%".
		-- Fallback text is "Do you want to sell all items? Revenue will be:\n%PRICE%"
		sellAllItems = "X015TA0003",

		-- Defines text id to mark Infinite attacks in unit encyclopedia.
		-- Fallback text is "Lasting".
		infiniteAttack = "X015TA0004",

		-- Defines text id to mark Critical Hit attacks in unit encyclopedia.
		-- Fallback text id is the standard "X160TA0017".
		critHitAttack = "",

		-- Defines text id to format Critical Hit damage in unit encyclopedia.
		-- The text must contain keywords "%DMG%" and "%CRIT%".
		-- Fallback text is "%DMG% (%CRIT%)".
		critHitDamage = "",

		-- Defines text id to format rated damage in unit encyclopedia.
		-- The text must contain keywords "%DMG%" and "%RATED%".
		-- Fallback text is "%DMG%, %RATED%".
		ratedDamage = "",

		-- Defines text id to format equal rated damage in unit encyclopedia.
		-- The text must contain keywords "%DMG%", %TARGETS% and "%RATED%".
		-- Fallback text is "%DMG%, (%TARGETS%x) %RATED%".
		ratedDamageEqual = "",

		-- Defines text id for rated damage separator in unit encyclopedia.
		-- Fallback text is ", ".
		ratedDamageSeparator = "",

		-- Defines text id to format split damage in unit encyclopedia.
		-- The text must contain keyword "%DMG%".
		-- Fallback text is "%DMG%, split between targets".
		splitDamage = "X015TA0006",
		
		
		-- Defines modified text representation in unit encyclopedia.
		-- Modified text includes attack name, source, reach, etc.
		-- The text must contain keyword "%VALUE%".
		-- Fallback text is "\c025;090;000;%VALUE%\c000;000;000;".
		modifiedValue = "",

		-- Defines modifiers list caption in unit encyclopedia.
		-- Fallback text is "\fMedBold;Effects:\fNormal;"
		modifiersCaption = "",

		-- Defines modifiers list caption in unit encyclopedia.
		-- Fallback text id is "X005TA0676" (empty leader abilities).
		modifiersEmpty = "",

		-- Defines format id for modifier description in unit encyclopedia.
		-- The text must contain keyword "%DESC%".
		-- Fallback text is "\vC;%DESC%"
		modifierDescription = "",

		-- Defines format id for native modifier description in unit encyclopedia.
		-- The text must contain keyword "%DESC%".
		-- Fallback text is "\vC;\fMedBold;%DESC%\fNormal;"
		nativeModifierDescription = "",
		
		
		-- Defines format id for drain description in unit encyclopedia.
		-- The text must contain keywords "%DRAINEFFECT%" and "%DRAIN%".
		-- Fallback text is "\fMedBold;%DRAINEFFECT%:\t\fNormal;%DRAIN%\n"
		drainDescription = "X015TA0008",

		-- Defines text id of drain effect in unit encyclopedia.
		-- Fallback text id is the standard "X005TA0792".
		drainEffect = "X015TA0009",

		-- Defines text id to mark Drain Overflow attacks in unit encyclopedia.
		-- Fallback text is "Overflow".
		overflowAttack = "X005TA0801",

		-- Defines text id to format Drain Overflow text in unit encyclopedia.
		-- The text must contain keywords "%ATTACK%" and "%OVERFLOW%".
		-- Fallback text is "%ATTACK% (%OVERFLOW%)".
		overflowText = "",
	},

	-- Text ids related to events logic
	events = {
		-- Text ids related to event conditions
		conditions = {
			-- Text ids for L_OWN_RESOURCE event condition
			ownResource = {
				-- Message to show when there are more than two conditions of type
				-- Fallback text is "At most two conditions of type "Own resource" is allowed per event."
				tooMany = "X150TA0612",
				-- Message to show when two conditions are mutually exclusive
				-- Fallback text is "Conditions of type "Own resource" are mutually exclusive."
				mutuallyExclusive = "X150TA0613",
			},
	
			-- Text ids for L_GAME_MODE event condition
			gameMode = {
				-- Message to show when there are more than one condition of type
				-- Fallback text "Only one condition of type "Game mode" is allowed per event."
				tooMany = "X150TA0614",
				-- Text id for single player game mode
				-- Fallback text "single player"
				single = "X150TA0590",
				-- Text id for hotseat game mode
				-- Fallback text "hotseat"
				hotseat = "X150TA0591",
				-- Text id for online game mode
				-- Fallback text "online"
				online = "X150TA0592",
			},
	
			-- Text ids for L_PLAYER_TYPE event condition
			playerType = {
				-- Message to show when there are more than one condition of type
				-- Fallback text "Only one condition of type "Player type" is allowed per event."
				tooMany = "X150TA0615",
				-- Text id for human player type
				-- Fallback text "human"
				human = "X150TA0594",
				-- Text id for AI player type
				-- Fallback text "AI"
				ai = "X150TA0595",
			},

			-- Text ids for L_VARIABLE_CMP event condition
			variableCmp = {
				-- Text id for equality comparison
				-- Fallback text "is equal to"
				equal = "X150TA0616",
				-- Text id for difference comparison
				-- Fallback text "is not equal to"
				notEqual = "X150TA0617",
				-- Fallback text "is greater than"
				greater = "X150TA0618",
				-- Fallback text "is greater or equal to"
				greaterEqual = "X150TA0619",
				-- Fallback text "is less than"
				less = "X150TA0620",
				-- Fallback text "is less or equal to"
				lessEqual = "X150TA0621",
			},
		},
	},
}
