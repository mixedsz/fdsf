Config = {
	--[[
	Discord Role-based Chat Tags
	=============================
	List in order of LEAST priority to HIGHEST priority.
	Highest priority role will override roles before it.

	Format: {'DISCORD_ROLE_ID', "^7OOC | ^COLOR[EMOJI TAG] | "}

	Colors:
	^0 = White, ^1 = Red, ^2 = Green, ^3 = Yellow/Gold
	^4 = Blue, ^5 = Light Blue, ^6 = Purple, ^7 = White

	HOW TO GET DISCORD ROLE IDS:
	1. Enable Developer Mode in Discord (Settings > Advanced > Developer Mode)
	2. Right-click on any role in Server Settings > Roles
	3. Click "Copy Role ID"
	4. Paste the ID below
	]]--
	roleList = {
		-- Default (everyone without a role)
		{'0', "^7OOC | ^2[✈️Civilian] | "},

		-- Community Roles (lowest priority)
		{'ROLE_ID_HERE', "^7OOC | ^3[👪Homies] | "},
		{'ROLE_ID_HERE', "^7OOC | ^6[🚀Server Booster] | "},
		{'ROLE_ID_HERE', "^7OOC | ^6[🎉Streamer] | "},
		{'ROLE_ID_HERE', "^7OOC | ^4[💸Donator] | "},
		{'ROLE_ID_HERE', "^7OOC | ^4[💎VIP] | "},

		-- Gang/Faction Roles
		{'ROLE_ID_HERE', "^7OOC | ^2[🌿Grove Street] | "},
		{'ROLE_ID_HERE', "^7OOC | ^4[🔵Crips] | "},
		{'ROLE_ID_HERE', "^7OOC | ^1[🔴Bloods] | "},
		{'ROLE_ID_HERE', "^7OOC | ^3[🟡Vagos] | "},

		-- Staff Roles (higher priority)
		{'ROLE_ID_HERE', "^7OOC | ^7[✨Trial Moderator] | "},
		{'ROLE_ID_HERE', "^7OOC | ^7[💚Moderator] | "},
		{'ROLE_ID_HERE', "^7OOC | ^7[💗Senior Moderator] | "},
		{'ROLE_ID_HERE', "^7OOC | ^7[💙Head Moderator] | "},
		{'ROLE_ID_HERE', "^7OOC | ^1[❤️Administrator] | "},
		{'ROLE_ID_HERE', "^7OOC | ^1[🧡Senior Administrator] | "},
		{'ROLE_ID_HERE', "^7OOC | ^1[💛Head Administrator] | "},

		-- Management Roles (high priority)
		{'ROLE_ID_HERE', "^7OOC | ^5[🖤Management] | "},
		{'ROLE_ID_HERE', "^7OOC | ^5[💗Community Management] | "},
		{'ROLE_ID_HERE', "^7OOC | ^5[⭐Head Of Management] | "},

		-- Developer Roles
		{'ROLE_ID_HERE', "^7OOC | ^0[💻Developer] | "},
		{'ROLE_ID_HERE', "^7OOC | ^0[🔧Lead Developer] | "},

		-- Owner/Director (highest priority - shows last)
		{'ROLE_ID_HERE', "^7OOC | ^6[👑Co-Owner] | "},
		{'ROLE_ID_HERE', "^7OOC | ^6[👑Owner] | "},
		{'ROLE_ID_HERE', "^7OOC | ^6[👑Director] | "},
	},

	-- Which role indices can use colored text (numbers correspond to position in roleList)
	allowedColors = {2, 3, 4, 5, 6},
	allowedRed = {15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25},
	allowedEmoji = {3, 7, 8, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25},

	sendBlockMessages = true,

	-- Color patterns available to specific roles
	ColorPatterns = {
		['DiscordChatRoles.Access.Donator'] = {
			['White'] = {'^0'},
			['Green'] = {'^2'},
			['Yellow'] = {'^3'},
			['Blue'] = {'^4'},
			['Light Blue'] = {'^5'},
			['Purple'] = {'^6'},
			['Pink'] = {'^7'},
			['Police'] = {'^1', '^4'},
			['Christmas'] = {'^2', '^1'},
		},
		['DiscordChatRoles.Access.Elite'] = {
			['RainbowYGB'] = {'^3', '^2', '^4'},
			['RainbowFull'] = {'^3', '^4', '^1', '^5', '^6', '^7'},
		},
		['DiscordChatRoles.Access.Staff'] = {
			['Red'] = {'^1'},
		}
	},

	-- Emoji shortcuts for chat
	emojis = {
		[":eyes:"] = '👀',
		[":thinking:"] = '🤔',
		[":rage:"] = '😡',
		[":alien:"] = '👽',
		[":nauseated_face:"] = '🤢',
		[":innocent:"] = '😇',
		[":sunglasses:"] = '😎',
		[":star_struck:"] = '🤩',
		[":nerd:"] = '🤓',
		[":face_with_symbols_over_mouth:"] = '🤬',
		[":joy:"] = '😂',
		[":rofl:"] = '🤣',
		[":face_vomiting:"] = '🤮',
		[":cold_face:"] = '🥶',
		[":heart_eyes:"] = '😍',
		[":kissing_heart:"] = '😘',
		[":smiling_imp:"] = '😈',
		[":grin:"] = '😁',
		[":exploding_head:"] = '🤯',
		[":stuck_out_tongue:"] = '😛',
		[":grimacing:"] = '😬',
		[":scream:"] = '😱',
		[":smiley:"] = '😃',
		[":face_with_raised_eyebrow:"] = '🤨',
		[":triumph:"] = '😤',
		[":kissing:"] = '😗',
		[":kissing_smiling_eyes:"] = '😙',
		[":fearful:"] = '😨',
		[":wink:"] = '😉',
		[":smiling_face_with_3_hearts:"] = '🥰',
		[":partying_face:"] = '🥳',
		[":sob:"] = '😭',
		[":thumbsup:"] = '👍',
		[":thumbsdown:"] = '👎',
		[":punch:"] = '👊',
		[":pray:"] = '🙏',
		[":face_with_monocle:"] = '🧐',
		[":smirk:"] = '😏',
		[":cold_sweat:"] = '😰',
		[":disappointed_relieved:"] = '😥',
		[":angry:"] = '😠',
		[":relieved:"] = '😌',
		[":worried:"] = '😟',
		[":confused:"] = '😕',
		[":upside_down:"] = '🙃',
		[":clown:"] = '🤡',
		[":mask:"] = '😷',
		[":shushing_face:"] = '🤫',
		[":yawning_face:"] = '🥱',
		[":imp:"] = '👿',
		[":lying_face:"] = '🤥',
		[":sweat:"] = '😓',
		[":frowning2:"] = '☹️',
		[":pleading_face:"] = '🥺',
		[":stuck_out_tongue_winking_eye:"] = '😜',
		[":hugging:"] = '🤗',
		[":no_mouth:"] = '😶',
		[":neutral_face:"] = '😐',
		[":flushed:"] = '😳',
		[":rolling_eyes:"] = '🙄',
		[":expressionless:"] = '😑',
		[":hot_face:"] = '🥵',
		[":sneezing_face:"] = '🤧',
		[":poop:"] = '💩',
		[":money_mouth:"] = '🤑',
		[":sleeping:"] = '😴',
		[":ghost:"] = '👻',
		[":zipper_mouth:"] = '🤐',
		[":sweat_smile:"] = '😅',
		[":detective:"] = '🕵️',
		[":wave:"] = '👋',
		[":drooling_face:"] = '🤤',
		[":head_bandage:"] = '🤕',
		[":cowboy:"] = '🤠',
		[":skull:"] = '💀',
		[":busts_in_silhouette:"] = '👥',
		[":eye:"] = '👁️',
		[":kiss:"] = '💋',
		[":brain:"] = '🧠',
		[":call_me:"] = '🤙',
		[":man_farmer:"] = '👨‍🌾',
		[":woman_farmer:"] = '👩‍🌾',
		[":man_police_officer:"] = '👮‍',
		[":woman_police_officer:"] = '👮‍',
		[":man_raising_hand:"] = '🙋‍',
		[":panda_face:"] = '🐼',
		[":pig:"] = '🐷',
		[":woozy_face:"] = '🥴',
		[":airplane:"] = '✈️',
		[":star2:"] = '🌟',
		[":fire:"] = '🔥',
		[":money_with_wings:"] = '💸',
		[":cloud_rain:"] = '🌧️',
		[":flying_saucer:"] = '🛸',
		[":rocket:"] = '🚀',
		[":gun:"] = '🔫',
		[":tools:"] = '🛠️',
		[":100:"] = '💯',
		[":cap:"] = '🧢',
		[":no_cap:"] = '🚫🧢',
		[":gang:"] = '🔫',
		[":rz:"] = '🔴',
		[":money:"] = '💰',
		[":bag:"] = '💼',
	},
}
