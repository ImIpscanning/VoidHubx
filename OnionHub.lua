-- OnionHub main.lua — integrated distribution
-- Contains the complete supplied Quantum main, Claude's Onion splash,
-- Data and Weebo, plus original upstream UI/Visuals modules.
-- UI replaced with the supplied Ice-style Onion Project adapter; Visuals remains upstream.
-- Compilation is checked separately from Roblox runtime compatibility.
-- Configure before executing: getgenv().OnionHubConfig = {
--     EnableEventReports = false, -- opt in to reports to api.quantumonyx.cc
--     ReloadURL = "",            -- your hosted Onion main.lua URL
-- }
assert(type(loadstring) == "function", "Onion requires a Luau client with loadstring")
local OnionEnvironment = (getgenv and getgenv()) or _G
if OnionEnvironment.OnionHubBooting or OnionEnvironment.OnionHubActive then
    warn("[OnionHub] Already starting or active")
    return
end
OnionEnvironment.OnionHubBooting = true
local OnionConfig = OnionEnvironment.OnionHubConfig or {}
local OnionBundle = {}

OnionBundle["Util/BloxFruitModule/Preload/Data.lua"] = [=[
return {
	QUESTS = {
		Sea_1 = {
			{1, 9, "Team-dependent", "Team-dependent", 1},
			{10, 14, "Monkey", "JungleQuest", 1},
			{15, 29, "Gorilla", "JungleQuest", 2, "The Gorilla King", 20},
			{30, 39, "Pirate", "BuggyQuest1", 1},
			{40, 59, "Brute", "BuggyQuest1", 2, "Chief", 55},
			{60, 74, "Desert Bandit", "DesertQuest", 1},
			{75, 89, "Desert Officer", "DesertQuest", 2},
			{90, 99, "Snow Bandit", "SnowQuest", 1},
			{100, 119, "Snowman", "SnowQuest", 2, "Yeti", 105},
			{120, 149, "Chief Petty Officer", "MarineQuest2", 1, "Vice Admiral", 130},
			{150, 174, "Sky Bandit", "SkyQuest", 1},
			{175, 189, "Dark Master", "SkyQuest", 2},
			{190, 209, "Prisoner", "PrisonerQuest", 1},
			{210, 249, "Dangerous Prisoner", "PrisonerQuest", 2, {"Warden", 220, "ImpelQuest", 1}, {"Chief Warden", 230, "ImpelQuest", 2}, {"Swan", 240, "ImpelQuest", 3}},
			{250, 274, "Toga Warrior", "ColosseumQuest", 1},
			{275, 299, "Gladiator", "ColosseumQuest", 2},
			{300, 324, "Military Soldier", "MagmaQuest", 1},
			{325, 374, "Military Spy", "MagmaQuest", 2, "Magma Admiral", 350},
			{375, 399, "Fishman Warrior", "FishmanQuest", 1},
			{400, 449, "Fishman Commando", "FishmanQuest", 2, "Fishman Lord", 425},
			{450, 474, "God's Guard", "SkyExp1Quest", 1},
			{475, 524, "Shanda", "SkyExp1Quest", 2, "Wysper", 500},
			{525, 549, "Royal Squad", "SkyExp2Quest", 1},
			{550, 624, "Royal Soldier", "SkyExp2Quest", 2, "Thunder God", 575},
			{625, 649, "Galley Pirate", "FountainQuest", 1},
			{650, 9999, "Galley Captain", "FountainQuest", 2, "Cyborg", 675},
		},
		Sea_2 = {
			{700, 724, "Raider", "Area1Quest", 1},
			{725, 774, "Mercenary", "Area1Quest", 2, "Diamond", 750},
			{775, 799, "Swan Pirate", "Area2Quest", 1},
			{800, 874, "Factory Staff", "Area2Quest", 2, "Jeremy", 850},
			{875, 899, "Marine Lieutenant", "MarineQuest3", 1},
			{900, 949, "Marine Captain", "MarineQuest3", 2, "Orbitus", 925},
			{950, 974, "Zombie", "ZombieQuest", 1},
			{975, 999, "Vampire", "ZombieQuest", 2},
			{1000, 1049, "Snow Trooper", "SnowMountainQuest", 1},
			{1050, 1099, "Winter Warrior", "SnowMountainQuest", 2},
			{1100, 1124, "Lab Subordinate", "IceSideQuest", 1},
			{1125, 1174, "Horned Warrior", "IceSideQuest", 2, "Smoke Admiral", 1150},
			{1175, 1199, "Magma Ninja", "FireSideQuest", 1},
			{1200, 1249, "Lava Pirate", "FireSideQuest", 2},
			{1250, 1274, "Ship Deckhand", "ShipQuest1", 1},
			{1275, 1299, "Ship Engineer", "ShipQuest1", 2},
			{1300, 1324, "Ship Steward", "ShipQuest2", 1},
			{1325, 1349, "Ship Officer", "ShipQuest2", 2},
			{1350, 1374, "Arctic Warrior", "FrostQuest", 1},
			{1375, 1424, "Snow Lurker", "FrostQuest", 2, "Awakened Ice Admiral", 1400},
			{1425, 1449, "Sea Soldier", "ForgottenQuest", 1},
			{1450, 9999, "Water Fighter", "ForgottenQuest", 2, "Tide Keeper", 1475},
		},
		Sea_3 = {
			{1500, 1524, "Pirate Millionaire", "PiratePortQuest", 1},
			{1525, 1574, "Pistol Billionaire", "PiratePortQuest", 2},
			{1575, 1599, "Dragon Crew Warrior", "DragonCrewQuest", 1},
			{1600, 1624, "Dragon Crew Archer", "DragonCrewQuest", 2},
			{1625, 1649, "Hydra Enforcer", "VenomCrewQuest", 1},
			{1650, 1699, "Venomous Assailant", "VenomCrewQuest", 2},
			{1700, 1724, "Marine Commodore", "MarineTreeIsland", 1},
			{1725, 1774, "Marine Rear Admiral", "MarineTreeIsland", 2},
			{1775, 1799, "Fishman Raider", "DeepForestIsland3", 1},
			{1800, 1824, "Fishman Captain", "DeepForestIsland3", 2},
			{1825, 1849, "Forest Pirate", "DeepForestIsland", 1},
			{1850, 1899, "Mythological Pirate", "DeepForestIsland", 2},
			{1900, 1924, "Jungle Pirate", "DeepForestIsland2", 1},
			{1925, 1974, "Musketeer Pirate", "DeepForestIsland2", 2},
			{1975, 1999, "Reborn Skeleton", "HauntedQuest1", 1},
			{2000, 2024, "Living Zombie", "HauntedQuest1", 2},
			{2025, 2049, "Demonic Soul", "HauntedQuest2", 1},
			{2050, 2074, "Posessed Mummy", "HauntedQuest2", 2},
			{2075, 2099, "Peanut Scout", "NutsIslandQuest", 1},
			{2100, 2124, "Peanut President", "NutsIslandQuest", 2},
			{2125, 2149, "Ice Cream Chef", "IceCreamIslandQuest", 1},
			{2150, 2199, "Ice Cream Commander", "IceCreamIslandQuest", 2},
			{2200, 2224, "Cookie Crafter", "CakeQuest1", 1},
			{2225, 2249, "Cake Guard", "CakeQuest1", 2},
			{2250, 2274, "Baking Staff", "CakeQuest2", 1},
			{2275, 2299, "Head Baker", "CakeQuest2", 2},
			{2300, 2324, "Cocoa Warrior", "ChocQuest1", 1},
			{2325, 2349, "Chocolate Bar Battler", "ChocQuest1", 2},
			{2350, 2374, "Sweet Thief", "ChocQuest2", 1},
			{2375, 2399, "Candy Rebel", "ChocQuest2", 2},
			{2400, 2424, "Candy Pirate", "CandyQuest1", 1},
			{2425, 2449, "Snow Demon", "CandyQuest1", 2},
			{2450, 2474, "Isle Outlaw", "TikiQuest1", 1},
			{2475, 2499, "Island Boy", "TikiQuest1", 2},
			{2500, 2524, "Sun-kissed Warrior", "TikiQuest2", 1},
			{2525, 2549, "Isle Champion", "TikiQuest2", 2},
			{2550, 2574, "Serpent Hunter", "TikiQuest3", 1},
			{2575, 2599, "Skull Slayer", "TikiQuest3", 2},
			{2600, 2624, "Reef Bandit", "SubmergedQuest1", 1},
			{2625, 2649, "Coral Pirate", "SubmergedQuest1", 2},
			{2650, 2674, "Sea Chanter", "SubmergedQuest2", 1},
			{2675, 2699, "High Disciple", "SubmergedQuest3", 1},
			{2700, 9999, "Grand Devotee", "SubmergedQuest3", 2},
		}
	},
	BossList = {
		Sea_1 = {
			{20, "The Gorilla King", "JungleQuest", 3, CFrame.new(-1602, 37, 153)},
			{55, "Chief", "BuggyQuest1", 2, CFrame.new(-1140, 5, 3827)},
			{105, "Yeti", "SnowQuest", 3, CFrame.new(1387, 87, -1298)},
			{130, "Vice Admiral", "MarineQuest2", 2, CFrame.new(-5036, 29, 4325)},
			{220, "Warden", "ImpelQuest", 1, CFrame.new(5192, 3, 686)},
			{230, "Chief Warden", "ImpelQuest", 2, CFrame.new(5192, 3, 686)},
			{240, "Swan", "ImpelQuest", 3, CFrame.new(5192, 3, 686)},
			{350, "Magma Admiral", "MagmaQuest", 3, CFrame.new(-5315, 12, 8517)},
			{425, "Fishman Lord", "FishmanQuest", 3, CFrame.new(61123, 18, 1569)},
			{500, "Wysper", "SkyExp1Quest", 3, CFrame.new(-7862, 5546, -380)},
			{575, "Thunder God", "SkyExp2Quest", 3, CFrame.new(-7903, 5636, -1411)},
			{675, "Cyborg", "FountainQuest", 3, CFrame.new(5258, 39, 4050)},
		},
		Sea_2 = {
			{750, "Diamond", "Area1Quest", 3, CFrame.new(-428, 73, 1835)},
			{850, "Jeremy", "Area2Quest", 3, CFrame.new(637, 73, 918)},
			{925, "Orbitus", "MarineQuest3", 3, CFrame.new(-2442, 73, -3218)},
			{1150, "Smoke Admiral", "IceSideQuest", 3, CFrame.new(-5429, 16, -5298)},
			{1400, "Awakened Ice Admiral", "FrostQuest", 3, CFrame.new(5669, 29, -6483)},
			{1475, "Tide Keeper", "ForgottenQuest", 3, CFrame.new(-3054, 237, -10145)},
		},
		Sea_3 = {
			{1575, "Stone", "PiratePortQuest", 3, CFrame.new(-290, 44, 5580)},
			{1775, "Kilo Admiral", "MarineTreeIsland", 3, CFrame.new(2179, 29, -6740)},
			{1875, "Captain Elephant", "DeepForestIsland", 3, CFrame.new(-13233, 332, -7626)},
			{1950, "Beautiful Pirate", "DeepForestIsland2", 3, CFrame.new(-12682, 391, -9902)},
			{2175, "Cake Queen", "IceCreamIslandQuest", 3, CFrame.new(-819, 65, -10967)},
		}
	},
	MaterialEnemies = {
		Sea_1 = {
			["Angel Wings"] = { "Shanda", "Royal Squad", "Royal Soldier", "Wysper", "Thunder God" },
			["Leather + Scrap Metal"] = { "Brute", "Pirate" },
			["Magma Ore"] = { "Military Soldier", "Military Spy", "Magma Admiral" },
			["Fish Tail"] = { "Fishman Warrior", "Fishman Commando", "Fishman Lord" },
		},
		Sea_2 = {
			["Leather + Scrap Metal"] = { "Marine Captain" },
			["Magma Ore"] = { "Magma Ninja", "Lava Pirate" },
			["Ectoplasm"] = { "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer" },
			["Mystic Droplet"] = { "Water Fighter" },
			["Radioactive Material"] = { "Factory Staff" },
			["Vampire Fang"] = { "Vampire" },
		},
		Sea_3 = {
			["Leather + Scrap Metal"] = { "Jungle Pirate" },
			["Demonic Wisp"] = { "Demonic Soul" },
			["Fish Tail"] = { "Fishman Raider", "Fishman Captain" },
			["Conjured Cocoa"] = { "Chocolate Bar Battler", "Cocoa Warrior" },
			["Dragon Scale"] = { "Dragon Crew Archer", "Dragon Crew Warrior" },
			["Gunpowder"] = { "Pistol Billionaire" },
			["Mini Tusk"] = { "Mythological Pirate" },
			["Nightmare Catcher"] = { "Reborn Skeleton", "Living Zombie" },
		}
	},
	Materials = {
		Sea_1 = { "Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail" },
		Sea_2 = { "Leather + Scrap Metal", "Radioactive Material", "Ectoplasm", "Mystic Droplet", "Magma Ore", "Vampire Fang" },
		Sea_3 = { "Leather + Scrap Metal", "Demonic Wisp", "Conjured Cocoa", "Dragon Scale", "Gunpowder", "Fish Tail", "Mini Tusk", "Nightmare Catcher" }
	},
	BossNames = {
		Sea_1 = { "The Gorilla King", "Chief", "Yeti", "Vice Admiral", "Warden", "Chief Warden", "Swan", "Magma Admiral", "Fishman Lord", "Wysper", "Thunder God", "Cyborg", "Saw" },
		Sea_2 = { "Diamond", "Jeremy", "Orbitus", "Smoke Admiral", "Awakened Ice Admiral", "Tide Keeper", "Don Swan" },
		Sea_3 = { "Stone", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Cake Queen" }
	},
	MeleeNames = {
		Sea_1 = { "Black Leg", "Electro", "Fishman Karate" },
		Sea_2 = { "Death Step", "Dragon Claw", "Sharkman Karate", "Superhuman" },
		Sea_3 = { "Dragon Talon", "Electric Claw", "Godhuman", "Sanguine Art" }
	},
	Melees = {
		["Black Leg"] = {
			Model = "Dark Step Teacher",
			Npc = "Dark Step Teacher",
			npc = "Dark Step Teacher",
			CFrame = CFrame.new(-1147.284, 4.752, 3816.326),
			cframe = CFrame.new(-1147.284, 4.752, 3816.326),
			Remote = { "BuyBlackLeg" },
			remote = { "BuyBlackLeg" },
			Sea = 1
		},
		["Electro"] = {
			Model = "Mad Scientist",
			Npc = "Mad Scientist",
			npc = "Mad Scientist",
			CFrame = CFrame.new(-4842.112, 717.670, -2623.149),
			cframe = CFrame.new(-4842.112, 717.670, -2623.149),
			Remote = { "BuyElectro" },
			remote = { "BuyElectro" },
			Sea = 1
		},
		["Fishman Karate"] = {
			Model = "Water Kung-fu Teacher",
			Npc = "Water Kung-fu Teacher",
			npc = "Water Kung-fu Teacher",
			CFrame = CFrame.new(61122.652, 18.497, 1568.351),
			cframe = CFrame.new(61122.652, 18.497, 1568.351),
			Remote = { "BuyFishmanKarate" },
			remote = { "BuyFishmanKarate" },
			Sea = 1
		},
		["Dragon Claw"] = {
			Model = "Sabi",
			Npc = "Sabi",
			npc = "Sabi",
			CFrame = CFrame.new(699.029, 185.661, 654.895),
			cframe = CFrame.new(699.029, 185.661, 654.895),
			CFrames = {
				Sea_2 = CFrame.new(699.029, 185.661, 654.895),
			},
			cframes = {
				Sea_2 = CFrame.new(699.029, 185.661, 654.895),
			},
			Remote = { { "BlackbeardReward", "DragonClaw", "1" }, { "BlackbeardReward", "DragonClaw", "2" } },
			remote = { { "BlackbeardReward", "DragonClaw", "1" }, { "BlackbeardReward", "DragonClaw", "2" } },
			Sea = 2
		},
		["Superhuman"] = {
			Model = "Martial Arts Master",
			Npc = "Martial Arts Master",
			npc = "Martial Arts Master",
			CFrame = CFrame.new(1377.125, 246.542, -5189.951),
			cframe = CFrame.new(1377.125, 246.542, -5189.951),
			CFrames = {
				Sea_2 = CFrame.new(1377.125, 246.542, -5189.951),
			},
			cframes = {
				Sea_2 = CFrame.new(1377.125, 246.542, -5189.951),
			},
			Remote = { "BuySuperhuman" },
			remote = { "BuySuperhuman" },
			Sea = 2
		},
		["Death Step"] = {
			Model = "Phoeyu, the Reformed",
			Npc = "Phoeyu, the Reformed",
			npc = "Phoeyu, the Reformed",
			CFrame = CFrame.new(6356.472, 296.100, -6762.771),
			cframe = CFrame.new(6356.472, 296.100, -6762.771),
			CFrames = {
				Sea_2 = CFrame.new(6356.472, 296.100, -6762.771),
			},
			cframes = {
				Sea_2 = CFrame.new(6356.472, 296.100, -6762.771),
			},
			Remote = { "BuyDeathStep" },
			remote = { "BuyDeathStep" },
			Sea = 2
		},
		["Sharkman Karate"] = {
			Model = "Sharkman Teacher",
			Npc = "Sharkman Teacher",
			npc = "Sharkman Teacher",
			CFrame = CFrame.new(-2599.622, 238.198, -10315.998),
			cframe = CFrame.new(-2599.622, 238.198, -10315.998),
			CFrames = {
				Sea_2 = CFrame.new(-2599.622, 238.198, -10315.998),
			},
			cframes = {
				Sea_2 = CFrame.new(-2599.622, 238.198, -10315.998),
			},
			Remote = { "BuySharkmanKarate" },
			remote = { "BuySharkmanKarate" },
			Sea = 2
		},
		["Electric Claw"] = {
			Model = "Previous Hero",
			Npc = "Previous Hero",
			npc = "Previous Hero",
			CFrame = CFrame.new(-10368.514, 331.788, -10134.120),
			cframe = CFrame.new(-10368.514, 331.788, -10134.120),
			CFrames = {
				Sea_3 = CFrame.new(-10368.514, 331.788, -10134.120),
			},
			cframes = {
				Sea_3 = CFrame.new(-10368.514, 331.788, -10134.120),
			},
			Remote = { "BuyElectricClaw" },
			remote = { "BuyElectricClaw" },
			Sea = 3
		},
		["Dragon Talon"] = {
			Model = "Uzoth",
			Npc = "Uzoth",
			npc = "Uzoth",
			CFrame = CFrame.new(-9515.372, 142.130, 5535.089),
			cframe = CFrame.new(-9515.372, 142.130, 5535.089),
			CFrames = {
				Sea_3 = CFrame.new(-9515.372, 142.130, 5535.089),
			},
			cframes = {
				Sea_3 = CFrame.new(-9515.372, 142.130, 5535.089),
			},
			Remote = { "BuyDragonTalon" },
			remote = { "BuyDragonTalon" },
			Sea = 3
		},
		["Godhuman"] = {
			Model = "Ancient Monk",
			Npc = "Ancient Monk",
			npc = "Ancient Monk",
			CFrame = CFrame.new(-12463.870, 374.910, -7523.770),
			cframe = CFrame.new(-12463.870, 374.910, -7523.770),
			CFrames = {
				Sea_3 = CFrame.new(-12463.870, 374.910, -7523.770),
			},
			cframes = {
				Sea_3 = CFrame.new(-12463.870, 374.910, -7523.770),
			},
			Remote = { "BuyGodhuman" },
			remote = { "BuyGodhuman" },
			Sea = 3
		},
		["Sanguine Art"] = {
			Model = "Shafi",
			Npc = "Shafi",
			npc = "Shafi",
			CFrame = CFrame.new(-16548.800, 12.000, 412.300),
			cframe = CFrame.new(-16548.800, 12.000, 412.300),
			CFrames = {
				Sea_3 = CFrame.new(-16548.800, 12.000, 412.300),
			},
			cframes = {
				Sea_3 = CFrame.new(-16548.800, 12.000, 412.300),
			},
			Remote = { { "BuySanguineArt", true }, { "BuySanguineArt" } },
			remote = { { "BuySanguineArt", true }, { "BuySanguineArt" } },
			Sea = 3
		},
	},
	ItemsToBuy = {
		["Frags"] = {
			["Race Rerol"] = { "BlackbeardReward", "Reroll", "2" },
			["Reset Stats"] = { "BlackbeardReward", "Refund", "2" }
		},
		["Ability"] = {
			["Geppo"] = { "BuyHaki", "Geppo" },
			["Buso Haki"] = { "BuyHaki", "Buso" },
			["Soru"] = { "BuyHaki", "Soru" },
			["Observation Haki"] = { "KenTalk", "Buy" }
		},
		["Gun"] = {
			["Slingshot"] = { "BuyItem", "Slingshot" },
			["Musket"] = { "BuyItem", "Musket" },
			["Flintlock"] = { "BuyItem", "Flintlock" },
			["Refined Slingshot"] = { "BuyItem", "Refined Flintlock" },
			["Refined Flintlock"] = { "BuyItem", "Refined Flintlock" },
			["Cannon"] = { "BuyItem", "Cannon" },
			["Kabucha"] = { "BlackbeardReward", "Slingshot", "1" },
			["Bizarre Rifle"] = { "Ectoplasm", "Buy", 1 }
		},
		["Accessory"] = {
			["Black Cape"] = { "Black Cape" },
			["Swordsman Hat"] = { "Swordsman Hat" },
			["Tomoe Ring"] = { "Tomoe Ring" }
		},
		["Sword"] = {
			["Cutlass"] = { "Cutlass" },
			["Katana"] = { "Katana" },
			["Iron Mace"] = { "Iron Mace" },
			["Dual Katana"] = { "Duel Katana" },
			["Triple Katana"] = { "Triple Katana" },
			["Pipe"] = { "Pipe" },
			["Dual-Headed Blade"] = { "Dual-Headed Blade" },
			["Bisento"] = { "Bisento" },
			["Soul Cane"] = { "Soul Cane" },
			["Pole v.2"] = { "ThunderGodTalk" }
		}
	},
	Islands = {
		["Sea 1"] = {
			["Pirate Starter"] = CFrame.new(1047, 15, 1506),
			["Marine Starter"] = CFrame.new(-2728, 25, 2056),
			["Middle Town"] = CFrame.new(-688, 15, 1585),
			["Jungle"] = CFrame.new(-1614, 37, 146),
			["Pirate Village"] = CFrame.new(-1173, 45, 3837),
			["Desert"] = CFrame.new(944, 21, 4373),
			["Frozen Village"] = CFrame.new(1298, 87, -1344),
			["Marine Fortress"] = CFrame.new(-4810, 21, 4359),
			["Colosseum"] = CFrame.new(-1535, 7, -3014),
			["Lower Skylands"] = CFrame.new(-4814, 718, -2551),
			["Skylands"] = CFrame.new(-4652, 873, -1754),
			["Upper Skylands"] = CFrame.new(-7895, 5547, -380),
			["Prison"] = CFrame.new(4870, 6, 736),
			["Magma Village"] = CFrame.new(-5290, 9, 8349),
			["Underwater City"] = CFrame.new(61164, 5, 1820),
			["Fountain City"] = CFrame.new(5757, 91, 4017),
			["Jean-Luc Island"] = CFrame.new(-2850, 7, 5355),
		},
		["Sea 2"] = {
			["The Cafe"] = CFrame.new(-382, 73, 290),
			["First Spot"] = CFrame.new(-11, 29, 2771),
			["Dark Arena"] = CFrame.new(3494, 13, -3259),
			["Don Swan Mansion"] = CFrame.new(-317, 331, 597),
			["Don Swan Room"] = CFrame.new(2285, 15, 905),
			["Green Zone"] = CFrame.new(-2258, 73, -2696),
			["Graveyard"] = CFrame.new(-5552, 194, -776),
			["Snow Mountain"] = CFrame.new(752, 408, -5277),
			["Hot and Cold"] = CFrame.new(-6008, 29, -5018),
			["Cursed Ship"] = CFrame.new(919, 125, 32869),
			["Ice Castle"] = CFrame.new(5505, 40, -6178),
			["Forgotten Island"] = CFrame.new(-3050, 240, -10178),
			["Remote Island"] = CFrame.new(4816, 8, 2863),
		},
		["Sea 3"] = {
			["Mansion"] = CFrame.new(-12471, 374, -7551),
			["Port Town"] = CFrame.new(-340, 21, 5524),
			["Great Tree"] = CFrame.new(2205, 22, -6766),
			["Castle On The Sea"] = CFrame.new(-4980, 314, -3018),
			["Hydra Island"] = CFrame.new(5294, 1005, 391),
			["Floating Turtle"] = CFrame.new(-12528, 332, -8658),
			["Haunted Castle"] = CFrame.new(-9517, 142, 5528),
			["Ice Cream Land"] = CFrame.new(-843, 66, -10944),
			["Peanut Land"] = CFrame.new(-2082, 38, -10190),
			["Cake Land"] = CFrame.new(-1897, 14, -11576),
			["Candy Cane Land"] = CFrame.new(-1094, 64, -14519),
			["Chocolate Land"] = CFrame.new(219, 127, -12604),
			["Tiki Outpost"] = CFrame.new(-16224, 9, 439),
		}
	},
	PortalLocations = {
		Sea_1 = {
			Vector3.new(-7894.62, 5545.49, -380.25),
			Vector3.new(-4607.82, 872.54, -1667.56),
			Vector3.new(61163.85, 11.76, 1819.78),
			Vector3.new(3876.28, 35.11, -1939.32)
		},
		Sea_2 = {
			Vector3.new(-288.46, 306.13, 598),
			Vector3.new(2284.91, 15.15, 905.48),
			Vector3.new(923.21, 126.98, 32852.83),
			Vector3.new(-6508.56, 89.03, -132.84)
		},
		Sea_3 = {
			Vector3.new(-5058.77, 314.52, -3155.88),
			Vector3.new(-12463.87, 374.91, -7523.77),
			Vector3.new(28282.57, 14896.85, 105.1),
			Vector3.new(5661.53, 1013.09, -334.96),
			Vector3.new(5319, 23, -93),
			Vector3.new(5651, 1018, -350),
			Vector3.new(28286, 14897, 103)
		}
	},
	SwordData = {
		["Dark Blade"] = { Rarity = "Mythical", Order = 1 },
		["True Triple Katana"] = { Rarity = "Mythical", Order = 1 },
		["Cursed Dual Katana"] = { Rarity = "Mythical", Order = 1 },
		["Hallow Scythe"] = { Rarity = "Mythical", Order = 1 },
		["Triple Dark Blade"] = { Rarity = "Mythical", Order = 1 },
		["Dog Blade"] = { Rarity = "Mythical", Order = 1 },

		["Rengoku"] = { Rarity = "Legendary", Order = 2 },
		["Yama"] = { Rarity = "Legendary", Order = 2 },
		["Tushita"] = { Rarity = "Legendary", Order = 2 },
		["Buddy Sword"] = { Rarity = "Legendary", Order = 2 },
		["Shark Anchor"] = { Rarity = "Legendary", Order = 2 },
		["Fox Lamp"] = { Rarity = "Legendary", Order = 2 },
		["Dragon Trident"] = { Rarity = "Legendary", Order = 2 },
		["Saber"] = { Rarity = "Legendary", Order = 2 },
		["Canvander"] = { Rarity = "Legendary", Order = 2 },
		["Dark Dagger"] = { Rarity = "Legendary", Order = 2 },
		["Dragonheart"] = { Rarity = "Legendary", Order = 2 },
		["Koko"] = { Rarity = "Legendary", Order = 2 },
		["Midnight Blade"] = { Rarity = "Legendary", Order = 2 },
		["Oroshi"] = { Rarity = "Legendary", Order = 2 },
		["Pole (1st Form)"] = { Rarity = "Legendary", Order = 2 },
		["Pole (2nd Form)"] = { Rarity = "Legendary", Order = 2 },
		["Saishi"] = { Rarity = "Legendary", Order = 2 },
		["Shizu"] = { Rarity = "Legendary", Order = 2 },
		["Longsword"] = { Rarity = "Legendary", Order = 2 },
		["Pipe"] = { Rarity = "Legendary", Order = 2 },
		["Soul Cane"] = { Rarity = "Legendary", Order = 2 },
		["Trident"] = { Rarity = "Legendary", Order = 2 },
		["Wardens Sword"] = { Rarity = "Legendary", Order = 2 },
		["Bisento"] = { Rarity = "Legendary", Order = 2 },
		["Triple Katana"] = { Rarity = "Legendary", Order = 2 },
		["Twin Hooks"] = { Rarity = "Legendary", Order = 2 },
		["Dual-Headed Blade"] = { Rarity = "Legendary", Order = 2 },
		["Flail"] = { Rarity = "Legendary", Order = 2 },
		["Gravity Blade"] = { Rarity = "Legendary", Order = 2 },

		["Spikey Trident"] = { Rarity = "Rare", Order = 3 },
		["Fishing Trophy"] = { Rarity = "Rare", Order = 3 },
		["Shark Saw"] = { Rarity = "Rare", Order = 3 },

		["Iron Mace"] = { Rarity = "Uncommon", Order = 4 },

		["Cutlass"] = { Rarity = "Common", Order = 5 },
		["Katana"] = { Rarity = "Common", Order = 5 },
		["Dual Katana"] = { Rarity = "Common", Order = 5 },
	},
	BoatsList = {
		'Dinghy',
		'PirateSloop',
		'PirateBrigade',
		'PirateGrandBrigade',
		'MarineSloop',
		'MarineBrigade',
		'MarineGrandBrigade',
		'Beast Hunter',
		'Lantern',
		'Guardian',
		'Grand Brigade',
		'Sloop',
		'The Sentinel'
	},
	ZoneList = {
		'Level 1',
		'Level 2',
		'Level 3',
		'Level 4',
		'Level 5',
		'Level 6',
		'Infinite'
	},
	SeaEventTargets = {
		"Terror Shark",
		"Sea Beast",
		"Shark",
		"Piranha",
		"Fish Crew Member",
		"Pirate Brigade",
		"Pirate Grand Brigade",
		"Ghost Ship"
	},
	RodsList = {
		"Fishing Rod",
		"Gold Rod",
		"Shark Rod",
		"Shell Rod",
		"Treasure Rod",
		"Shark (Corrupted)",
		"Shell (Celestial)"
	},
	BaitsList = {
		"Basic Bait",
		"Kelp Bait",
		"Good Bait",
		"Abyssal Bait",
		"Frozen Bait",
		"Epic Bait",
		"Carnivore Bait"
	},
	DungeonCards = {
		"Hyper",
		"Overflow",
		"Fortress",
		"Shadow",
		"Sniper",
		"Lifesteal",
		"Unbreakable",
		"Health",
		"Defense",
		"Armor",
		"Melee",
		"Sword",
		"Fruit",
		"Gun"
	},
	TrainMethods = {
		"Bones",
		"Cakes"
	},
	LegendarySwordNames = {
		"Shizu",
		"Oroshi",
		"Saishi"
	},
	BossHopNames = {
		"Greybeard",
		"Darkbeard",
		"Cursed Captain",
		"rip_indra True Form",
		"Soul Reaper",
		"Cake Prince",
		"Dough King",
		"Tyrant of the Skies"
	},
	BossMap = {
		["Greybeard"] = "Greybeard",
		["Darkbeard"] = "Darkbeard",
		["Cursed Captain"] = "CursedCaptain",
		["rip_indra True Form"] = "Ripindra",
		["Soul Reaper"] = "SoulReaper",
		["Cake Prince"] = "CakePrince",
		["Dough King"] = "DoughKing",
		["Tyrant of the Skies"] = "Tyrant"
	},
	ScrollList = {
		"Common Scroll",
		"Rare Scroll",
		"Legendary Scroll",
		"Mythical Scroll"
	},
	ChestTiers = {
		"Diamond",
		"Gold",
		"Silver"
	},
	IgnoreNPC = {
		"Quest",
		"Boat",
		"Home"
	},
	DracoSequence = {
		"Relic1",
		"EndRelic1",
		"Relic2",
		"EndRelic2",
		"Relic3",
		"EndRelic3"
	},
	SwordList = {
		"Shizu",
		"Saishi",
		"Oroshi"
	},
	DealerFruitList = {
		"Rocket-Rocket",
		"Spin-Spin",
		"Blade-Blade",
		"Spring-Spring",
		"Bomb-Bomb",
		"Smoke-Smoke",
		"Spike-Spike",
		"Flame-Flame",
		"Ice-Ice",
		"Sand-Sand",
		"Dark-Dark",
		"Eagle-Eagle",
		"Diamond-Diamond",
		"Light-Light",
		"Rubber-Rubber",
		"Ghost-Ghost",
		"Magma-Magma",
		"Quake-Quake",
		"Buddha-Buddha",
		"Love-Love",
		"Creation-Creation",
		"Spider-Spider",
		"Sound-Sound",
		"Phoenix-Phoenix",
		"Portal-Portal",
		"Lightning-Lightning",
		"Pain-Pain",
		"Blizzard-Blizzard",
		"Gravity-Gravity",
		"Mammoth-Mammoth",
		"T-Rex-T-Rex",
		"Dough-Dough",
		"Shadow-Shadow",
		"Venom-Venom",
		"Gas-Gas",
		"Spirit-Spirit",
		"Tiger-Tiger",
		"Yeti-Yeti",
		"Kitsune-Kitsune",
		"Control-Control",
		"Dragon-Dragon"
	}
}
]=]

OnionBundle["Util/BloxFruitModule/Preload/Weebo.lua"] = [=[
-- generated at .gg/bonnieblue

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")
local CollectionService = game:GetService("CollectionService")
local localPlayer = Players.LocalPlayer
local enemies = Workspace:WaitForChild("Enemies")
local map = Workspace:FindFirstChild("Map")
local attribute = Workspace:GetAttribute("MAP")
local flag = attribute == "Sea1"
local flag2 = attribute == "Sea2"
local flag3 = attribute == "Sea3"

if game:GetService("ReplicatedStorage").PrivateServerOwnerId.Value ~= 0 then
	return
end

local request_ = nil

if syn and syn.request then
	request_ = syn.request
elseif http_request then
	request_ = http_request
elseif http and http.request then
	request_ = http.request
else
	request_ = request or httprequest or request_
end

local function fn(arg)
	if not request_ then
		warn("[QO] No HTTP function found!")
		return nil
	end
	return request_(arg)
end

local str = "https://api.quantumonyx.cc"
local str2 = "secretkey-wqe231weqweqweqweqweqwe"
local str3 = "QnTmOnyX"

IsReady = function(arg)
	return arg and arg:FindFirstChild("Humanoid") and arg:FindFirstChild("HumanoidRootPart") and arg.Humanoid.Health > 0
end

local function fn2(arg)
	local worldOrigin = Workspace:FindFirstChild("_WorldOrigin")
	worldOrigin = worldOrigin and worldOrigin:FindFirstChild("Locations")
	local tikiOutpost = nil

	if worldOrigin then
		tikiOutpost = worldOrigin:FindFirstChild("Tiki Outpost")
	end

	if not tikiOutpost and map then
		tikiOutpost = map:FindFirstChild("Tiki Outpost") or map:FindFirstChild("TikiOutpost")
	end

	if not tikiOutpost then
		tikiOutpost = nil
	elseif typeof(tikiOutpost) == "CFrame" then
		tikiOutpost = tikiOutpost.Position
	elseif typeof(tikiOutpost) ~= "Vector3" then
		if tikiOutpost:IsA("Model") then
			tikiOutpost = tikiOutpost.PrimaryPart and tikiOutpost.PrimaryPart.Position or tikiOutpost:GetPivot().Position
		else
			tikiOutpost = tikiOutpost.Position
		end
	end

	if not arg then
		arg = nil
	elseif typeof(arg) == "CFrame" then
		arg = arg.Position
	elseif typeof(arg) ~= "Vector3" then
		if arg:IsA("Model") then
			arg = arg.PrimaryPart and arg.PrimaryPart.Position or arg:GetPivot().Position
		else
			arg = arg.Position
		end
	end

	if not tikiOutpost or not arg then
		return nil
	end
	return math.floor((arg - tikiOutpost).Magnitude)
end

local tbl = {
	["15124425041"] = "Rocket",
	["15123685330"] = "Spin",
	["15123613404"] = "Blade",
	["15123689268"] = "Spring",
	["15123595806"] = "Bomb",
	["15123677932"] = "Smoke",
	["15124220207"] = "Spike",
	["121545956771325"] = "Flame",
	["15123635706"] = "Ice",
	["15123673019"] = "Sand",
	["15123618591"] = "Dark",
	["77885466312115"] = "Eagle",
	["104164258044308"] = "Eagle",
	["115703817807141"] = "Eagle",
	["92330877901374"] = "Eagle",
	["140412727763638"] = "Eagle",
	["116175797994934"] = "Eagle",
	["125929650313762"] = "Eagle",
	["15112600534"] = "Diamond",
	["15123640714"] = "Light",
	["15123668008"] = "Rubber",
	["15123662036"] = "Ghost",
	["15123645682"] = "Magma",
	["15123659223"] = "Quake",
	["15123606541"] = "Buddha",
	["15100313696"] = "Buddha",
	["15123643097"] = "Love",
	["116828771482820"] = "Creation",
	["115462995299384"] = "Creation",
	["137656801165733"] = "Creation",
	["108425658611774"] = "Creation",
	["111759706483783"] = "Creation",
	["97124048109653"] = "Creation",
	["70881482165206"] = "Creation",
	["15123681598"] = "Spider",
	["15123679712"] = "Sound",
	["15123654553"] = "Phoenix",
	["15123656798"] = "Portal",
	["15123670514"] = "Lightning",
	["15123652069"] = "Pain",
	["15123587371"] = "Blizzard",
	["15123633312"] = "Gravity",
	["15123648309"] = "Mammoth",
	["14661837634"] = "Mammoth",
	["15694681122"] = "T-Rex",
	["15123624401"] = "Dough",
	["15123675904"] = "Shadow",
	["10773719142"] = "Venom",
	["118054805452821"] = "Gas",
	["104856271432800"] = "Gas",
	["11911905519"] = "Spirit",
	["94006198119776"] = "Tiger",
	["80670192030381"] = "Tiger",
	["132341855488805"] = "Tiger",
	["79732160844822"] = "Tiger",
	["116028810606047"] = "Tiger",
	["121749335304244"] = "Tiger",
	["99049288828561"] = "Tiger",
	["73861360346938"] = "Tiger",
	["118911296874650"] = "Tiger",
	["139071042378135"] = "Tiger",
	["119072421589354"] = "Tiger",
	["78523331136291"] = "Tiger",
	["95633780504600"] = "Tiger",
	["15123638064"] = "Tiger",
	["115276580506154"] = "Yeti",
	["101378450824208"] = "Yeti",
	["15487764876"] = "Kitsune",
	["15482881956"] = "Kitsune",
	["15482881888"] = "Kitsune",
	["15482881962"] = "Kitsune",
	["15482881967"] = "Kitsune",
	["15482881910"] = "Kitsune",
	["15482881907"] = "Kitsune",
	["121982453080224"] = "Control",
	["91364186483184"] = "Control",
	["89745128079512"] = "Control",
	["78720366879931"] = "Control",
	["127508816572084"] = "Control",
	["113083898554637"] = "Control",
	["119304463491572"] = "Control",
	["90545150537446"] = "Control",
	["115917455020832"] = "Control",
	["87568890802647"] = "Control",
	["121332674491298"] = "Control",
	["81733441695721"] = "Control",
	["112993897514368"] = "Control",
	["70787028184100"] = "Control",
	["90340382070779"] = "Control",
	["76533257082993"] = "Control",
	["106034479309709"] = "Control",
	["133003579772395"] = "Control",
	["107443979453792"] = "Control",
	["78841069420154"] = "Control",
	["104845568970309"] = "Control",
	["130002991386896"] = "Control",
	["93043841632966"] = "Control",
	["116461547625166"] = "Control",
	["132635844357070"] = "Control",
	["107388226920083"] = "Control",
	["94578806515177"] = "Control",
	["102115204234236"] = "Control",
	["15123616275"] = "Control",
	["95749033139458"] = "Dragon East",
	["95746827929258"] = "Dragon East",
	["96238290310071"] = "Dragon East",
	["106721528646960"] = "Dragon West",
	["130723287037570"] = "Dragon West",
	["122911500223006"] = "Dragon West",
	["82028055099848"] = "Dragon West",
	["84013034085846"] = "Dragon West",
	["106354002177250"] = "Dragon West",
}

for k, v in pairs(tbl) do
	tbl["rbxassetid://" .. k] = v
end

local obj = setmetatable({}, { __mode = "k" })

local function fn3(arg)
	if type(arg) ~= "string" then
		return nil
	end
	return arg:match("%d+")
end

local function fn4(arg)
	if not arg or arg == "" then
		return nil
	end

	if tbl[arg] then
		return tbl[arg]
	end
	local v = fn3(arg)
	if v and tbl[v] then
		return tbl[v]
	end

	if v and tbl["rbxassetid://" .. v] then
		return tbl["rbxassetid://" .. v]
	end
	return nil
end

local function fn5(arg)
	if not arg or not arg.Parent then
		return "Fruit [Spawned]"
	end
	local name = arg.Name
	if name ~= "Fruit " and name ~= "Fruit" and name ~= "" then
		return name
	end

	if obj[arg] then
		return obj[arg]
	end

	for _, v in ipairs({ "OriginalName", "FruitName", "Fruit", "DisplayName", "ItemName" }) do
		local attribute2 = arg:GetAttribute(v)

		if type(attribute2) == "string" and #attribute2 > 0 and attribute2 ~= "Fruit " and attribute2 ~= "Fruit" then
			local str4 = "Fruit [" .. attribute2 .. "] Spawned"
			obj[arg] = str4
			return str4
		end
	end

	local descendants = arg:GetDescendants()

	for _, descendant in ipairs(descendants) do
		if descendant:IsA("Animation") then
			local v = fn4(descendant.AnimationId)

			if v then
				local str4 = "Fruit [" .. v .. "] Spawned"
				obj[arg] = str4
				return str4
			end
		end
	end

	for _, descendant in ipairs(descendants) do
		if descendant:IsA("MeshPart") then
			local v = fn4(descendant.MeshId) or fn4(descendant.TextureID)

			if v then
				local str4 = "Fruit [" .. v .. "] Spawned"
				obj[arg] = str4
				return str4
			end

			continue
		end

		if descendant:IsA("SpecialMesh") then
			local v = fn4(descendant.MeshId) or fn4(descendant.TextureId)

			if v then
				local str4 = "Fruit [" .. v .. "] Spawned"
				obj[arg] = str4
				return str4
			end

			continue
		end

		local isDecal = descendant:IsA("Decal")

		if isDecal or descendant:IsA("Texture") then
			local v = fn4(descendant.Texture)

			if v then
				local str4 = "Fruit [" .. v .. "] Spawned"
				obj[arg] = str4
				return str4
			end
		end
	end

	for _, descendant in ipairs(descendants) do
		local name2 = descendant.Name

		if name2:find("Fruit") and name2 ~= "Fruit " and name2 ~= "Fruit" then
			local match = name2:match("^(.-)%s*Fruit")
			local str4 = "Fruit [" .. (match or name2) .. "] Spawned"
			obj[arg] = str4
			return str4
		end
	end

	return "Fruit di ko alam [Spawned]"
end

local n = 200

local function fn6(arg)
	local players = Players:GetPlayers()
	local tbl2 = {}

	for _, player in ipairs(players) do
		if player ~= localPlayer then
			local character = player.Character
			character = character and character:FindFirstChild("HumanoidRootPart")

			if character then
				local n2 = math.floor((character.Position - arg).Magnitude)

				if n2 <= n then
					table.insert(tbl2, { name = player.Name, distance = n2 })
				end
			end
		end
	end

	table.sort(tbl2, function(arg2, arg3)
		return arg2.distance < arg3.distance
	end)

	return tbl2
end

local function fn7(arg, arg2)
	if localPlayer.Character then
		localPlayer.Character:FindFirstChild("HumanoidRootPart")
	end

	local characters = Workspace:FindFirstChild("Characters")

	for _, descendant in ipairs(arg:GetDescendants()) do
		if descendant:IsA("Model") and (descendant.Name == "Fruit " or descendant.Name:sub(1, 6) == "Fruit ") then
			local humanoidRootPart = descendant:FindFirstChild("HumanoidRootPart") or descendant.PrimaryPart

			if humanoidRootPart then
				local name = nil

				if characters then
					local parent = descendant.Parent

					while true do
						local flag4 = parent and parent ~= Workspace
						name = nil

						if flag4 then
							if parent.Parent == characters then
								name = parent.Name
								break
							else
								parent = parent.Parent
								continue
							end
						end

						break
					end
				end

				if not (name ~= nil and localPlayer.Character ~= nil and name == localPlayer.Character.Name) then
					local position = humanoidRootPart.Position
					local v = fn5(descendant)
					local v2 = fn6(position)
					local insert = table.insert

					local tbl2 = {
						name = v,
						position = string.format("%.0f, %.0f, %.0f", position.X, position.Y, position.Z),
						nearbyPlayers = v2,
						onCharacter = name,
					}

					tbl2.sea = flag and "Sea 1" or flag2 and "Sea 2" or flag3 and "Sea 3" or "Unknown"
					insert(arg2, tbl2)
				end
			end
		end
	end
end

local function fn8()
	local tbl2 = {}
	fn7(Workspace, tbl2)
	local characters = Workspace:FindFirstChild("Characters")

	if characters then
		fn7(characters, tbl2)
	end

	if #tbl2 > 0 then
		return tbl2
	end
	return nil
end

local function fn9(arg)
	if map then
		local v = map:FindFirstChild(arg)
		if v then
			return v
		end
	end

	local worldOrigin = Workspace:FindFirstChild("_WorldOrigin")
	worldOrigin = worldOrigin and worldOrigin:FindFirstChild("Locations")

	if worldOrigin then
		local v = worldOrigin:FindFirstChild(arg)
		if v then
			return v
		end
	end

	return nil
end

local function fn10()
	if flag3 then
		local sky = Lighting:FindFirstChild("Sky")
		return sky and sky.MoonTextureId
	end
	local sky = Lighting:FindFirstChildWhichIsA("Sky")
	return sky and sky.MoonTextureId
end

local str4 = "http://www.roblox.com/asset/?id=9709149431"
local str5 = "http://www.roblox.com/asset/?id=9709149052"

local function fn11()
	local v = fn10()
	if v == str4 then
		return "Full Moon"
	end

	if v == str5 then
		return "Next Night"
	end
	return "Bad Moon"
end

local function fn12()
	local clockTime = Lighting.ClockTime
	return clockTime >= 6 and clockTime < 18 and "Day" or "Night"
end

local function fn13()
	local v = fn11()
	local clockTime = Lighting.ClockTime
	local n2 = math.floor(clockTime)

	if v == "Full Moon" then
		if clockTime <= 5 then
			return string.format("%d:00 (Will End Moon In %d min)", n2, math.floor(5 - clockTime))
		end

		if clockTime < 12 then
			return string.format("%d:00 (Fake Moon)", n2)
		end

		if clockTime < 18 then
			return string.format("%d:00 (Will Full Moon In %d min)", n2, math.floor(18 - clockTime))
		end
		return string.format("%d:00 (Will End Moon In %d min)", n2, math.floor(30 - clockTime))
	end

	if v == "Next Night" then
		if clockTime < 12 then
			return string.format("%d:00 (Will Full Moon In %d min)", n2, math.floor(18 - clockTime))
		end
		return string.format("%d:00 (Will Full Moon In %d min)", n2, math.floor(30 - clockTime))
	end

	return tostring(n2) .. ":00"
end

local function fn14()
	local v = fn11()
	local clockTime = Lighting.ClockTime
	if v == "Next Night" and (clockTime >= 17 and clockTime < 18 or clockTime < 5) then
		return true
	end
	return false
end

local function fn15()
	local commF = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_")
	if not commF then
		return nil
	end

	local ok, result = pcall(function()
		return commF:InvokeServer("LegendarySwordDealer", "1")
	end)

	if ok and result and type(result) == "string" then
		return result
	end
	return nil
end

local tbl2 = { ["Snow White"] = true, ["Pure Red"] = true, ["Winter Sky"] = true }

local function fn16()
	local commF = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("CommF_")
	if not commF then
		return nil
	end

	local ok, result = pcall(function()
		return commF:InvokeServer("ColorsDealer", "1")
	end)

	if not ok then
		return nil
	end

	if result == 1 then
		return nil
	end

	if not result or type(result) ~= "string" then
		return nil
	end

	if tbl2[result] then
		return result
	end
	return nil
end

GetConnectMon = function(arg, arg2)
	local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
	local flag4 = type(arg) == "table"
	local flag5 = type(arg) == "string"
	if arg2 and not humanoidRootPart then
		return nil
	end
	local v, v2, v3 = ipairs({ enemies, ReplicatedStorage })
	local huge = math.huge
	local v4 = nil
	local _vm_n_1 = (function(iterator, iteratorState, control) return coroutine.wrap(function() for value1, value2 in iterator, iteratorState, control do coroutine.yield(true, value1, value2) end; return false end) end)(v, v2, v3)

	for _, v5 in v, v2, v3 do
		for _, child in ipairs(v5:GetChildren()) do
			if flag5 then
				if child.Name ~= arg then
					continue
				end

				if IsReady(child) then
					if not arg2 then
						return child
					end
					local humanoidRootPart2 = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart

					if humanoidRootPart2 then
						local magnitude = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude

						if magnitude < huge then
							huge = magnitude
							v4 = child
						end
					end

					continue
				end

				continue
			end

			if flag4 then
				if arg[child.Name] == true then
					if IsReady(child) then
						if not arg2 then
							return child
						end
						local humanoidRootPart2 = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart

						if humanoidRootPart2 then
							local magnitude = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude

							if magnitude < huge then
								huge = magnitude
								v4 = child
							end
						end

						continue
					end

					continue
				end

				if table.find(arg, child.Name) == nil then
					continue
				end

				if IsReady(child) then
					if not arg2 then
						return child
					end
					local humanoidRootPart2 = child:FindFirstChild("HumanoidRootPart")
					humanoidRootPart2 = humanoidRootPart2 or child.PrimaryPart

					if humanoidRootPart2 then
						local magnitude = (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude

						if magnitude < huge then
							huge = magnitude
							v4 = child
						end
					end
				end
			end
		end
	end

	local _vm_n_0
	_vm_n_1 = _vm_n_0
	local _vm_N_0
	local _vm_N_1 = _vm_N_0
	local _vm_F_0
	local _vm_F_1 = _vm_F_0
	return v4
end

local function fn17(arg, arg2)
	return (arg + ("QnTmOnyX"):byte((arg2 - 1) % #str3 + 1) + arg2) % 32
end

local function fn18(arg)
	local tbl3 = {}
	local _vm_F_1 = 1

	for i = 1, #arg do
		local v = arg:byte(i)
		local v2 = fn17(v % 32, i)
		local v3 = fn17(math.floor(v / 32), i + 100)
		table.insert(tbl3, ("kQ9mZ2xW7nR4vB1jY6tF3hD8pL5cG0sA"):sub(v2 + 1, v2 + 1))
		table.insert(tbl3, ("kQ9mZ2xW7nR4vB1jY6tF3hD8pL5cG0sA"):sub(v3 + 1, v3 + 1))
	end

	local _vm_F_0
	_vm_F_1 = _vm_F_0
	local str6 = table.concat(tbl3)
	local tbl4 = {}
	_vm_F_1 = 1

	for i = 1, #str6 do
		table.insert(tbl4, str6:sub(i, i))
		local flag4 = i % 4 == 0

		if flag4 and i ~= #str6 then
			local v = ("kQ9mZ2xW7nR4vB1jY6tF3hD8pL5cG0sA"):byte((i * 7 + 13) % 32 + 1)
			table.insert(tbl4, string.char(v))
		end
	end

	_vm_F_1 = _vm_F_0
	return "." .. table.concat(tbl4) .. "."
end

local tbl3 = {
	fullmoon = 0,
	nearfullmoon = 0,
	greybeard = 60,
	darkbeard = 60,
	cursedcaptain = 60,
	ripindra = 60,
	soulreaper = 60,
	cakeprince = 60,
	doughking = 60,
	tyrant = 60,
	factory = 60,
	pirate = 60,
	elites = 10,
	prehistoric = 10,
	mirage = 10,
	kitsune = 10,
	legendarysword = 10,
	legendaryhaki = 10,
	berry = 10,
	fourhours = 20,
	fruit = 10,
}

local tbl4 = {
	fullmoon = "/api/fullmoon",
	nearfullmoon = "/api/nearfullmoon",
	greybeard = "/api/greybeard",
	darkbeard = "/api/darkbeard",
	cursedcaptain = "/api/cursedcaptain",
	ripindra = "/api/ripindra",
	soulreaper = "/api/soulreaper",
	cakeprince = "/api/cakeprince",
	doughking = "/api/doughking",
	tyrant = "/api/tyrant",
	factory = "/api/factory",
	pirate = "/api/pirate",
	elites = "/api/elites",
	mirage = "/api/mirage",
	prehistoric = "/api/prehistoric",
	kitsune = "/api/kitsune",
	legendarysword = "/api/legendarysword",
	legendaryhaki = "/api/legendaryhaki",
	berry = "/api/berry",
	fourhours = "/api/fourhours",
	fruit = "/api/fruit",
}

local function fn19(arg, arg2)
	local v = tbl4[arg]
	if not v then
		return false
	end

	local ok, result = pcall(function()
		local tbl5 = {
			placeId = tostring(game.PlaceId),
			jobId = fn18(tostring(game.JobId)),
			players = #Players:GetPlayers(),
			maxPlayers = 12,
		}

		if arg2 and type(arg2) == "table" then
			for k, v2 in pairs(arg2) do
				tbl5[k] = v2
			end
		end

		local v2 = fn({
			Url = str .. v,
			Method = "POST",
			Headers = { ["Content-Type"] = "application/json", ["x-qo-token"] = str2 },
			Body = HttpService:JSONEncode(tbl5),
		})

		if v2 and v2.StatusCode and v2.StatusCode >= 200 and v2.StatusCode < 300 then
			return true
		end
		return false
	end)

	if not ok then
		return false
	end
	return result
end

local tbl5 = {}
local tbl6 = {}

local function fn20(arg, arg2)
	local n2 = tbl3[arg] or 0
	local flag4

	if n2 == 0 then
		flag4 = tbl5[arg] ~= nil
	else
		flag4 = tbl5[arg] ~= nil and os.clock() - tbl5[arg] < n2
	end

	if flag4 then
		return false
	end

	if tbl6[arg] == arg2 then
		return false
	end
	return true
end

local function fn21(arg, arg2)
	tbl5[arg] = os.clock()
	tbl6[arg] = arg2

	if tbl3[arg] < 300 then
		tbl3[arg] = 300
	end
end

Checkelites = function()
	for _, v in ipairs({ "Urban", "Deandre", "Diablo" }) do
		if GetConnectMon(v) then
			return v
		end
	end
end

local function fn22()
	local v, v2, v3 = ipairs(CollectionService:GetTagged("BerryBush"))
	local _vm_n_1 = (function(iterator, iteratorState, control) return coroutine.wrap(function() for value1, value2 in iterator, iteratorState, control do coroutine.yield(true, value1, value2) end; return false end) end)(v, v2, v3)

	for _, v4 in v, v2, v3 do
		if v4 and v4.Parent then
			for _, v5 in pairs(v4:GetAttributes()) do
				if typeof(v5) == "string" and v5 ~= "" then
					return v5
				end
			end
		end
	end

	local _vm_n_0
	_vm_n_1 = _vm_n_0
	local _vm_N_0
	local _vm_N_1 = _vm_N_0
	local _vm_F_0
	local _vm_F_1 = _vm_F_0
	return nil
end

local function fn23()
	local PrehistoricIsland = fn9("PrehistoricIsland") or fn9("Prehistoric Island")
	if not PrehistoricIsland then
		return false
	end
	return true, { timeOfDay = fn12(), distanceFromTiki = fn2(PrehistoricIsland) }
end

local function fn24()
	local children = localPlayer.PlayerGui.Notifications:GetChildren()
	local v, v2, v3 = pairs(children)
	local _vm_n_1 = (function(iterator, iteratorState, control) return coroutine.wrap(function() for value1, value2 in iterator, iteratorState, control do coroutine.yield(true, value1, value2) end; return false end) end)(v, v2, v3)

	for _, v4 in v, v2, v3 do
		for _, child in pairs(v4:GetChildren()) do
			if child:IsA("TextLabel") and string.find(child.Text, "Pirates have been spotted approaching the castle") then
				return true, child.Text
			end
		end
	end

	local _vm_n_0
	_vm_n_1 = _vm_n_0
	local _vm_N_0
	local _vm_N_1 = _vm_N_0
	local _vm_F_0
	local _vm_F_1 = _vm_F_0
	return false
end

local tbl7 = {
	{
		key = "fullmoon",
		check = function()
			if not flag3 then
				return false
			end
			local v = fn11()
			if v ~= "Full Moon" then
				return false
			end
			local clockTime = Lighting.ClockTime
			if not (clockTime > 18 or clockTime < 5) then
				return false
			end
			return true, { moonStatus = v, cycleInfo = fn13(), timeOfDay = fn12() }
		end,
	},
	{
		key = "nearfullmoon",
		check = function()
			if not flag3 then
				return false
			end

			if not fn14() then
				return false
			end
			local clockTime = Lighting.ClockTime

			return true, {
				moonStatus = fn11(),
				cycleInfo = string.format("%d:00 (Will Full Moon In %d min)", math.floor(clockTime), clockTime < 18 and math.floor(18 - clockTime) or math.floor(30 - clockTime)),
				timeOfDay = fn12(),
			}
		end,
	},
	{
		key = "greybeard",
		check = function()
			if GetConnectMon("Greybeard") then
				return true, "Greybeard"
			end
			return false
		end,
	},
	{
		key = "darkbeard",
		check = function()
			if GetConnectMon("Darkbeard") then
				return true, "Darkbeard"
			end
			return false
		end,
	},
	{
		key = "cursedcaptain",
		check = function()
			if GetConnectMon("Cursed Captain") then
				return true, "Cursed Captain"
			end
			return false
		end,
	},
	{
		key = "ripindra",
		check = function()
			if GetConnectMon("rip_indra True Form") then
				return true, "rip_indra"
			end
			return false
		end,
	},
	{
		key = "elites",
		check = function()
			if Checkelites() then
				return true, "Elite Hunter"
			end
			return false
		end,
	},
	{
		key = "soulreaper",
		check = function()
			if GetConnectMon("Soul Reaper") then
				return true, "Soul Reaper"
			end
			return false
		end,
	},
	{
		key = "cakeprince",
		check = function()
			if GetConnectMon("Cake Prince") then
				return true, "Cake Prince"
			end
			return false
		end,
	},
	{
		key = "doughking",
		check = function()
			if GetConnectMon("Dough King") then
				return true, "Dough King"
			end
			return false
		end,
	},
	{
		key = "tyrant",
		check = function()
			if GetConnectMon("Tyrant of the Skies") then
				return true, "Tyrant"
			end
			return false
		end,
	},
	{
		key = "mirage",
		check = function()
			local MysticIsland = fn9("MysticIsland") or fn9("Mirage Island")
			if not MysticIsland then
				return false
			end
			return true, { timeOfDay = fn12(), distanceFromTiki = fn2(MysticIsland) }
		end,
	},
	{ key = "prehistoric", check = fn23 },
	{
		key = "kitsune",
		check = function()
			local KitsuneIsland = fn9("KitsuneIsland") or fn9("Kitsune Island")
			if not KitsuneIsland then
				return false
			end
			return true, { timeOfDay = fn12(), distanceFromTiki = fn2(KitsuneIsland) }
		end,
	},
	{
		key = "factory",
		check = function()
			local children = localPlayer.PlayerGui.Notifications:GetChildren()
			local v, v2, v3 = pairs(children)
			local _vm_n_1 = (function(iterator, iteratorState, control) return coroutine.wrap(function() for value1, value2 in iterator, iteratorState, control do coroutine.yield(true, value1, value2) end; return false end) end)(v, v2, v3)

			for _, v4 in v, v2, v3 do
				for _, child in pairs(v4:GetChildren()) do
					if child:IsA("TextLabel") and string.find(child.Text, "We are breaching the factory in 30 seconds") then
						return true, child.Text
					end
				end
			end

			local _vm_n_0
			_vm_n_1 = _vm_n_0
			local _vm_N_0
			local _vm_N_1 = _vm_N_0
			local _vm_F_0
			local _vm_F_1 = _vm_F_0
			return false
		end,
	},
	{ key = "pirate", check = fn24 },
	{
		key = "fruit",
		check = function()
			local v = fn8()
			if v then
				return true, { fruits = v }
			end
			return false
		end,
	},
	{
		key = "legendarysword",
		check = function()
			local v = fn15()
			if v then
				return true, { sword = v }
			end
			return false
		end,
	},
	{
		key = "legendaryhaki",
		check = function()
			local v = fn16()
			if v then
				return true, { haki = v }
			end
			return false
		end,
	},
	{
		key = "fourhours",
		check = function()
			if not (flag2 or flag3) then
				return false
			end
			local locations = Workspace:FindFirstChild("_WorldOrigin") and Workspace._WorldOrigin:FindFirstChild("Locations")
			if not locations then
				return false
			end
			local v = nil

			for _, child in ipairs(locations:GetChildren()) do
				local attribute2 = child:GetAttribute("TimeIn")

				if attribute2 and attribute2 > 1.7e9 then
					if v == nil or attribute2 < v then
						v = attribute2
					end
				end
			end

			if not v then
				return false
			end
			local n2 = os.time() - v
			local n3 = math.floor(n2 / 3600)
			if n3 ~= 4 then
				return false
			end
			local n4 = math.floor(n2 % 3600 / 60)
			local n5 = math.floor(n2 % 60)
			return true, { uptime = string.format("%dh %dm %ds", n3, n4, n5), sea = flag2 and "2" or "3" }
		end,
	},
}

local function fn25()
	while true do
		for _, v in ipairs(tbl7) do
			local v2, v3 = v.check()

			if v2 and fn20(v.key, v3) then
				if fn19(v.key, v3) then
					fn21(v.key, v3)
				end
			end
		end

		local v = fn22()

		if v and fn20("berry", v) then
			if fn19("berry", { berry = v }) then
				fn21("berry", v)
			end
		end

		task.wait(10)
	end
end

task.spawn(fn25)
]=]

OnionBundle["dev/testers.lua"] = [=[
local Library = {}
function Library:CreateWindow(config)
config = config or {}
local LOGO_ASSET_ID = "" -- opcional (solo Studio)

local playersService = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local localPlayer = playersService.LocalPlayer
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local appState = {
    allGradients = {},
    menuOpen = true,
    screenGui = nil,
    panel = nil,
    tabButtons = {},
    tabContents = {},
    PANEL_W = 940,
    PANEL_H = 560,
    COL_DARK = Color3.fromRGB(7, 13, 27),
    COL_WHITE = Color3.fromRGB(232, 237, 246),
    COL_DIM = Color3.fromRGB(147, 163, 188),
}
if isMobile then
    appState.PANEL_W = 820
    appState.PANEL_H = 500
end

do
    local accentKeys = {
        ColorSequenceKeypoint.new(0, Color3.fromRGB(83, 139, 245)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(110, 176, 255)),
    }
    appState.ACCENT_KEYS = accentKeys
end
do
    local bgKeys = {}
    bgKeys[1] = ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 10, 22))
    bgKeys[2] = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(10, 17, 34))
    bgKeys[3] = ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 16, 36))
    appState.BG_KEYS = bgKeys
end

local function generateRandomGuiName()
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local out = {}
    for i = 1, 12 + math.random(0, 8) do
        local n = math.random(1, #chars)
        out[i] = chars:sub(n, n)
    end
    return table.concat(out)
end

--------------------------------------------------------------------------------
-- LOGO OPCIONAL PARA ROBLOX STUDIO
-- Sube OnionProject_Logo.png a Roblox como imagen y pega el ID arriba.
--------------------------------------------------------------------------------
local logoAsset = LOGO_ASSET_ID ~= "" and LOGO_ASSET_ID or nil

--------------------------------------------------------------------------------
-- SCREEN GUI
--------------------------------------------------------------------------------
local function attachGui(gui)
    for _, getterName in ipairs({ "gethui", "get_hidden_gui" }) do
        local hiddenGuiGetter = rawget(_G, getterName)
        if type(hiddenGuiGetter) == "function" then
            local ok, parent = pcall(hiddenGuiGetter)
            if ok and typeof(parent) == "Instance" then
                if pcall(function()
                    gui.Parent = parent
                end) and gui.Parent == parent then
                    return true
                end
            end
        end
    end
    local okCore = pcall(function()
        gui.Parent = game:GetService("CoreGui")
    end)
    if okCore and gui.Parent then
        return true
    end
    gui.Parent = localPlayer:WaitForChild("PlayerGui")
    return true
end

do
    local old = nil
    pcall(function()
        old = localPlayer:WaitForChild("PlayerGui"):FindFirstChild("ONION_PROJECT_MAIN_GUI")
    end)
    if old then
        old:Destroy()
    end
end

appState.screenGui = Instance.new("ScreenGui")
appState.screenGui.Name = "ONION_PROJECT_MAIN_GUI"
appState.screenGui.ResetOnSpawn = false
appState.screenGui.DisplayOrder = 999
appState.screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
attachGui(appState.screenGui)
local mainGui = appState.screenGui

--------------------------------------------------------------------------------
-- HELPERS VISUALES (originales)
--------------------------------------------------------------------------------
local function createUIGradient(parent, gradientColors)
    local uiGradient = Instance.new("UIGradient")
    uiGradient.Color = ColorSequence.new(gradientColors or appState.ACCENT_KEYS)
    uiGradient.Rotation = 0
    uiGradient.Parent = parent
    table.insert(appState.allGradients, uiGradient)
    return uiGradient
end

local function addGradientStroke(parent, thickness)
    local instance = Instance.new("UIStroke")
    instance.Thickness = thickness or 2
    instance.Color = appState.COL_WHITE
    instance.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    instance.Parent = parent
    createUIGradient(instance)
    return instance
end

local function createUICorner(parent, cornerRadius)
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, cornerRadius or 10)
    uiCorner.Parent = parent
    return uiCorner
end

-- Arrastre (solo movimiento visual, sin persistencia)
local function makeDraggable(guiObject, handle)
    local isActive = false
    local dragInput = nil
    local startPos = nil
    local startGuiPos = nil
    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            isActive = true
            startPos = input.Position
            startGuiPos = guiObject.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    isActive = false
                end
            end)
        end
    end)
    handle.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and isActive then
            local delta = input.Position - startPos
            guiObject.Position = UDim2.new(
                startGuiPos.X.Scale,
                startGuiPos.X.Offset + delta.X,
                startGuiPos.Y.Scale,
                startGuiPos.Y.Offset + delta.Y
            )
        end
    end)
end

--------------------------------------------------------------------------------
-- BOTÓN "Menu [T]" (abre/cierra la ventana principal)
--------------------------------------------------------------------------------
local menuButton = Instance.new("TextButton")
menuButton.Name = generateRandomGuiName()
menuButton.Size = UDim2.new(0, isMobile and 82 or 88, 0, isMobile and 27 or 28)
menuButton.Position = UDim2.new(0.5, -(isMobile and 41 or 44), 1, -42)
menuButton.BackgroundColor3 = Color3.fromRGB(13, 45, 90)
menuButton.BackgroundTransparency = 0.38
menuButton.BorderSizePixel = 0
menuButton.Text = isMobile and "ONION" or "ONION [T]"
menuButton.TextColor3 = appState.COL_WHITE
menuButton.TextSize = isMobile and 12 or 12
menuButton.Font = Enum.Font.GothamBold
menuButton.ZIndex = 4
menuButton.AutoButtonColor = false
menuButton.Active = true
menuButton.Parent = mainGui
createUICorner(menuButton, 7)
addGradientStroke(menuButton, 1)

--------------------------------------------------------------------------------
-- PANEL PRINCIPAL
--------------------------------------------------------------------------------
appState.panel = Instance.new("Frame")
appState.panel.Name = generateRandomGuiName()
appState.panel.Size = UDim2.new(0, appState.PANEL_W, 0, appState.PANEL_H)
appState.panel.Position = UDim2.new(0.5, -appState.PANEL_W / 2, 0.5, -appState.PANEL_H / 2)
appState.panel.BackgroundColor3 = Color3.fromRGB(12, 16, 25)
appState.panel.BackgroundTransparency = 0
appState.panel.BorderSizePixel = 0
appState.panel.Visible = true
appState.panel.ZIndex = 10
appState.panel.Active = true
appState.panel.Parent = mainGui
createUICorner(appState.panel, 18)
addGradientStroke(appState.panel, 1).Transparency = 0.65
do
    local uiGradient = Instance.new("UIGradient")
    local keys = {}
    keys[1] = ColorSequenceKeypoint.new(0, Color3.fromRGB(12, 16, 25))
    keys[2] = ColorSequenceKeypoint.new(0.55, Color3.fromRGB(18, 25, 39))
    keys[3] = ColorSequenceKeypoint.new(1, Color3.fromRGB(12, 16, 25))
    uiGradient.Color = ColorSequence.new(keys)
    uiGradient.Rotation = 135
    uiGradient.Parent = appState.panel
end

local headerHeight = 64
local headerFrame = Instance.new("Frame")
headerFrame.Size = UDim2.new(1, 0, 0, headerHeight)
headerFrame.BackgroundColor3 = Color3.fromRGB(10, 27, 45)
headerFrame.BackgroundTransparency = 1
headerFrame.BorderSizePixel = 0
headerFrame.ZIndex = 11
headerFrame.Parent = appState.panel
createUICorner(headerFrame, 18)
do
    local frame4 = Instance.new("Frame")
    frame4.Size = UDim2.new(1, 0, 0, 18)
    frame4.Position = UDim2.new(0, 0, 1, -18)
    frame4.BackgroundColor3 = Color3.fromRGB(10, 27, 55)
    frame4.BackgroundTransparency = 1
    frame4.BorderSizePixel = 0
    frame4.ZIndex = 12
    frame4.Parent = headerFrame
end
do
    local frame4 = Instance.new("Frame")
    frame4.Size = UDim2.new(1, 0, 0, 2)
    frame4.Position = UDim2.new(0, 0, 1, -2)
    frame4.BackgroundColor3 = Color3.fromRGB(95, 175, 255)
    frame4.BackgroundTransparency = 1
    frame4.BorderSizePixel = 0
    frame4.ZIndex = 13
    frame4.Parent = headerFrame
    local uiGradient = Instance.new("UIGradient")
    local keys = {}
    keys[1] = ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 115, 235))
    keys[2] = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(235, 248, 255))
    keys[3] = ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 145, 255))
    uiGradient.Color = ColorSequence.new(keys)
    uiGradient.Parent = frame4
    table.insert(appState.allGradients, uiGradient)
end

-- Logo del header
if logoAsset then
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(0, isMobile and 32 or 36, 0, isMobile and 32 or 36)
    imageLabel.Position = UDim2.new(0, 10, 0.5, isMobile and -16 or -18)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Image = logoAsset
    imageLabel.ScaleType = Enum.ScaleType.Fit
    imageLabel.ZIndex = 15
    imageLabel.Parent = headerFrame
else
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0, isMobile and 32 or 36, 0, isMobile and 32 or 28)
    textLabel.Position = UDim2.new(0, 10, 0.5, isMobile and -16 or -18)
    textLabel.BackgroundColor3 = Color3.fromRGB(12, 45, 92)
    textLabel.BackgroundTransparency = 0.08
    textLabel.Text = "ON"
    textLabel.TextColor3 = Color3.fromRGB(225, 242, 255)
    textLabel.TextSize = isMobile and 14 or 12
    textLabel.Font = Enum.Font.GothamBlack
    textLabel.BorderSizePixel = 0
    textLabel.ZIndex = 15
    textLabel.Parent = headerFrame
    createUICorner(textLabel, 9)
    addGradientStroke(textLabel, 1)
end

-- Título
do
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -98, 1, 0)
    textLabel.Position = UDim2.new(0, isMobile and 54 or 54, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "ONION PROJECT"
    textLabel.TextColor3 = appState.COL_WHITE
    textLabel.TextSize = 18
    textLabel.Font = Enum.Font.GothamBlack
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.ZIndex = 14
    textLabel.Parent = headerFrame
end

do
    local badge = Instance.new("TextLabel")
    badge.Size = UDim2.new(0, 140, 0, 26)
    badge.Position = UDim2.new(1, -194, 0.5, -13)
    badge.BackgroundColor3 = Color3.fromRGB(27, 43, 68)
    badge.BackgroundTransparency = 0.2
    badge.BorderSizePixel = 0
    badge.Text = "BLOX FRUITS"
    badge.TextColor3 = Color3.fromRGB(140, 183, 250)
    badge.Font = Enum.Font.GothamBold
    badge.TextSize = 11
    badge.ZIndex = 15
    badge.Parent = headerFrame
    createUICorner(badge, 7)
    local hint = Instance.new("TextLabel")
    hint.BackgroundTransparency = 1
    hint.Size = UDim2.new(1, -36, 0, 22)
    hint.Position = UDim2.new(0, 18, 1, -25)
    hint.Text = "ONION PROJECT   /   " .. (isMobile and "Desliza las pestañas para explorar" or "T para mostrar u ocultar  ·  Arrastra el encabezado para mover")
    hint.TextColor3 = Color3.fromRGB(105, 124, 153)
    hint.TextSize = 10
    hint.Font = Enum.Font.Gotham
    hint.TextXAlignment = Enum.TextXAlignment.Left
    hint.ZIndex = 14
    hint.Parent = appState.panel
end

local RunService = game:GetService("RunService")

--------------------------------------------------------------------------------
-- UTILIDADES DE ANIMACIÓN
--------------------------------------------------------------------------------
local function playTween(obj, tweenInfo, props)
    local ok, tw = pcall(function()
        local t = TweenService:Create(obj, tweenInfo, props)
        t:Play()
        return t
    end)
    return ok and tw or nil
end

--------------------------------------------------------------------------------
-- ANIMACIÓN DE APERTURA / CIERRE DE LA VENTANA (valores originales)
--------------------------------------------------------------------------------
local function openWindow()
    appState.menuOpen = true
    appState.panel.Visible = true
    appState.panel.Size = UDim2.new(0, appState.PANEL_W, 0, 0)
    appState.panel.BackgroundTransparency = 1
    playTween(appState.panel, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, appState.PANEL_W, 0, appState.PANEL_H),
        BackgroundTransparency = 0,
    })
end

local function closeWindow()
    appState.menuOpen = false
    local tween = playTween(appState.panel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
        Size = UDim2.new(0, appState.PANEL_W, 0, 0),
        BackgroundTransparency = 1,
    })
    if tween then
        tween.Completed:Connect(function()
            if not appState.menuOpen then
                appState.panel.Visible = false
            end
        end)
    else
        appState.panel.Visible = false
    end
end

local function toggleWindow()
    if appState.menuOpen then
        closeWindow()
    else
        openWindow()
    end
end

-- Botón cerrar
do
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, isMobile and 25 or 28, 0, isMobile and 25 or 28)
    closeButton.Position = UDim2.new(1, isMobile and -33 or -38, 0.5, isMobile and -12 or -14)
    closeButton.BackgroundColor3 = Color3.fromRGB(15, 42, 78)
    closeButton.Text = "×"
    closeButton.TextColor3 = Color3.fromRGB(180, 225, 255)
    closeButton.TextSize = isMobile and 12 or 13
    closeButton.Font = Enum.Font.GothamBlack
    closeButton.BorderSizePixel = 0
    closeButton.AutoButtonColor = false
    closeButton.ZIndex = 15
    closeButton.Parent = headerFrame
    createUICorner(closeButton, 7)
    addGradientStroke(closeButton, 1)
    closeButton.MouseButton1Click:Connect(closeWindow)
end

makeDraggable(appState.panel, headerFrame)

menuButton.MouseButton1Click:Connect(toggleWindow)
if not isMobile then
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if input.KeyCode == Enum.KeyCode.T and not gameProcessed then
            toggleWindow()
        end
    end)
end

--------------------------------------------------------------------------------
-- CUERPO: SIDEBAR + CONTENIDO
--------------------------------------------------------------------------------
local bodyFrame = Instance.new("Frame")
bodyFrame.Size = UDim2.new(1, -32, 1, -(headerHeight + 34))
bodyFrame.Position = UDim2.new(0, 16, 0, headerHeight)
bodyFrame.BackgroundTransparency = 1
bodyFrame.ZIndex = 12
bodyFrame.Parent = appState.panel

local sidebarWidth = isMobile and 96 or 125
local sidebar = Instance.new("Frame")
sidebar.Size = UDim2.new(1, 0, 0, 48)
sidebar.BackgroundColor3 = Color3.fromRGB(17, 23, 35)
sidebar.BackgroundTransparency = 0.25
sidebar.BorderSizePixel = 0
sidebar.ZIndex = 11
sidebar.Parent = bodyFrame
sidebar.ClipsDescendants = true
createUICorner(sidebar, 11)

local sidebarScroll = Instance.new("ScrollingFrame")
sidebarScroll.Size = UDim2.new(1, -12, 1, -6)
sidebarScroll.Position = UDim2.new(0, 6, 0, 2)
sidebarScroll.BackgroundTransparency = 1
sidebarScroll.BorderSizePixel = 0
sidebarScroll.ScrollBarThickness = 0
sidebarScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
sidebarScroll.AutomaticCanvasSize = Enum.AutomaticSize.X
sidebarScroll.ScrollingDirection = Enum.ScrollingDirection.X
sidebarScroll.ScrollBarThickness = 2
sidebarScroll.ZIndex = 12
sidebarScroll.Parent = sidebar
do
    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uiListLayout.Padding = UDim.new(0, 5)
    uiListLayout.FillDirection = Enum.FillDirection.Horizontal
    uiListLayout.Parent = sidebarScroll
end
do
    local instance = Instance.new("UIPadding")
    instance.PaddingTop = UDim.new(0, 4)
    instance.PaddingLeft = UDim.new(0, 3)
    instance.PaddingRight = UDim.new(0, 3)
    instance.Parent = sidebarScroll
end

local contentHolder = Instance.new("Frame")
contentHolder.Size = UDim2.new(1, 0, 1, -62)
contentHolder.Position = UDim2.new(0, 0, 0, 62)
contentHolder.BackgroundTransparency = 1
contentHolder.ZIndex = 11
contentHolder.Parent = bodyFrame

-- SISTEMA DE TABS REUTILIZABLE
--  * Un único indicador (barra con gradient) que se desliza al tab seleccionado.
--  * TabSystem.addTab(nombre) crea botón + página; TabSystem.select(nombre) cambia.
--  * Añadir más tabs en el futuro = llamar a addTab; nada más que tocar.
--------------------------------------------------------------------------------
local TabSystem = {
    tabs = {},
    order = {},
    selected = nil,
    indicator = nil,
    indicatorTween = nil,
}
local TAB_FADE = TweenInfo.new(0.15, Enum.EasingStyle.Quad)
local TAB_SLIDE = TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

do
    -- Indicador único: misma geometría que el original (3px de ancho, 68% de alto)
    local indicator = Instance.new("Frame")
    indicator.Name = "TabSelectionIndicator"
    indicator.Size = UDim2.new(0, 3, 0, 20)
    indicator.BackgroundColor3 = appState.COL_WHITE -- el gradient lo tiñe (igual que los UIStroke originales)
    indicator.BackgroundTransparency = 1 -- aparece al seleccionar el primer tab
    indicator.BorderSizePixel = 0
    indicator.ZIndex = 16
    indicator.Parent = sidebar
    createUICorner(indicator, 3)
    local uiGradient = Instance.new("UIGradient")
    uiGradient.Color = ColorSequence.new(appState.ACCENT_KEYS)
    uiGradient.Rotation = 90
    uiGradient.Parent = indicator
    table.insert(appState.allGradients, uiGradient)
    TabSystem.indicator = indicator
end

local function indicatorGoal(tab)
    local b = tab.button
    local rel = b.AbsolutePosition - sidebar.AbsolutePosition
    return UDim2.fromOffset(rel.X + 10, rel.Y + b.AbsoluteSize.Y - 2), UDim2.fromOffset(b.AbsoluteSize.X - 20, 2)
end

local function setTabVisual(tab, selected, instant)
    local bgT = selected and 0.05 or 1
    local strokeT = selected and 0.6 or 1
    local color = selected and appState.COL_WHITE or appState.COL_DIM
    tab.label.Font = selected and Enum.Font.GothamBlack or Enum.Font.GothamBold
    if instant then
        tab.button.BackgroundTransparency = bgT
        tab.stroke.Transparency = strokeT
        tab.label.TextColor3 = color
    else
        playTween(tab.button, TAB_FADE, { BackgroundTransparency = bgT })
        playTween(tab.stroke, TAB_FADE, { Transparency = strokeT })
        playTween(tab.label, TAB_FADE, { TextColor3 = color })
    end
    tab.content.Visible = selected
end

function TabSystem.select(name, instant)
    local tab = TabSystem.tabs[name]
    if not tab or TabSystem.selected == name then
        return
    end
    local previous = TabSystem.tabs[TabSystem.selected]
    if previous then
        setTabVisual(previous, false, instant)
    end
    TabSystem.selected = name
    setTabVisual(tab, true, instant)

    local pos, size = indicatorGoal(tab)
    local indicator = TabSystem.indicator
    if TabSystem.indicatorTween then
        TabSystem.indicatorTween:Cancel()
        TabSystem.indicatorTween = nil
    end
    if instant or indicator.BackgroundTransparency >= 1 then
        indicator.Position = pos
        indicator.Size = size
        if instant then
            indicator.BackgroundTransparency = 0
        else
            playTween(indicator, TAB_FADE, { BackgroundTransparency = 0 })
        end
    else
        local tw = playTween(indicator, TAB_SLIDE, { Position = pos, Size = size })
        TabSystem.indicatorTween = tw
        if tw then
            tw.Completed:Connect(function()
                if TabSystem.indicatorTween == tw then
                    TabSystem.indicatorTween = nil
                end
            end)
        end
    end
end

function TabSystem.addTab(name)
    local index = #TabSystem.order + 1
    local tabButton = Instance.new("TextButton")
    tabButton.Size = UDim2.new(0, math.max(82, #name * 7 + 28), 0, 36)
    tabButton.BackgroundColor3 = Color3.fromRGB(10, 31, 61)
    tabButton.BackgroundTransparency = 0.48
    tabButton.BorderSizePixel = 0
    tabButton.Text = ""
    tabButton.AutoButtonColor = false
    tabButton.LayoutOrder = index
    tabButton.ZIndex = 13
    tabButton.Parent = sidebarScroll
    createUICorner(tabButton, 8)

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -12, 1, 0)
    label.Position = UDim2.new(0, 6, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = name
    label.TextColor3 = appState.COL_DIM
    label.TextSize = isMobile and 10 or 12
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.ZIndex = 14
    label.Parent = tabButton

    local stroke = addGradientStroke(tabButton, 1)
    stroke.Transparency = 0.8

    local content = Instance.new("ScrollingFrame")
    content.Name = generateRandomGuiName()
    content.Size = UDim2.new(1, 0, 1, 0)
    content.BackgroundTransparency = 1
    content.BorderSizePixel = 0
    content.ScrollBarThickness = isMobile and 4 or 3
    content.ScrollBarImageColor3 = Color3.fromRGB(80, 120, 255)
    content.CanvasSize = UDim2.new(0, 0, 0, 0)
    content.AutomaticCanvasSize = Enum.AutomaticSize.Y
    content.Visible = false
    content.ZIndex = 12
    content.Parent = contentHolder
    do
        local uiListLayout = Instance.new("UIListLayout")
        uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        uiListLayout.Padding = UDim.new(0, 14)
        uiListLayout.FillDirection = Enum.FillDirection.Horizontal
        uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
        uiListLayout.Parent = content
    end
    do
        local uiPadding = Instance.new("UIPadding")
        uiPadding.PaddingTop = UDim.new(0, 6)
        uiPadding.PaddingBottom = UDim.new(0, 8)
        uiPadding.PaddingLeft = UDim.new(0, 6)
        uiPadding.PaddingRight = UDim.new(0, 8)
        uiPadding.Parent = content
    end

    local tab = { name = name, button = tabButton, label = label, stroke = stroke, content = content }
    TabSystem.tabs[name] = tab
    TabSystem.order[index] = name

    tabButton.MouseButton1Click:Connect(function()
        TabSystem.select(name, false)
    end)

    -- Mantiene el indicador sincronizado si el layout se mueve (scroll, ventana animada)
    tabButton:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
        if TabSystem.selected == name and not TabSystem.indicatorTween then
            local pos, size = indicatorGoal(tab)
            TabSystem.indicator.Position = pos
            TabSystem.indicator.Size = size
        end
    end)
    return content
end



--------------------------------------------------------------------------------
-- TOOLTIP / NOTIFICACIONES (infraestructura)
--------------------------------------------------------------------------------
local tooltipFrame = Instance.new("Frame")
tooltipFrame.Name = "OnionProjectTooltip"
tooltipFrame.AutomaticSize = Enum.AutomaticSize.XY
tooltipFrame.Size = UDim2.new(0, 0, 0, 0)
tooltipFrame.BackgroundColor3 = Color3.fromRGB(12, 16, 25)
tooltipFrame.BackgroundTransparency = 1
tooltipFrame.BorderSizePixel = 0
tooltipFrame.Visible = false
tooltipFrame.ZIndex = 100
tooltipFrame.Parent = mainGui
createUICorner(tooltipFrame, 7)
local tooltipStroke = addGradientStroke(tooltipFrame, 1)
tooltipStroke.Transparency = 1
do
    local pad = Instance.new("UIPadding")
    pad.PaddingTop = UDim.new(0, 5)
    pad.PaddingBottom = UDim.new(0, 5)
    pad.PaddingLeft = UDim.new(0, 8)
    pad.PaddingRight = UDim.new(0, 8)
    pad.Parent = tooltipFrame
end
local tooltipLabel = Instance.new("TextLabel")
tooltipLabel.AutomaticSize = Enum.AutomaticSize.XY
tooltipLabel.Size = UDim2.new(0, 0, 0, 0)
tooltipLabel.BackgroundTransparency = 1
tooltipLabel.Text = ""
tooltipLabel.TextColor3 = appState.COL_WHITE
tooltipLabel.TextTransparency = 1
tooltipLabel.TextSize = 11
tooltipLabel.Font = Enum.Font.GothamBold
tooltipLabel.ZIndex = 101
tooltipLabel.Parent = tooltipFrame

local tooltipToken = 0
local function attachTooltip(guiObject, text)
    guiObject.MouseEnter:Connect(function()
        tooltipToken = tooltipToken + 1
        tooltipLabel.Text = text
        local abs = guiObject.AbsolutePosition - mainGui.AbsolutePosition
        tooltipFrame.Position = UDim2.fromOffset(abs.X + 8, abs.Y + guiObject.AbsoluteSize.Y + 4)
        tooltipFrame.Visible = true
        playTween(tooltipFrame, TweenInfo.new(0.15, Enum.EasingStyle.Quad), { BackgroundTransparency = 0.05 })
        playTween(tooltipStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quad), { Transparency = 0.25 })
        playTween(tooltipLabel, TweenInfo.new(0.15, Enum.EasingStyle.Quad), { TextTransparency = 0 })
    end)
    guiObject.MouseLeave:Connect(function()
        tooltipToken = tooltipToken + 1
        local mine = tooltipToken
        playTween(tooltipFrame, TweenInfo.new(0.12, Enum.EasingStyle.Quad), { BackgroundTransparency = 1 })
        playTween(tooltipStroke, TweenInfo.new(0.12, Enum.EasingStyle.Quad), { Transparency = 1 })
        playTween(tooltipLabel, TweenInfo.new(0.12, Enum.EasingStyle.Quad), { TextTransparency = 1 })
        task.delay(0.13, function()
            if mine == tooltipToken then
                tooltipFrame.Visible = false
            end
        end)
    end)
end

local toastHolder = Instance.new("Frame")
toastHolder.Name = "OnionProjectToasts"
toastHolder.AnchorPoint = Vector2.new(1, 0)
toastHolder.Position = UDim2.new(1, -12, 0, 12)
toastHolder.Size = UDim2.new(0, 250, 1, -24)
toastHolder.BackgroundTransparency = 1
toastHolder.ZIndex = 90
toastHolder.Parent = mainGui
do
    local l = Instance.new("UIListLayout")
    l.SortOrder = Enum.SortOrder.LayoutOrder
    l.Padding = UDim.new(0, 6)
    l.Parent = toastHolder
end

local toastCounter = 0
local function showToast(title, message)
    toastCounter = toastCounter + 1
    local wrapper = Instance.new("Frame")
    wrapper.Size = UDim2.new(1, 0, 0, 56)
    wrapper.BackgroundTransparency = 1
    wrapper.LayoutOrder = toastCounter
    wrapper.ClipsDescendants = false
    wrapper.ZIndex = 90
    wrapper.Parent = toastHolder

    local toast = Instance.new("Frame")
    toast.Size = UDim2.new(1, 0, 1, 0)
    toast.Position = UDim2.new(1.3, 0, 0, 0)
    toast.BackgroundColor3 = Color3.fromRGB(21, 29, 43)
    toast.BackgroundTransparency = 0.15
    toast.BorderSizePixel = 0
    toast.ZIndex = 91
    toast.Parent = wrapper
    createUICorner(toast, 10)
    addGradientStroke(toast, 1.5)

    local tl = Instance.new("TextLabel")
    tl.Size = UDim2.new(1, -20, 0, 18)
    tl.Position = UDim2.new(0, 10, 0, 8)
    tl.BackgroundTransparency = 1
    tl.Text = string.upper(title)
    tl.TextColor3 = Color3.fromRGB(181, 205, 243)
    tl.TextSize = 11
    tl.Font = Enum.Font.GothamBlack
    tl.TextXAlignment = Enum.TextXAlignment.Left
    tl.ZIndex = 92
    tl.Parent = toast

    local ml = Instance.new("TextLabel")
    ml.Size = UDim2.new(1, -20, 0, 18)
    ml.Position = UDim2.new(0, 10, 0, 28)
    ml.BackgroundTransparency = 1
    ml.Text = message
    ml.TextColor3 = appState.COL_WHITE
    ml.TextSize = 12
    ml.Font = Enum.Font.GothamBold
    ml.TextXAlignment = Enum.TextXAlignment.Left
    ml.TextTruncate = Enum.TextTruncate.AtEnd
    ml.ZIndex = 92
    ml.Parent = toast

    playTween(toast, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0),
    })
    task.delay(3, function()
        local tw = playTween(toast, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(1.3, 0, 0, 0),
        })
        if tw then
            tw.Completed:Connect(function()
                wrapper:Destroy()
            end)
        else
            wrapper:Destroy()
        end
    end)
end

--------------------------------------------------------------------------------
-- COMPONENTES (estilo original). Todo es local: no hay lógica de negocio.
--------------------------------------------------------------------------------

local ACCENT_TWEEN = TweenInfo.new(0.15, Enum.EasingStyle.Quad)

local function newRow(parent, height, bgColor, bgTransparency, corner, order)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, height)
    frame.BackgroundColor3 = bgColor or Color3.fromRGB(28, 38, 54)
    frame.BackgroundTransparency = bgTransparency or 0.42
    frame.BorderSizePixel = 0
    frame.ZIndex = 12
    frame.LayoutOrder = order or #parent:GetChildren()
    frame.Parent = parent
    createUICorner(frame, corner or 8)
    return frame
end

local function newLabel(parent, text, x, y, w, h, size, color, font, align)
    local l = Instance.new("TextLabel")
    l.Size = w
    l.Position = UDim2.new(0, x, 0, y)
    if h then
        l.Size = UDim2.new(w.X.Scale, w.X.Offset, 0, h)
    end
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = color or appState.COL_WHITE
    l.TextSize = size or 12
    l.Font = font or Enum.Font.GothamBold
    l.TextXAlignment = align or Enum.TextXAlignment.Left
    l.ZIndex = 13
    l.Parent = parent
    return l
end

-- Encabezado de sección (createSectionHeader original)
local function createSectionHeader(parent, text)
    local instance = Instance.new("TextLabel")
    instance.Size = UDim2.new(1, 0, 0, isMobile and 28 or 32)
    instance.BackgroundTransparency = 1
    instance.Text = text
    instance.TextColor3 = appState.COL_WHITE
    instance.TextSize = isMobile and 14 or 12
    instance.Font = Enum.Font.GothamBold
    instance.TextXAlignment = Enum.TextXAlignment.Left
    instance.ZIndex = 12
    instance.LayoutOrder = #parent:GetChildren()
    instance.Parent = parent
    local line = Instance.new("Frame")
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 1, -1)
    line.BackgroundColor3 = appState.COL_WHITE
    line.BorderSizePixel = 0
    line.ZIndex = 12
    line.Parent = instance
    return instance
end

local function createDescription(parent, text)
    local l = Instance.new("TextLabel")
    l.Size = UDim2.new(1, 0, 0, 0)
    l.AutomaticSize = Enum.AutomaticSize.Y
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextWrapped = true
    l.TextColor3 = appState.COL_DIM
    l.TextSize = isMobile and 12 or 11
    l.Font = Enum.Font.GothamBold
    l.TextXAlignment = Enum.TextXAlignment.Left
    l.TextYAlignment = Enum.TextYAlignment.Top
    l.ZIndex = 13
    l.LayoutOrder = #parent:GetChildren()
    l.Parent = parent
    return l
end

local function createSeparator(parent)
    local f = Instance.new("Frame")
    f.Size = UDim2.new(1, 0, 0, 1)
    f.BackgroundColor3 = Color3.fromRGB(60, 145, 255)
    f.BackgroundTransparency = 0.45
    f.BorderSizePixel = 0
    f.ZIndex = 13
    f.LayoutOrder = #parent:GetChildren()
    f.Parent = parent
    return f
end

-- Tarjeta de sección (createPanelSection original)
local function createPanelSection(parent, sectionTitle)
    local instance = Instance.new("Frame")
    instance.Name = generateRandomGuiName()
    instance.Size = UDim2.new(1, 0, 0, 0)
    instance.AutomaticSize = Enum.AutomaticSize.Y
    instance.BackgroundColor3 = Color3.fromRGB(21, 29, 43)
    instance.BackgroundTransparency = 0.08
    instance.BorderSizePixel = 0
    instance.ZIndex = 12
    instance.LayoutOrder = #parent:GetChildren()
    instance.Parent = parent
    createUICorner(instance, 10)

    local uiStroke = Instance.new("UIStroke")
    uiStroke.Color = Color3.fromRGB(65, 145, 255)
    uiStroke.Thickness = 1
    uiStroke.Transparency = 0.78
    uiStroke.Parent = instance

    local uiListLayout = Instance.new("UIListLayout")
    uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uiListLayout.Padding = UDim.new(0, 5)
    uiListLayout.Parent = instance

    local instance2 = Instance.new("UIPadding")
    instance2.PaddingTop = UDim.new(0, 7)
    instance2.PaddingBottom = UDim.new(0, 8)
    instance2.PaddingLeft = UDim.new(0, 8)
    instance2.PaddingRight = UDim.new(0, 8)
    instance2.Parent = instance

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 0, isMobile and 24 or 21)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = string.upper(sectionTitle)
    textLabel.TextColor3 = Color3.fromRGB(181, 205, 243)
    textLabel.TextSize = isMobile and 13 or 11
    textLabel.Font = Enum.Font.GothamBlack
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.ZIndex = 13
    textLabel.LayoutOrder = 1
    textLabel.Parent = instance

    local frame4 = Instance.new("Frame")
    frame4.Size = UDim2.new(1, 0, 0, 1)
    frame4.BackgroundColor3 = Color3.fromRGB(60, 145, 255)
    frame4.BackgroundTransparency = 0.45
    frame4.BorderSizePixel = 0
    frame4.ZIndex = 13
    frame4.LayoutOrder = 2
    frame4.Parent = instance

    local frame5 = Instance.new("Frame")
    frame5.Size = UDim2.new(1, 0, 0, 0)
    frame5.AutomaticSize = Enum.AutomaticSize.Y
    frame5.BackgroundTransparency = 1
    frame5.ZIndex = 12
    frame5.LayoutOrder = 3
    frame5.Parent = instance

    local uiListLayout2 = Instance.new("UIListLayout")
    uiListLayout2.SortOrder = Enum.SortOrder.LayoutOrder
    uiListLayout2.Padding = UDim.new(0, 7)
    uiListLayout2.Parent = frame5

    return frame5, instance
end

-- Estado visual de gradient de un track (como createToggleRow original)
local function setTrackGradient(uiGradient, enabled)
    if enabled then
        uiGradient.Color = ColorSequence.new(appState.ACCENT_KEYS)
        local found = false
        for _, g in ipairs(appState.allGradients) do
            if g == uiGradient then
                found = true
                break
            end
        end
        if not found then
            table.insert(appState.allGradients, uiGradient)
        end
    else
        uiGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(28, 55, 88)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(28, 45, 92)),
        })
        for idx, g in ipairs(appState.allGradients) do
            if g == uiGradient then
                table.remove(appState.allGradients, idx)
                break
            end
        end
    end
end

-- Toggle grande (createToggleRow del original)
local function createToggleRow(parent, text, enabled, onChanged, locked)
    local rowHeight = 42
    local frame3 = newRow(parent, rowHeight, Color3.fromRGB(28, 38, 54), 0.42, 8)

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, -60, 1, 0)
    textLabel.Position = UDim2.new(0, 10, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = text
    textLabel.TextColor3 = appState.COL_WHITE
    textLabel.TextSize = 13
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    textLabel.TextWrapped = true
    textLabel.ZIndex = 13
    textLabel.Parent = frame3

    local trackW = isMobile and 46 or 40
    local trackH = isMobile and 24 or 20
    local knob = isMobile and 20 or 16
    local track = Instance.new("Frame")
    track.Size = UDim2.new(0, trackW, 0, trackH)
    track.Position = UDim2.new(1, -trackW - 8, 0.5, -trackH / 2)
    track.BackgroundColor3 = Color3.fromRGB(28, 55, 88)
    track.BorderSizePixel = 0
    track.ZIndex = 13
    track.Parent = frame3
    createUICorner(track, trackH / 2)
    local uiGradient = Instance.new("UIGradient")
    uiGradient.Parent = track

    local knobFrame = Instance.new("Frame")
    knobFrame.Size = UDim2.new(0, knob, 0, knob)
    knobFrame.Position = enabled and UDim2.new(1, -knob - 2, 0.5, -knob / 2) or UDim2.new(0, 2, 0.5, -knob / 2)
    knobFrame.BackgroundColor3 = appState.COL_WHITE
    knobFrame.BorderSizePixel = 0
    knobFrame.ZIndex = 14
    knobFrame.Parent = track
    createUICorner(knobFrame, knob / 2)

    setTrackGradient(uiGradient, enabled)

    local clickArea = Instance.new("TextButton")
    clickArea.Size = UDim2.new(1, 0, 1, 0)
    clickArea.BackgroundTransparency = 1
    clickArea.Text = ""
    clickArea.ZIndex = 15
    clickArea.Parent = frame3
    local function setValue(value, silent)
        enabled = value == true
        playTween(knobFrame, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
            Position = enabled and UDim2.new(1, -knob - 2, 0.5, -knob / 2) or UDim2.new(0, 2, 0.5, -knob / 2),
            BackgroundColor3 = appState.COL_WHITE,
        })
        setTrackGradient(uiGradient, enabled)
        if onChanged and not silent then onChanged(enabled) end
    end
    clickArea.MouseButton1Click:Connect(function()
        if not locked then setValue(not enabled) end
    end)
    if locked then textLabel.TextTransparency = 0.5 end
    return frame3, setValue
end

-- Toggle compacto (createToggle del original)
local function createToggle(parent, text, enabled)
    local rowHeight = isMobile and 28 or 30
    local frame3 = newRow(parent, rowHeight, Color3.fromRGB(28, 38, 54), 0.42, 6)
    frame3.ZIndex = 11

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -50, 1, 0)
    label.Position = UDim2.new(0, 8, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = appState.COL_WHITE
    label.TextSize = 12
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.ZIndex = 12
    label.Parent = frame3

    local trackW = isMobile and 42 or 36
    local trackH = isMobile and 22 or 18
    local knob = isMobile and 18 or 14
    local track = Instance.new("Frame")
    track.Size = UDim2.new(0, trackW, 0, trackH)
    track.Position = UDim2.new(1, -trackW - 6, 0.5, -trackH / 2)
    track.BackgroundColor3 = Color3.fromRGB(28, 55, 88)
    track.BorderSizePixel = 0
    track.ZIndex = 12
    track.Parent = frame3
    createUICorner(track, trackH / 2)
    local uiGradient = Instance.new("UIGradient")
    uiGradient.Parent = track

    local knobFrame = Instance.new("Frame")
    knobFrame.Size = UDim2.new(0, knob, 0, knob)
    knobFrame.Position = enabled and UDim2.new(1, -knob - 2, 0.5, -knob / 2) or UDim2.new(0, 2, 0.5, -knob / 2)
    knobFrame.BackgroundColor3 = appState.COL_WHITE
    knobFrame.BorderSizePixel = 0
    knobFrame.ZIndex = 13
    knobFrame.Parent = track
    createUICorner(knobFrame, knob / 2)
    setTrackGradient(uiGradient, enabled)

    local clickArea = Instance.new("TextButton")
    clickArea.Size = UDim2.new(1, 0, 1, 0)
    clickArea.BackgroundTransparency = 1
    clickArea.Text = ""
    clickArea.ZIndex = 12
    clickArea.Parent = frame3
    clickArea.MouseButton1Click:Connect(function()
        enabled = not enabled
        playTween(knobFrame, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
            Position = enabled and UDim2.new(1, -knob - 2, 0.5, -knob / 2) or UDim2.new(0, 2, 0.5, -knob / 2),
        })
        setTrackGradient(uiGradient, enabled)
    end)
    return frame3
end

-- Botones: "normal" (createActionButton original), "featured" (estilo Menu/keybind), "disabled"
local function createButton(parent, text, style, onClick)
    style = style or "normal"
    local frame3 = Instance.new("Frame")
    frame3.Size = UDim2.new(1, 0, 0, isMobile and 36 or 30)
    frame3.BorderSizePixel = 0
    frame3.ZIndex = 12
    frame3.LayoutOrder = #parent:GetChildren()
    frame3.Parent = parent
    createUICorner(frame3, 8)

    local restT, hoverT, pressT
    local restColor = Color3.fromRGB(28, 38, 54)
    if style == "featured" then
        restColor = Color3.fromRGB(12, 48, 90)
        restT, hoverT, pressT = 0.28, 0.1, 0
        addGradientStroke(frame3, 1)
    elseif style == "disabled" then
        restT = 0.7
    else
        restT, hoverT, pressT = 0.42, 0, 0
    end
    frame3.BackgroundColor3 = restColor
    frame3.BackgroundTransparency = restT

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 1, 0)
    button.BackgroundTransparency = 1
    button.Text = text
    button.TextColor3 = appState.COL_WHITE
    button.TextSize = isMobile and 14 or 12
    button.Font = style == "featured" and Enum.Font.GothamBlack or Enum.Font.GothamBold
    button.ZIndex = 13
    button.AutoButtonColor = false
    button.Parent = frame3

    if style == "disabled" then
        button.TextTransparency = 0.55
        button.Active = false
        button.AutoButtonColor = false
        return frame3, button
    end

    local hovering = false
    button.MouseEnter:Connect(function()
        hovering = true
        playTween(frame3, TweenInfo.new(0.1), { BackgroundTransparency = hoverT })
    end)
    button.MouseLeave:Connect(function()
        hovering = false
        playTween(frame3, TweenInfo.new(0.1), { BackgroundTransparency = style == "featured" and restT or 0.2 })
    end)
    button.MouseButton1Down:Connect(function()
        playTween(frame3, TweenInfo.new(0.06), {
            BackgroundTransparency = pressT,
            BackgroundColor3 = Color3.fromRGB(16, 58, 108),
        })
    end)
    button.MouseButton1Up:Connect(function()
        playTween(frame3, TweenInfo.new(0.1), {
            BackgroundTransparency = hovering and hoverT or restT,
            BackgroundColor3 = restColor,
        })
    end)
    if onClick then
        button.MouseButton1Click:Connect(onClick)
    end
    return frame3, button
end

-- Slider
local function createSlider(parent, text, minV, maxV, defaultV, step, suffix, onChanged, locked)
    local pageScroll = parent:FindFirstAncestorWhichIsA("ScrollingFrame")
    step = tonumber(step) or 1
    if step <= 0 then step = 1 end
    local row = newRow(parent, isMobile and 56 or 52, Color3.fromRGB(28, 38, 54), 0.42, 8)
    newLabel(row, text, 10, 6, UDim2.new(0.6, 0, 0, 18), 18, isMobile and 14 or 12)
    local valueLabel = newLabel(row, "", 0, 6, UDim2.new(0.4, -10, 0, 18), 18, 12, Color3.fromRGB(80, 205, 255), Enum.Font.GothamBold, Enum.TextXAlignment.Right)
    valueLabel.Position = UDim2.new(0.6, 0, 0, 6)

    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, -20, 0, 8)
    track.Position = UDim2.new(0, 10, 1, -18)
    track.BackgroundColor3 = Color3.fromRGB(28, 55, 88)
    track.BorderSizePixel = 0
    track.ZIndex = 13
    track.Parent = row
    createUICorner(track, 4)

    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = appState.COL_WHITE
    fill.BorderSizePixel = 0
    fill.ZIndex = 14
    fill.Parent = track
    createUICorner(fill, 4)
    createUIGradient(fill)

    local knob = Instance.new("Frame")
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Size = UDim2.new(0, 14, 0, 14)
    knob.Position = UDim2.new(0, 0, 0.5, 0)
    knob.BackgroundColor3 = appState.COL_WHITE
    knob.BorderSizePixel = 0
    knob.ZIndex = 15
    knob.Parent = track
    createUICorner(knob, 7)
    addGradientStroke(knob, 1)

    local hit = Instance.new("TextButton")
    hit.Size = UDim2.new(1, 12, 0, 28)
    hit.Position = UDim2.new(0, -6, 0.5, -14)
    hit.BackgroundTransparency = 1
    hit.Text = ""
    hit.ZIndex = 16
    hit.Parent = track

    local value = defaultV
    local function apply(v, silent)
        value = math.clamp(v, minV, maxV)
        local a = (value - minV) / math.max(maxV - minV, 0.000001)
        fill.Size = UDim2.new(a, 0, 1, 0)
        knob.Position = UDim2.new(a, 0, 0.5, 0)
        local shown = math.floor(value * 100 + 0.5) / 100
        valueLabel.Text = tostring(shown) .. (suffix or "")
        if onChanged and not silent then onChanged(value) end
    end
    apply(defaultV, true)

    local function setFromX(x)
        local a = math.clamp((x - track.AbsolutePosition.X) / math.max(track.AbsoluteSize.X, 1), 0, 1)
        local v = minV + a * math.max(maxV - minV, 0.000001)
        v = math.floor(v / step + 0.5) * step
        apply(v)
    end

    local dragging = false
    local function isPointer(input)
        return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch
    end
    hit.InputBegan:Connect(function(input)
        if isPointer(input) and not locked then
            dragging = true
            if pageScroll then pageScroll.ScrollingEnabled = false end
            playTween(knob, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { Size = UDim2.new(0, 18, 0, 18) })
            setFromX(input.Position.X)
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            setFromX(input.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if dragging and isPointer(input) then
            dragging = false
            if pageScroll then pageScroll.ScrollingEnabled = true end
            playTween(knob, TweenInfo.new(0.1, Enum.EasingStyle.Quad), { Size = UDim2.new(0, 14, 0, 14) })
        end
    end)
    return row, apply
end

-- Barra de progreso de solo lectura
local function createProgressBar(parent, text)
    local row = newRow(parent, isMobile and 50 or 46, Color3.fromRGB(28, 38, 54), 0.42, 8)
    local title = newLabel(row, text, 10, 6, UDim2.new(0.6, 0, 0, 18), 18, isMobile and 14 or 12)
    local pct = newLabel(row, "0%", 0, 6, UDim2.new(0.4, -10, 0, 18), 18, 12, Color3.fromRGB(80, 205, 255), Enum.Font.GothamBold, Enum.TextXAlignment.Right)
    pct.Position = UDim2.new(0.6, 0, 0, 6)
    local track = Instance.new("Frame")
    track.Size = UDim2.new(1, -20, 0, 8)
    track.Position = UDim2.new(0, 10, 1, -16)
    track.BackgroundColor3 = Color3.fromRGB(28, 55, 88)
    track.BorderSizePixel = 0
    track.ZIndex = 13
    track.Parent = row
    createUICorner(track, 4)
    local fill = Instance.new("Frame")
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.BackgroundColor3 = appState.COL_WHITE
    fill.BorderSizePixel = 0
    fill.ZIndex = 14
    fill.Parent = track
    createUICorner(fill, 4)
    createUIGradient(fill)
    local token = 0
    local function run(duration)
        token = token + 1
        local mine = token
        fill.Size = UDim2.new(0, 0, 1, 0)
        title.Text = text
        playTween(fill, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
            Size = UDim2.new(1, 0, 1, 0),
        })
        task.spawn(function()
            local start = os.clock()
            while mine == token do
                local a = math.clamp((os.clock() - start) / duration, 0, 1)
                pct.Text = tostring(math.floor(a * 100)) .. "%"
                if a >= 1 then
                    title.Text = "Done"
                    break
                end
                task.wait(0.05)
            end
        end)
    end
    local function set(a)
        token = token + 1
        fill.Size = UDim2.new(a, 0, 1, 0)
        pct.Text = tostring(math.floor(a * 100)) .. "%"
    end
    return row, run, set
end

-- Dropdown (se despliega dentro del flujo con el tween del panel colapsable original: 0.22 Quint)
local function createDropdown(parent, title, options, defaultIndex)
    local headerH = isMobile and 36 or 32
    local optH = isMobile and 32 or 28
    local listH = #options * optH + 6
    local container = newRow(parent, headerH, Color3.fromRGB(28, 38, 54), 0.2, 6)
    container.ClipsDescendants = true

    local header = Instance.new("TextButton")
    header.Size = UDim2.new(1, 0, 0, headerH)
    header.BackgroundTransparency = 1
    header.Text = ""
    header.AutoButtonColor = false
    header.ZIndex = 13
    header.Parent = container

    newLabel(header, title, 8, 0, UDim2.new(0.5, 0, 1, 0), nil, isMobile and 13 or 11)
    local selectedLabel = newLabel(header, "", 0, 0, UDim2.new(0.5, -34, 1, 0), nil, isMobile and 12 or 11, Color3.fromRGB(80, 205, 255), Enum.Font.GothamBold, Enum.TextXAlignment.Right)
    selectedLabel.Position = UDim2.new(0.5, 0, 0, 0)
    local arrow = newLabel(header, "+", 0, 0, UDim2.new(0, 24, 1, 0), nil, 14, appState.COL_WHITE, Enum.Font.GothamBlack, Enum.TextXAlignment.Center)
    arrow.Position = UDim2.new(1, -28, 0, 0)

    local optionButtons = {}
    local selectedIndex = defaultIndex or 1
    local isOpen = false

    local function refresh()
        selectedLabel.Text = options[selectedIndex]
        for i, ob in ipairs(optionButtons) do
            local sel = i == selectedIndex
            playTween(ob.button, ACCENT_TWEEN, { BackgroundTransparency = sel and 0.28 or 1 })
            playTween(ob.dot, ACCENT_TWEEN, { BackgroundTransparency = sel and 0 or 1 })
            ob.label.Font = sel and Enum.Font.GothamBlack or Enum.Font.GothamBold
        end
    end

    local function setOpen(open)
        isOpen = open
        arrow.Text = open and "-" or "+"
        playTween(container, TweenInfo.new(0.22, Enum.EasingStyle.Quint), {
            Size = UDim2.new(1, 0, 0, open and (headerH + listH) or headerH),
        })
    end

    for i, optText in ipairs(options) do
        local ob = Instance.new("TextButton")
        ob.Size = UDim2.new(1, -12, 0, optH - 4)
        ob.Position = UDim2.new(0, 6, 0, headerH + 3 + (i - 1) * optH)
        ob.BackgroundColor3 = Color3.fromRGB(12, 48, 90)
        ob.BackgroundTransparency = 1
        ob.BorderSizePixel = 0
        ob.Text = ""
        ob.AutoButtonColor = false
        ob.ZIndex = 14
        ob.Parent = container
        createUICorner(ob, 6)
        local lb = newLabel(ob, optText, 10, 0, UDim2.new(1, -30, 1, 0), nil, isMobile and 13 or 11)
        lb.ZIndex = 15
        local dot = Instance.new("Frame")
        dot.Size = UDim2.new(0, 8, 0, 8)
        dot.Position = UDim2.new(1, -18, 0.5, -4)
        dot.BackgroundColor3 = appState.COL_WHITE
        dot.BackgroundTransparency = 1
        dot.BorderSizePixel = 0
        dot.ZIndex = 15
        dot.Parent = ob
        createUICorner(dot, 4)
        createUIGradient(dot)
        optionButtons[i] = { button = ob, label = lb, dot = dot }

        ob.MouseEnter:Connect(function()
            if i ~= selectedIndex then
                playTween(ob, TweenInfo.new(0.1), { BackgroundTransparency = 0.6 })
            end
        end)
        ob.MouseLeave:Connect(function()
            if i ~= selectedIndex then
                playTween(ob, TweenInfo.new(0.1), { BackgroundTransparency = 1 })
            end
        end)
        ob.MouseButton1Click:Connect(function()
            selectedIndex = i
            refresh()
            setOpen(false)
        end)
    end
    header.MouseButton1Click:Connect(function()
        setOpen(not isOpen)
    end)
    refresh()
    return container
end

-- Estilo común para controles seleccionables (mismo patrón que los botones de tab)
local function styleSelectable(btn, stroke, label, selected)
    playTween(btn, ACCENT_TWEEN, { BackgroundTransparency = selected and 0.28 or 0.48 })
    playTween(stroke, ACCENT_TWEEN, { Transparency = selected and 0.25 or 0.8 })
    playTween(label, ACCENT_TWEEN, { TextColor3 = selected and appState.COL_WHITE or appState.COL_DIM })
    label.Font = selected and Enum.Font.GothamBlack or Enum.Font.GothamBold
end

-- Grupo de opciones tipo radio
local function createRadioGroup(parent, options, defaultIndex)
    local rows = {}
    local selected = defaultIndex or 1
    local function refresh()
        for i, r in ipairs(rows) do
            local sel = i == selected
            playTween(r.inner, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = sel and UDim2.new(0, 8, 0, 8) or UDim2.new(0, 0, 0, 0),
            })
            playTween(r.ring, ACCENT_TWEEN, { Transparency = sel and 0 or 0.5 })
            playTween(r.row, ACCENT_TWEEN, { BackgroundTransparency = sel and 0.28 or 0.48 })
            r.label.TextColor3 = sel and appState.COL_WHITE or appState.COL_DIM
            r.label.Font = sel and Enum.Font.GothamBlack or Enum.Font.GothamBold
        end
    end
    for i, text in ipairs(options) do
        local row = newRow(parent, isMobile and 34 or 30, Color3.fromRGB(10, 31, 61), 0.48, 8)
        local ringFrame = Instance.new("Frame")
        ringFrame.Size = UDim2.new(0, 16, 0, 16)
        ringFrame.Position = UDim2.new(0, 10, 0.5, -8)
        ringFrame.BackgroundTransparency = 1
        ringFrame.ZIndex = 13
        ringFrame.Parent = row
        createUICorner(ringFrame, 8)
        local ring = Instance.new("UIStroke")
        ring.Color = Color3.fromRGB(65, 145, 255)
        ring.Thickness = 1.5
        ring.Transparency = 0.5
        ring.Parent = ringFrame
        local inner = Instance.new("Frame")
        inner.AnchorPoint = Vector2.new(0.5, 0.5)
        inner.Position = UDim2.new(0.5, 0, 0.5, 0)
        inner.Size = UDim2.new(0, 0, 0, 0)
        inner.BackgroundColor3 = appState.COL_WHITE
        inner.BorderSizePixel = 0
        inner.ZIndex = 14
        inner.Parent = ringFrame
        createUICorner(inner, 4)
        createUIGradient(inner)
        local label = newLabel(row, text, 34, 0, UDim2.new(1, -44, 1, 0), nil, isMobile and 13 or 12, appState.COL_DIM)
        local click = Instance.new("TextButton")
        click.Size = UDim2.new(1, 0, 1, 0)
        click.BackgroundTransparency = 1
        click.Text = ""
        click.ZIndex = 15
        click.Parent = row
        rows[i] = { row = row, ring = ring, inner = inner, label = label }
        click.MouseButton1Click:Connect(function()
            selected = i
            refresh()
        end)
    end
    refresh()
end

-- Chips (selección segmentada)
local function createChips(parent, options, defaultIndex)
    local holder = Instance.new("Frame")
    holder.Size = UDim2.new(1, 0, 0, isMobile and 34 or 30)
    holder.BackgroundTransparency = 1
    holder.ZIndex = 12
    holder.LayoutOrder = #parent:GetChildren()
    holder.Parent = parent
    local list = Instance.new("UIListLayout")
    list.FillDirection = Enum.FillDirection.Horizontal
    list.SortOrder = Enum.SortOrder.LayoutOrder
    list.Padding = UDim.new(0, 6)
    list.Parent = holder
    local chips = {}
    local selected = defaultIndex or 1
    local function refresh()
        for i, c in ipairs(chips) do
            styleSelectable(c.button, c.stroke, c.label, i == selected)
        end
    end
    local n = #options
    for i, text in ipairs(options) do
        local b = Instance.new("TextButton")
        b.Size = UDim2.new(1 / n, -(6 * (n - 1)) / n, 1, 0)
        b.BackgroundColor3 = Color3.fromRGB(10, 31, 61)
        b.BackgroundTransparency = 0.48
        b.BorderSizePixel = 0
        b.Text = ""
        b.AutoButtonColor = false
        b.LayoutOrder = i
        b.ZIndex = 13
        b.Parent = holder
        createUICorner(b, 8)
        local lb = newLabel(b, text, 0, 0, UDim2.new(1, 0, 1, 0), nil, isMobile and 11 or 12, appState.COL_DIM, Enum.Font.GothamBold, Enum.TextXAlignment.Center)
        lb.ZIndex = 14
        local st = addGradientStroke(b, 1)
        st.Transparency = 0.8
        chips[i] = { button = b, label = lb, stroke = st }
        b.MouseButton1Click:Connect(function()
            selected = i
            refresh()
        end)
    end
    refresh()
end

-- Checkbox
local function createCheckbox(parent, text, checked)
    local row = newRow(parent, isMobile and 34 or 30, Color3.fromRGB(28, 38, 54), 0.42, 8)
    local box = Instance.new("Frame")
    box.Size = UDim2.new(0, 18, 0, 18)
    box.Position = UDim2.new(0, 10, 0.5, -9)
    box.BackgroundColor3 = Color3.fromRGB(28, 55, 88)
    box.BorderSizePixel = 0
    box.ZIndex = 13
    box.Parent = row
    createUICorner(box, 5)
    local boxStroke = Instance.new("UIStroke")
    boxStroke.Color = Color3.fromRGB(65, 145, 255)
    boxStroke.Thickness = 1
    boxStroke.Transparency = 0.45
    boxStroke.Parent = box
    local fill = Instance.new("Frame")
    fill.AnchorPoint = Vector2.new(0.5, 0.5)
    fill.Position = UDim2.new(0.5, 0, 0.5, 0)
    fill.Size = UDim2.new(0, 0, 0, 0)
    fill.BackgroundColor3 = appState.COL_WHITE
    fill.BorderSizePixel = 0
    fill.ZIndex = 14
    fill.Parent = box
    createUICorner(fill, 3)
    createUIGradient(fill)
    newLabel(row, text, 38, 0, UDim2.new(1, -48, 1, 0), nil, isMobile and 13 or 12)
    local function refresh()
        playTween(fill, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = checked and UDim2.new(0, 10, 0, 10) or UDim2.new(0, 0, 0, 0),
        })
        playTween(boxStroke, ACCENT_TWEEN, { Transparency = checked and 0 or 0.45 })
    end
    refresh()
    local click = Instance.new("TextButton")
    click.Size = UDim2.new(1, 0, 1, 0)
    click.BackgroundTransparency = 1
    click.Text = ""
    click.ZIndex = 15
    click.Parent = row
    click.MouseButton1Click:Connect(function()
        checked = not checked
        refresh()
    end)
    return row
end

-- Keybind (UI del original: botón "[R]" -> "..." -> tecla). Sin acción asociada.
local function createKeybind(parent, text, defaultKey)
    local frame2 = newRow(parent, 34, Color3.fromRGB(28, 38, 54), 0.45, 7)
    addGradientStroke(frame2, 1)
    newLabel(frame2, text, 10, 0, UDim2.new(1, -90, 1, 0), nil, isMobile and 11 or 12)
    local keyButton = Instance.new("TextButton")
    keyButton.Size = UDim2.new(0, 70, 0, 22)
    keyButton.Position = UDim2.new(1, -78, 0.5, -11)
    keyButton.BackgroundColor3 = Color3.fromRGB(12, 48, 90)
    keyButton.BackgroundTransparency = 0.28
    keyButton.BorderSizePixel = 0
    keyButton.Text = "[" .. defaultKey .. "]"
    keyButton.TextColor3 = appState.COL_WHITE
    keyButton.TextSize = 10
    keyButton.Font = Enum.Font.GothamBlack
    keyButton.TextTruncate = Enum.TextTruncate.AtEnd
    keyButton.AutoButtonColor = false
    keyButton.ZIndex = 14
    keyButton.Parent = frame2
    createUICorner(keyButton, 6)
    addGradientStroke(keyButton, 1)
    local capturing = false
    local currentText = keyButton.Text
    keyButton.MouseButton1Click:Connect(function()
        if capturing then
            return
        end
        capturing = true
        keyButton.Text = "..."
        playTween(keyButton, TweenInfo.new(0.1), { BackgroundTransparency = 0 })
        local connection
        connection = UserInputService.InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.Unknown then
                return
            end
            connection:Disconnect()
            capturing = false
            if input.KeyCode ~= Enum.KeyCode.Escape then
                currentText = "[" .. (tostring(input.KeyCode):gsub("Enum%.KeyCode%.", "")) .. "]"
            end
            keyButton.Text = currentText
            playTween(keyButton, TweenInfo.new(0.1), { BackgroundTransparency = 0.28 })
        end)
    end)
    return frame2
end

-- TextBox con placeholder
local function createTextInput(parent, labelText, placeholder, startText)
    local row = newRow(parent, isMobile and 36 or 32, Color3.fromRGB(28, 38, 54), 0.2, 6)
    newLabel(row, labelText, 8, 0, UDim2.new(1, -150, 1, 0), nil, isMobile and 13 or 11)
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0, 130, 0, isMobile and 24 or 22)
    textBox.Position = UDim2.new(1, -138, 0.5, isMobile and -12 or -11)
    textBox.BackgroundColor3 = Color3.fromRGB(8, 22, 45)
    textBox.BackgroundTransparency = 0.15
    textBox.BorderSizePixel = 0
    textBox.Text = startText or ""
    textBox.PlaceholderText = placeholder
    textBox.PlaceholderColor3 = Color3.fromRGB(90, 140, 190)
    textBox.TextColor3 = Color3.fromRGB(80, 205, 255)
    textBox.TextSize = isMobile and 12 or 10
    textBox.Font = Enum.Font.GothamBold
    textBox.ClearTextOnFocus = false
    textBox.TextTruncate = Enum.TextTruncate.AtEnd
    textBox.ZIndex = 13
    textBox.Parent = row
    createUICorner(textBox, 5)
    local stroke = addGradientStroke(textBox, 1)
    textBox.Focused:Connect(function()
        playTween(stroke, ACCENT_TWEEN, { Thickness = 2 })
        playTween(textBox, ACCENT_TWEEN, { BackgroundTransparency = 0 })
    end)
    textBox.FocusLost:Connect(function()
        playTween(stroke, ACCENT_TWEEN, { Thickness = 1 })
        playTween(textBox, ACCENT_TWEEN, { BackgroundTransparency = 0.15 })
    end)
    return row, textBox
end

-- Campo de búsqueda con icono dibujado (sin assets nuevos) + filtrado local de demostración
local function createSearch(parent, items)
    local box = newRow(parent, isMobile and 36 or 32, Color3.fromRGB(8, 22, 45), 0.15, 8)
    local stroke = addGradientStroke(box, 1)
    stroke.Transparency = 0.45

    -- icono lupa (círculo + mango)
    local ringF = Instance.new("Frame")
    ringF.Size = UDim2.new(0, 11, 0, 11)
    ringF.Position = UDim2.new(0, 10, 0.5, -7)
    ringF.BackgroundTransparency = 1
    ringF.ZIndex = 14
    ringF.Parent = box
    createUICorner(ringF, 6)
    local ringStroke = Instance.new("UIStroke")
    ringStroke.Color = Color3.fromRGB(147, 163, 188)
    ringStroke.Thickness = 1.5
    ringStroke.Parent = ringF
    local handle = Instance.new("Frame")
    handle.Size = UDim2.new(0, 6, 0, 2)
    handle.AnchorPoint = Vector2.new(0.5, 0.5)
    handle.Position = UDim2.new(0, 22, 0.5, 5)
    handle.Rotation = 45
    handle.BackgroundColor3 = Color3.fromRGB(147, 163, 188)
    handle.BorderSizePixel = 0
    handle.ZIndex = 14
    handle.Parent = box

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(1, -62, 1, 0)
    textBox.Position = UDim2.new(0, 32, 0, 0)
    textBox.BackgroundTransparency = 1
    textBox.Text = ""
    textBox.PlaceholderText = "Search..."
    textBox.PlaceholderColor3 = Color3.fromRGB(90, 140, 190)
    textBox.TextColor3 = appState.COL_WHITE
    textBox.TextSize = isMobile and 13 or 12
    textBox.Font = Enum.Font.GothamBold
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    textBox.ClearTextOnFocus = false
    textBox.ZIndex = 14
    textBox.Parent = box

    local clear = Instance.new("TextButton")
    clear.Size = UDim2.new(0, 20, 0, 20)
    clear.Position = UDim2.new(1, -26, 0.5, -10)
    clear.BackgroundColor3 = Color3.fromRGB(15, 42, 78)
    clear.BackgroundTransparency = 1
    clear.Text = "×"
    clear.TextColor3 = Color3.fromRGB(180, 225, 255)
    clear.TextTransparency = 1
    clear.TextSize = 13
    clear.Font = Enum.Font.GothamBlack
    clear.BorderSizePixel = 0
    clear.AutoButtonColor = false
    clear.ZIndex = 15
    clear.Parent = box
    createUICorner(clear, 6)

    local resultFrame = Instance.new("Frame")
    resultFrame.Size = UDim2.new(1, 0, 0, 0)
    resultFrame.AutomaticSize = Enum.AutomaticSize.Y
    resultFrame.BackgroundTransparency = 1
    resultFrame.ZIndex = 12
    resultFrame.LayoutOrder = #parent:GetChildren()
    resultFrame.Parent = parent
    do
        local l = Instance.new("UIListLayout")
        l.SortOrder = Enum.SortOrder.LayoutOrder
        l.Padding = UDim.new(0, 4)
        l.Parent = resultFrame
    end
    local resultRows = {}
    for i, name in ipairs(items) do
        local r = newRow(resultFrame, 26, Color3.fromRGB(10, 31, 61), 0.48, 7, i)
        newLabel(r, name, 10, 0, UDim2.new(1, -20, 1, 0), nil, 12, appState.COL_DIM)
        resultRows[i] = { frame = r, name = name }
    end
    local empty = newLabel(resultFrame, "No results", 0, 0, UDim2.new(1, 0, 0, 24), 24, 12, appState.COL_DIM, Enum.Font.GothamBold, Enum.TextXAlignment.Center)
    empty.LayoutOrder = #items + 1
    empty.Visible = false

    local function filter()
        local q = string.lower(textBox.Text)
        local any = false
        for _, r in ipairs(resultRows) do
            local match = q == "" or string.find(string.lower(r.name), q, 1, true) ~= nil
            r.frame.Visible = match
            any = any or match
        end
        empty.Visible = not any
        playTween(clear, ACCENT_TWEEN, {
            TextTransparency = q == "" and 1 or 0,
            BackgroundTransparency = q == "" and 1 or 0.3,
        })
    end
    textBox:GetPropertyChangedSignal("Text"):Connect(filter)
    textBox.Focused:Connect(function()
        playTween(stroke, ACCENT_TWEEN, { Transparency = 0 })
    end)
    textBox.FocusLost:Connect(function()
        playTween(stroke, ACCENT_TWEEN, { Transparency = 0.45 })
    end)
    clear.MouseButton1Click:Connect(function()
        textBox.Text = ""
    end)
    return box
end

-- Panel colapsable (patrón +/- con tween 0.22 Quint del mini-panel original)
local function createCollapsible(parent, title, bodyText)
    local headerH = 34
    local bodyH = 46
    local container = newRow(parent, headerH, Color3.fromRGB(28, 38, 54), 0.45, 7)
    container.ClipsDescendants = true
    addGradientStroke(container, 1)
    newLabel(container, title, 10, 0, UDim2.new(1, -50, 0, headerH), headerH, 12, appState.COL_WHITE, Enum.Font.GothamBlack)
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 24, 0, 22)
    toggleBtn.Position = UDim2.new(1, -32, 0, 6)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(12, 48, 90)
    toggleBtn.BackgroundTransparency = 0.28
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Text = "+"
    toggleBtn.TextColor3 = appState.COL_WHITE
    toggleBtn.TextSize = 13
    toggleBtn.Font = Enum.Font.GothamBlack
    toggleBtn.AutoButtonColor = false
    toggleBtn.ZIndex = 14
    toggleBtn.Parent = container
    createUICorner(toggleBtn, 6)
    addGradientStroke(toggleBtn, 1)
    local body = newLabel(container, bodyText, 10, headerH, UDim2.new(1, -20, 0, bodyH - 8), bodyH - 8, 11, appState.COL_DIM)
    body.TextWrapped = true
    body.TextYAlignment = Enum.TextYAlignment.Top
    local open = false
    toggleBtn.MouseButton1Click:Connect(function()
        open = not open
        toggleBtn.Text = open and "-" or "+"
        playTween(container, TweenInfo.new(0.22, Enum.EasingStyle.Quint), {
            Size = UDim2.new(1, 0, 0, open and (headerH + bodyH) or headerH),
        })
    end)
    return container
end

--------------------------------------------------------------------------------

local HttpService = game:GetService("HttpService")
local saved = {}
local savePath = tostring(config.SaveFile or "OnionProject") .. "_IceUI.json"
if type(readfile) == "function" then
    local ok, decoded = pcall(function() return HttpService:JSONDecode(readfile(savePath)) end)
    if ok and type(decoded) == "table" then saved = decoded end
end
local pendingSave = false
local function commit(flag, value)
    if not flag then return end
    saved[flag] = value
    if pendingSave or type(writefile) ~= "function" then return end
    pendingSave = true
    task.delay(0.4, function()
        pendingSave = false
        local ok, err = pcall(function() writefile(savePath, HttpService:JSONEncode(saved)) end)
        if not ok then warn("[Onion UI] Settings: " .. tostring(err)) end
    end)
end
local function initial(flag, default)
    if flag and saved[flag] ~= nil then return saved[flag] end
    return default
end
local function fire(callback, value)
    if type(callback) == "function" then
        local ok, err = pcall(callback, value)
        if not ok then warn("[Onion UI] " .. tostring(err)) end
    end
end
local function control(row, setter)
    local item = {Instance = row}
    item.Update = function(a, b)
        if a == item then setter(b) else setter(a) end
    end
    item.Set = item.Update
    item.SetValue = item.Update
    function item:Destroy() row:Destroy() end
    return item
end
local wrap
wrap = function(parent)
    local section = {}
    function section:addSection() return wrap(parent) end
    function section:addMenu(title)
        local body = createPanelSection(parent, tostring(title or ""))
        return wrap(body)
    end
    function section:addLabel(title, description)
        local label = createDescription(parent, tostring(title or ""))
        local desc = createDescription(parent, tostring(description or ""))
        desc.RichText = true
        local item = {Instance = desc}
        function item:RefreshDesc(value) desc.Text = tostring(value or "") end
        function item:Refresh(value) label.Text = tostring(value or "") end
        return item
    end
    function section:addButton(title, callback, locked, description)
        local row = createButton(parent, tostring(title), locked and "disabled" or "normal", function()
            if not locked then fire(callback) end
        end)
        if type(description) == "string" then attachTooltip(row, description) end
        return row
    end
    function section:addToggle(title, default, callback, locked, description, flag)
        local value = initial(flag, default) == true
        local row, set = createToggleRow(parent, tostring(title), value, function(v)
            commit(flag, v)
            fire(callback, v)
        end, locked)
        if description then attachTooltip(row, tostring(description)) end
        task.defer(function() fire(callback, value) end)
        return control(row, set)
    end
    function section:addSlider(title, minimum, maximum, default, callback, locked, step, flag)
        local value = math.clamp(tonumber(initial(flag, default)) or minimum, minimum, maximum)
        local row, set = createSlider(parent, tostring(title), minimum, maximum, value, step or 1, "", function(v)
            commit(flag, v)
            fire(callback, v)
        end, locked)
        task.defer(function() fire(callback, value) end)
        return control(row, set)
    end
    function section:addTextbox(title, callback, confirmText, flag)
        local value = tostring(initial(flag, ""))
        local row, box = createTextInput(parent, tostring(title), "Escribe aquí", value)
        local function set(v)
            box.Text = tostring(v or "")
            commit(flag, box.Text)
            fire(callback, box.Text)
        end
        box.FocusLost:Connect(function(enterPressed)
            if not confirmText or enterPressed then set(box.Text) end
        end)
        task.defer(function() fire(callback, value) end)
        return control(row, set)
    end
    function section:addDropdown(title, default, options, callback, locked, multi, flag)
        options = type(options) == "table" and options or {}
        local value = initial(flag, default)
        local selected = {}
        if multi then
            if type(value) == "table" then
                for k, v in pairs(value) do
                    if type(k) == "number" then selected[v] = true
                    elseif v then selected[k] = true end
                end
            elseif value ~= nil then
                selected[options[value] or value] = true
            end
        end
        local row = newRow(parent, 36, Color3.fromRGB(28, 38, 54), 0.2, 6)
        row.ClipsDescendants = true
        local header = Instance.new("TextButton")
        header.Size = UDim2.new(1, 0, 0, 36)
        header.BackgroundTransparency = 1
        header.Text = ""
        header.ZIndex = 14
        header.Parent = row
        local label = newLabel(header, tostring(title), 8, 0, UDim2.new(0.52, -8, 1, 0), nil, 11)
        label.TextTruncate = Enum.TextTruncate.AtEnd
        local chosen = newLabel(header, "", 0, 0, UDim2.new(0.48, -12, 1, 0), nil, 11, appState.COL_DIM, nil, Enum.TextXAlignment.Right)
        chosen.Position = UDim2.new(0.52, 0, 0, 0)
        chosen.TextTruncate = Enum.TextTruncate.AtEnd
        local list = Instance.new("ScrollingFrame")
        list.Size = UDim2.new(1, -12, 0, 0)
        list.Position = UDim2.new(0, 6, 0, 36)
        list.BackgroundTransparency = 1
        list.BorderSizePixel = 0
        list.ScrollBarThickness = 3
        list.CanvasSize = UDim2.new()
        list.AutomaticCanvasSize = Enum.AutomaticSize.Y
        list.ZIndex = 15
        list.Parent = row
        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0, 3)
        layout.Parent = list
        local opened, buttons = false, {}
        local function result()
            if not multi then return value end
            local out = {}
            for _, option in ipairs(options) do
                if selected[option] then table.insert(out, option) end
            end
            return out
        end
        local function paint()
            local labels = {}
            if multi then for _, v in ipairs(result()) do table.insert(labels, tostring(v)) end
            elseif value ~= nil then labels[1] = tostring(value) end
            chosen.Text = (#labels > 0 and table.concat(labels, ", ") or "Seleccionar") .. (opened and " −" or " +")
            for i, button in ipairs(buttons) do
                local active = multi and selected[options[i]] or (not multi and options[i] == value)
                button.BackgroundTransparency = active and 0.15 or 0.7
            end
        end
        local function resize()
            local height = opened and math.min(#options * 33, 165) or 0
            list.Size = UDim2.new(1, -12, 0, height)
            row.Size = UDim2.new(1, 0, 0, 36 + height)
            paint()
        end
        local function changed()
            local out = result()
            commit(flag, out)
            fire(callback, out)
            paint()
        end
        local function rebuild()
            for _, button in ipairs(buttons) do button:Destroy() end
            buttons = {}
            for i, option in ipairs(options) do
                local button = Instance.new("TextButton")
                button.Size = UDim2.new(1, -4, 0, 30)
                button.BackgroundColor3 = Color3.fromRGB(12, 48, 90)
                button.BorderSizePixel = 0
                button.Text = tostring(option)
                button.TextColor3 = appState.COL_WHITE
                button.Font = Enum.Font.GothamBold
                button.TextSize = 11
                button.LayoutOrder = i
                button.ZIndex = 16
                button.Parent = list
                createUICorner(button, 6)
                buttons[i] = button
                button.MouseButton1Click:Connect(function()
                    if locked then return end
                    if multi then selected[option] = not selected[option]
                    else value = option; opened = false end
                    changed()
                    resize()
                end)
            end
            resize()
        end
        header.MouseButton1Click:Connect(function()
            if not locked then opened = not opened; resize() end
        end)
        local item = control(row, function(v)
            if multi then
                selected = {}
                if type(v) == "table" then
                    for k, entry in pairs(v) do
                        if type(k) == "number" then selected[entry] = true
                        elseif entry then selected[k] = true end
                    end
                end
            else value = v end
            changed()
        end)
        function item:Refresh(newOptions)
            if type(newOptions) == "function" then newOptions = newOptions() end
            options = type(newOptions) == "table" and newOptions or {}
            rebuild()
        end
        rebuild()
        task.defer(function() fire(callback, result()) end)
        return item
    end
    return section
end
local window = {}
function window:AddTab(name)
    local parent = TabSystem.addTab(name)
    local columns = {}
    for i = 1, 2 do
        local column = Instance.new("Frame")
        column.Name = "Column" .. i
        column.Size = UDim2.new(0.5, -7, 0, 0)
        column.AutomaticSize = Enum.AutomaticSize.Y
        column.BackgroundTransparency = 1
        column.LayoutOrder = i
        column.Parent = parent
        local layout = Instance.new("UIListLayout")
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Padding = UDim.new(0, 14)
        layout.Parent = column
        columns[i] = column
    end
    local tab, count = {}, 0
    function tab:addSection()
        count = count + 1
        return wrap(columns[(count - 1) % 2 + 1])
    end
    if #TabSystem.order == 1 then task.defer(function() TabSystem.select(name, true) end) end
    return tab
end
function window:Destroy() mainGui:Destroy() end
function window:Toggle() toggleWindow() end
appState.panel.AnchorPoint = Vector2.new(0.5, 0.5)
appState.panel.Position = UDim2.fromScale(0.5, 0.5)
local scale = Instance.new("UIScale")
scale.Parent = appState.panel
local function fit()
    local camera = workspace.CurrentCamera
    if camera then
        local viewport = camera.ViewportSize
        scale.Scale = math.min(1, (viewport.X - 20) / appState.PANEL_W, (viewport.Y - 60) / appState.PANEL_H)
    end
end
fit()
if workspace.CurrentCamera then workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(fit) end
openWindow()
Library._toast = showToast
return window
end
Library.Notification = {}
function Library.Notification:Notify(data, settings)
    if Library._toast then Library._toast(tostring(data.Title or "Onion Project"), tostring(data.Description or ""))
    else
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = tostring(data.Title or "Onion Project"), Text = tostring(data.Description or ""),
                Duration = settings and settings.Time or 5,
            })
        end)
    end
end
return Library

]=]

OnionBundle["Util/BloxFruitModule/Preload/Visuals.lua"] = [=[
return(function(...)local u,p,o,s,x,r,G,w,I,z,C,e,Z,k=string.byte,string.sub,string.char,string.gsub,string.rep,setmetatable,pcall,type,tostring,assert,loadstring,unpack,string.pack,{}local N={}local c=bit32 local y,L,O,J,B=_ENV,getfenv,metatable,unpack,"!!!"local U,d,S="-",true,nil local K,j=nil,0 local l={YaaPvbh7V="v!!!"}local u={";djcjEaa\'(Df,";"6Z6j[ARff";"FCB3&ATR";"49";"7qm-X6#:@1@;U.$Er","@UX:XE\\KFoA5+pM0er","@VfI`AH","7QG9Q2E3]jB2:=(;0`","8pFok2*kq1:JNfJ0E";";f4s9A5d2D6qp$Z;GI";"BhCBo9PA\'1CM5Y<","F`)/,@qu";"4@=%\'DfS!;F`MG;ANit6@;^10D\'2VlH$D@m7qlRWARlp/Dfm0iASbq!FD50\"+@1$i4@=%\'DfRuo4o";"7;d6b","7!3NYFD5Z2","B3A/B1I=`ZGVi8SAjH";"@q]:k@:OCjEW";"EbTK)@;T^pH!t`)DIE","Bl.9kAP$D";"CLM(&Beo";"Ajf7%B5gF1CfkOV","9P%gX+@1$b";"8p+ui:iCPhEW";"11EmoEGeHnBN%K7",";fH/hD?","Anc9s6tpZ","1i[Op=@HA1E-Gf61N*","Df^%j=#P(b:JH(2","?XIMbA7]u";":I/bP7W)uq";"G&DU\\;+GqJChP_+","De*O\'2aq_\'G\\BNU63","E&KXf2agA0@V%K3EW","2HF<W:,,C@G\\ffAA,";"BQ[s!","A9Da+Gl";"@rH7,Ec5a";"6tp^PDf0H(@rq","@R=XFEC+MQAiDVf",":N^bjE^Ob]DfP";"<G43WCM,>\'>#7V*";";flGgF8","<b5\\t2F9lJ;KcVIG5","@<,ps@3B>oD09O","7<*HaE)^aoC]";"7;c[RBk;>","Eaj9%F)to7Bk07X0/57B0f:X=3&<HI0JGLH","H<PSrE(WboF(AolEW","9OVCAC]","Eaj9%F)to7Bk07X0/54<1,gmG0JkaI1GgjH";"8TR^E@<lR)B)";"E-\"H[B2<h.CMmZm75t","GB6G\\6>]Y)=`#iN","G@>N0","<+ouUCMm^)Er";"Eaj9%F)to7Bk07X0/5FE1GLmK1,q0H";":18!N";"AlN\\<7UgX!8To,G7Q:";"6#L=OATI";"B5KtV=`&\"96\"P._;u","8SqmKAQ3\\YDKBc*Eb0,uGl",";JBcWF<EkiD#";"E+*Hu","6!.hm>\"rpRH>.5A8H","<,Z\\k<,$:","5seU_EFi[#:,?TMEr","6#L=HC]","CbY","6t(+O6>U(@AOpBKA,";"=>=T(AMc5?8P2<g83m";"Eb065Bl[b";"2Fg/Z9hSYKB37W!";"6YKnKB4V";"6Z6jaEaa$2";"3(J4+=F!5%;cbh1";"2KDVo8Qfgq2G-DaBE","EctPfGu]/cE\\VMjE-M","6>U(?CEQApCLm","DgH&1Ec3p03D=!u1B";"=E8C`F\\kh\'96Ol:";"BOQ$eA9W-:9N+MS=%<",":i\'Q^AoD^,;flGcA,","=@6b1EbAq","6#L=HC`l(s+@0mXAS`JYCgh0lEr";"4@=%\'DfS!;F`MG;ANit6@;^10D\'2VlH$D@m7qlRWARlp/Dfm0gCht4e@;U.$4@=%\'DfRuo4o";"Eaj9%F)to7Bk07X0/57B1c7$J3AEKO1bpjH";"Eaj9%F)to7Bk07X0/5.?2).\'F1,La?";"6#L=HC`l%r+@1*k@:O\'";"8O[;MG>W*S9Li/M";"8SqmKAH";"6Z6ja@;0UjEW","<affeAH",":3:S[F[Im%7Rh\'\"=]#","CLM(&B`","FE9BS8kF#(DcCU68iQ";"?XIGU","F)YQ3D?";"9jpP;<`\"$,=*$cL:&","88i<TBl7P";"<,ZnhBE","6t(1G9lFQRC]";"8T&]_EcYd","A79Lo","1Km^Q8Oc$j@S_2c",":3CD_ATC^\\EHPi1@qA;EH#R\\9DKG","6Z6dWARfgrDf/KbEcu/,AH";"@q]:k";"Eaj9%F)to7Bk07X0/57B3&EKM1GUjH3ArcM","6#L=HC`l\"q+@0mXAS`JeASbpdF(J]6";"<H)ngE`?stF)M";"FYnATFZ)Q@3I+4U8H","6YKnK@:OCjE^=5HARk","6Z6dZEW","8Qot/0R.&+3G:oZ7n!","H8nSnB2*#+79\"S,:JU",";Isf`Bk(RnARn_]DfT9!AH";"7qm-X6t(+O6>U(@AH";"B45Xg","F$iB2<b>oP@;StF","9kA-PAH",";fHD]Eb/0cBk(^q<\\a","75./0D.@f`6:+7R","4A]I%BleB)DBM>]D.RU+Bl@lQ";"FDl5BEbTE(";"@;f7I8h`4^BR+fB<W";"CGfX69P7pQ9K?6M:&","882UFASq";"<CCP<1&","DfTQ)Bl3";"7qHc","6Y\'^p7sRmGA5$er2+.","EG/3@BLcuV;,(n<","6#L=HCg\'2>@;0V#";";flG\\AH";"F[p.?:f:7LAlEG%AH","A4&q.H=;)-3,V_`H:e",":NC/^Bl3";"9PJ*MFD5T\'";"8MW(k:h=;tGZnQ4=&T","FEqh:De8";"G>:kV@9QT)Bl6aA";"8T&EWE^Ob]DfP","CLM(&Bf#";"@5DLn<&$.E7U^IL8Rq";":3CD_ATC[WDJ*M","F\\Gh(E\'d/R3+k]XH=6","0Mb7oF&ke)GC\"4;8ot";"FCB6+","Ao_g,;Fa%";"CghC,F%1(g","6>pdY<affeAH","E+*I$Er";"6#L=HC`l(s+@Bj`@r,^!88i<T";"Bk\'MLDg=0O:/G,/DZ",":N^a","CG9jF6T6u@3+5lJ","6o[t;GrJW4B2s+D7VV","<+0f[ATR";"2De2c=>aYJ0m[JH";"Bl7HmGQ";"2KV\\J2_o,fG\\MJ;G5";"Eaj9%F)to7Bk07X00(^H2`WlV1H@?N3AEA","3-&Lt>\'\"CSCLqF$E<","CfX5,3-fLb@9>fl","H>Rd`3AG5KDG<_sFo";"6tp^]CghS","=(l#a+CoC5H#IgJGA2,3+EVNEA8`T7Bln#2FD,B0+@9m_GT]IrF_Pq^","G%GQ0D#","@ps7L0`";"=&W4)Bjk[16SM\\$";"Bk2$k<,uDWCB","<GlAfF_PeoDf9H5";"9P&*SFD(","FD56#";"2-3sX;ccn32FqV#","Ao(mmAH",":dSi90NV%QE`6L<6SS","4o","6=WefGtD^n6qVB6<<","Eaj9%F)to7Bk07X00(mM2*!TU2E!BK2`ES";"EbTJ8CLM(&B`";"5uKC/7r27OCIDTSBk%","8Pj(WH=]ijC.`>aGAd";"6#LCR@<?F.";"=^ar];ctneCKP49";"2.KKeFDEQj@:E&6<W","<C_(-H?F@R7l<(uAc";"1Ic[W12gtc@qTjU","9PJ-QFD5W*","Eaj9%F)to7Bk07X0/5181c[QN0Jk[C3&riP";"9jq[PBlnK.AH","GXGCs8l[lI<A8Jk","4A]s+CLqT16tpLLDKBN1DE\\","CH+%jE-!`k9N#:Q3AC";"AnOe;G^<7i@qKUNBk[","0em*-@sMp;3I#=A";"6YL1MA3ja:ARk";"BQ%]t>\"3=:B)","F(\\#","3H%SnDE)3?:h+$/";"88i<U","D..NrBE","C1T2\"<c0p2854;\"";"5qt_aGXGmuH\"UT\"","@qRc@@7G0M6UXR6";"6>Udb7:p.C@rq";"=T","94`B9De*D";"Ci=K.";"8MG!SAMu>;<]!fD:K[",";K$YUE+NTk";"G@>3-";":dJ)VCKYaH@mY&k6pq";";fFWRBPD!Z@P^D-A,";";flqs","6Z6g\\Ch7^\"A,","EDeK8=][I8H?+\"&6@&";"BLHuZCLp78@;0Ri=T","0ekF;0f^sE0JkXD1H.,";"D_O+HAhZ54ECr-!";"F)Y]#Bjkf","Ecki#AT@","@:F9","F*(i2FAm!i@qB^XDf]W7Bl@k";"4@=%\'DfS!;F`MG;ANit6@;^10D\'2VlH$D@m7qlRWARlp/Dfm0jBm+3.AKX9ZF?Dp/Ci=>W00T","H<3j1A3soa1i6bq<r","CLM(&Bf,","F(TX","6?5ObChn?BA8a=q",":iCDhFD5Z2","BQ%]t=o";"8T&6aBjkgVCghBu","6oIY<6V;Yb@;9=uD?";"Ap7?YD.@I)0K;sJEW";"<,Z\\k8Rl[V";"BLkrd;`@?`H\"^W)";"@8\'\'aA4oZ`=&im6:c8",":G>d`BJaBi8PrE42/3","DIn\"",".67";":..g\"DF.$@6W7nX<<";"7qm-X<+TrgASD";"Eaj9%F)to7Bk07X0/54=1cR6N0f1Z","CN<?t=>NEe7Up1E8,","6?HgX1O(oi770OI@V,","ApHg\"@T$/n:N83`AH";"6Xak3DfoQ\'";"Eaj9%F)to7Bk07X0/5.?3AN9D2E<HN3AWWT";"=(PfZDf/HaGAhM;Er";":M+3[ATR";"89JcXDJs6\";K$Jq:gnBd";":gn-RF*(i.+@Kp\\ASuR\'Df,","ASu$WCh[BjF&6drBln\'-D?";"88rB%Bjksq8T8<>DJ0","7qm-X6>U(?CI2iGF*%","9PA`l3)aWOH\"(2_","Bl8!\'Ec_";"6=FqH:gnBd","AT;j,E,]B!";"Eaj9%F)to7Bk07X0/tjK2DI3J3B.";"DGjt$=uKGU79*$#F8";"Eaj9%F)to7Bk07X0)",":N1DiDf.9";"1Li^`ED/]/@5g&$GA.","8T\\N\\8Rq";"@l.+t2,uS.G\"t@j";"9N+8uG\'H_>7;c^_";"F*)>>+EM=4A7TClB-8cKAo(n%BR\'","<HNOjGq`o613$0;";"<(\'&[=%,DQ","F),K+Cb\\IlCh*","87tk<=&rg!@Tc!+";"3Disn;KcPp7rC+<5l","7;c[RGuAR!F8";"8830TDg4TeFEDG<";"<(\'&[78[&V:]","CghC,6$.3W@qu","B4Z1,BQ@ZmA8,RcDKKT7Gl","4Aom4?UeI@Bl&&;882UGDfp.c";"Eaj9%F)to7Bk07X0/t^F1GUXE1,UdE2_Zr",":fM4T:GXk<3G;SQGXV","6Y1(FF*),)C`l#aF8";"<,ZeuDZ","7VQaN7VQmaF@0_UCh-=R6Yp1PEr","Bk(]","0f(LD0JkL@0ebC>1Gq/","6Xak\"Des6(A7Y","4@=%\'DfS!;F`MG;ANit6@;^10D\'2VlH$D@m7qlRWARlp/Dfm0hCgggh+AR&pANW=uCi=>W00T","7qm-X6>U(?CJK\"fAH","<+U;rF`M$";"4@=%\'DfS!;F`MG;ANit6@;^10D\'2VlH$D@m;IO9W+@^BoBlnDY6Z6dZE]l\'>";"3E8d^6\"k@AFa5fC<-8";"Eaj9%F)to7Bk07X0/57A1GLjE3&W]Q3&*BM","4@=%\'DfS!;F`MG;ANit6@;^10D\'2VlH$D@m;fuqoDf-[`@q0(kF$)g.Ci=>W00T";"7;cXIA,";"6um3b","<,uDbF)YQ.ASu\"\'",";f#l`BN?k","D)G<l6r?Nu<,k8]0M)";"+=KfL3Zn";":iBiZATURRD09O","ApS;L;Jf!@8iLj;6i";":i^8e@<-Wi@<-G";"6>URb+@^BoBlj","8RaJU9JT.S;)`PjCeO","7qm-X;K$\\jAO^]_Blj";"F*(tZGYMam898`,","G==>]@o,H_<,c8U9)","G&\'T685=.Y8pYGhE``","<b5c_DfRW";"1,(Oq6#T25BPVQF","6t(+O6>U(@AOl";"@rc-hFD5Z2";":h**Q:,-ob;H?=H1ir","BQ%]t=9","EHOZqAhn$m6UXa-B64","BgkQ_78#HmDa?\'G","6#pOS@7t$GF_L","<,YQAC1Ums;fH/TAH","=o";"87c4?";":gnBdBk(sj0`","@r,^bEW";"7s/NA@VTIaF8";"6Xak!AOLQWE,]B!";"7S%/h:MX\'!:fTGJ9)";"6#L=HC`l\"q+@0mXAS`J[Derq","<,ZnhBLQfLARk","F*)G:DJ&";"B6@n","87?:BB`";"<*Ed!:,Q`R7lX-","7qm-X6Y1(FF*),)CdE)`","DK0W?@:`#>=#4l*7f","A7]RcGl","6Z6dZE^ObcEb/a&Bl@lXAnGUaF8";"7qHd0BPD9nEb0+","6Z6dZE`6OhF_,H#AH","<HMqk";"E,m[57R:j\'2H4d%7f";"AmoLcDf,";"<bZ&cBl.n";"1iIS9@n015H\"gbcAlA";"Eaj9%F)to7Bk07X0/5.@3AWQP2DI\'K2)dBQ";"@Vfb)H=:i)";"6#pOS@/";"@r#[ZF_jB31jD`@","<&.?eGXOo:FDt>c","8TR/","G%=Wl@SSh+:e#8:<FG","CdLa9=uUG(<d6VYB3,","EcFE5G?%[G6;gN;G&.";"9Q+igARk";":i\'QcATDh";"4@=%\'DfS!;F`MG;ANit6@;^10D\'2VlH$D@m7qlRWARlp/Dfm1%ASuR#Bfnb$Ci=>W00T";"Ch[NqFDbf1B)","Eaj9%F)to7Bk07X0/5.92`*9K3&ruW1GCL;";">?5HZF^]*->p)^[Cgh3l+Du+>+D,P7DIal%DfRl]";"FCf?2ASD";"8T&W]DKBN6Gl";":iBiZATT%_Bl.F!F(oQ1","<(0_b+B)?;;FC","=@6M6ATD3HBOPUmEr";"DIIBn";";g3/#A,","=Z/*03,UKTCf*YrAc","H=_,8";"F(KH1ATV@&@:F%a";"6Yp[NCK,\"bAH","9jqQm1/i.4H#cJb5um";"Bk.";"6tp(GDeF3(6Z6jaEc5c1AT@","Ea`J",";)D3O;)h\'V92n]$2,=","1i@;)3+6`GF@1+81]";"Eaj9%F)to7Bk07X0/5.?3A`QP0K;!F0fD!N","7<icfDf]W2DGY7m","7qHd3De!p2ARnbOG]Z8jGQ";"F)Y]#BjkgD@ruF.@<?\'k";"8NA_2Bk1%>1e_Uq@f";";fH/hDK\'N8";"3(HAS<FJj1Cdg3T<_i";":i\'QcATC:`B`";"BOtUqASrW+@;U.$","<cKifEai!l1O!SX1NW";"8hamLG^++,CKYI.","C2J&^BN6ra0ks\'SFDC";"E+<<mC]","Cg\'PGG&0QX<DldS",":dIZ?;J]0);KbWV7f","","Ci=N/EW";"@rH6p@<;","7SS#\"FA5\\HG;W\')95\"",";K$2jAM$euB6@b","7<*HaE,]B!","4Aoa$?VG$DBl@l3882UGDfp.c";";e:&IEbTB!Ed:JiEcaZ<Ea`fr","DfT:","1hgW8;,M(#2)T>VC]","ARTY%";"8n)7M912Bn=Di\"5DZ",";e:&:FEDP;@Wcd(","Eaj9%F)to7Bk07X0/kaB2`<EL0f([A0K:r";"B6%F(BlnV","G#)sN=thm<0hG5&";"AlNM8DH1+^85DrW<r",";K?SI7<(4h0Q&g?<d+";">%r8!;)W<*@S0$[AH","<+^#::.%j\"CIg<q";"3W";"6Z6dZE\\d";">:\">t,qWC";"D`C3AEI)@gBgjaH<W";"=E-rHG]mV,2+q(a7;W";"8830TDg4TW@qu";"9l=unGsc(4=\'.dYBMJ","8830TDg4`lDf0X","87c4GFD(";"6>U(?CEPr[@<6M","8p+ui<,V","@l$eFE`cF_2ed&N";"Eaj9%F)to7Bk07X00)!J1GgmA0JPL@0fLu","7:C7ODJ)miH#.$";"Bm3?EH8[TZ7SR;b","DIl7FG\"GP/C/[!!9lL","0ekLC1c$pJ2)$^C0ebE","B6/3)","CKOP(=$eT21Mg,j85T",";fH/hDIm?MF)59&A9.","0f1R<3B8uQ2)d3C2`<M";"FEqh:",":3CD_ATC^\\EHPi1@q>";"Eaj9%F)to7Bk07X0/51>2_m9H3&`TP1c@3N","G@kH)7V6mDGstbDFu\'",";JBcWF@]hXA,";"3I+SI;bKe]Ed)Ok",";fHbg@:VZAB5D,",">?5HZF^]*->p*\'gD/F3/8TS]VDIal1AT;j,Eb0;7@3B`%Ch[E&Ble*!DIal-@;TQuF*)G:DJ(R","6#L=HC`l%r+@U0ZD0[6kBOPUmEr";"7VQaN7VQmaF@0_UCh-U\\Bk(gJF$T","7qHd<@VTIaFE7","Eb0<\'FAuskAT@";"8o77@=$g%I2H3dXEr";"@q]:kB4Y%VD.N","CI\'^E76,U+7rN9\\FT","77qB3De^t-B1dA+8c";"?XIV\\D?","+CSc%Bm*p,ARmDU6Z6dZE]l\'>","D,<oH<Hhkm=a=\"?;u","@Wc3lBOL";"Ci<`m9lFQRCdDrL<+TlWE,Tc=";"=YXhrC2Q%6G=F;]>#P";"Eaj9%F)to7Bk07X00(jC1c-pF2Dd0F2`NJ";"E,8s.AT@","=DL2X:bc$OD0SWc;,R","De<U&ATR",":N1DiDf.<";"8p=<Q82<_T3EJL*8l,","9Q+ib<b5c_DfP","<HD_l8T&KiFB!O)AH",";IsA]9P%jNDf-[gBk1dnF`[";":iCDhFD5Z20`";"6tpLLDKBN1D?","6\"F_QF*(?\"AS#B","F]:8!3HT\".>#/j,C]","DJ<j);-?P%@UjChC]";"Gu@(C1M/F92,@CG@5e","7Puo72J[JF2ebfuFo","@l?k6Ce[i#6;om37f";"7W`-59l)^D@PLb^9m?","FCB3&ATU:/";"1MTHq>&8@Z;/L/J";"G?.%#2Ip`J2.CD\\F(#","91h\'/;fb9&D+$Zb1dM","6Z,ReC,%DG95Rg-@/";"9P%gX87?CH",">#/aBF(KF";"E+*NrF*(i.+DYD&F_L","Eaj9%F)to7Bk07X0/54<0f_6J1,1I:2`EEN";"6t(+O6>U(@APr","7:C9","1NlJgGsa<39l\"ckBE";"Eaj9%F)to7Bk07X0/54:3&!$A2`3TL2Dd3E";";fH;ZA,";";flqsE+NP",">%(lBDGi/J8U)sKEW","D/!k";"D/;%)7X80S@7>ES9`";":iC&cFB!0S@VTIaFAm-e@q>","3)hS\'9m/Eb@mNUU69t","<,$GjAH";"Eaj9%F)to7Bk07X0/57B2DR!D1c-pC3B/fP";"6Yp[YAH","7ojOaD/M^eBP(b#";"Eaj9%F)to7Bk07X0/5.:1,L^A1c$gB2E<HG","F)Q2=A,";"GrKeHFa$D[6oSdsFT","G=bP#8kO4s1.sPn@9N","=(,o\\;fH;ZA,";"8oIjFBlS6@Fu)*G","3-Ir32cjF$CK!lACg$","FC]5D2E4<C6V]XD";"6t(+O6>U(@AP<","7qHd2G][M7FE:ApH=[",";JC(m7U^.JCj@-hEb0,s";"BlcRMFD5o0";"0PO[\"7p&T*91q04","Fa81LF]1RoA8an(Fo";"G\\9N$7QFmhAn<eeBm\'","87?CHCh3","D)\"CG","8830TDg4W\\DKKH1","8o.\"5ARn,!6#h\'(1e%";"6#LCR@<?4%D?",";.r<f2)%osAhmO_","6:kuIF`\'`?6:XU7GVK","E+j0$DJ==";"3(%S$EC+=oDJh0g9`","=\'\'QVC3)sb0fXGE";"7WNWcFE7","6Z5k48T[F)Cftn$=#B";"H?`)+G>p@R6t9);=9";"6#L1GDfSZmBl8\"","6#L=HCg\'5@F(\'$,ARTU7";"CM@m3F`(a",";flSiE+NP","G]-ML:2Xi:FAbY2AkN";">=*.EGT]IrF_Pq?A9)U-E+NQ4>l","82<eP2KO%!B1bT[","6t(+O6>U(@AMO";":,t12<&\\At3EK$M=9",";IOZY";"96j\'SDc1(76:P^!","6#L=HC`l\"q+@0mXAS`JeASbpdF(G";"9PJ-QF@g@^Cis<,@q>";"8T&KiF@C(XARk","1efeaC,g$&:N&c]";"91sCnF?\"G9;e\\a$G@^";"Eaa0)ATR";"87c4MFCJfiF8";"<)uV.BOjG&AjSFeGl","FE1r;","82Opp9iP%Z=*@_@63";"4@=%\'DfS!2Eb/g\"5!j((GT]IrF_Pq?","6\">\"NG%#K(A,";"<cN8-A2m:dBMg]I";"6:aU79l!F;G#*-s","Eaj9%F)to7Bk07X0/5:?2E3TR1,psF","E)LR^1IP2OCf<\\iBE";"6$bJ)@n\'FC=@Q_>BJT","G@bi;";"6ZQaHFCb","<,u\\lCh4_W@<--+6>U(@AH";"Eaj9%F)to7Bk07X0/kX?1H.0H1GUjG3&r_";"<,ZnhBOt]",">?5HZF^]*->p)UFBl%?k+EVNECi<`m+A6-[F_Mt8De*Eq+CT>4ATTs","3[c:b.OdC","ART4fAH";"6YKnK@:OCjEW";"ATDg0EW","=YWs#8TmR\"<EM8%82L";"?6sYB-n[)#-$(O]",";flquAH";"0h+Z16uOk<68:cH";";f?erA,";"6#L=HC`l(s;IsZU@<5u";";JC(m7U^.JCj@-oBk1dnF`[","H\"BlA92S#cF^\\uE1&";"Eaj9%F)to7Bk07X0/5:?0f(L?0JbF>","4@=%\'DfS!;F`MG;ANit6@;^10D\'2VlH$D@m7qlRWARlp/Dfm0hCgggh+@9mQF*\'N3Des?44YJu";":iCDhFD5Z20E","6?u4M7n$-cGVi\';D+=";"EG9E&@l@FtH?_/CF@u";";/A]uDb#+h920(T:1X";"EE6Lf9lFoM3DF]W","<G6Y<2cNpHH?4(,","6#LCR@<?4%DFn@","Eaj9%F)to7Bk07X0/kjK2DmKT2`EKN3&3;";"9lFQRC]";"E_:1FCNjMnD-0SCC&";"A8+goBeX^@C3`ob6N";"@<ca+<b,`d2E527<(?";"87c4QASrVYBl.F!F(oQ1";"8830TDg5/oB4uA","<-MnbDFn_XDZ";"6r-]h=_M5cG=Y#%";"89JcXDJs6\"";"7VQaN7VQmaF@0_UCh*";"B6@o`@;TQ";"G%Ptq@<-G","3ANEL1c6sI1c.3K1be";"=`8>\'1&","9ec","6Yp1PF&$.\\AH";";K$YcFD5Z2","@W-*m";"=(Q2Y6Z6j`FE1f(DKG","Eaj9%F)to7Bk07X0/57C1,q3L0f(UB3B/rT";";,V\"\'BeV5N;,M9j";"<+U;rF`M%bA,","3Fkd\':N://1IGbL:Nc";"6>URYD+/&KARff";"H<3Tq0M6%G2fEt@>$(";">&-ZD8S2\"K>$!J*;JZ","F)Yi(AT@";"9Q+?M6#LCR@<?4%D?";"B45i";"F(eumDg)","6#L=HCg\'8PE,9H6Bl@k","D/=8gB0o\".2f<nDED?","BL,\'@A40?RBjt!t=>g";";K$Jq";"6oe.YG?SHG=A30X@f","@ngrT=Ct]ZCe.](=9","7:C7ODJ)@OEb/a&Bl@k",":fD77<FJs+1g\"rj70","7qHd:De*Eq6Ul*)D.N","6#L=HC`l\"q+@UNoCi=B/Df,","2f!8P=B\\-O8k)-A3<";"CLM(&Bef","6t\\tgD/=)g7rW0<";"B6@o[D..\'g","3&`j.<F],j6rRZ3;u";"6t(+O6>U(@AMF";"6=FA>E+*6l";"6?RBlDf.9tDg-(";";GUj_G#W@!0k5<;Aha","<b5c_DfRT","@WZa31M(lQ@RXd8";"9iG&.A2&0pEA;9?";"6N","0ebF?1-%\'E3&EP";"7U^@[9PJ-QFDbf1B/0","@<>1S@<6NdDIlj_@ruF%","GAhM;F)YPtAH","0iU&2CLUpH78e+oH?f";"@q\\S.7qP>):f;1)H8k",";fuqoDf/-fCgh3l";"DaI$?G;O/(=]ACA";";JC)>@;T^pGt;X[AT)^5","77UL%1,X)<3DVVFE_Z","CjBndBi\\#L6W-ftAc";"=9","7VQj[EAVB!E_(IJDb^";"8TR:2F(8d!A79@t:M\'";"1dt/J7WCmu:igSP<,V","1M_8=FDO]O3E\\=`Du";"G\\p)RDD>(26T-Z5C]",":,R)_GqjOu@Ralb@K","<,Z\\k";"=\'BBPF_3U11KnR<";"BOtUqASu$mD.RU+Bl@k";":i\'Qc";"F(KH8BQ@ZmA8,RcDKKT7Gl";"4B#g\"4o";"4Aom4?UeI@Bl&&;GT]mqA7&#AB5):%+@1$ZDIG^";":gnBUDKG";"6#L=HC`l\"q+@:!WGp#LhF(\'$,ARTT","8830TDg2";":3C>`","87c4QASt.LD09O","=)0Nb1g\"6iA54sj;#","=(,fb7W3<7BPD9n","E,T6%ATVHsD.RU+Bl@k","BMNP,C,et$8kX5\'";"?Uk","1i?)F<C\\f4<GleM2d-";"A8cU\'BE";"1ic62Gr][s5snF^",";HZXi9L`u0Anc*k","F[8Dn3)XC$<+SWpECB";"=(,fb","BQ%]t=@R+8B)";"=\\`-pF&dO-6npB1","BlIKpEcV","6Ul*)D.N","<+U)j@;0T","DcTamCbfX\"BfU<M","6?QgLGl","Eaj9%F)to7Bk07X0/5.<3&NBL1GCR>2D[\'E";"6#L=HC`l%r+@UNoCi=B/Df,";"Eaj9%F)to7Bk07X0/kRA2E3NM2*!BN1,Ui","=uLC[=(QVB8S)\'k";";0?;X";"2-\"3b;.aZGDerEK","1eW\'[AkG(+E(Oqh";"H=Bll7s\\!/:NgnKC&","D..9uDffX","0ed9<3GLlk2JmXo7TT";"@l._\"9MeMoBlZsP","6#L=HC`l\"q+@:!WGp#LhF(\'$,ARTUd1&","Eaj9%F)to7Bk07X0/5.72)70O0JYF<3ANQM";"8U\"Zf=`6kcG;r\'42Fd";"@rH3nDc:ahDu";"6#L=HC`l(s+B3&lAKX<JCht4\\Eb/Zp";"8830TDg56\"Du";"B4u4)F8","7qHd@ATDs*E`?aiAPR/f";"@ps7bAS_","Eaj9%F)to7Bk07X0/51<1GC^F3AE6B2`WZS","7qHd@ATDs.@q>","FDl&>D.7\'s";":2b5gAnba`FD5Z2";";e\'6PAH";"Cbb";">=*.EGT]IrF_Pq?F*)>@ARmE!","9efao1.?@Q9Q\"9A8H";"AQWeMAn*Y`Bgm#RB2S";";*dcECemVuGZ]9*";";KZkUATDs.@q>","Eaj9%F)to7Bk07X0/GRE3&!<H3B8h";";IsijBl[d+87?CHCh3","1NkKU;aNf12ecrA","BQA%","<,ZnhBN/DZ";"8T&Tk@;]Rd";"6\"FM*@:o",";e^Ph","<c;esD.N","Ea`irDf#";"@5Ku^<\'aW#85_6&C&",":gnBd";":et-";"@5W@U:/4>S6Zl@FC&";"FAXr7CMlFa7lb\':","6YKnMFCet","@;di<E\'[)pFYl$F";"BmOGZA2SU?H\"1>S;d\'","8SqmKAQ!)LFAln\"AH","1GEQa:j,Z9D0S!T","7<iBRF`_0","7:p.C@rq","<+p;`F(fK.A,";"AP+b\'7q#S@Bi/P2";"H\"D)3";"+CSc%Bm*p,ARmD94@=%\'DfRuo4o","=)CnmF@8eX8pGQ$";"D..\'o@/","-$(P?7V5qHF_PqDF\"/F","C3N68@o#]j9lONTAOQ";"Eaj9%F)to7Bk07X00(pH2`3KP0ekR@1c[A";"Anc-n","3GUHQ;b9JV1.$\"tAc";"=@6b1E^OMKBl7t","2I\\scG%+9W:,#+<1&","7qm-X7WNWcFAcO]D?","<b6)c@qg%1;fHbg@:T","8T&KiF@\'PO@;Z";";Iso\\FAHdQE+*s.";"9l<^=2)B?!@X2C-=&f","883/","FCB3&ATUaeEr";"GYi9J=\"m&t7Vke$:Mp";":N1DiDf.?";"E(;d2G]uYI<,kKJ8TX";"<HD_l8T&KiFAlakG%kGt";"7;cOCCh7,","Ao)0mF%1(g","DaJ1n=]Im\\Eb]?7EDQ";"Eb/ctAS5^qDJ3`pAT)^5","<-MnbDGt+eG%kGt";":L[sGDG*?>7;c[=D#","6#L=HC`l(s+B3&lAKXonDf>";";f#l`BN?n","B0p0+@o,sD6:G@%CB";"6tpgYDIjqVEc_";"6#L=HC`l(s+@1$gDg*<nBl[b","2_eJi:.eDNCI^=/",">?5HZF^]*->p)UFBl%?k+EVNECi<`m+DGn5@;]TuD/WrrC`m>.EZb",";d*0Y=\\^u%CiW0)C&",";KZj","Ch[NqF8",">=DtBBl7Q+6>URb+@^BoBlks[/mS";"EHP]*AH","9lG/qAO:N]FDl%O";"EbTK)@;T^pH\"^o&AT)^5";"6?6dQBQS-\'F)q";"6#L1GDfTE\"",";IMmm3Abee7WV+:Gl","3([jA:jP#[@rua0C&","7ri$I","8SqmKAP?NAAS_","E^=S!=DLo:@8LSo9go";"8830TDg4reAon";"E+*NrF*(i.A8,mlDKBN1D?","F(o9)","<HDhq@Rr4oH;/Hl";"<bZVt@;JDRF_Pp",";f?erA4^;";"FCAWpAH";"9Q!<W;b1k+E-ZV>";"6t(+O6>U(@AMX";"8Qe&^=[b;DB2rJ[";"<,X[\'E)17\'8k:[KA,",";e\'iZASt\"\\B`","D..O\"";"87?R=@:o","6#L=HCbb";"7qm-X6tpgYDIl+SF8";"F^m*^137SXE_]G\'>#t";"A4]gGGq_]`DK\\ld";"B4Z0tASuY","B4Z1%ATV@&@:F%a","B1ZcZ79\"AHH#6JQBE";"9OW-6CjLAJ;DWPjEH;";":iC&cFA-C]BQO","88i<T7!3NYFD5Z2","Ec6)<A,","9P$M%;0Q)b@8D,>:]";";JBcWF8","@rFYQ=DMJB3+6NAFT","A8,IhDf0(";"Eaj9%F)to7Bk07X00(^@1c.*J1,h*G2)@/","<cr(Y93\"eDG\\0B28n@";"7qHd1ATM?mDId0nFE7";"0hF/YAO1>m0M5hP",":gnBdBk(sj1&";"F)Yi6Blj";"9N!WH9j\'kCC3=<$","A9Dp$FD5Z2",":gnBd0E";":hb)kFB!/","7lP%$3Djg787tI^","0Q286BQ@p\'G\\pDk","9Q+ELCf\"qVH\"D!";"G$&lV2b.pDA7fOI5l","GskVQ3I*VU@9>F\'","D00r8De*Tk13>?jGQ";"9LW#O0QKd/DGWrA7f","A2J-uCH-0/=]@.kD?";"<+U;r","B6J\'$6o/Fk;+4?\"","G%Pu7@;U.$";"7W_OL@Sf\'P@9>L\"";"4@=%\'DfS!;F`MG;ANit6@;^10D\'2VlH$D@m7qlRWARlp/Dfm1#Dfo](+@^BoBllI)Des?44YJu","4@=%\'DfS!;F`MG;ANit6@;^10D\'2VlH$D@m7qlRWARlp/Dfm1%EbTK/AKXBLEbf-#@:Wq36Z6dZE]l\'>","6tLF]Ec64";"<GlAfF_Pf6ARk";"7ScHF<]Ei`1e:A.";">\"rp;7qR$::/=hlA,";"B5M(!@qY",";c%I.84GI7A9(Fi9`","Eaj9%F)to7Bk07X0/t^I0ekCC0JG:=1,gr";"2_[s-9fR5a12&F47lU","<bZVt@;L!Z";"6tLFLASu$eDKJcfD/XT3DJ&","6YL1MA5ZuUDg#]&";"6?P:cH<GN+D*_WP";"<,$)H;)gp4H8o#J@f",":gn-RF*(i.94;[[B`";"7qHd=CghU\'DJ)7QBl.:#Bl@lgEa`HnEr";"DF.5Y;/.t.@:Mkr","Eaa05ATR","@s)g4ASuTUDJ<q";"Dg+K96tTV3BP;O\"";"G#_\"P=B0<b=DK]`";"@S07;ATLRU8m+k[","6=FA>B6%p5DIc^e@;^.*@<,ps@sJ",";IsB4AS5^qDFeJPAT)^5",":O4rZ<GXL:Df92gF8","=`8F*6#pNZ9Q+uo+T";";JC)C@;U.$";"0etXE3&<KL0K:aH2`NS","0h4u)88*$09km\'t","CJ-WD;IWa<6Xk@b";"=BA@&2.Kg#8ht6l","7qHd:Dfp,4","G^4+CFuaP_6u5[u<<";":g%C41.4l\'F\\ZUfB2&","<,$5l6Z6dZEW";"H>I\\==&*XR;,g+sEW";"@l%Or=EJS#3(He6";"<*3%;E%k:$>\"M1d","2b7jh0fa/k3,hf+";"D..Y","8SqmKAQ!)LFAHL\\F(KF",":gnBdBk(sj7;Za\\FCfI";"CeRH$EB$ol8S_6s@f"}for p,o in ipairs({{1,879},{1,578},{579,879}})do while o[1]<o[2]do u[o[1]],u[o[2]],o[1],o[2]=u[o[2]],u[o[1]],o[1]+1,o[2]-1 end end local function p(p)return u[p-11993]end do local p=u local o={}local function s(u)local p={}local o=1 local s=#u while o<=s do local x=string.sub(u,o,o)if x=="z"then table.insert(p,string.char(0,0,0,0))o=o+1 elseif x:match("%s")then o=o+1 else local x={}local r=0 while r<5 and o+r<=s do local p=string.sub(u,o+r,o+r)if p=="z"or p==" "or p=="\n"or p=="\r"then break end x[#x+1]=p r=r+1 end local G=#x for u=G+1,5,1 do x[#x+1]="u"end local w=0 for u=1,5,1 do w=w*85+(string.byte(x[u])-33)end local I=G-1 for u=3,3-(I-1),-1 do local o=math.floor(w/256^u)%256 table.insert(p,string.char(o))end o=o+G end end return table.concat(p)end for u=1,#p,1 do local o=p[u]if type(o)=="string"then p[u]=s(o)end end end return(function(u,s,x,r,G,w,I,j,C,d,S,J,k,o,y,K,O,N,e,z,U,L,B,Z,c)d,J,e,U,O,c,z,y,K,N,o,S,C,L,k,j,B,Z=function(u,p)local s=k(p)local x=function(x,r,G,w,I)return o(u,{x;r;G;w,I},p,s)end return x end,function(u,p)local s=k(p)local x=function(x,r,G,w)return o(u,{x;r;G,w},p,s)end return x end,function()Z=Z+1 C[Z]=1 return Z end,function(u,p)local s=k(p)local x=function(x,r,G,w,I,z)return o(u,{x;r;G;w,I,z},p,s)end return x end,function(u,p)local s=k(p)local x=function(x)return o(u,{x},p,s)end return x end,function(u)C[u]=C[u]-1 if C[u]==0 then C[u],z[u]=nil,nil end end,{},function(u,p)local s=k(p)local x=function(...)return o(u,{...},p,s)end return x end,function(u,p)local s=k(p)local x=function(x,r,G,w,I,z,C)return o(u,{x;r,G,w,I;z,C},p,s)end return x end,function(u)local p,o=1,u[1]while o do C[o],p=C[o]-1,p+1 if 0==C[o]then C[o],z[o]=nil,nil end o=u[p]end end,function(o,x,r,G)local Oy={}local Ly,g,H,wy,Z,q,Ny,ry,l,i,a,V,F,W,N,xy,I,cy,h,f,C,M,E,v,zy,P,n,oy,Cy,sy,ky,Iy,X,Zy,R,y,b,t,D,py,T,k,Gy,Y,yy,m,Q,uy,ey,A while o do if o<8448061 then if o<4397623 then if o<2088268 then if o<988605 then if o<494986 then if o<225975 then if o<108156 then if o<38057 then if o<24636 then if o<15025 then if o<14758 then o=7872311 C=z[r[2]]I=C else o=u[p(12127)]I={}end else if o<17106 then I=C o=Z o=5567558 else o=I and 16332665 or 582324 end end else if o<36494 then if o<32303 then o=z[r[1]]o=o and 13128075 or 10567974 else I={}o=u[p(12077)]end else g=p(12711)a=o X=u[g]Y=X l=o o=X and 2115447 or 16656001 end end else if o<73634 then if o<72853 then if o<52804 then o=0 z[r[1]]=o I=z[r[2]]o=I and 11837449 or 8497679 else o=z[r[1]]I=p(12530)I=o[I]I=I(o)o=9802922 end else k=p(12281)N=p(12755)k=Z[k]k=k(Z,N)o=k and 16252701 or 14747357 I=k end else if o<94483 then if o<81292 then o=false I={o}o=u[p(12009)]else I={}o=u[p(12214)]end else I=z[C]Y=p(12369)Z=p(12801)o=I[Z]Z=e()N=p(12369)z[Z]=o k=z[C]I=k[N]X=p(12002)k=p(12152)o=I[k]N=e()I=p(12328)k=o o=u[I]I=p(12391)I=o[I]I=I(o)z[N]=I l=u[Y]Y=p(12810)W=l[Y]a=u[X]X=p(12059)Y=a[X]V=p(12489)a=p(12369)l=W(Y,k)Y=u[a]a=p(12630)W=Y[a]a=0 g=u[V]V=p(12065)X=g[V]V=-35 g=X(V)X=0 Y=W(a,g,X)a=p(12369)D=p(12489)W=p(12152)y=l*Y I=y[W]Y=u[a]a=p(12810)l=Y[a]g=p(12002)X=u[g]g=p(12059)a=X[g]X=p(12369)Y=l(a,k)a=u[X]X=p(12630)l=a[X]V=u[D]X=0 D=p(12065)g=V[D]D=35 V=g(D)g=0 a=l(X,V,g)W=Y*a l=p(12152)y=W[l]o={k;I;y}y=o I=p(12368)o=u[I]Y={o(y)}W=Y[2]l=Y[3]I=Y[1]o=3521123 Y=I end end end else if o<187831 then if o<152100 then if o<124005 then if o<118483 then o=u[p(12603)]I={}else N=p(12801)C=p(12132)o=z[r[1]]k=z[r[2]]I=p(12346)y=.5 I=o[I]Z=k[N]N=.7 k=nil I=I(o,C,Z,k,N,y)o=u[p(12334)]I={}end else o=I and 2482412 or 7854997 end else if o<182932 then if o<166436 then o=I and 5364801 or 2290790 else sy=I o=sy and 7000464 or 497659 end else Z=p(12628)C=x[1]I=C[Z]Z=p(12246)o=I==Z o=o and 8482220 or 15145305 end end else if o<200561 then if o<194996 then if o<193254 then m=g==V o=6718182 Q=m else o=u[p(12162)]I={}end else o=u[p(12161)]I={}C=nil end else if o<221182 then if o<209463 then P=1 N=z[r[9]]l=z[r[13]]Y=true g=p(12460)W=N(l,Y)Y=p(12483)z[r[8]]=W l=u[Y]Y=p(12828)t=p(12801)N=l[Y]Q=p(12346)Y=z[r[11]]a=z[r[12]]o=13267786 D=z[Z]V=D[t]t=.8 D=nil Q=a[Q]X={Q(a,g,V,D,t,P)}l=N(Y,s(X))else o=z[r[3]]I={}N=false k=o(Z,N)k=p(12802)Z=nil N=false o=z[r[1]]o[k]=N N=p(12769)k=z[r[1]]o=k[N]N=false k=p(12663)o[k]=N C=nil o=z[r[1]]k=p(12007)N=false o[k]=N N=p(12366)k=z[r[1]]o=k[N]k=p(12663)N=false o[k]=N o=u[p(12102)]end else I=z[r[1]]C=x[1]Z=x[2]o=not I o=o and 10177511 or 15059832 end end end end else if o<393600 then if o<324077 then if o<261465 then if o<255217 then if o<238971 then Q=z[C]m=p(12022)o=Q[m]Q=p(12530)Q=o[Q]Q=Q(o)o=15607685 else I=z[r[5]]N=z[Z]k=I(N)Y=p(12801)N=e()z[N]=k V=p(12369)l=p(12424)I=z[r[6]]k=I()I=z[r[7]]a=1 W=z[r[8]]y=W[l]W=false k=I(y,W)I=z[r[9]]l=z[Z]y=p(12227)W=l[Y]k=p(12346)P=-5 Y=.75 l=nil t=0 k=I[k]k=k(I,y,W,l,Y,a)Y=p(12801)k=p(12346)I=z[r[9]]y=p(12680)l=z[Z]a=1.2 W=l[Y]Y=.7 k=I[k]n=o l=nil k=k(I,y,W,l,Y,a)y=p(12719)k=u[y]y=p(12027)I=k[y]y=.3 W=O(11140300,{r[9],N;Z})k=I(y,W)M=o y=p(12719)k=u[y]W=J(14390499,{r[9];Z})y=p(12027)I=k[y]y=.5 k=I(y,W)Y=p(12369)W=p(12305)I=z[r[10]]l=z[Z]D=p(12369)g=z[Z]X=g[V]V=u[D]D=p(12810)g=V[D]D=0 V=g(D,t,P)Q=p(12069)a=X*V X=p(12845)V=p(12670)t=p(12023)g=z[N]v=z[N]R=v o=v and 6778083 or 15738842 P=true D=nil end else if o<257002 then k=z[r[1]]N=p(12683)o=15397495 Z=k[N]k=p(12365)k=Z[k]k=k(Z)I=k else o=z[r[5]]I=o()o=4360275 end end else if o<282449 then if o<277063 then R=o V=P M=e()m=p(12281)m=W[m]m=m(W,V)z[M]=m n=z[M]o=n and 4856617 or 1887626 m=n else o=t()g=c(g)N=c(N)t=nil V=c(V)X=c(X)o=P()D=c(D)P=nil k=c(k)y=c(y)l=c(l)v=nil o=Q()o=m()C=nil W=c(W)a=c(a)Y=c(Y)m=nil o=M()o=u[p(12139)]I={}Q=nil M=nil n=nil Z=c(Z)R=c(R)end else o=3320111 a=1 Y=W[a]l=not Y I=l end end else if o<347800 then if o<338528 then if o<332726 then P=p(12801)t=p(12801)D=X[t]t=C[P]V=D-t D=p(12762)o=V[D]V=o t=V<N o=t and 4242286 or 9327085 D=t else o=u[p(12595)]I={}C=nil end else o=u[p(12458)]I={}end else if o<386411 then if o<355447 then I={}o=u[p(12844)]else Z=o N=z[r[2]]k=not N C=k o=k and 5332569 or 15104 end else k=p(12663)o=z[r[4]]I=o()o=true N=true z[r[2]]=o I=z[r[5]]I[k]=N I=z[r[6]]k=I()I=z[r[7]]o=I and 6364779 or 15168623 end end end else if o<453573 then if o<428810 then if o<409972 then if o<399807 then o=p(12310)Y=p(12801)o=C[o]X=p(12801)o=o(C)k=o N=p(12369)o=p(12011)o=k[o]I=Z[N]o=o(k,I)N=o y=p(12369)I=u[y]y=p(12810)o=I[y]l=z[r[1]]W=l[Y]l=p(12336)y=W[l]a=z[r[1]]Y=a[X]a=p(12778)l=Y[a]Y=99999 W=l+Y a=z[r[1]]X=p(12801)Y=a[X]a=p(12012)l=Y[a]I=o(y,W,l)o=p(12515)y=I o=C[o]W=p(12673)W=N[W]W=W(N)I=y*W o=o(C,I)W=3 l=W W=1 Y=W W=0 a=Y<W I=1 W=I-Y o=6221113 else k=nil C=nil y=p(12719)W=L(13375221,{r[1],r[12];r[2];r[13];r[14]})o=u[p(12224)]N=u[y]y=p(12027)I=N[y]y=.5 N=I(y,W)I={}Z=c(Z)end else Z=e()I=p(12822)o=p(12281)o=C[o]o=o(C,I)z[Z]=o I=z[Z]o=not I o=o and 16199107 or 393415 end else if o<437761 then if o<431627 then I=z[r[5]]k=I()I=z[r[6]]y=false N=z[r[7]]k=I(N,y)Y=1 I=z[r[8]]W=z[Z]l=p(12801)N=p(12659)y=W[l]k=p(12346)l=.8 W=nil k=I[k]k=k(I,N,y,W,l,Y)N=p(12719)k=u[N]N=p(12027)I=k[N]N=.2 y=J(7749944,{r[8],Z})k=I(N,y)N=p(12719)k=u[N]y=B(123417,{r[8],Z})N=p(12027)I=k[N]N=.5 k=I(N,y)I=z[r[9]]y=120 N=z[Z]k=I(N,y)y=0 N=#k I=N>y o=I and 11709046 or 3064051 else Z=z[r[4]]k=Z()Z=z[r[5]]k=Z()Z=z[r[2]]k=p(12560)k=Z[k]k=k(Z)Z=z[r[6]]o=Z and 5815616 or 14251323 end else o=9904938 y=p(12801)N=Z[y]Y=p(12369)l=Z[Y]Y=p(12152)W=l[Y]l=50 y=W*l k=N+y I=k end end else if o<468308 then if o<467432 then if o<464013 then o=Y o=l and 6196878 or 11453768 else C=k o=N o=4342232 end else o=u[p(12165)]I={}C=nil Z=nil end else if o<483008 then if o<476765 then I={}o=u[p(12797)]else o=14654313 k=1 z[r[5]]=k end else N=p(12719)I=u[N]N=p(12783)o=I[N]I=o()o=14493117 end end end end end else if o<738364 then if o<617843 then if o<553617 then if o<534719 then if o<515729 then if o<504512 then yy=e()ry=603 xy=p(12409)Oy[1]=e()I=u[xy]xy=p(12810)o=I[xy]Ly=e()xy=p(12343)I=o(xy)o=p(12628)Zy=e()xy=I I=p(12853)xy[o]=I I=false o=p(12405)Gy=p(12318)xy[o]=I I=p(12836)C=nil o=p(12095)o=xy[o]o=o(xy,I,ry)o=p(12636)I=p(12691)xy[o]=I I=p(12679)Cy=e()o=p(12293)Iy=e()xy[o]=I cy=e()ry=z[r[3]]o=p(12350)I=ry[Gy]ry=e()wy=e()xy[o]=I o=O(4391649,{T})ey=e()Gy=e()zy=e()z[ry]=o o=O(2787169,{g;D})z[Gy]=o o=J(12212290,{D;g})z[wy]=o o=J(11102172,{H;r[3]})z[Iy]=o o=J(7722218,{Iy;q})ky=e()z[zy]=o o=O(3192623,{Iy,E,oy})I=p(12238)z[Cy]=o Ny=e()o=O(12861849,{E})z[ey]=o Oy[2]=J(12615410,{t;Zy})o=J(2081294,{t;V,r[3],D,g,ey;f,zy;Q;y,i,b;h,Cy;wy})z[Zy]=o o=J(9905013,{t,i,r[3];py,ey,f;zy,m,Z,W})z[ky]=o o=d(5272890,{t,i;py;r[3];k,ey,zy;m;Z;W;b;h,Cy})sy=nil z[Ny]=o o=d(5493637,{t,b,r[3];A,ey,f;zy,M,l})z[cy]=o o=L(11325595,{t,b;A,r[3],ey;zy,R,Z;N;Y,a,i;h;Cy})z[yy]=o o=L(16103789,{t,h,r[3];ry;uy,ey,f;F,zy;v;T,Z,n,X})z[Ly]=o o=d(4977525,{t,h;uy;r[3],ey;F,ry,N;zy,m,Z;X;i,b,Cy,v})z[Oy[1]]=o zy=c(zy)o=xy[I]W=c(W)E=c(E)I=p(12573)R=c(R)I=o[I]I=I(o,Oy[2])Oy[2]=J(3030631,{t,r[3];H;Cy,Gy;P;Zy})I=p(12088)o=xy[I]I=p(12573)I=o[I]Iy=c(Iy)I=I(o,Oy[2])n=c(n)I=p(12531)X=c(X)o=xy[I]Oy[2]=J(2847001,{t;ey,q,f;F,ry;Gy,V,P;i,py,b;A;h;uy})I=p(12573)q=c(q)I=o[I]I=I(o,Oy[2])Q=c(Q)i=c(i)I=z[r[4]]N=c(N)Oy[2]=p(12441)Cy=c(Cy)Gy=c(Gy)Y=c(Y)T=c(T)l=c(l)a=c(a)wy=c(wy)f=c(f)A=c(A)o=I[Oy[2]]Z=c(Z)I=p(12573)V=c(V)xy=nil m=c(m)uy=c(uy)I=o[I]M=c(M)b=c(b)Oy[2]=J(11241093,{r[4],t,ky;cy;Ly,Zy})I=I(o,Oy[2])ky=c(ky)I=z[r[4]]Zy=c(Zy)v=c(v)Oy[2]=p(12229)o=I[Oy[2]]ey=c(ey)P=c(P)oy=c(oy)Oy[2]=S(12122137,{t;Ny;yy;Oy[1]})py=c(py)h=c(h)D=c(D)t=c(t)cy=c(cy)F=c(F)yy=c(yy)ry=c(ry)Ly=c(Ly)I=p(12573)Ny=c(Ny)H=c(H)Oy[1]=c(Oy[1])I=o[I]y=c(y)I=I(o,Oy[2])g=c(g)o=u[p(12486)]k=c(k)I={}else X=p(12829)o=13348680 a=p(12041)a=l[a]a=a(l,X)Y=a end else if o<523426 then o=true z[r[2]]=o Z=p(12801)I=C[Z]Z=e()z[Z]=I k=3 N=k k=1 y=k o=2143981 I=1 k=0 W=y<k k=I-y else o=z[r[1]]l=nil Y=p(12397)W=p(12034)N=p(12670)k=z[r[2]]a=1 Z=p(12305)y=z[r[3]]C={[Z]=k,[N]=y;[W]=l,[Y]=a}I=o(C)o=u[p(12521)]I={}end end else if o<541893 then if o<538137 then I={}o=u[p(12484)]else m=p(12111)Q=g[m]m=0 o=13209860 P=Q>m D=P end else y={[W]=l;[Y]=a,[X]=g,[V]=D,[t]=P;[Q]=m}o=M N=c(N)o=u[p(12035)]k=I(y)y=p(12719)k=u[y]y=p(12027)I=k[y]W=B(14568638,{r[1],r[2];r[11],r[12],r[7],r[8]})y=.3 k=I(y,W)y=p(12719)k=u[y]W=O(13777705,{r[1];r[2];r[11],r[12];r[13]})y=p(12027)I=k[y]C=nil Z=c(Z)y=.8 k=I(y,W)I={}end end else if o<597675 then if o<589907 then if o<580831 then o=15256356 else o=u[p(12018)]I={}C=nil end else o=u[p(12527)]I={}end else if o<607435 then if o<601360 then o=z[r[1]]o=o and 6526712 or 952156 else Z=o N=z[r[2]]k=not N o=k and 7265255 or 6088140 C=k end else n=I o=z[Q]v=false I=o(n,v)I=p(12723)H=p(12318)o=u[I]F=z[r[4]]f=F[H]H=p(12029)H=f[H]F={H(f)}f={o(s(F))}I=f[1]v=f[2]q=f[3]f=I o=12088784 end end end else if o<684520 then if o<672747 then if o<667825 then if o<655630 then o=u[p(12294)]I={}else C=p(12554)I=p(12253)o=u[I]I=o(C)o=u[p(12337)]I={}end else o=3955959 v=l end else if o<679526 then if o<675871 then k=z[r[1]]N=p(12007)Z=k[N]C=not Z I=C o=14804145 else o=not k o=o and 6946666 or 11789850 end else X=p(12080)o=u[X]g=L(3160280,{a,Y})X=o(g)o=2021881 end end else if o<724619 then if o<709012 then if o<688056 then o=z[r[5]]I=o()o=2178564 else I={}o=u[p(12363)]end else Z=x[2]o=z[r[1]]I=o()k=I o=not k o=o and 11575848 or 12729681 C=x[1]end else if o<736217 then if o<732849 then N=o W=z[r[4]]y=not W k=y o=y and 10687102 or 5430568 else N=z[r[1]]y=p(12547)k=N[y]o=k and 16138737 or 14870124 I=k end else y=16 N=p(12192)k=z[r[9]]k[N]=y o=2556080 N=p(12594)k=z[r[9]]y=50 k[N]=y k=z[r[9]]N=p(12653)y=false k[N]=y end end end end else if o<884655 then if o<789252 then if o<760101 then if o<752070 then if o<749408 then Y=W V=p(12272)g=p(12041)g=a[g]g=g(a,V)o=g and 12693533 or 4656881 X=g else Z=p(12719)C=u[Z]Z=p(12783)o=C[Z]Z=.1 C=o(Z)o=4324148 end else if o<755684 then o=false I={}z[r[1]]=o o=u[p(12624)]else o=10046512 W=z[r[4]]y=not W k=y end end else if o<779635 then if o<775773 then i,py=F(H,i)o=i and 6129564 or 15592471 else I=p(12281)Z=p(12822)I=C[I]I=I(C,Z)Z=e()z[Z]=I k=z[Z]I=not k o=I and 6040186 or 1550753 end else Y=I o=Y and 9284220 or 11523058 end end else if o<821813 then if o<808387 then if o<803766 then I=z[r[11]]o=I and 4842699 or 406984 else o=I and 13506045 or 4390994 end else o=15318185 f=nil py=nil end else if o<863193 then if o<831678 then o=14026734 else k=y o=W o=14262663 end else o=p(12858)b=true py[o]=b b=true o=p(12818)py[o]=b o=3820612 end end end else if o<914356 then if o<904148 then if o<901547 then if o<888470 then Z=z[r[2]]k=p(12252)C=Z[k]o=C and 16153468 or 16114086 I=C else o=u[p(12118)]I={}end else I=C o=Z o=10258046 end else if o<909620 then if o<908335 then I={}o=u[p(12304)]else Z=z[r[1]]C=not Z I=C o=C and 4419387 or 13572235 end else o=true k=p(12663)z[r[2]]=o N=true I=z[r[4]]I[k]=N I=z[r[5]]k=I()I=z[r[6]]o=I and 13871789 or 8626194 end end else if o<940696 then if o<926141 then if o<921161 then k=z[r[8]]o=8863246 N=p(12786)N=k[N]N=N(k)k=nil z[r[8]]=k else y=nil N=nil o=9930241 end else a=p(12719)l=k l=nil o=15034608 Y=u[a]a=p(12668)I=Y[a]a=L(12216091,{r[5],Z})Y=I(a)end else if o<980414 then if o<961133 then I={}o=u[p(12812)]else o=I and 7843983 or 8119206 end else o=z[r[2]]I=o()o=9907230 end end end end end end else if o<1612627 then if o<1392279 then if o<1237236 then if o<1095469 then if o<1064490 then if o<1015897 then if o<1004233 then k=z[r[7]]y=z[r[8]]W=true N=k(y,W)y=p(12719)N=u[y]I={}Z=nil y=p(12668)k=N[y]y=L(14766355,{r[9];C;r[4]})o=u[p(12765)]C=c(C)N=k(y)else o=9035532 end else if o<1030982 then y=true z[r[2]]=y a=z[r[1]]Y=o l=a o=a and 11536776 or 13386609 else k=p(12490)N=p(12481)Z=z[r[1]]k=Z[k]o=5204090 k=k(Z,C,N)I=k end end else if o<1088961 then if o<1066285 then I=p(12723)o=p(12084)Z=x[2]o=Z[o]C=x[1]o=o(Z)k=o o=u[I]W=z[r[1]]l={o(W)}y=l[3]N=l[2]I=l[1]o=3842108 W=I else y=p(12021)I=u[y]y=p(12084)o=I[y]I=o(Z)y=p(12105)W=p(12083)o=p(12120)o=I[o]o=o(I,y,W)y=o o=N[y]W=o o=not W o=o and 7337328 or 13622503 end else l=p(12343)y=k o=p(12041)o=W[o]o=o(W,l)o=o and 10244182 or 8793759 end end else if o<1155149 then if o<1153342 then if o<1096876 then X=nil R=0 D=p(12397)g=p(12034)Q=p(12147)a=p(12670)P=p(12252)V=nil o=5524033 N=z[r[12]]M=p(12500)Y=p(12305)t=1 m=z[r[4]]l={[Y]=Z,[a]=X;[g]=V,[D]=t,[P]=C,[Q]=m,[M]=R}W=N(l)else Z=z[r[2]]o=1556758 C=not Z I=C end else I={}o=true z[r[1]]=o o=u[p(12167)]end else if o<1201949 then if o<1186637 then l=false o=p(12450)W[o]=l o=9893355 else C=p(12252)I=z[r[2]]o=I[C]C=o o=C and 7193092 or 2092894 I=C end else Y=p(12041)Y=W[Y]a=p(12028)y=k Y=Y(W,a)o=Y and 4401379 or 13459163 l=Y end end end else if o<1311842 then if o<1279418 then if o<1269648 then if o<1261091 then R=p(12398)o=u[R]R=p(12639)u[R]=o o=14415075 else I=p(12530)o=z[r[1]]I=o[I]I=I(o)o=6377534 end else C=p(12252)I=z[r[3]]o=I[C]C=o o=not C o=o and 625378 or 427568 end else if o<1301811 then if o<1286365 then Z=x[2]k=e()C=e()z[C]=x[1]z[k]=x[3]o=z[r[1]]I=o()y=J(9092697,{C;k,r[3]})C=c(C)N=1.2647101806872e+14 o=z[r[2]]Z=nil k=c(k)I=o(N,y)I={}o=u[p(12364)]else t=p(12801)D=g[t]P=p(12801)t=C[P]V=D-t D=p(12762)o=V[D]V=o o=V<Z o=o and 9414142 or 8446497 end else D=g o=13231153 end end else if o<1354571 then if o<1353681 then if o<1352692 then o=z[r[3]]I=o()o=14302543 else I=p(12398)C=p(12639)o=u[I]I=u[C]C=p(12639)u[C]=o C=p(12398)u[C]=I C=z[r[1]]Z=C()o=1871212 end else a=1 X=p(12822)l=W I=Y[a]a=I I=p(12281)I=a[I]I=I(a,X)X=e()z[X]=I I=z[X]o=I and 7046223 or 13199167 end else if o<1372167 then if o<1358214 then o=5730661 k=p(12786)Z=z[r[5]]k=Z[k]k=k(Z)Z=nil z[r[5]]=Z else W=z[r[3]]N=o y=not W o=y and 6264272 or 11971155 k=y end else C=p(12719)I=u[C]C=p(12783)o=I[C]I=o()C=p(12318)o=z[r[4]]I=p(12281)I=o[I]I=I(o,C)C=I o=C and 4179580 or 8174942 end end end end else if o<1515975 then if o<1467904 then if o<1409789 then if o<1404582 then if o<1403674 then k=p(12281)N=p(12755)k=Z[k]k=k(Z,N)I=k o=k and 10095924 or 14959196 else Z=z[r[2]]k=p(12252)C=Z[k]k=p(12822)Z=p(12281)Z=C[Z]o=2073789 Z=Z(C,k)I=Z end else if o<1406257 then I=false o=false z[r[1]]=o z[r[2]]=I I={}o=u[p(12329)]else o=z[r[1]]k=p(12609)z[r[2]]=o I=z[r[3]]k=I[k]k=k(I)I=z[r[4]]o=I and 4965374 or 4265822 end end else if o<1432235 then if o<1415801 then Z=nil C=nil o=u[p(12222)]I={}else C=p(12742)I=z[r[1]]o=I[C]I=p(12786)I=o[I]I=I(o)o=5722280 end else Y=false y=false z[r[10]]=y W=z[r[11]]l=p(12663)I={}X=false W[l]=Y W=false Y=p(12663)z[r[12]]=W a=false l=z[r[13]]o=u[p(12001)]l[Y]=a l=false z[r[14]]=l Y=z[r[15]]a=p(12663)Y[a]=X end end else if o<1488425 then if o<1481332 then if o<1475412 then l=p(12489)W=p(12489)y=u[W]W=p(12479)N=y[W]y=N(Z)W=u[l]l=p(12180)N=W[l]Y=z[r[11]]l=Y*C X=p(12489)a=u[X]X=p(12794)Y=a[X]a={Y(Z)}W=N(l,s(a))k=y*W y=z[r[2]]N=y+k W=o z[r[2]]=N l=z[r[5]]y=l o=l and 10225584 or 12674431 else y=k o=p(12786)o=W[o]o=o(W)W=nil y=nil o=12359853 end else N=p(12723)I=u[N]l={I(k)}o=7863369 N=l[1]W=l[3]y=l[2]end else if o<1509872 then if o<1504641 then Y=p(12801)l=z[r[2]]o=14758888 W=l[Y]N=W else R=M o=2571427 end else I=p(12281)o=z[C]I=o[I]Z=p(12822)I=I(o,Z)Z=I o=not Z o=o and 4319653 or 2145309 end end end else if o<1551472 then if o<1532511 then if o<1530095 then if o<1528211 then o=z[r[2]]I=o()o=8319667 else o=I and 8359173 or 10883424 end else o=W o=y and 1959586 or 578163 end else if o<1546219 then if o<1544385 then o=n P={[Q]=m,[M]=R}M=p(12607)Q=p(12004)n=p(12013)R=p(12281)q=o o=X and 3955959 or 669965 v=X R=W[R]R=R(W,n)n=p(12574)else o=z[r[2]]o=o and 10663899 or 10308051 end else I=z[r[5]]N=z[Z]Y=p(12801)n=o k=I(N)N=e()z[N]=k P=-5 I=z[r[6]]l=p(12424)k=I()I=z[r[7]]W=z[r[8]]y=W[l]W=false k=I(y,W)k=p(12346)y=p(12227)I=z[r[9]]k=I[k]l=z[Z]W=l[Y]Y=.75 a=1 l=nil V=p(12369)k=k(I,y,W,l,Y,a)D=p(12369)k=p(12346)I=z[r[9]]l=z[Z]Y=p(12801)y=p(12680)W=l[Y]a=1.2 l=nil k=I[k]Y=.7 k=k(I,y,W,l,Y,a)y=p(12719)k=u[y]Y=p(12369)y=p(12027)I=k[y]y=.3 Q=p(12069)W=d(9408164,{r[9];N;Z})k=I(y,W)y=p(12719)t=0 k=u[y]W=S(1738821,{r[9];Z})y=p(12027)I=k[y]y=.5 k=I(y,W)I=z[r[10]]l=z[Z]g=z[Z]W=p(12305)X=g[V]V=u[D]D=p(12810)g=V[D]D=0 V=g(D,t,P)a=X*V P=true t=p(12023)V=p(12670)M=o X=p(12845)D=nil g=z[N]v=z[N]o=v and 8211507 or 14095388 R=v end end else if o<1566443 then if o<1559292 then if o<1556649 then I={}o=u[p(12541)]else o=I and 9922711 or 13158031 end else C=z[r[1]]o=C and 11306759 or 4978944 I=C end else if o<1604914 then if o<1577733 then l=l+a g=not X I=l<=Y I=g and I g=l>=Y g=X and g I=g or I g=13310591 o=I and g I=16019185 o=o or I else o=I and 11077233 or 10702089 end else N=p(12347)o=9662168 k=u[N]I=k end end end end end else if o<1858924 then if o<1726364 then if o<1698951 then if o<1656237 then if o<1637320 then if o<1620161 then Z=z[r[4]]k=Z()Z=z[r[5]]k=Z()k=p(12560)Z=z[r[2]]k=Z[k]k=k(Z)Z=z[r[6]]o=Z and 5268617 or 11720857 else l=z[r[2]]o=4024025 Y=p(12801)W=l[Y]N=W end else if o<1655464 then Z=I k=p(12409)I=u[k]k=p(12810)o=I[k]N=p(12833)a=p(12387)k=p(12207)I=o(k)W=z[r[3]]o=p(12270)k=I Y=z[r[1]]l=Y[a]y=W[l]I=N..y k[o]=I o=p(12299)o=Z[o]o=o(Z,k)N=o I=false o=p(12045)N[o]=I k=nil o=p(12346)o=N[o]o=o(N)I=p(12547)Z=nil y=N N=nil o=z[r[1]]o[I]=y o=14986178 else k=p(12779)W=p(12585)I=C[k]y=u[W]W=p(12779)N=y[W]y=p(12324)k=N[y]o=I==k o=o and 2649973 or 6450450 end end else if o<1668979 then if o<1659414 then y=p(12045)W=true I=z[r[2]]o=8412406 I[y]=W else o=u[p(12816)]I={}end else Z=z[r[2]]o=6660722 C=not Z I=C end end else if o<1718463 then if o<1707331 then if o<1699333 then Z=p(12350)I=C[Z]Z=z[r[2]]o=I==Z o=o and 8540796 or 11216460 else o=8055400 W=z[r[4]]y=not W k=y end else I=z[r[2]]k=p(12719)C=p(12628)o=I[C]C=e()z[C]=o Z=e()o=z[r[3]]N=p(12466)I=o()z[Z]=I I=u[k]k=p(12668)o=I[k]k=d(6666863,{Z,r[4],r[2];r[5],C,r[6],r[7]})I=o(k)k={N}I=p(12524)o={[I]=k}I={o}o=u[p(12067)]end else if o<1725655 then if o<1723780 then o=u[p(12641)]I={}else o=z[r[1]]C=x[1]I=p(12070)I=o[I]Z=x[2]I=I(o)o=I and 7444696 or 6325667 end else o=z[r[1]]C=z[r[2]]I=o(C)o=u[p(12436)]I={}end end end else if o<1775358 then if o<1740450 then if o<1738551 then if o<1734669 then o=z[r[2]]I=o()o=10616035 else o=I and 11451405 or 1277542 end else o=z[r[1]]k=z[r[2]]C=p(12217)N=p(12801)y=1 Z=k[N]N=.6 k=nil I=p(12346)I=o[I]I=I(o,C,Z,k,N,y)y=1 N=p(12801)o=z[r[1]]k=z[r[2]]Z=k[N]N=.65 C=p(12351)k=nil I=p(12346)I=o[I]I=I(o,C,Z,k,N,y)N=p(12801)o=z[r[1]]I=p(12346)C=p(12384)k=z[r[2]]Z=k[N]I=o[I]y=1.1 N=.6 k=nil I=I(o,C,Z,k,N,y)I={}o=u[p(12577)]end else if o<1772117 then if o<1765167 then a=p(12621)l=p(12354)N=p(12315)I=p(12199)Z=p(12022)Y=p(12590)y=nil C=false k=nil W=p(12282)o={[I]=C,[Z]=k;[N]=y;[W]=l,[Y]=a}Z=K(11604779,{r[1],r[2];r[3]})I=p(12144)k=p(12591)C=e()z[C]=o o=z[C]N=S(12188237,{r[5];C})C=c(C)o[I]=Z Z=p(12076)o=z[r[4]]I=o(Z,k,N)o=u[p(12710)]I={}else o=nil I={o}o=u[p(12382)]end else o=z[r[1]]I=o()C=I o=not C o=o and 16085960 or 1544994 end end else if o<1810967 then if o<1793777 then if o<1786384 then o=Z o=8310046 I=C else I=z[r[1]]C=p(12252)o=I[C]C=o I=C o=C and 13741959 or 15188877 end else I=z[r[1]]Z=p(12547)o=I[Z]I=p(12786)I=o[I]I=I(o)o=11588383 end else if o<1857458 then if o<1835651 then o=I and 7580267 or 9035214 else I=z[r[2]]o=not I o=o and 535881 or 14764092 end else a=p(12719)Y=u[a]a=p(12668)I=Y[a]l=k a=S(15107752,{r[4];Z})o=2143981 l=nil Y=I(a)end end end end else if o<1967197 then if o<1893395 then if o<1880011 then if o<1871631 then if o<1865733 then I={}o=u[p(12494)]else o=true o=o and 1353680 or 7270716 end else I={}o=u[p(12316)]end else if o<1890884 then if o<1887534 then m=z[Z]Q=m o=m and 190801 or 6718182 else o=R n=o v=z[M]R=v o=v and 13039379 or 4800009 end else Y=z[r[6]]o=840107 l=not Y y=l end end else if o<1921040 then if o<1914950 then if o<1895565 then k=p(12830)I=z[r[2]]o=I[k]o=o and 14970287 or 9209607 else Q=Q+M n=not R I=Q<=m I=n and I n=Q>=m n=R and n I=n or I n=14385176 o=I and n I=1887489 o=o or I end else o=p(12530)o=sy[o]o=o(sy)o=12700040 end else if o<1960825 then if o<1956694 then o=u[p(12756)]I={}else a=p(12369)y=z[r[8]]Y=z[r[5]]l=Y[a]W=p(12369)o=578163 y[W]=l end else I=p(12625)y=p(12249)o=u[I]I=o(y,C,k)o=3808717 end end end else if o<2050025 then if o<2002149 then if o<1991402 then if o<1972021 then l=p(12368)W=u[l]X={W(y)}l=X[1]Y=X[2]o=12853252 a=X[3]else I={}o=u[p(12582)]end else o=13607845 end else if o<2022919 then if o<2020844 then k=o W=p(12742)Z=I y=z[r[1]]N=y[W]o=N and 3393860 or 12781384 I=N else o=2476577 a=c(a)Y=c(Y)l=nil end else F=q F=nil o=m(H)H=nil o=12088784 end end else if o<2078173 then if o<2073831 then if o<2066260 then C=p(12252)I=z[r[3]]o=I[C]C=o o=not C o=o and 691757 or 9959251 else C=e()z[C]=I o=z[C]o=o and 10855724 or 11127517 end else D=p(12723)M=p(12223)m=p(12317)V=u[D]R=p(12485)Q={m;M;R}m={V(Q)}P=m[3]t=m[2]D=m[1]o=8070368 end else if o<2085444 then if o<2082331 then Z=z[r[1]]C=not Z I=C o=C and 13480117 or 4099364 else o=X and 3403011 or 7734167 end else N=o W=z[r[4]]y=not W k=y o=y and 16339766 or 14262663 end end end end end end end else if o<3195887 then if o<2664482 then if o<2377992 then if o<2198579 then if o<2146653 then if o<2138108 then if o<2114389 then if o<2099505 then Z=I o=Z and 72905 or 6152094 else N=W o=l o=13407808 end else if o<2120505 then V=p(12711)P=p(12689)g=u[V]t=u[P]P=p(12046)D=t[P]o=16656001 V=g(D)g=p(12409)X=V~=g Y=X else i=p(12574)H=Q[i]o=9597955 f=H end end else if o<2145026 then if o<2140027 then C=x[1]Z=p(12409)o=z[r[1]]I=o(C)y=80 W=80 I=u[Z]Z=p(12810)o=I[Z]Z=p(12028)I=o(Z)N=p(12104)o=p(12350)Z=I I=z[r[2]]Z[o]=I k=u[N]o=p(12563)N=p(12720)I=k[N]N=255 k=I(N,y,W)I=.3 Z[o]=k o=p(12470)Z[o]=I k=p(12483)o=p(12645)I=.5 Z[o]=I I=1 o=p(12572)Z[o]=I I=u[k]k=p(12828)o=I[k]I=o(C,Z)N=p(12483)k=p(12409)Z=nil I=u[k]k=p(12810)o=I[k]k=p(12777)I=o(k)k=I o=p(12350)I=z[r[2]]k[o]=I I=10 o=p(12411)k[o]=I I=u[N]N=p(12828)o=I[N]I=o(C,k)N=p(12409)I=u[N]N=p(12810)o=I[N]N=p(12295)I=o(N)o=p(12350)y=p(12483)N=I I=z[r[2]]N[o]=I o=p(12052)I=1 N[o]=I o=p(12411)I=24 k=nil N[o]=I o=p(12426)I=0 N[o]=I I=u[y]y=p(12828)o=I[y]I=o(C,N)C=nil N=nil o=u[p(12208)]I={}else l=not W k=k+y I=k<=N I=l and I l=k>=N l=W and l I=l or I l=1858175 o=I and l I=16097462 o=o or I end else k=p(12663)o=true z[r[2]]=o I=z[r[4]]N=true I[k]=N I=z[r[5]]k=I()I=z[r[6]]o=I and 14412218 or 990650 end end else if o<2178255 then if o<2162446 then if o<2150855 then o=X and 4505394 or 10647327 else k=p(12719)I=u[k]k=p(12392)o=I[k]k=z[r[4]]I=o(k)o=nil z[r[4]]=o o=7126354 end else Z=z[r[1]]k=p(12503)C=Z[k]o=10021455 Z=p(12281)k=p(12698)Z=C[Z]Z=Z(C,k)I=Z end else if o<2194810 then if o<2179257 then I={}o=u[p(12685)]else I=p(12661)o=z[r[1]]C=z[r[2]]o[I]=C I={}o=u[p(12360)]end else I=C o=Z o=9301455 end end end else if o<2289673 then if o<2266902 then if o<2251662 then if o<2228887 then o=z[r[1]]Z=p(12305)N=p(12670)Y=p(12397)a=1 l=nil k=z[r[2]]y=z[r[3]]W=p(12034)C={[Z]=k,[N]=y,[W]=l,[Y]=a}I=o(C)I={}o=u[p(12669)]else C=p(12368)W=p(12029)o=u[C]N=z[r[2]]W=N[W]y={W(N)}N={o(s(y))}Z=N[2]k=N[3]C=N[1]o=15237716 end else l=p(12350)o=8789196 W=z[r[5]]y=W[l]k=y end else if o<2288695 then if o<2274691 then Z=o N=z[r[2]]k=not N o=k and 4383785 or 901666 C=k else o=9209607 end else I={}o=u[p(12420)]end end else if o<2339972 then if o<2328700 then if o<2294437 then C=p(12252)I=z[r[3]]o=I[C]C=e()z[C]=o I=z[C]o=not I o=o and 15285929 or 1512324 else Z=x[2]o=z[r[1]]I=p(12070)C=x[1]I=o[I]I=I(o)o=I and 10348473 or 14457203 end else o=u[p(12519)]I={}end else if o<2376460 then if o<2362209 then Z=p(12022)y=nil C=false Y=p(12590)a=p(12621)k=nil W=p(12282)I=p(12199)l=p(12010)N=p(12315)o={[I]=C,[Z]=k,[N]=y,[W]=l,[Y]=a}Z=B(4800048,{r[1],r[2];r[3]})C=e()k=p(12714)z[C]=o o=z[C]N=O(1725874,{r[5],C})I=p(12144)o[I]=Z o=z[r[4]]Z=p(12615)C=c(C)I=o(Z,k,N)o=u[p(12371)]I={}else o=I and 3424170 or 12172162 end else N=p(12689)C=e()z[C]=x[1]I=p(12642)o=u[I]k=u[N]N=p(12394)N=k[N]y=p(12687)N=N(k,y)k=p(12064)Z=N[k]I=o(Z)Z=I I=z[r[1]]k=p(12252)o=I[k]k=o I=k o=k and 9782330 or 4196410 end end end end else if o<2538518 then if o<2476954 then if o<2453813 then if o<2419978 then if o<2383087 then I=p(12281)C=p(12822)o=z[r[4]]I=o[I]I=I(o,C)C=I o=C and 9876362 or 2480494 else o=W o=N and 204187 or 13267786 end else if o<2438630 then o=1734903 C=z[r[2]]I=C else V=nil o=12399565 end end else if o<2474200 then if o<2461790 then Y=p(12343)N=k l=p(12041)l=y[l]l=l(y,Y)W=l o=l and 4414824 or 2876039 else g=not X l=l+a W=l<=Y W=g and W g=l>=Y g=X and g W=g or W g=11818316 o=W and g W=1968920 o=o or W end else C=nil I={}Z=nil o=u[p(12480)]k=nil end end else if o<2491344 then if o<2486015 then if o<2481685 then o=3328818 C=nil else I=false o=true z[r[3]]=o z[r[2]]=I k=z[r[5]]o=k and 16763380 or 3688600 end else A=p(12290)b=p(12041)b=py[b]f=i b=b(py,A)o=b and 3302388 or 4551589 end else if o<2525046 then if o<2498622 then o=z[r[5]]k=p(12474)Z=z[r[6]]C=Z[k]Z=false I=o(C,Z)o=8859931 else o=11332021 m=l end else o=I and 2496999 or 8859931 end end end else if o<2600740 then if o<2575979 then if o<2561382 then if o<2541154 then l=p(12872)Z=p(12022)Y=p(12590)C=false I=p(12199)N=p(12315)a=p(12146)W=p(12282)k=nil y=nil o={[I]=C,[Z]=k;[N]=y,[W]=l,[Y]=a}I=p(12144)Z=B(1280184,{r[1];r[2],r[3]})C=e()z[C]=o N=J(12744206,{r[5];C})k=p(12665)o=z[C]o[I]=Z C=c(C)Z=p(12665)o=z[r[4]]I=o(Z,k,N)I={}o=u[p(12400)]else y=false N=p(12199)k=z[r[10]]o=8676261 k[N]=y end else o=n o=R and 3753651 or 10328770 end else if o<2593128 then if o<2588982 then I={}C=nil o=u[p(12717)]Z=nil else k=z[r[1]]N=p(12742)Z=k[N]k=p(12622)o=16147353 C=Z[k]I=C end else I=p(12822)o=p(12281)o=C[o]o=o(C,I)Z=o o=not Z o=o and 9313211 or 10026164 end end else if o<2615140 then if o<2614532 then if o<2608616 then I={}o=u[p(12268)]else k=x[3]Z=x[2]C=x[1]N=p(12409)I=u[N]N=p(12810)o=I[N]N=p(12415)I=o(N)N=I I=C o=p(12628)N[o]=I I=k o=p(12411)k=nil N[o]=I I=Z o=p(12369)N[o]=I o=p(12471)I=true N[o]=I o=p(12858)I=false N[o]=I y=O(12411238,{r[2];r[3];r[4],r[5]})I=1 o=p(12868)N[o]=I o=p(12350)I=z[r[1]]N[o]=I I=p(12248)o=N[I]I=p(12573)I=o[I]I=I(o,y)I=p(12020)y=B(11717197,{r[2],r[3];r[4],r[6],r[7]})C=nil Z=nil o=N[I]I=p(12573)N=nil I=o[I]I=I(o,y)I={}o=u[p(12809)]end else W,a=l(y,W)o=W and 14204680 or 4772932 end else if o<2644789 then if o<2630524 then W=N o=p(12281)o=C[o]o=o(C,l)Y=o o=Y and 3471223 or 5882350 else o=X and 10613614 or 4722861 end else o=z[r[5]]I=o()o=6450450 end end end end end else if o<2892713 then if o<2786961 then if o<2723617 then if o<2711889 then if o<2689844 then if o<2682943 then C=z[r[1]]Z=p(12503)I=C[Z]C=p(12698)o=I[C]I=p(12530)I=o[I]I=I(o)o=4686636 else o=7516661 C=z[r[7]]Z=C()end else if o<2705589 then o=1011218 else I={}o=p(12122)C[o]=I o=1066504 end end else if o<2717668 then if o<2716074 then C=z[r[2]]o=6416324 I=C else o=u[p(12342)]I={}end else C=p(12719)I=u[C]C=p(12783)o=I[C]C=.5 I=o(C)C=z[r[1]]I=C o=C and 12239682 or 15235745 end end else if o<2753199 then if o<2737731 then if o<2734457 then o=W k=y o=5430568 else C=p(12719)I=u[C]C=p(12027)o=I[C]C=1.5 Z=J(16048417,{r[2];r[1]})I=o(C,Z)z[r[1]]=I I={}o=u[p(12748)]end else I=p(12054)o=p(12628)l[o]=I I=z[r[2]]o=p(12350)l[o]=I o=11683063 end else if o<2768134 then if o<2760623 then k=p(12755)Z=p(12281)Z=C[Z]Z=Z(C,k)o=Z and 2016341 or 11371751 I=Z else o=14647186 end else I={}o=u[p(12322)]end end end else if o<2828424 then if o<2806473 then if o<2797708 then if o<2792534 then o=0 z[r[1]]=o I=z[r[2]]o=I and 6887794 or 2607744 else o=z[r[2]]I=o()o=7385504 end else I={}o=u[p(12058)]end else if o<2820075 then if o<2811584 then I={}o=u[p(12092)]else k=z[r[2]]I=k o=130029 end else N=z[r[1]]y=p(12007)o=15016010 k=N[y]I=k end end else if o<2869489 then if o<2849848 then if o<2846707 then I={}o=u[p(12550)]else o=false z[r[1]]=o I=z[r[2]]C=I()I=z[r[3]]o=I and 3548321 or 9943388 end else o=z[r[2]]I=o()o=8517285 end else if o<2883598 then if o<2877884 then o=W and 5134305 or 4641911 else o=p(12350)Z=p(12328)C=x[1]I=u[Z]Z=true C[o]=I o=p(12281)o=C[o]I=p(12596)o=o(C,I,Z)Z=o o=Z and 10100675 or 14206787 end else o=z[r[5]]I=o()o=7160233 end end end end else if o<3057840 then if o<3004127 then if o<2971906 then if o<2934007 then if o<2893198 then o=Z I=C o=2537710 else C=z[r[7]]Z=C()o=6057518 end else if o<2946632 then y=p(12409)N=u[y]y=p(12810)k=N[y]o=4985926 y=p(12755)N=k(y,Z)I=N else o=V and 13829438 or 8140342 end end else if o<2990859 then if o<2986195 then I={}o=u[p(12239)]else y=p(12779)Y=p(12585)N=C[y]l=u[Y]Y=p(12779)W=l[Y]l=p(12336)y=W[l]k=N==y o=k and 2827922 or 15016010 I=k end else b=p(12514)A=l o=5109516 py[b]=A end end else if o<3029548 then if o<3022291 then if o<3012041 then Y=p(12281)I=z[r[3]]a=p(12806)Y=I[Y]Y=Y(I,a)a=e()z[a]=Y X=z[a]I=X Y=o o=X and 10814182 or 16069870 else Z=false o=z[r[1]]C=z[r[2]]I=o(C,Z)o=z[r[3]]o=o and 12761595 or 10687013 end else o=z[r[10]]Z=z[r[11]]C[o]=Z o=z[r[12]]Z={o(C)}I={s(Z)}o=u[p(12100)]end else if o<3044625 then if o<3030517 then Z=p(12786)C=z[r[4]]Z=C[Z]Z=Z(C)C=nil z[r[4]]=C o=7258045 else o=true z[r[1]]=o Z=p(12252)C=z[r[2]]I=C[Z]C=I o=C and 10605796 or 432236 end else y,Y=W(N,y)o=y and 5521664 or 12954181 end end end else if o<3103864 then if o<3064807 then if o<3064119 then if o<3062606 then t=nil k=c(k)P=c(P)X=c(X)k=o a=c(a)Y=nil Z=c(Z)Y=p(12689)g=nil W=nil N=c(N)D=nil V=nil y=c(y)y=o l=c(l)l=u[Y]W=not l o=W and 7963762 or 15820569 N=W else I=z[r[10]]o=I and 8558433 or 801157 end else o=I and 4227696 or 8522985 end else if o<3099240 then if o<3090020 then o=y o=N and 7582383 or 3340162 Z=N else i,py=F(H,i)o=i and 2486366 or 10798030 end else V=nil o=16518275 m=nil Q=nil end end else if o<3158292 then if o<3155794 then if o<3134149 then I=z[r[1]]C=z[r[2]]o=I[C]o=o and 9653211 or 1718128 else o=nil C=e()z[C]=x[1]N=p(12849)Z=e()z[Z]=o k=u[N]I=k o=k and 1612394 or 9662168 end else y=p(12153)N=C[y]Y=p(12585)l=u[Y]Y=p(12153)W=l[Y]l=p(12468)y=W[l]k=N==y o=1829389 I=k end else if o<3191118 then if o<3176543 then o=z[r[1]]I=p(12661)k=p(12063)Z=z[r[2]]C=Z[k]o[I]=C I=p(12569)o=z[r[1]]Z=z[r[2]]k=p(12149)C=Z[k]k=p(12321)o[I]=C o=z[r[1]]I=p(12422)N=150 Z=u[k]k=p(12810)C=Z[k]k=150 Z=C(k,N)o[I]=Z o=u[p(12448)]I={}else I=C o=Z o=4687556 end else o=z[r[1]]I=o()C=I o=not C o=o and 1987983 or 16329219 end end end end end end else if o<3806261 then if o<3487072 then if o<3392180 then if o<3306627 then if o<3267428 then if o<3226882 then if o<3223358 then C=p(12252)I=z[r[3]]o=I[C]C=o o=not C o=o and 5668439 or 2593918 else I=z[r[5]]k=I()I=z[r[6]]o=I and 5614547 or 5355963 end else if o<3236819 then t=z[r[13]]o=5913060 D=not t g=D else y=p(12153)N=C[y]Y=p(12585)l=u[Y]Y=p(12153)W=l[Y]l=p(12671)o=6885120 y=W[l]k=N==y I=k end end else if o<3298504 then if o<3294635 then g=p(12369)W=p(12369)P=p(12489)y=z[r[5]]X=p(12369)a=u[X]X=p(12810)Y=a[X]X=z[r[6]]V=0 a=Y(X)X=u[g]g=p(12630)Y=X[g]t=u[P]g=0 P=p(12065)D=t[P]P=z[r[2]]t={D(P)}X=Y(g,V,s(t))l=a*X y[W]=l W=o l=z[r[8]]y=l o=l and 8506868 or 1532475 else I={}o=u[p(12675)]end else A=false b=p(12450)py[b]=A h=p(12483)A=u[h]h=p(12828)b=A[h]A=b(q,py)uy=p(12350)h=py[uy]uy=p(12628)A=h[uy]h=p(12203)b=A==h o=b and 6707750 or 5556294 end end else if o<3349331 then if o<3339781 then if o<3328330 then o=I and 4940440 or 14841659 else I=p(12524)Z=p(12221)C={Z}o={[I]=C}I={o}o=u[p(12706)]end else W=p(12801)y=z[r[3]]o=7582383 N=y[W]Z=N end else if o<3359645 then if o<3357828 then o=12774559 n=nil F=p(12080)q=nil R=nil f=u[F]H=S(11208725,{M})v=nil F=f(H)else o=z[r[2]]I=p(12786)I=o[I]I=I(o)o=10492821 end else o=12465175 C=z[r[2]]I=C end end end else if o<3425450 then if o<3412043 then if o<3404575 then if o<3399820 then o=12781384 W=z[r[1]]l=p(12742)y=W[l]W=p(12622)N=y[W]I=N else X=p(12822)o=p(12281)o=a[o]o=o(a,X)X=o g=p(12280)V=X o=p(12855)o=a[o]o=o(a,g)g=o o=X and 15800836 or 13951903 end else o=5524033 N=z[r[9]]Y=p(12424)l=z[r[10]]W=l[Y]t=1.5 l=false y=N(W,l)W=p(12409)l=p(12327)y=u[W]W=p(12810)N=y[W]W=p(12722)y=N(W)W=p(12628)g=1 D=p(12397)N=e()z[N]=y y=z[N]y[W]=l R=3 l=true y=z[N]W=p(12663)y[W]=l l=Z y=z[N]W=p(12350)X=.75 P=p(12252)y[W]=l l=p(12719)W=u[l]Y=L(7309160,{N})l=p(12027)y=W[l]l=10 W=y(l,Y)y=z[r[11]]W=p(12346)l=p(12259)a=p(12801)M=p(12500)Y=Z[a]a=nil W=y[W]W=W(y,l,Y,a,X,g)l=p(12456)y=z[r[11]]Q=p(12147)a=p(12801)W=p(12346)Y=Z[a]W=y[W]X=.7 g=1.2 a=nil W=W(y,l,Y,a,X,g)g=1 y=z[r[11]]N=c(N)X=.65 l=p(12388)a=p(12801)Y=Z[a]a=nil W=p(12346)W=y[W]W=W(y,l,Y,a,X,g)l=p(12719)g=p(12034)W=u[l]l=p(12027)X=nil a=p(12670)y=W[l]Y=B(15210239,{k,r[11]})l=2.5 W=y(l,Y)Y=p(12305)y=z[r[12]]V=z[k]m=z[r[4]]l={[Y]=Z;[a]=X,[g]=V,[D]=t;[P]=C,[Q]=m,[M]=R}W=y(l)l=p(12719)W=u[l]l=p(12027)y=W[l]Y=J(3461679,{r[1],r[13];r[14];r[2];r[15]})l=.5 W=y(l,Y)end else if o<3422203 then if o<3412752 then o=u[p(12648)]I={}else I={}o=u[p(12194)]end else o=u[p(12835)]I={}end end else if o<3461888 then if o<3459346 then if o<3434043 then o=u[p(11994)]I={}else o=11695744 k=p(12133)N=p(12829)Z=z[C]k=Z[k]k=k(Z,N)I=k end else C=z[r[1]]o=C and 5821186 or 6358250 I=C end else if o<3474322 then if o<3470869 then k=p(12281)k=Z[k]N=p(12755)k=k(Z,N)o=k and 8849495 or 12265338 I=k else o=p(12530)o=Y[o]o=o(Y)o=5882350 end else I={}o=u[p(12559)]end end end end else if o<3648192 then if o<3598038 then if o<3562317 then if o<3540173 then if o<3521068 then o=N and 11246302 or 15351032 I=N else l,X=Y(W,l)o=l and 3892342 or 12971964 end else if o<3553851 then I=z[r[3]]o=9943388 C=p(12786)C=I[C]C=C(I)I=nil z[r[3]]=I else o=z[r[1]]k=z[r[2]]N=p(12801)Z=p(12708)y=z[r[3]]C={[Z]=k,[N]=y}I=o(C)I={}o=u[p(12265)]end end else if o<3597234 then if o<3593331 then o=n(v)o=279625 else I=z[r[1]]C=p(12252)o=I[C]C=o I=C o=C and 6364016 or 12490829 end else X=p(12628)a=l[X]W=N X=p(12435)X=a[X]g=p(12352)X=X(a,g)o=X and 505373 or 13348680 Y=X end end else if o<3612427 then if o<3605458 then if o<3599488 then C=z[r[1]]I=C o=C and 374839 or 5567558 else k=z[r[3]]o=968693 I=k end else o=15588665 end else if o<3644762 then if o<3620492 then k,W=N(Z,k)o=k and 1202239 or 14339885 else I={}o=u[p(12158)]end else g=p(12633)X=p(12281)X=C[X]X=X(C,g)o=15565833 Y=X end end end else if o<3708998 then if o<3695662 then if o<3689029 then if o<3659941 then I={}o=u[p(12367)]C=nil else y=p(12719)N=u[y]y=p(12027)k=N[y]o=7854997 y=.5 W=O(14942740,{r[3]})N=k(y,W)end else g=e()W=a z[g]=X D=p(12719)o=12853252 V=u[D]D=p(12668)X=g W=nil g=V[D]D=O(8357970,{r[6],r[7],Z,k;X,r[8],N})X=c(X)V=g(D)end else if o<3705130 then if o<3698066 then o=V D=X N=o o=2451651 k=D else Z=p(12822)I=p(12281)o=z[C]I=o[I]I=I(o,Z)Z=I o=not Z o=o and 10211392 or 910492 end else C=p(12252)I=z[r[3]]o=I[C]C=e()z[C]=o I=z[C]o=not I o=o and 5165783 or 3704920 end end else if o<3752961 then if o<3736246 then if o<3714042 then g=l t=p(12369)o=z[r[1]]I=p(12369)P=p(12801)D=u[t]t=p(12810)V=D[t]t=Z[P]D=V(t)V=p(12719)g=nil o[I]=D I=u[V]V=p(12783)o=I[V]V=.05 I=o(V)o=6996066 else I={}o=u[p(12732)]end else C=nil o=u[p(12463)]Z=nil I={}end else if o<3789029 then if o<3767107 then q=p(12369)n=p(12369)f=p(12369)R=g[n]v=M[q]q=p(12369)n=p(12011)n=R[n]n=n(R,v)F=p(12723)b=p(12508)v=l[q]R=v*n q=M[f]o=3877213 f=p(12673)f=q[f]f=f(q)q={}v=R*f b=m[b]f=u[F]py={b(m)}b={f(s(py))}i=b[3]H=b[2]F=b[1]else wy=p(12252)Gy=z[r[3]]ry=Gy[wy]wy=p(12459)Gy=p(12281)Gy=ry[Gy]Gy=Gy(ry,wy)o=11415223 sy=Gy end else o=u[p(12098)]I={}end end end end end else if o<4174824 then if o<3965886 then if o<3887400 then if o<3848252 then if o<3813451 then if o<3808007 then I=p(12328)Z=p(12617)C=x[1]o=u[I]I=p(12281)I=o[I]I=I(o,Z)Z=I o=not Z o=o and 12268798 or 11785784 else N=nil o=u[p(12383)]C=nil k=nil Z=nil I={}end else if o<3831690 then o=13602586 i=nil py=nil else y,Y=W(N,y)o=y and 8719784 or 2476577 end end else if o<3881927 then if o<3876886 then t=z[r[13]]o=6391540 D=not t g=D else i,py=F(H,i)o=i and 10075995 or 10951759 end else o=z[r[5]]W=o()o=11267730 end end else if o<3936016 then if o<3906380 then if o<3896161 then o=e()z[o]=X X=o a=l V=p(12719)g=u[V]V=p(12668)o=g[V]V=L(6008282,{r[3],r[2],C;Z,X,r[4],N})g=o(V)a=nil o=3521123 X=c(X)else Z=x[2]Z=nil N=87737109817581 C=e()z[C]=x[1]k=e()z[k]=x[3]y=S(2879891,{C,k;r[3]})k=c(k)o=z[r[1]]I=o()o=z[r[2]]I=o(N,y)C=c(C)o=u[p(12086)]I={}end else I={}C=nil k=c(k)Z=nil o=u[p(12804)]end else if o<3957461 then if o<3955816 then I={}o=u[p(12504)]else m={[M]=R,[n]=v}o=q g={[V]=D;[t]=P,[Q]=m}D=p(12723)V=u[D]Q={V(g)}t=Q[2]P=Q[3]D=Q[1]o=7171792 end else I={}o=u[p(12190)]end end end else if o<4087431 then if o<4013063 then if o<4006048 then if o<3991924 then o=I and 7102563 or 15293320 else I=z[r[4]]Z=e()C=I()z[Z]=C C=z[Z]I=not C o=I and 3644233 or 5388169 end else o=true k=p(12663)z[r[2]]=o N=true I=z[r[4]]I[k]=N I=z[r[5]]k=I()I=z[r[6]]o=I and 9430466 or 16575307 end else if o<4039930 then if o<4027582 then o=y Z=N o=N and 15914899 or 13282874 else W,a=l(y,W)o=W and 745721 or 13112137 end else o=u[p(12163)]I={}end end else if o<4146317 then if o<4105326 then if o<4098303 then k=e()o=false z[k]=o W=J(13938108,{k;r[2],C,r[3],r[4],r[5],r[6]})y=p(12248)o=z[r[1]]I=z[C]k=c(k)C=c(C)N=Z[y]y=p(12573)y=N[y]y=y(N,W)Z=nil o[I]=y o=u[p(12461)]I={}else Z=z[r[2]]C=not Z o=13480117 I=C end else y=o a=p(12689)Y=u[a]a=p(12287)l=Y[a]Y=p(12672)W=l~=Y N=W o=W and 13407808 or 36734 end else if o<4152658 then if o<4150899 then o=907842 else C=x[1]I=p(12368)o=u[I]y=p(12029)y=C[y]N={y(C)}y={o(s(N))}I=y[1]Z=y[2]k=y[3]N=I o=7660696 end else D=p(12723)m=p(12128)n=p(12681)M=p(12169)V=u[D]R=p(12013)Q={m,M;R;n}m={V(Q)}P=m[3]t=m[2]o=16518275 D=m[1]end end end end else if o<4314983 then if o<4236607 then if o<4190297 then if o<4181760 then if o<4178168 then W=z[r[3]]y=not W k=y N=o o=y and 8922960 or 5743483 else o=z[r[2]]I=p(12350)Z=C o[I]=Z k=true o=z[r[1]]Z=z[r[2]]I=o(Z,k)o=8174942 end else y=p(12742)N=z[r[1]]k=N[y]N=p(12622)o=5138140 Z=k[N]I=Z end else if o<4228021 then if o<4212882 then W=p(12701)N=e()z[N]=I l=B(10694052,{r[2],C;r[3];r[4],r[5];r[6],r[7];r[8];N,r[9];r[10];r[1]})y=p(11996)I=p(12184)k=nil o={[I]=y;[W]=l}y=o o=p(12613)o=Z[o]N=c(N)C=c(C)o=o(Z,y)I={}y=nil Z=nil o=u[p(12376)]else o=u[p(12863)]I={}end else o=X g=p(12013)X=p(12281)X=C[X]X=X(C,g)o=Z and 13448867 or 11332683 end end else if o<4264751 then if o<4242539 then if o<4241804 then k=p(12252)Z=z[r[2]]C=Z[k]I=C o=C and 1403904 or 2073789 else P=80 o=9327085 t=V<P D=t end else I={}o=u[p(12791)]end else if o<4268487 then if o<4266886 then N=o y=z[r[5]]k=y o=y and 2258840 or 8789196 else N=Z W=1 o=y[W]l=p(12822)W=o o=p(12281)o=W[o]o=o(W,l)l=o o=l and 8743930 or 5559095 end else W=9897434364 I=9897433972 Y=9897435626 a=1 py=nil V=p(12135)b=p(12769)F=p(12547)H=nil R=.5 l=9897435270 Q=p(12740)o={I;W;l;Y}X=p(12848)W=e()uy=p(12409)M=p(12204)D=nil z[W]=o q=p(12007)i=p(12742)o=p(12325)l=e()t=p(12830)g=0 P=false m=true Y=p(12054)z[l]=o o=z[r[2]]I=p(12281)I=o[I]v=false E=p(12409)I=I(o,Y)Y=e()f=false n=p(12802)z[Y]=I I=p(12387)h=u[uy]uy=p(12810)A=h[uy]uy=p(12722)h=A(uy)T=u[E]E=p(12810)A=p(12366)uy=T[E]E=p(12722)T=uy(E)o={[I]=a,[X]=g,[V]=D,[t]=P,[Q]=m;[M]=R,[n]=v;[q]=f;[F]=H;[i]=py,[b]=h;[A]=T}D=e()X=e()a=e()V=e()z[a]=o o=O(12953164,{a;r[4];l})t=e()g=e()z[X]=o o=L(6709368,{a,r[4];W;r[5],X})z[g]=o o=O(12607426,{a;r[4];X;Z})z[V]=o o=d(10558533,{a;X})z[D]=o Q=p(12441)P=e()o=O(5073583,{a,r[4],X;k})z[t]=o o=d(13963726,{a;r[4];y;N,X})z[P]=o I=z[r[6]]o=I[Q]Q=J(8892740,{r[6],a,V;t,g})I=p(12573)I=o[I]I=I(o,Q)Q=p(12229)I=z[r[6]]o=I[Q]I=p(12573)Q=S(8328013,{a;D;P})I=o[I]I=I(o,Q)o=K(4533242,{r[2],Y})Q=e()z[Q]=o n=p(12318)o=d(184449,{a;g,r[4],Q;X})R=z[r[4]]M=R[n]m=o R=p(12281)n=p(12246)R=M[R]R=R(M,n)o=R and 8674891 or 11402020 I=R end end end else if o<4360580 then if o<4341390 then if o<4329115 then if o<4322212 then o=u[p(12472)]I={}else C=z[r[1]]o=C and 10941097 or 9784201 I=C end else k=p(12280)Z=p(12855)o=10112786 Z=C[Z]Z=Z(C,k)I=Z end else if o<4359276 then if o<4356081 then I=C o=Z o=6358250 else o=9482830 W=z[r[4]]y=not W k=y end else o=u[p(12647)]I={}end end else if o<4387583 then if o<4382789 then if o<4367856 then I=p(12801)o=Z[I]N=p(12801)I=p(12310)a=p(12801)k=o I=C[I]g=p(12801)I=I(C)W=p(12002)o=I[N]N=o o=N-k I=u[W]W=p(12810)y=o o=I[W]Y=z[r[1]]l=Y[a]Y=p(12336)W=l[Y]X=z[r[1]]a=X[g]X=p(12778)Y=a[X]a=99999 g=p(12801)l=Y+a X=z[r[1]]a=X[g]X=p(12012)Y=a[X]I=o(W,l,Y)Y=p(12369)W=I l=u[Y]Y=p(12810)o=p(12515)I=l[Y]o=C[o]Y=W+y l={I(Y)}o=o(C,s(l))o=1570727 l=3 I=1 Y=l l=1 a=l l=0 X=a<l l=I-a else k=p(12719)I=u[k]k=p(12783)o=I[k]k=.15 I=o(k)N=z[r[4]]y=N()k=not y I=k o=k and 2819443 or 130029 end else W=z[r[3]]N=o y=not W k=y o=y and 758493 or 10046512 end else if o<4393019 then if o<4391097 then C=nil I={}Z=nil o=u[p(12006)]else I=p(12723)o=u[I]k=z[r[1]]N={o(k)}I=N[1]C=N[2]o=5907269 k=I Z=N[3]end else Z=nil o=11216647 C=nil end end end end end end end end else if o<6293328 then if o<5382684 then if o<4855139 then if o<4599826 then if o<4498919 then if o<4422002 then if o<4413399 then if o<4403382 then if o<4398776 then k=p(12490)o=11132711 N=p(12481)Z=z[r[1]]k=Z[k]k=k(Z,C,N)I=k else o=l and 6938523 or 12179136 end else if o<4408691 then I=p(12723)Y=p(12029)o=u[I]Y=N[Y]l={Y(N)}Y={o(s(l))}y=Y[2]W=Y[3]o=12112628 I=Y[1]l=I else o=14323680 N=p(12547)k=z[r[1]]Z=k[N]k=p(12622)C=Z[k]I=C end end else if o<4419119 then if o<4415485 then a=p(12636)Y=y[a]o=2876039 a=p(11996)l=Y==a W=l else q=p(12719)o=z[r[6]]v=o(P)v=u[q]q=p(12783)o=v[q]q=1 v=o(q)o=D and 15298257 or 9396756 end else o=I and 348644 or 3705188 end end else if o<4446794 then if o<4439364 then if o<4435211 then V=D o=t o=15837471 else o=I and 12825429 or 1966439 end else W=L(753402,{r[3]})o=u[p(12160)]y=p(12719)I={}N=u[y]y=p(12027)k=N[y]y=.5 C=nil Z=nil N=k(y,W)end else if o<4496388 then if o<4450603 then Z=z[r[1]]C=not Z o=C and 2368394 or 10770597 I=C else o=p(12530)o=W[o]o=o(W)g=nil o=10086353 X=nil end else o=z[r[2]]C=p(12719)I=o()I=u[C]C=p(12783)o=I[C]C=.5 I=o(C)o=z[r[3]]I=p(12530)I=o[I]I=I(o)k=p(12237)o=z[r[4]]y=p(12429)Z=p(12810)C=z[r[5]]I=o(C)C=I I=z[r[6]]o=I[Z]N=C..y Z=k..N I=o(Z)o=p(12737)o=I[o]C=nil o=o(I)o=16716293 end end end else if o<4524901 then if o<4513930 then if o<4508728 then if o<4504656 then z[r[3]]=I o=k o=7300726 else o=true I={o}o=u[p(12517)]end else C=z[r[1]]o=C and 10984917 or 8310046 I=C end else if o<4523763 then if o<4521580 then y=nil Y=p(12801)o=z[r[2]]l=Z[Y]I=o(l)a=nil o=z[r[3]]Y=p(12348)X=nil k=nil l=p(12694)W=nil N=nil I=o(C,l,Y,a,X)o=14206787 else k=p(12779)I=C[k]W=p(12585)y=u[W]W=p(12779)N=y[W]y=p(12324)k=N[y]o=I==k o=o and 8891576 or 13168451 end else o=z[r[6]]I=o()o=10815690 end end else if o<4561838 then if o<4549820 then if o<4541753 then I=p(12723)o=u[I]Z=x[2]C=x[1]l=p(12847)W=p(12841)y={W,l}W={o(y)}N=W[3]I=W[1]y=I o=9381864 k=W[2]else Z=false o=false z[r[2]]=o I=z[r[3]]C=p(12663)I[C]=Z Z=p(12252)C=z[r[4]]I=C[Z]C=I I=not C o=I and 15793582 or 16217915 end else py=nil o=3090304 f=nil end else if o<4588037 then if o<4587197 then N=p(12369)l=p(12369)k=z[r[5]]o=12787016 W=u[l]l=p(12810)y=W[l]l=z[r[6]]W=y(l)k[N]=W else y=120 k=z[r[7]]N=k()k=z[r[8]]N=k(Z,y)k=e()z[k]=N W=z[k]y=#W W=0 N=y>W o=N and 11615801 or 5547437 end else o=z[r[1]]o=o and 2850408 or 8517285 end end end end else if o<4686372 then if o<4634916 then if o<4611277 then if o<4604178 then if o<4601207 then C=1 I=p(12387)o=z[r[1]]o[I]=C C=p(12135)I=z[r[1]]o=I[C]I=p(12609)I=o[I]I=I(o)C=nil I=p(12135)o=z[r[1]]o[I]=C o=3716075 else o=z[r[4]]o=o and 2157291 or 7126354 end else if o<4607489 then o=nil I=true Z=o z[r[1]]=o z[r[2]]=I k=z[r[3]]o=k and 730881 or 9580642 C=k else o=D and 3697690 or 2451651 end end else if o<4626883 then if o<4618050 then o=p(12786)o=y[o]o=o(y)o=921818 else k=z[r[4]]o=4445178 N=k()end else o=I and 9703542 or 16652759 end end else if o<4657327 then if o<4650047 then if o<4645240 then y=nil N=nil o=15237716 else g=nil X=nil o=8477026 end else o=X and 10327527 or 8477026 end else if o<4675546 then if o<4660810 then o=Z I=C o=9751263 else y=p(12153)N=C[y]Y=p(12585)l=u[Y]Y=p(12153)W=l[Y]o=805959 l=p(12671)y=W[l]k=N==y I=k end else I=py o=b o=5574877 end end end else if o<4795470 then if o<4704808 then if o<4687727 then if o<4687480 then o=u[p(12335)]I={}else o=I and 687426 or 2178564 end else W=p(12585)k=p(12779)I=C[k]y=u[W]W=p(12779)N=y[W]y=p(12324)k=N[y]o=I==k o=o and 7206893 or 468241 end else if o<4734849 then if o<4721249 then I=k o=N o=k and 9904938 or 451563 else Y=nil a=nil o=2614865 end else o=u[p(12558)]I={k}end end else if o<4819101 then if o<4804662 then if o<4800033 then o=n o=R and 7203825 or 12774559 else C=e()N=95297968392131 k=e()Z=x[2]Z=nil z[C]=x[1]z[k]=x[3]o=z[r[1]]y=J(11166869,{C,k,r[3]})I=o()o=z[r[2]]I=o(N,y)o=u[p(12142)]k=c(k)C=c(C)I={}end else b=p(12450)h=p(12483)A=false py[b]=A uy=p(12350)A=u[h]h=p(12828)b=A[h]A=b(q,py)h=py[uy]uy=p(12628)A=h[uy]h=p(12203)b=A==h o=b and 2991929 or 5109516 end else if o<4840925 then if o<4828917 then l=I o=l and 6976169 or 16253561 else o=4324148 end else W=p(12407)I=z[r[11]]l=z[Z]Y=p(12721)a=2 y={[W]=l,[Y]=a}o=406984 N=I(y)end end end end end else if o<5134288 then if o<4985067 then if o<4941295 then if o<4934111 then if o<4916902 then if o<4862412 then o=1887626 n=z[M]q=p(12203)v=p(12281)f=true v=n[v]v=v(n,q,f)m=v else l=z[r[14]]o=8672786 Y=l()end else if o<4927870 then Y=p(12585)y=p(12153)N=C[y]l=u[Y]Y=p(12153)W=l[Y]l=p(12468)y=W[l]k=N==y I=k o=k and 13176767 or 10251574 else o=u[p(12580)]I={}end end else if o<4940470 then if o<4936922 then o=765037 f=nil py=nil else I={}o=u[p(12542)]end else g=z[r[3]]o=5015304 V=p(12252)X=g[V]V=p(12649)g=p(12281)g=X[g]g=g(X,V)Y=g end end else if o<4962334 then if o<4954380 then if o<4947448 then N=p(12203)C=e()z[C]=x[1]Z=z[C]k=p(12281)k=Z[k]k=k(Z,N)I=k o=k and 11695744 or 3455093 else o=12525875 y=z[r[3]]W=p(12350)N=y[W]Z=N end else I=z[r[1]]C=x[1]o=I[C]o=o and 5434125 or 5539856 end else if o<4978062 then if o<4969566 then I=z[r[4]]k=p(12609)k=I[k]k=k(I)I=nil o=4265822 z[r[4]]=I else Z=z[r[1]]C=not Z o=C and 9295218 or 5788271 I=C end else o=I and 1266425 or 6377534 end end end else if o<5055385 then if o<5029983 then if o<5007006 then if o<5003791 then N=p(12409)k=I I=u[N]N=p(12810)o=I[N]N=p(12207)I=o(N)o=p(12270)N=I I=p(12262)N[o]=I o=p(12299)o=k[o]I=false o=o(k,N)y=o o=p(12045)y[o]=I o=p(12346)I=p(12547)o=y[o]k=nil o=o(y)W=y N=nil o=z[r[1]]o[I]=W W=O(15555300,{r[1];r[3]})I=p(12178)o=y[I]y=nil I=p(12573)I=o[I]I=I(o,W)o=13950171 else o=I and 10984650 or 3419034 end else I=Y o=a o=787038 end else if o<5041925 then if o<5039256 then F=o i=p(12607)H=Q[i]o=H and 2131244 or 9597955 f=H else I=z[r[6]]k=p(12786)k=I[k]k=k(I)I=nil o=16654105 z[r[6]]=I end else W=p(12745)y=u[W]Y=p(12848)W=y()l=z[r[1]]y=l[Y]N=W-y l=p(12204)W=z[r[1]]y=W[l]k=N>=y o=7839452 C=k end end else if o<5097177 then if o<5077131 then if o<5060291 then o=u[p(12592)]I={}else Z=z[r[1]]k=p(12830)C=Z[k]I=C o=C and 674077 or 14804145 end else k=p(12252)Z=z[r[2]]o=16766561 C=Z[k]k=p(12822)Z=p(12281)Z=C[Z]Z=Z(C,k)I=Z end else if o<5124763 then if o<5100705 then o=false z[r[1]]=o o=u[p(12226)]I=false z[r[2]]=I C=false I={}z[r[3]]=C else o=16060070 end else I={k}o=u[p(12042)]end end end end else if o<5261541 then if o<5206485 then if o<5160653 then if o<5137877 then if o<5136824 then I={y}o=u[p(12843)]else k=p(12779)I=C[k]W=p(12585)y=u[W]W=p(12779)N=y[W]y=p(12012)k=N[y]o=I==k o=o and 1727119 or 2989919 end else if o<5141968 then o=I and 10592749 or 7856780 else l=a o=X o=13386609 end end else if o<5201158 then if o<5171153 then o=u[p(12771)]I={}else W=115 y=p(12002)N=u[y]y=p(12810)I=N[y]y=0 l=0 N=I(y,W,l)o=k+N N=o W=p(12369)l=p(12369)y=u[W]W=p(12810)I=y[W]y=I(N)W=u[l]a=p(12489)l=p(12630)I=W[l]Y=u[a]D=p(12729)a=p(12065)l=Y[a]a=-90 Y=l(a)a=0 l=0 W=I(Y,l,a)Y=p(12574)o=y*W l=p(12678)y=o o=z[r[4]]V=z[r[3]]X=o g=V[D]a=g o=g and 8172360 or 10142699 end else o=I and 1699140 or 9035532 end end else if o<5254947 then if o<5234907 then if o<5216905 then C=k o=N o=6088140 else b=z[Z]o=b and 5759099 or 5411756 py=b end else a=o V=p(12252)g=z[r[3]]X=g[V]Y=X o=X and 4940492 or 5015304 end else if o<5261148 then if o<5259477 then Z=nil o=432236 else Y=W V=p(12272)g=p(12041)g=a[g]g=g(a,V)X=g o=g and 8922998 or 11846565 end else q=p(12801)v=z[Z]H=p(12369)n=v[q]F=z[Z]f=F[H]F=p(12152)q=f[F]f=10 v=q*f R=n+v m=R o=543324 end end end else if o<5326995 then if o<5292999 then if o<5273711 then if o<5268757 then N=p(12609)Z=z[r[6]]o=11720857 N=Z[N]N=N(Z)else Z=z[r[1]]C=not Z o=C and 3064338 or 12963887 I=C end else o=true z[r[1]]=o Z=z[r[3]]k=p(12628)I=Z[k]Z=p(12084)o=11330117 Z=I[Z]Z=Z(I)k=p(12723)I=u[k]W=z[r[4]]l={I(W)}y=l[3]k=l[1]N=l[2]end else if o<5312616 then if o<5297776 then k=p(12252)Z=z[r[2]]C=Z[k]k=p(12822)Z=p(12281)Z=C[Z]Z=Z(C,k)I=Z o=16735398 else I=z[r[11]]o=I and 11827104 or 14174613 end else k=p(12343)C=x[1]Z=p(12041)Z=C[Z]Z=Z(C,k)I=Z o=Z and 4398229 or 11132711 end end else if o<5356920 then if o<5356250 then if o<5337886 then W=z[r[3]]y=not W N=o k=y o=y and 5443835 or 15077882 else y=120 k=z[r[7]]N=k()k=z[r[8]]N=k(Z,y)k=e()z[k]=N W=z[k]y=#W W=0 N=y>W o=N and 3411896 or 14479419 end else o=z[r[1]]I=o()o=u[p(12193)]I={}end else if o<5371165 then if o<5365195 then I={}o=u[p(12650)]else Z=z[r[1]]k=p(12490)N=p(12481)k=Z[k]k=k(Z,C,N)I=k o=9921423 end else Q=160 N=z[r[9]]W=z[r[10]]X=p(12655)l=false y=N(W,l)l=p(12483)t=p(12801)z[r[8]]=y W=u[l]l=p(12828)N=W[l]l=z[r[11]]Y=z[r[12]]P=p(12002)D=z[Z]V=D[t]t=u[P]P=p(12810)D=t[P]m=0 P=0 t=D(P,Q,m)D=.65 P=p(12346)g=V+t V=nil P=Y[P]t=1.5 a={P(Y,X,g,V,D,t)}W=N(l,s(a))l=p(12483)W=u[l]l=p(12828)D=p(12801)N=W[l]l=z[r[11]]X=p(12724)Y=z[r[12]]t=1 V=z[Z]g=V[D]D=.7 V=nil P=p(12346)P=Y[P]a={P(Y,X,g,V,D,t)}W=N(l,s(a))l=p(12719)W=u[l]l=p(12783)N=W[l]l=.5 W=N(l)W=o l=z[r[2]]N=l o=l and 12560960 or 7970444 end end end end end end else if o<5748805 then if o<5537913 then if o<5433764 then if o<5410458 then if o<5397325 then if o<5387759 then if o<5384645 then k=13677122 I=12789678 Z=p(12776)C=Z^k o=I-C C=o I=p(12024)o=I/C I={o}o=u[p(12267)]else Z=z[r[2]]k=p(12252)C=Z[k]I=C o=C and 14422439 or 16643586 end else if o<5389616 then I=true N=p(12801)z[r[2]]=I l=5 k=z[Z]o=2463715 C=k[N]W=p(12369)Y=l k=e()z[k]=C y=z[Z]N=y[W]W=1 y=p(12152)C=N[y]y=p(12328)N=u[y]y=p(12391)y=N[y]y=y(N)l=1 N=e()z[N]=y a=l y={C}l=0 X=a<l l=W-a else o=4722861 X=nil g=nil end end else if o<5405787 then if o<5400312 then I=p(12368)o=u[I]y=z[r[2]]l=p(12508)l=y[l]W={l(y)}y={o(s(W))}k=y[2]N=y[3]I=y[1]o=12520123 y=I else o=1871212 end else o=false z[r[2]]=o Z=false I=z[r[3]]C=p(12663)I[C]=Z Z=p(12252)C=z[r[4]]I=C[Z]C=I I=not C o=I and 3298000 or 13470490 end end else if o<5422926 then if o<5416134 then if o<5413636 then z[Z]=py T=1 uy=z[f]h=uy+T A=i[h]b=g+A A=256 o=b%A h=z[q]g=o A=V+h h=256 o=8006201 b=A%h V=b else Y=not a o=X W=Y o=2111409 end else o=z[r[5]]I=o()o=4925922 end else if o<5433700 then if o<5428993 then N=p(12409)k=u[N]N=p(12810)Z=k[N]N=p(12755)k=Z(N,C)I=k o=1655444 else C=k o=N o=9580642 end else o=z[r[2]]l=p(12801)W=Z[l]a=nil I=o(W)Y=nil l=p(12348)W=p(12089)y=nil k=nil o=z[r[3]]I=o(C,W,l,Y,a)o=10452875 N=nil end end end else if o<5488470 then if o<5444603 then if o<5439677 then if o<5434955 then I=z[r[1]]o=I[C]I=p(12609)I=o[I]I=I(o)I=nil o=z[r[1]]o[C]=I o=5539856 else k=z[r[8]]o=k and 918379 or 8863246 end else W=z[r[4]]y=not W k=y o=15077882 end else if o<5463345 then if o<5446395 then Y=p(12080)I=p(12395)N=p(12695)o=u[I]C=z[r[4]]k=u[N]l=u[Y]a=L(5382754,{})Y={l(a)}W={s(Y)}l=2 y=W[l]N=k(y)k=p(12250)Z=C(N,k)C={Z()}I=o(s(C))Z=z[r[5]]C=I o=Z and 10219258 or 15520058 I=Z else I={}o=u[p(12039)]end else l=a o=X o=457163 end end else if o<5522356 then if o<5506495 then if o<5495889 then Z=z[r[1]]C=not Z I=C o=C and 156663 or 9548511 else D=z[r[1]]t=p(12252)V=D[t]g=a~=V o=2084761 X=g end else l=y o=Y k[l]=o o=3051187 l=nil Y=nil end else if o<5525522 then if o<5522622 then o=I and 9288617 or 347588 else k=c(k)I={}o=u[p(12497)]Z=nil C=nil end else k=p(12409)I=u[k]k=p(12810)N=p(12833)o=I[k]k=p(12207)I=o(k)o=p(12270)y=z[r[3]]k=I I=N..y k[o]=I o=p(12299)o=Z[o]I=true o=o(Z,k)N=o o=p(12045)N[o]=I o=p(12346)o=N[o]o=o(N)I=p(12742)o=z[r[1]]y=N k=nil N=nil o[I]=y o=8207424 end end end end else if o<5637472 then if o<5590312 then if o<5558842 then if o<5544807 then if o<5541889 then C=nil o=u[p(12629)]I={}else N,l=y(k,N)o=N and 14220105 or 1409824 end else if o<5552521 then N=z[r[9]]l=false W=z[r[16]]y=N(W,l)z[r[6]]=y N=z[r[6]]o=N and 7339432 or 16348443 else o=4551589 end end else if o<5568820 then if o<5559432 then o=10590436 l=nil y=nil W=nil N=nil else o=I and 7640363 or 2829777 end else z[Z]=I o=8006201 end end else if o<5612449 then if o<5605343 then if o<5599988 then g=p(12822)X=p(12280)o=p(12855)o=a[o]o=o(a,X)X=o o=p(12281)o=a[o]o=o(a,g)V=X g=o o=X and 7854233 or 2948979 else Z=p(12719)I=u[Z]Z=p(12783)o=I[Z]C=nil Z=.2 I=o(Z)o=z[r[4]]I=o()I={}o=u[p(12766)]end else a=p(12806)o=p(12281)o=C[o]o=o(C,a)a=e()z[a]=o g=z[a]o=g and 16759756 or 16694559 X=g end else if o<5619756 then if o<5615676 then k=p(12786)I=z[r[6]]k=I[k]o=5355963 k=k(I)I=nil z[r[6]]=I else I=z[r[1]]Z=p(12135)o=I[Z]I=p(12609)I=o[I]I=I(o)o=7956505 end else o=z[r[4]]I=o(Z)o=2581514 end end end else if o<5713053 then if o<5672298 then if o<5654361 then if o<5644590 then l=z[r[7]]Y=p(12178)o=11783440 y=l[Y]l=p(12573)l=y[l]Y=S(11351784,{r[7],r[2];r[1];r[11];r[12];r[13],r[14],r[15]})l=l(y,Y)else xy=o Gy=z[r[3]]wy=p(12252)ry=Gy[wy]o=ry and 3771298 or 11415223 sy=ry end else C=nil Z=nil o=900421 end else if o<5696350 then if o<5678133 then I=p(12849)o=u[I]I=o()z[r[1]]=I C=p(12347)o=u[C]Z=8 C=o(Z)o=u[p(12610)]I={}else y=p(12153)Y=p(12585)N=C[y]l=u[Y]Y=p(12153)W=l[Y]l=p(12671)y=W[l]k=N==y I=k o=k and 1829389 or 3156537 end else k=p(12663)N=true o=z[r[4]]I=o()o=true z[r[2]]=o I=z[r[5]]I[k]=N I=z[r[6]]k=I()I=z[r[7]]o=I and 6179541 or 5439313 end end else if o<5730071 then if o<5723791 then if o<5722424 then k=p(12252)Z=z[r[2]]C=Z[k]I=C o=C and 15778837 or 6252198 else R=6 o=z[l]M=1 m=o(M,R)o=p(12398)u[o]=m R=p(12398)M=u[R]R=2 o=M>R o=o and 10045393 or 1255018 end else o=I and 8057392 or 4548215 end else if o<5743954 then if o<5739107 then k=z[r[6]]N=k()k=z[r[7]]N=k()k=true z[r[8]]=k N=z[r[9]]o=N and 7470711 or 1461147 else o=N o=9078436 C=k end else I={I}o=u[p(12587)]end end end end end else if o<6020818 then if o<5867045 then if o<5815816 then if o<5802031 then if o<5759172 then if o<5758601 then Z=p(12041)C=x[1]k=p(12343)Z=C[Z]Z=Z(C,k)I=Z o=Z and 7816538 or 17589 else A=1 b=i[A]py=b o=5411756 end else if o<5769175 then D=p(12483)V=u[D]D=p(12583)g=V[D]o=11095337 a=g else o=9295218 Z=z[r[2]]C=not Z I=C end end else if o<5814158 then if o<5804499 then N=p(12490)k=z[r[3]]N=k[N]y=p(12481)N=N(k,Z,y)I=N o=7183744 else t=z[r[12]]D=not t g=D V=o o=D and 3855641 or 6391540 end else N=p(12609)Z=z[r[6]]o=14251323 N=Z[N]N=N(Z)end end else if o<5829638 then if o<5827094 then if o<5823399 then N=z[r[2]]Z=o k=not N o=k and 15658635 or 4342232 C=k else I=z[r[1]]k=p(12810)o=I[k]k=p(12865)I=o(k)W=p(12790)y=p(12063)M=p(12260)o=p(12737)o=I[o]Y=p(12276)o=o(I)t=p(12198)a=p(12056)P=p(12056)o=1200 V=p(12154)k=o m=p(12056)l=p(12056)D=p(12056)I=p(12345)N={[y]=W;[l]=Y}l=p(12063)g=p(12056)X=p(12823)y=p(12478)Y=p(12119)W={[l]=Y,[a]=X}X=p(12284)l=p(12453)a=p(12063)Y={[a]=X;[g]=V}a=p(12589)g=p(12063)Q=p(12053)V=p(12556)X={[g]=V,[D]=t}t=p(12123)g=p(12357)D=p(12063)V={[D]=t;[P]=Q}Q=p(12857)P=p(12063)t={[P]=Q,[m]=M}D=p(12469)o={[I]=N;[y]=W;[l]=Y;[a]=X;[g]=V;[D]=t}N=o y=p(12122)I=C[y]o=not I o=o and 2707070 or 1066504 end else C=x[1]Z=p(12810)I=z[r[1]]o=I[Z]Z=p(12862)I=o(Z)o=p(12737)Z=p(12719)o=I[o]o=o(I)I=u[Z]Z=p(12668)o=I[Z]Z=S(11961173,{r[2];r[3];r[1];r[4]})C=nil I=o(Z)I={}o=u[p(12817)]end else if o<5861057 then if o<5851763 then o=8699030 else N=p(12489)o=nil I=u[N]N=p(12606)k=o Y=p(12029)o=I[N]N=o Y=Z[Y]I=p(12723)o=u[I]l={Y(Z)}Y={o(s(l))}y=Y[2]W=Y[3]I=Y[1]l=I o=2614865 end else I=p(12786)o=z[r[1]]I=o[I]I=I(o)o=nil z[r[1]]=o o=110134 end end end else if o<5912974 then if o<5890179 then if o<5878262 then if o<5877022 then N=p(12802)k=z[r[1]]o=1529440 Z=k[N]C=not Z I=C else y=z[r[7]]o=12113221 W=p(12786)W=y[W]W=W(y)end else Y=nil W=nil l=nil o=9381864 end else if o<5906899 then if o<5906507 then N=z[r[2]]Z=o k=not N C=k o=k and 1362053 or 3188629 else I={}o=u[p(12330)]end else Z,y=k(C,Z)o=Z and 9964937 or 6055939 end end else if o<5932005 then if o<5923620 then if o<5919739 then a=g o=V o=5464828 else C=false I=p(12830)o=z[r[1]]o[I]=C Z=z[r[1]]k=p(12742)C=Z[k]o=C and 2590486 or 16147353 I=C end else I=z[r[2]]o=not I o=o and 12225093 or 12488094 end else if o<5991001 then if o<5946444 then C=z[r[2]]I=C o=6457284 else o=p(12350)Z=p(12328)C=x[1]I=u[Z]Z=true C[o]=I o=p(12281)o=C[o]I=p(12073)o=o(C,I,Z)Z=o o=Z and 4361465 or 3751785 end else g=2 N=p(12407)o=z[r[1]]W=p(12700)m=false Z=p(12147)k=z[r[2]]y=z[r[3]]X=p(12705)Q=p(12071)l=z[r[4]]Y=p(12597)a=z[r[5]]C={[Z]=k;[N]=y,[W]=l;[Y]=a;[X]=g}I=o(C)o=z[r[6]]k=z[r[2]]Z=p(12147)X=p(12445)Y=p(12597)N=p(12407)y=z[r[3]]l=z[r[4]]a=z[r[5]]V=z[r[4]]t=z[r[5]]P=800 W=p(12700)D=t*P g=V+D D=2.5 t=p(12061)V=p(12451)P=z[r[7]]C={[Z]=k;[N]=y;[W]=l,[Y]=a,[X]=g,[V]=D;[t]=P;[Q]=m}I=o(C)o=u[p(12735)]I={}end end end end else if o<6176755 then if o<6107022 then if o<6050177 then if o<6047143 then if o<6036730 then Z=z[r[2]]C=not Z o=12891257 I=C else I={}o=u[p(12525)]end else uy=p(12369)b=p(12369)h=py[uy]A=v*h py[b]=A o=808419 end else if o<6059108 then if o<6057240 then o={}z[r[1]]=o I={}o=u[p(12175)]else C=z[r[8]]Z=C()I={}o=u[p(12195)]end else o=Z o=7988369 I=C end end else if o<6151843 then if o<6141673 then if o<6119928 then o=z[r[1]]C=z[r[2]]I=o(C)I={}o=u[p(12523)]else b=p(12041)A=p(12829)f=i b=py[b]b=b(py,A)o=b and 7406655 or 4936528 end else a,g=l(Y,a)o=a and 11476379 or 10086353 end else if o<6164279 then if o<6152067 then o=z[r[3]]I=o()o=10616035 else o=15384465 Z=nil C=nil end else W=1 y=N[W]I=y o=4435317 end end end else if o<6231976 then if o<6214455 then if o<6198079 then if o<6180386 then k=p(12786)I=z[r[7]]o=5439313 k=I[k]k=k(I)I=nil z[r[7]]=I else l=z[r[14]]o=11453768 Y=l()end else o=u[p(12168)]I={}end else if o<6229110 then if o<6222329 then X=not a W=W+Y I=W<=l I=X and I X=W>=l X=a and X I=X or I X=14801138 o=I and X I=12785633 o=o or I else y=nil W=p(12282)I=p(12199)Y=p(12590)N=p(12315)C=false k=nil a=p(12621)Z=p(12022)l=p(12543)o={[I]=C;[Z]=k;[N]=y;[W]=l;[Y]=a}k=p(12798)C=e()z[C]=o I=p(12144)Z=U(3904939,{r[1],r[2],r[3]})N=O(6119322,{r[5];C})o=z[C]o[I]=Z o=z[r[4]]Z=p(12171)I=o(Z,k,N)C=c(C)I={}o=u[p(12800)]end else y=p(12670)N=p(12305)o=z[r[4]]W=z[r[5]]k={[N]=Z,[y]=W}I=o(k)C=nil k=p(12719)Z=nil I=u[k]k=p(12783)o=I[k]I=o()o=8699030 end end else if o<6259852 then if o<6256029 then if o<6252148 then o=15368357 k=1 z[r[5]]=k else C=I o=C and 10836020 or 6377126 end else I={}o=u[p(12697)]end else if o<6281526 then if o<6265589 then W=z[r[4]]o=11971155 y=not W k=y else b=p(12450)f=i A=true f=nil py[b]=A py=nil o=13319929 end else o=false z[r[1]]=o o=u[p(12240)]I={}end end end end end end end else if o<7314518 then if o<6885436 then if o<6458711 then if o<6377432 then if o<6359656 then if o<6352414 then if o<6330809 then if o<6326897 then I=z[r[2]]o=not I o=o and 13223676 or 15924794 else o=I and 13203579 or 7142786 end else if o<6342563 then o=I and 8454527 or 3426940 else V=p(12063)X=p(12833)o=z[r[2]]g=W[V]a=X..g X={o(a)}I=X[1]a=I Y=X[2]X=not a o=X and 16400155 or 11691518 I=X end end else if o<6358188 then if o<6356548 then o=u[p(12358)]I={}else o=u[p(12117)]I={}end else o=I and 16203015 or 12184091 end end else if o<6368275 then if o<6365418 then if o<6364470 then o=12490829 Z=p(12281)Z=C[Z]k=p(12822)Z=Z(C,k)I=Z else I=z[r[7]]k=p(12786)k=I[k]o=15168623 k=k(I)I=nil z[r[7]]=I end else o=14595478 q=p(12252)v=z[r[4]]n=v[q]v=p(12281)q=p(12246)v=n[v]v=v(n,q)M=v end else if o<6377015 then if o<6369376 then C=x[1]I=z[r[1]]k=z[r[2]]Z=k*C o=I+Z z[r[1]]=o Z=z[r[3]]N=z[r[2]]k=N*C I=Z+k N=p(12315)z[r[3]]=I k=z[r[4]]Z=k[N]o=Z and 13202649 or 3649669 else k=p(12719)Z=u[k]k=p(12027)N=B(1564376,{C})o=Z[k]k=1.5 Z=o(k,N)o=11640006 end else k=nil o=z[r[1]]Z=p(12547)o[Z]=k o=z[r[1]]y=p(12252)k=nil Z=p(12742)o[Z]=k N=z[r[2]]k=N[y]Z=k o=k and 220018 or 11622162 end end end else if o<6407456 then if o<6390839 then if o<6383457 then if o<6382345 then I={}o=u[p(12306)]else b=p(12829)o=p(12041)o=py[o]i=H o=o(py,b)o=o and 867691 or 3820612 end else I={}o=u[p(12754)]end else if o<6403302 then if o<6393284 then o=V o=5157502 a=g else o=2635347 D=z[r[1]]t=p(12252)V=D[t]g=a~=V X=g end else Z=false o=z[r[2]]k=p(12328)I=o(C,Z)Z=p(12350)I=C[Z]Z=u[k]o=I==Z o=o and 12859143 or 10138307 end end else if o<6441588 then if o<6432841 then if o<6425668 then o=I and 14084578 or 10012848 else o=z[r[5]]I=o()o=2286953 end else I=z[r[2]]o=not I o=o and 6997603 or 11926816 end else if o<6452778 then if o<6448953 then Z=z[r[1]]k=p(12007)o=15623557 C=Z[k]I=C else y=p(12153)N=C[y]Y=p(12585)l=u[Y]Y=p(12153)W=l[Y]l=p(12468)y=W[l]k=N==y I=k o=k and 805959 or 4666850 end else o=I and 11911532 or 11216647 end end end end else if o<6652190 then if o<6520349 then if o<6499200 then if o<6479891 then if o<6477157 then sy=I o=sy and 1920222 or 12700040 else o=3064051 end else if o<6488501 then X=not a W=W+Y I=W<=l I=X and I X=W>=l X=a and X I=X or I X=13368730 o=I and X I=5433760 o=o or I else q=p(12252)R=p(12409)I=u[R]R=p(12810)o=I[R]R=p(12343)I=o(R)R=I I=p(12246)n=1190 o=p(12628)R[o]=I I=false o=p(12405)R[o]=I I=p(12836)o=p(12095)o=R[o]o=o(R,I,n)o=p(12636)I=p(12057)R[o]=I v=p(12318)n=z[r[4]]o=p(12350)I=n[v]R[o]=I o=m(R)v=z[r[4]]n=v[q]I=n o=n and 617816 or 15283177 end end else if o<6514100 then if o<6504870 then Z=p(12745)N=p(12848)C=u[Z]Z=C()k=z[r[1]]C=k[N]I=Z-C C=1.5 o=I>=C o=o and 4599916 or 3716075 else o=z[r[1]]C=z[r[2]]I=o(C)I={}o=u[p(12512)]end else o=V D=X k=D N=o o=13707115 end end else if o<6541677 then if o<6533229 then if o<6531741 then o=z[r[1]]Z=p(12407)y=3 k=z[r[2]]N=p(12721)C={[Z]=k;[N]=y}I=o(C)o=952156 else o=z[r[4]]o=o and 14905019 or 11695730 end else W=z[r[4]]o=466342 y=not W k=y end else if o<6650160 then if o<6583413 then Z=z[r[1]]C=not Z o=C and 15891998 or 8195603 I=C else Z=p(12810)Y=p(12425)I=z[r[1]]o=I[Z]C=x[1]Z=p(12529)I=o(Z)o=p(12737)o=I[o]o=o(I)I=p(12642)l=p(12425)o=u[I]W=z[r[2]]y=W[l]W=p(12662)N=y[W]y=p(12285)k=N[y]N=p(12692)Z=k[N]I=o(Z)Z=e()z[Z]=I I=p(12642)o=u[I]l=z[r[2]]a=p(12425)W=l[Y]l=p(12662)y=W[l]W=p(12820)N=y[W]y=p(12640)k=N[y]I=o(k)k=e()z[k]=I X=p(12425)I=p(12642)o=u[I]Y=z[r[2]]l=Y[a]Y=p(12662)W=l[Y]l=p(12285)y=W[l]W=p(12869)N=y[W]I=o(N)N=e()z[N]=I I=p(12642)o=u[I]a=z[r[2]]Y=a[X]a=p(12662)l=Y[a]Y=p(12285)W=l[Y]l=p(12803)y=W[l]I=o(y)y=e()W=p(12281)l=p(12054)z[y]=I I=z[r[2]]W=I[W]W=W(I,l)o=not W o=o and 15318646 or 4306036 end else Z=z[r[5]]o=Z and 15951580 or 14495562 end end end else if o<6708968 then if o<6660440 then if o<6655264 then if o<6653689 then o=p(12786)o=y[o]o=o(y)o=11457700 else V=l o=11787007 end else V=p(12719)g=u[V]V=p(12668)I=g[V]V=O(10964996,{r[10];X})g=I(V)o=8252109 end else if o<6676923 then if o<6662800 then o=I and 16027772 or 12201475 else o=z[r[1]]o=o and 8368993 or 4498111 end else h=p(12574)A=Q[h]o=5556294 b=p(12514)py[b]=A end end else if o<6753386 then if o<6732951 then if o<6715356 then k=p(12830)Z=z[r[1]]C=Z[k]o=C and 9535207 or 6332238 I=C else z[Z]=Q o=z[Z]o=o and 9718529 or 2767388 end else o=3842108 l=nil Y=c(Y)end else if o<6841265 then if o<6787881 then f=p(12801)q=z[N]v=q[f]o=15738842 R=v else o=u[p(12220)]I={}end else o=I and 6432244 or 2286953 end end end end end else if o<7130300 then if o<6975347 then if o<6911232 then if o<6896627 then if o<6889625 then if o<6888910 then Z=p(12719)C=u[Z]Z=p(12392)o=2607744 I=C[Z]Z=z[r[2]]C=I(Z)I=nil z[r[2]]=I else I={}o=true z[r[1]]=o o=u[p(12602)]end else if o<6894482 then o=14058253 N=nil l=nil y=nil W=nil else C=z[r[1]]I=C o=C and 601498 or 7988369 end end else if o<6904508 then if o<6899359 then Z=nil o=13033508 C=nil else I={}o=u[p(12261)]end else W=z[r[3]]N=o y=not W k=y o=y and 1699533 or 8055400 end end else if o<6945976 then if o<6940584 then if o<6930429 then C=x[1]Z=p(12617)I=p(12328)o=u[I]I=p(12281)I=o[I]I=I(o,Z)Z=I o=not Z o=o and 15846317 or 5854769 else o=p(12530)o=W[o]o=o(W)o=12179136 end else k=p(12683)Z=z[r[1]]C=Z[k]Z=p(12365)o=7314955 Z=C[Z]Z=Z(C)I=Z end else if o<6973928 then if o<6947455 then o=u[p(12423)]I={}else V=p(12530)o=15820080 V=g[V]V=V(g)end else N=z[r[2]]Z=o k=not N C=k o=k and 4177650 or 9078436 end end end else if o<7015352 then if o<6995539 then if o<6993187 then if o<6986454 then o=p(12530)o=l[o]o=o(l)o=16253561 else I=p(12786)o=z[r[1]]I=o[I]I=I(o)o=nil z[r[1]]=o o=10695112 end else o=z[r[1]]o=o and 11024127 or 2736396 end else if o<6997958 then if o<6996249 then l=l+a g=not X I=l<=Y I=g and I g=l>=Y g=X and g I=g or I g=3711613 o=I and g I=9271523 o=o or I else I={}o=u[p(12548)]end else o=p(12530)o=sy[o]o=o(sy)o=497659 end end else if o<7084547 then if o<7068120 then if o<7041387 then Z=p(12350)I=C[Z]Z=z[r[4]]o=I~=Z o=o and 6404585 or 3610442 else V=p(12719)g=u[V]V=p(12668)I=g[V]V=S(600869,{r[10];X})g=I(V)o=13199167 end else Y=p(12585)y=p(12153)N=C[y]l=u[Y]Y=p(12153)o=3966693 W=l[Y]l=p(12468)y=W[l]k=N==y I=k end else if o<7124604 then if o<7109011 then o=z[r[3]]I=o()o=15293320 else W=p(12186)W=y[W]W=W(y)Y=N X=p(12681)a=p(12281)a=C[a]l=p(12628)W[l]=Y a=a(C,X)l=a Y=o o=a and 9720170 or 7336477 end else k=z[r[5]]y=4 N=1 I=k+N z[r[5]]=I N=z[r[5]]k=N>y o=k and 6251112 or 15368357 end end end end else if o<7210760 then if o<7172261 then if o<7153516 then if o<7136819 then if o<7133635 then o=z[r[1]]o=o and 9002624 or 4263888 else N=Z o=y and 4615663 or 921818 end else if o<7146308 then o=u[p(12121)]C=nil Z=nil I={}else I=1 g=p(12328)V=p(12369)o=a[I]X=o I=u[g]o=p(12350)X[o]=I g=u[V]V=p(12810)D=0 o=p(12515)I=g[V]o=X[o]V=0 g={I(V,k,D)}I=p(12122)o=o(X,s(g))o=C[I]I=X o[l]=I I={X}o=u[p(12567)]end end else if o<7171757 then if o<7157309 then o=u[p(12243)]I={}else I={}o=u[p(12832)]end else P,Q=D(t,P)o=P and 273621 or 4155921 end end else if o<7196502 then if o<7193675 then if o<7185644 then o=I and 5622671 or 2581514 else Z=p(12855)k=p(12280)o=2092894 Z=C[Z]Z=Z(C,k)I=Z end else b=o uy=1 h=i[uy]uy=false A=h==uy o=A and 8091475 or 4685592 py=A end else if o<7203868 then if o<7202311 then a=1 o=10292527 Y=W[a]a=p(12029)a=Y[a]a=a(Y)Y=1 l=a[Y]I=l else q=p(12369)v=p(12607)n=Q[v]v=p(12369)f=p(12574)A=p(12508)R=n[v]o=3090304 n=p(12011)v=m[q]n=R[n]n=n(R,v)q=Q[f]f=p(12369)v=q[f]R=v*n f=p(12369)q=m[f]f=p(12673)F=p(12723)f=q[f]f=f(q)q={}v=R*f f=u[F]py=z[M]A=py[A]b={A(py)}py={f(s(b))}H=py[2]i=py[3]F=py[1]end else o=z[r[4]]I=o()o=468241 end end end else if o<7269612 then if o<7230330 then if o<7212810 then if o<7212699 then o=z[r[1]]C=z[r[2]]Z=false I=o(C,Z)o=z[r[3]]o=o and 14835226 or 1378526 else y=z[r[3]]o=7311581 W=p(12801)N=y[W]Z=N end else I=p(12530)o=z[r[1]]I=o[I]I=I(o)I={}o=u[p(12402)]end else if o<7261156 then if o<7240488 then n=nil v=nil q=nil o=10328770 R=nil else Z=z[r[5]]o=Z and 1354891 or 5730661 end else W=z[r[3]]y=not W k=y N=o o=y and 10848484 or 5210820 end end else if o<7297698 then if o<7294477 then if o<7275304 then I={}o=u[p(12549)]else I=C o=Z o=5006771 end else Z=true I=p(12802)o=z[r[1]]o[I]=Z I=z[r[1]]Z=p(12769)o=I[Z]Z=true I=p(12663)o[I]=Z I=z[r[2]]Z=p(12252)o=I[Z]Z=p(12280)I=p(12855)I=o[I]I=I(o,Z)Z=I o=Z and 14981713 or 13950171 end else if o<7310923 then if o<7305517 then Z=nil o=1615894 else o=z[r[1]]o=o and 8578855 or 15078876 end else I=p(12346)y=1 o=k I=o[I]k=nil N=.8 I=I(o,C,Z,k,N,y)C=p(12302)o=z[r[1]]k=o W=z[r[2]]y=o N=W o=W and 9014640 or 3069128 end end end end end end else if o<7887759 then if o<7591384 then if o<7467300 then if o<7416183 then if o<7374016 then if o<7336711 then if o<7324625 then Z=p(12822)C=e()k=p(12280)z[C]=I y=e()I=p(12356)o=z[C]I=o[I]W=p(12434)I=I(o,Z)o=z[C]Z=I N=p(12318)I=p(12356)I=o[I]I=I(o,k)k=e()z[k]=I I=p(12356)o=z[r[1]]I=o[I]I=I(o,N)N=e()z[N]=I o=z[r[1]]I=p(12560)I=o[I]I=I(o)z[y]=I o=z[r[2]]I=o(W)W=I l=not W I=l o=l and 3320111 or 292646 else X=p(12854)a=p(12281)a=C[a]o=9720170 a=a(C,X)l=a end else if o<7339361 then X=p(12695)I=p(12625)o=u[I]a=u[X]X=a(Z)Y=p(12050)l=Y..X I=o(l)o=u[p(12296)]I={}else W=z[r[6]]l=p(12178)N=W[l]l=d(10637317,{r[1];r[13];r[14],r[2],r[15]})W=p(12573)o=16348443 W=N[W]W=W(N,l)end end else if o<7407434 then if o<7390288 then I={}o=u[p(12533)]else b=p(12369)uy=p(12369)h=py[uy]A=v*h o=4936528 py[b]=A end else o=z[r[1]]o=o and 5862216 or 110134 end end else if o<7444023 then if o<7438155 then if o<7425803 then y=p(12508)I=p(12368)o=u[I]k=z[r[2]]y=k[y]N={y(k)}k={o(s(N))}C=k[2]Z=k[3]I=k[1]o=7885078 k=I else o=z[r[3]]I=o()C=I o=not C o=o and 9879550 or 14981111 end else C=x[1]I=p(12070)Z=x[2]o=z[r[1]]I=o[I]I=I(o)o=I and 1718759 or 9568905 end else if o<7456875 then if o<7448122 then o=u[p(12520)]I={}else o=I and 16630213 or 1873297 end else o=8402758 a=c(a)l=c(l)W=nil end end end else if o<7516784 then if o<7499892 then if o<7489727 then if o<7473364 then y=p(12609)N=z[r[9]]y=N[y]y=y(N)o=1461147 N=nil z[r[9]]=N else W=p(12409)o=10217832 y=u[W]W=p(12810)N=y[W]W=p(12755)y=N(W,Z)I=y end else I={Z}V=p(12359)a=c(a)y=nil N=c(N)W=c(W)l=c(l)k=c(k)g=u[V]D=Z V=p(12538)o=u[p(12166)]g[V]=D X=c(X)Y=c(Y)end else if o<7511949 then if o<7505244 then o=t o=13951903 V=D else C=x[1]I=z[r[1]]k=e()Z=p(12810)y=p(12356)o=I[Z]Z=p(12528)I=o(Z)o=p(12737)o=I[o]o=o(I)W=p(12425)Z=e()I=p(12642)o=false z[Z]=o o=false z[k]=o o=u[I]N=z[r[2]]l=p(12356)y=N[y]y=y(N,W)W=p(12662)N=p(12356)N=y[N]N=N(y,W)W=p(12372)y=p(12356)y=N[y]y=y(N,W)a=p(12318)W=p(12336)l=y[l]N={l(y,W)}I=o(s(N))N=e()y=e()o=B(12395948,{r[3]})z[N]=I W=e()z[y]=o o=d(9787445,{k,Z;y,N})z[W]=o I=z[r[4]]l=p(12441)o=I[l]l=B(7443731,{r[4];k;W})I=p(12573)I=o[I]I=I(o,l)Y=z[r[3]]l=Y[a]Y=p(12281)a=p(12087)Y=l[Y]Y=Y(l,a)I=Y o=Y and 4821949 or 13966955 end else C=z[r[8]]Z=C()I={}o=u[p(12612)]end end else if o<7554704 then if o<7538722 then if o<7517450 then k=p(12779)I=C[k]W=p(12585)y=u[W]W=p(12779)N=y[W]y=p(12336)k=N[y]o=I==k o=o and 12512251 or 4699070 else o=Z o=14843267 I=C end else k=x[3]C=e()g=e()Z=x[2]N=e()z[C]=x[1]z[N]=x[4]I=p(12197)Q=p(12369)y=e()a=e()z[y]=x[5]R=p(12778)X=e()o=z[C]I=o[I]I=I(o)W=I o=z[C]I=p(12310)I=o[I]I=I(o)l=I I=2 o=W/I Y=o o=false z[a]=o o=false I=p(12205)n=p(12012)z[X]=o o=L(3597013,{r[1];C})z[g]=o o=B(2609264,{C;r[1];a,X,N,g,y})V=o o=V(I,l,W)I=p(12389)P=u[Q]Q=p(12810)t=P[Q]M=p(12778)Q=0 m=Y[M]M=0 P=t(Q,m,M)Q=p(12002)D=l*P P=u[Q]m=p(12336)Q=p(12810)t=P[Q]Q=W[m]M=W[R]R=2 m=M/R R=p(12012)M=W[R]P={t(Q,m,M)}X=c(X)o=V(I,D,s(P))Q=p(12369)P=u[Q]Q=p(12810)R=p(12778)I=p(12846)t=P[Q]Q=0 M=Y[R]m=-M M=0 P=t(Q,m,M)m=p(12336)D=l*P Q=p(12002)P=u[Q]Q=p(12810)t=P[Q]Q=W[m]R=p(12778)M=W[R]R=2 m=M/R R=p(12012)M=W[R]P={t(Q,m,M)}Q=p(12369)M=p(12336)o=V(I,D,s(P))P=u[Q]I=p(12477)Q=p(12810)t=P[Q]m=Y[M]Q=-m M=0 m=0 P=t(Q,m,M)D=l*P Q=p(12002)M=p(12336)P=u[Q]R=p(12012)Q=p(12810)t=P[Q]m=W[M]M=2 Q=m/M M=p(12778)m=W[M]M=W[R]P={t(Q,m,M)}o=V(I,D,s(P))M=0 I=p(12277)m=p(12336)Q=p(12369)P=u[Q]Q=p(12810)t=P[Q]Q=Y[m]m=0 P=t(Q,m,M)Q=p(12002)D=l*P P=u[Q]Q=p(12810)R=p(12012)t=P[Q]M=p(12336)m=W[M]M=2 Q=m/M y=c(y)k=nil M=p(12778)m=W[M]g=c(g)Z=nil M=W[R]P={t(Q,m,M)}o=V(I,D,s(P))I=p(12110)Q=p(12369)P=u[Q]Q=p(12810)t=P[Q]Q=0 R=Y[n]C=c(C)M=-R m=0 P=t(Q,m,M)Q=p(12002)m=p(12336)D=l*P P=u[Q]Q=p(12810)t=P[Q]M=p(12778)Q=W[m]n=p(12012)m=W[M]R=W[n]n=2 a=c(a)M=R/n P={t(Q,m,M)}Q=p(12369)o=V(I,D,s(P))I=p(12108)P=u[Q]Q=p(12810)m=0 t=P[Q]R=p(12012)Q=0 N=c(N)M=Y[R]P=t(Q,m,M)m=p(12336)Q=p(12002)M=p(12778)D=l*P P=u[Q]Q=p(12810)t=P[Q]Q=W[m]m=W[M]l=nil n=p(12012)R=W[n]n=2 M=R/n Y=nil W=nil P={t(Q,m,M)}o=V(I,D,s(P))V=nil I={}o=u[p(12026)]end else if o<7581558 then if o<7564748 then o=u[p(12274)]I={}else o=z[r[3]]I=o()o=9035214 end else I=p(12346)o=k I=o[I]k=nil y=1.1 N=.75 I=I(o,C,Z,k,N,y)o=u[p(12784)]I={}end end end end else if o<7777927 then if o<7684085 then if o<7659716 then if o<7614411 then if o<7595751 then o={}Z=x[2]N=p(12617)k=o C=x[1]I=p(12328)o=u[I]I=p(12281)I=o[I]I=I(o,N)N=I o=not N o=o and 9738154 or 4404389 else o=8446016 k=nil end else if o<7652792 then o=z[r[5]]k=p(12474)Z=z[r[6]]C=Z[k]Z=false I=o(C,Z)o=2829777 else I=p(12041)k=p(12343)o=z[r[2]]I=o[I]I=I(o,k)o=I and 9472575 or 8446016 end end else if o<7675089 then if o<7665791 then k,W=N(Z,k)o=k and 1093002 or 7686902 else o=5906573 C=nil end else a=g o=V o=5415928 end end else if o<7735677 then if o<7729826 then if o<7699726 then I={}o=u[p(12571)]C=nil else C=x[1]Z=x[2]o=z[r[1]]I=o()k=I o=not k o=o and 1771676 or 12162116 end else Y=nil a=nil o=14299492 end else if o<7773002 then if o<7761729 then o=z[r[1]]C=p(12374)N=p(12801)k=z[r[2]]Z=k[N]y=1 I=p(12346)k=nil N=.75 I=o[I]I=I(o,C,Z,k,N,y)I={}o=u[p(12455)]else C=p(12409)I=u[C]C=p(12810)o=I[C]k=e()C=p(12207)I=o(C)C=I o=p(12270)I=p(12658)C[o]=I I=p(12299)o=z[r[1]]I=o[I]I=I(o,C)o=p(12157)Z=I I=2 o=Z[o]o=o(Z,I)o=p(12346)I=p(12178)o=Z[o]o=o(Z)o=false z[k]=o N=S(12319794,{k})o=Z[I]I=p(12573)I=o[I]I=I(o,N)o=14493117 end else o=I and 1201811 or 15384465 end end end else if o<7854646 then if o<7835011 then if o<7819670 then if o<7808114 then Z=x[2]k=not Z o=k and 12176526 or 16205844 C=x[1]I=k else Z=z[r[1]]N=p(12481)k=p(12490)o=17589 k=Z[k]k=k(Z,C,N)I=k end else o=z[r[2]]I=o()o=14772180 end else if o<7849676 then if o<7842247 then o=Z I=C o=6332238 else I={}o=u[p(12712)]end else m=p(12111)Q=X[m]m=0 t=o P=Q>m o=P and 1304829 or 13231153 D=P end end else if o<7865479 then if o<7861271 then if o<7855186 then Z=nil C=nil o=u[p(12101)]I={}else I=z[r[1]]Z=p(12547)o=I[Z]o=o and 1793862 or 11588383 end else W,Y=N(y,W)o=W and 1353770 or 7986804 end else if o<7883309 then if o<7870878 then o=z[r[1]]N=p(12801)k=z[r[2]]C=p(12374)Z=k[N]N=.75 y=1 k=nil I=p(12346)I=o[I]I=I(o,C,Z,k,N,y)o=u[p(12181)]I={}else o=I and 8347129 or 7437991 end else Z,y=k(C,Z)o=Z and 11731901 or 751376 end end end end end else if o<8190346 then if o<8053315 then if o<7987854 then if o<7959635 then if o<7897379 then if o<7891354 then o=p(12281)I=p(12822)o=C[o]Z=e()o=o(C,I)z[Z]=o I=z[Z]o=not I o=o and 6358000 or 13132038 else I=p(12801)o=Z[I]I=p(12310)N=p(12801)I=C[I]g=p(12801)I=I(C)k=o o=I[N]W=p(12002)N=o o=N-k y=o I=u[W]W=p(12810)o=I[W]Y=z[r[1]]a=p(12801)l=Y[a]Y=p(12336)W=l[Y]X=z[r[1]]a=X[g]g=p(12801)X=p(12778)Y=a[X]a=99999 l=Y+a X=z[r[1]]a=X[g]X=p(12012)Y=a[X]I=o(W,l,Y)o=p(12515)W=I Y=p(12369)l=u[Y]Y=p(12810)I=l[Y]Y=W+y o=C[o]l={I(Y)}I=1 o=o(C,s(l))l=3 Y=l l=1 o=6996066 a=l l=0 X=a<l l=I-a end else if o<7911357 then C=I o=C and 8687642 or 14986178 else I=p(12135)o=z[r[1]]N=p(12219)k=z[r[4]]Z=k[N]N=B(6503268,{r[1]})k=p(12573)k=Z[k]C=nil k=k(Z,N)o[I]=k Z=p(12719)I=u[Z]Z=p(12027)N=p(12204)o=I[Z]k=z[r[1]]Z=k[N]k=B(12278709,{r[1];r[5]})I=o(Z,k)o=3426940 end end else if o<7984789 then if o<7966865 then X=p(12689)l=o a=u[X]X=p(12394)Y=a[X]o=Y and 11306566 or 15069327 W=Y else o=W o=N and 12208850 or 16052739 end else o=9847392 end end else if o<8020356 then if o<7994447 then if o<7989165 then o=I and 2892687 or 7160233 else Z=z[r[1]]C=not Z o=C and 1556758 or 1106468 I=C end else f=c(f)o=1906874 F=c(F)i=nil n=c(n)H=c(H)v=c(v)q=c(q)end else if o<8047849 then if o<8039808 then py=z[Z]o=py and 7196173 or 5574877 I=py else C=false I=p(12802)o=z[r[1]]o[I]=C C=p(12769)I=z[r[1]]o=I[C]C=false I=p(12663)o[I]=C o=z[r[2]]I=o()o=2800161 end else o=u[p(12254)]I={}end end end else if o<8105343 then if o<8087787 then if o<8068357 then if o<8056015 then o=N o=7284632 C=k else I={}o=u[p(12279)]end else P,Q=D(t,P)o=P and 8611471 or 6966503 end else if o<8091952 then if o<8090152 then k=p(12252)Z=z[r[2]]C=Z[k]o=C and 12971072 or 7897678 I=C else uy=2 h=i[uy]uy=z[H]A=h==uy o=4685592 py=A end else Y=p(12369)o=l[Y]Y=p(12182)X=p(12801)Y=o[Y]a=Z[X]t=p(12489)Y=Y(o,a)X=p(12411)a=l[X]P=p(12336)X=2 o=a/X a=o D=u[t]t=p(12794)V=D[t]t=Y[P]D=V(t)t=p(12336)V=a[t]g=D<V o=g and 13276683 or 2146777 X=g end end else if o<8146210 then if o<8140098 then if o<8121041 then I=true o=true z[r[3]]=o z[r[2]]=I k=z[r[4]]o=k and 4619865 or 4445178 else Z=nil I={}C=nil o=u[p(12750)]end else X=nil g=nil o=14633786 end else if o<8173770 then if o<8166539 then N=nil y=nil o=7885078 else k=nil Z=nil g=20 o=X N=nil V=p(12164)X=p(12568)W={[l]=C,[Y]=a;[X]=g;[V]=y}I=o(W)C=nil o=u[p(12078)]y=nil I={}end else I=p(12524)k=p(12399)Z={k}o={[I]=Z}I={o}o=u[p(12201)]end end end end else if o<8322576 then if o<8251722 then if o<8209107 then if o<8200085 then if o<8194961 then o={}I={}z[r[1]]=o o=u[p(12079)]else C=z[r[2]]I=C o=15891998 end else Z=nil o=10289638 end else if o<8251079 then if o<8211654 then q=z[N]f=p(12801)v=q[f]R=v o=14095388 else o=true o=o and 5722482 or 10653942 end else Z=p(12822)I=p(12281)I=C[I]I=I(C,Z)Z=I I=not Z o=I and 13026132 or 3225925 end end else if o<8277438 then if o<8258492 then if o<8253066 then a=nil o=8373558 X=c(X)Y=nil l=nil else W=p(12347)o=8609855 y=u[W]I=y end else Y=p(12483)l=p(12489)W=I I=u[l]l=p(12413)o=I[l]l=e()z[l]=o I=u[Y]Y=p(12085)V=p(12483)o=I[Y]g=u[V]a=g Y=o X=o o=g and 5759234 or 11095337 end else if o<8317079 then if o<8289433 then o=15741668 W=true I=z[r[2]]y=p(12045)I[y]=W else o=I and 11228235 or 4083076 end else I={}o=u[p(12309)]end end end else if o<8372556 then if o<8349985 then if o<8346689 then if o<8327912 then I=z[r[1]]Z=p(12810)C=x[1]P=1236 y=e()o=I[Z]Z=p(12656)I=o(Z)o=p(12737)o=I[o]R=1173 o=o(I)g=1191 I=p(12689)o=u[I]a=e()V=p(12615)I=p(12394)Q=p(12171)Z=p(12760)X=e()n=p(12076)I=o[I]I=I(o,Z)o=B(14588281,{})N=e()k=e()Y=e()Z=e()z[Z]=I z[k]=o o=S(12630103,{})I=p(12752)z[N]=o o=J(13606350,{})l=e()W=e()z[y]=o o=B(8483278,{})m=1173 M=p(12665)z[W]=o o=J(12242496,{Z})D=1235 z[l]=o o=J(2139882,{l,Z})z[Y]=o t=p(12076)o=j(7553312,{r[2]})v=p(12752)z[a]=o o=U(10318022,{r[3]})z[X]=o o={[I]=g;[V]=D;[t]=P,[Q]=m;[M]=R}V=e()g=e()D=e()z[g]=o o=j(10727573,{g;r[2]})z[V]=o o=O(10882556,{r[2];N;r[4];Y;W;l,y})z[D]=o q=p(12665)o=S(16186008,{k,X;a;V,D})t=o o=d(2344435,{k,X;a,V,D})P=o o=L(1760779,{k,X,a,V;D})Q=o I=p(12171)o=J(6224170,{k;X,a;V;D})m=o R=p(12615)o=B(2541063,{k;X;a,V,D})M=o o={I;R,n;v;q}R=e()q=p(12318)z[R]=o o=S(4150923,{R})n=o v=z[r[2]]I=v[q]o=n(I)I=z[r[2]]v=p(12252)o=I[v]v=o o=v and 3570676 or 279625 else Z=x[2]C=x[1]k=p(12830)I=z[r[1]]o=I[k]o=o and 5137589 or 15117914 end else o=u[p(12066)]I={}end else if o<8368819 then if o<8359089 then o=z[r[1]]W=p(12700)N=p(12407)m=false Q=p(12071)Z=p(12147)k=z[r[2]]Y=p(12597)y=z[r[3]]l=z[r[4]]a=z[r[5]]X=p(12705)g=3 C={[Z]=k;[N]=y;[W]=l;[Y]=a;[X]=g}I=o(C)o=z[r[6]]X=p(12445)Y=p(12597)N=p(12407)k=z[r[2]]W=p(12700)Z=p(12147)P=800 y=z[r[3]]l=z[r[4]]a=z[r[5]]V=z[r[4]]t=z[r[5]]D=t*P g=V+D t=p(12061)D=3.5 V=p(12451)P=z[r[7]]C={[Z]=k;[N]=y;[W]=l,[Y]=a;[X]=g,[V]=D,[t]=P;[Q]=m}I=o(C)I={}o=u[p(12215)]else o=z[r[2]]I=o()o=10883424 end else o=z[r[2]]Z=p(12810)y=p(12141)I=o()o=z[r[3]]I=p(12530)I=o[I]k=p(12237)I=I(o)o=z[r[4]]C=z[r[5]]I=o(C)C=I I=z[r[6]]o=I[Z]N=C..y Z=k..N C=nil I=o(Z)Z=p(12719)o=p(12737)o=I[o]o=o(I)I=u[Z]Z=p(12783)o=I[Z]Z=.5 I=o(Z)o=z[r[7]]Z=z[r[1]]k=z[r[5]]I=o(Z,k)o=16716293 end end else if o<8405698 then if o<8393342 then if o<8387353 then W,Y=N(y,W)o=W and 14423784 or 6477249 else y=0 I=p(12192)o=z[N]o[I]=y y=0 o=z[N]I=p(12594)o[I]=y I=p(12653)y=true o=z[N]o[I]=y o=13939516 end else I=z[r[3]]k=p(12350)N=z[r[5]]y=true o=u[p(12379)]I[k]=N I=z[r[6]]N=z[r[3]]k=I(N,y)N=p(12719)k=u[N]N=p(12783)I=k[N]k=I()I=z[r[7]]k=p(12616)k=I[k]N=z[r[3]]k=k(I,N)N=p(12719)C=nil k=u[N]N=p(12783)Z=nil I=k[N]N=1 k=I(N)I=false z[r[1]]=I I={}end else if o<8446159 then if o<8439163 then o=u[p(12339)]I=z[r[2]]I={I}else o=z[r[5]]Z=nil k=z[r[2]]I=o(k)o=2480494 end else o=4649275 V=nil end end end end end end end end end else if o<12314089 then if o<10365393 then if o<9560522 then if o<8921225 then if o<8673325 then if o<8558464 then if o<8504454 then if o<8480475 then if o<8453083 then if o<8450098 then k=z[r[2]]C=k o=2196080 else C=z[r[1]]o=C and 10019982 or 5006771 I=C end else if o<8473511 then C=false o=z[r[1]]k=p(12742)I=p(12740)Z=p(12745)o[I]=C I=p(12848)o=z[r[1]]C=u[Z]Z=C()o[I]=Z Z=z[r[1]]C=Z[k]I=C o=C and 15347099 or 4634155 else o=4028957 Y=nil a=nil end end else if o<8493404 then if o<8482753 then I=p(12238)Z=d(12079565,{r[1],r[2]})o=C[I]I=p(12573)I=o[I]I=I(o,Z)I=p(12088)o=C[I]Z=O(9081373,{r[1];r[3],r[4],r[5]})I=p(12573)I=o[I]I=I(o,Z)I=p(12531)Z=J(5923408,{r[1];r[3];r[4]})o=C[I]I=p(12573)I=o[I]I=I(o,Z)o=15145305 else C=p(12409)I=u[C]C=p(12810)o=I[C]C=p(12258)Z=p(12751)I=o(C)C=e()z[C]=I o=z[C]I=p(12482)o[I]=Z o=z[C]Z=10 I=p(12412)o[I]=Z o=z[C]k=p(12328)I=p(12350)Z=u[k]o[I]=Z o=z[C]I=p(12346)I=o[I]I=I(o)I=z[C]Z=p(12866)o=I[Z]Z=J(7216738,{C})I=p(12573)I=o[I]C=c(C)I=I(o,Z)o=u[p(12043)]I={}end else o=u[p(12827)]I={}end end else if o<8521936 then if o<8516562 then if o<8508304 then Y=z[r[8]]a=p(12350)l=Y[a]o=1532475 y=l else t=p(12871)I=p(12625)o=u[I]m=p(12063)g=p(12462)Q=W[m]m=p(12811)P=Q..m D=t..P V=l..D X=g..V I=o(X,Y)I={}o=u[p(12159)]end else I={}o=u[p(12312)]end else if o<8551473 then if o<8530118 then o=false Z=false C=p(12663)z[r[2]]=o I=z[r[3]]I[C]=Z Z=p(12252)C=z[r[4]]I=C[Z]C=I I=not C o=I and 6258760 or 776168 else o=z[r[3]]Z=true I=o(C,Z)o=1011218 end else a=2 Y=p(12721)I=z[r[10]]W=p(12407)l=z[Z]y={[W]=l;[Y]=a}N=I(y)o=801157 end end end else if o<8601663 then if o<8579207 then if o<8577216 then if o<8561328 then k=p(12779)W=p(12585)I=C[k]y=u[W]W=p(12779)N=y[W]y=p(12012)k=N[y]o=I==k o=o and 13359352 or 7517424 else I={}o=false z[r[3]]=o o=u[p(12417)]end else I=p(12530)o=z[r[1]]I=o[I]I=I(o)o=15078876 end else if o<8589122 then if o<8584203 then I=z[r[1]]Z=p(12742)o=I[Z]I=p(12786)I=o[I]I=I(o)o=z[r[1]]Z=nil I=p(12742)o[I]=Z o=15562782 else Y=p(12029)Y=N[Y]I=p(12723)o=u[I]l={Y(N)}Y={o(s(l))}o=4028957 W=Y[3]I=Y[1]y=Y[2]l=I end else i,py=F(H,i)o=i and 11167345 or 7233254 end end else if o<8623650 then if o<8611229 then if o<8606799 then k=p(12822)I=p(12281)I=Z[I]I=I(Z,k)o=C~=I o=o and 3412289 or 13654860 else o=I and 13983190 or 3520909 end else m=p(12281)R=o m=W[m]m=m(W,Q)V=P M=m o=m and 11630291 or 12795478 end else if o<8667796 then if o<8635701 then k=z[r[7]]W=true y=z[r[8]]N=k(y,W)y=p(12719)N=u[y]o=u[p(12566)]y=p(12668)k=N[y]y=B(16137764,{r[9];C;r[4]})N=k(y)I={}C=c(C)Z=nil else Z=p(12280)I=p(12281)I=C[I]I=I(C,Z)Z=I o=Z and 9223558 or 7300726 end else o=11783440 l=z[r[15]]Y=l()end end end end else if o<8793405 then if o<8719534 then if o<8683075 then if o<8676359 then if o<8675689 then M=I o=M and 16082463 or 6498252 else I={}C=nil o=u[p(12703)]Z=nil end else if o<8678977 then k=p(12822)Z=p(12281)Z=C[Z]Z=Z(C,k)o=5744718 I=Z else Z=nil o=15692446 W=nil end end else if o<8715723 then if o<8697548 then Z=p(12281)k=p(12755)Z=C[Z]Z=Z(C,k)I=Z o=Z and 1655444 or 5423917 else C=z[r[1]]o=C and 5932262 or 6457284 I=C end else I={}o=u[p(12257)]end end else if o<8768092 then if o<8743699 then if o<8721150 then g=true l=y o=e()z[o]=Y Y=o X=p(12021)a=u[X]X=p(12435)o=a[X]X=1 a=o(k,l,X,g)o=a and 5611368 or 6746405 else y=.5 o=z[r[1]]C=p(12132)I=p(12346)k=z[r[2]]N=p(12801)I=o[I]Z=k[N]k=nil N=.7 I=I(o,C,Z,k,N,y)o=u[p(12599)]I={}end else o=z[r[2]]a=p(12132)Y=p(12346)g=p(12801)X=l[g]Y=o[Y]D=1 g=nil V=1.1 Y=Y(o,a,X,g,V,D)o=5559095 end else if o<8789229 then if o<8773898 then o=8251036 else o=N o=k and 4587144 or 12787016 end else I={}o=u[p(12815)]C=nil end end end else if o<8856402 then if o<8810541 then if o<8796376 then if o<8793860 then o=7660696 y=nil W=nil else I={}o=u[p(12421)]end else C=x[1]I=z[r[1]]N=p(12489)Z=z[r[2]]o=I-Z k=u[N]N=p(12794)Z=o I=k[N]k=I(Z)I=1 o=k<I o=o and 1409314 or 1473640 end else if o<8844648 then if o<8841826 then o=0 z[r[1]]=o I=nil o=u[p(12106)]z[r[2]]=I I={}else I=p(12281)k=p(12822)I=Z[I]I=I(Z,k)o=C~=I o=o and 8796177 or 10653768 end else z[r[1]]=I o=6897612 end end else if o<8892651 then if o<8873930 then if o<8861634 then I={}o=u[p(12808)]else X=p(12655)Q=160 m=0 l=false N=z[r[9]]W=z[r[10]]y=N(W,l)z[r[8]]=y l=p(12483)W=u[l]l=p(12828)N=W[l]l=z[r[11]]Y=z[r[12]]D=z[Z]P=p(12002)t=p(12801)V=D[t]t=u[P]P=p(12810)D=t[P]P=0 t=D(P,Q,m)g=V+t V=nil t=1.5 P=p(12346)D=.65 P=Y[P]a={P(Y,X,g,V,D,t)}t=1 W=N(l,s(a))l=p(12483)W=u[l]l=p(12828)N=W[l]l=z[r[11]]X=p(12724)Y=z[r[12]]D=p(12801)V=z[Z]g=V[D]V=nil D=.7 P=p(12346)P=Y[P]a={P(Y,X,g,V,D,t)}W=N(l,s(a))l=p(12719)W=u[l]l=p(12783)N=W[l]l=.5 W=N(l)l=z[r[2]]N=l W=o o=l and 14931986 or 2415955 end else o=z[r[4]]I=o()o=13168451 end else if o<8918398 then if o<8903561 then C=x[1]I=p(12070)Z=x[2]o=z[r[1]]I=o[I]I=I(o)o=I and 1556523 or 1894908 else k=p(12719)I=u[k]k=p(12668)o=I[k]k=L(11339547,{r[4],r[2];C;r[1]})Z=nil I=o(k)o=11127517 end else o=k o=Z and 9819307 or 13607845 end end end end end else if o<9287442 then if o<9077363 then if o<9026111 then if o<9013484 then if o<8929101 then if o<8922994 then W=z[r[4]]y=not W o=5743483 k=y else t=p(12252)o=11846565 D=z[r[1]]V=D[t]g=a~=V X=g end else if o<8936758 then Z=o y=z[r[1]]W=p(12547)N=y[W]k=not N C=k o=k and 7518063 or 13499771 else o=z[r[2]]I=o()o=4263888 end end else if o<9020314 then if o<9017525 then l=z[r[2]]o=3069128 Y=p(12801)W=l[Y]N=W else o=p(12299)I=z[r[3]]o=C[o]o=o(C,I)Z=p(12346)z[r[2]]=o I=z[r[2]]k=true Z=I[Z]Z=Z(I)Z=p(12045)o=u[p(12727)]I=z[r[2]]C=nil I[Z]=k I={}end else f=i b=p(12041)A=p(12829)b=py[b]b=b(py,A)o=b and 6050102 or 808419 end end else if o<9044173 then if o<9035462 then if o<9033360 then g=nil o=12936501 else C=nil I={}o=u[p(12715)]Z=nil end else C=nil I={}o=u[p(12303)]end else if o<9064391 then if o<9058506 then I={I}o=u[p(12825)]else k=p(12409)I=u[k]C=x[1]k=p(12810)Z=x[2]o=I[k]k=p(12570)I=o(k)o=p(12628)k=I I=C k[o]=I I=p(12723)o=u[I]W={o(Z)}I=W[1]y=W[3]N=W[2]o=3051187 W=I end else o=z[r[2]]Z=true I=o(C,Z)o=195546 end end end else if o<9176942 then if o<9094501 then if o<9086324 then if o<9078568 then I=C o=Z o=5522507 else o=z[r[1]]k=p(12252)I=p(12830)C=true o[I]=C Z=z[r[2]]C=Z[k]I=C o=C and 13397962 or 9617442 end else Z=p(12328)o=p(12350)I=u[Z]C=x[1]C[o]=I Z=true o=p(12281)I=p(12073)o=C[o]o=o(C,I,Z)Z=o o=Z and 7892927 or 8139159 end else if o<9164652 then if o<9150879 then I=p(12625)k=p(12131)o=u[I]I=o(k)o=u[p(12498)]I={}else y=3 Z=p(12407)o=z[r[1]]N=p(12721)k=z[r[2]]C={[Z]=k;[N]=y}I=o(C)o=10706113 end else k=p(12343)C=x[1]Z=p(12041)Z=C[Z]Z=Z(C,k)I=Z o=Z and 5365291 or 9921423 end end else if o<9253513 then if o<9219001 then if o<9198981 then Z=z[r[1]]C=not Z o=C and 12891257 or 6034518 I=C else C=nil o=u[p(12344)]I={}Z=nil end else y=p(12755)N=p(12281)N=Z[N]N=N(Z,y)k=o I=N o=N and 4503471 or 15576738 end else if o<9280802 then if o<9266150 then C=c(C)o=9549860 else W=nil Y=p(12801)k=nil o=z[r[2]]a=nil l=Z[Y]y=nil N=nil X=nil I=o(l)l=p(12764)o=z[r[3]]Y=p(12348)I=o(C,l,Y,a,X)o=8139159 end else o=p(12530)o=Y[o]o=o(Y)o=11523058 end end end end else if o<9425951 then if o<9379216 then if o<9311452 then if o<9289966 then if o<9288246 then V=z[r[11]]g=not V X=o a=g o=g and 13800529 or 5464828 else o=z[r[5]]I=o()o=347588 end else if o<9295801 then o=I and 6791155 or 16147067 else o=I and 15716703 or 907842 end end else if o<9329252 then if o<9323947 then Z=nil o=900421 C=nil else o=D and 6516375 or 13707115 end else l=p(12178)W=z[r[6]]N=W[l]o=1096487 W=p(12573)l=O(4511625,{r[1],r[13],r[14];r[2],r[15]})W=N[W]W=W(N,l)end end else if o<9408900 then if o<9400168 then if o<9388940 then N,l=y(k,N)o=N and 2627122 or 13371989 else V=c(V)R=nil F=p(12489)i=360 f=u[F]F=p(12501)Q=nil q=f[F]n=nil I={}M=nil H=z[Y]Z=c(Z)F=H/i f=q(F)q=360 H=p(12233)g=c(g)P=nil v=f*q f=e()q=e()z[q]=v v=nil z[f]=v m=nil F=z[r[3]]v=F[H]F=p(12573)H=d(8798047,{q;Y,f,X;k;l,r[7];W,N;C;a})o=u[p(12604)]q=c(q)k=c(k)W=c(W)F=v[F]l=c(l)y=nil a=c(a)X=c(X)C=c(C)Y=c(Y)D=nil N=c(N)F=F(v,H)z[f]=F f=c(f)end else C=p(12311)o=z[r[1]]W=z[r[2]]N=W k=o y=o o=W and 14731884 or 9441769 end else if o<9415766 then if o<9411447 then R=v o=q o=4800009 else t=p(12483)D=u[t]t=p(12828)Q=p(12801)o=D[t]P=g[Q]t={a;P}D=o(k,t)o=8446497 end else I=z[r[1]]C=p(12729)o=I[C]C=o o=C and 14214682 or 14784866 I=C end end end else if o<9478632 then if o<9462089 then if o<9445129 then if o<9434118 then k=p(12786)o=16575307 I=z[r[6]]k=I[k]k=k(I)I=nil z[r[6]]=I else o=y Z=N o=N and 7311581 or 7212767 end else o=z[r[3]]o=o and 8576327 or 3996158 end else if o<9470507 then if o<9468742 then Z=O(8832294,{r[2];r[1]})C=p(12719)I=u[C]C=p(12027)o=I[C]C=1.5 I=o(C,Z)o=u[p(12725)]z[r[1]]=I I={}else o=z[r[1]]I=o()o=u[p(12406)]I={}end else k=p(12203)o=z[r[2]]I=p(12281)I=o[I]I=I(o,k)k=I o=k and 11906513 or 11482363 end end else if o<9546552 then if o<9535662 then if o<9484330 then o=N C=k o=4658083 else Z=o y=p(12740)N=z[r[1]]k=N[y]o=k and 5042598 or 7839452 C=k end else P=n o=v o=13400056 end else if o<9554797 then if o<9549816 then C=z[r[2]]I=C o=156663 else I={}o=u[p(12598)]end else I={}o=false z[r[1]]=o o=u[p(12565)]end end end end end end else if o<9941118 then if o<9789430 then if o<9696799 then if o<9653249 then if o<9616949 then if o<9589527 then if o<9570958 then I=z[r[2]]o=not I o=o and 15249235 or 15872701 else o=Z o=C and 2688354 or 7516661 end else if o<9600554 then o=F v=f o=9409343 else I={}o=true z[r[1]]=o o=u[p(12637)]end end else if o<9651713 then if o<9617475 then k=p(12683)Z=z[r[2]]o=13397962 C=Z[k]Z=p(12365)Z=C[Z]Z=Z(C)I=Z else N=p(12719)k=u[N]N=p(12783)Z=k[N]k=Z()k=p(12625)N=p(12839)Z=u[k]k=Z(N)Z=false o=Z and 1993181 or 9619230 end else I=z[r[1]]C=z[r[2]]o=I[C]I=p(12609)I=o[I]I=I(o)o=z[r[1]]C=nil I=z[r[2]]o[I]=C o=1718128 end end else if o<9666789 then if o<9661442 then if o<9658213 then V=p(12272)g=p(12041)g=a[g]g=g(a,V)X=g Y=W o=g and 5498851 or 2084761 else o=2734252 Y=z[r[6]]l=not Y y=l end else o=I and 10929810 or 14147827 end else if o<9682672 then if o<9670775 then N=p(12670)o=z[r[1]]k=z[r[2]]y=z[r[3]]Z=p(12252)C={[Z]=k,[N]=y}I=o(C)o=10841915 else o=k N=.75 k=nil y=1.1 I=p(12346)I=o[I]I=I(o,C,Z,k,N,y)o=u[p(12581)]I={}end else I=z[r[1]]k=p(12547)o=I[k]I=p(12786)I=o[I]I=I(o)o=5533142 end end end else if o<9751223 then if o<9719473 then if o<9716236 then if o<9707561 then I=z[r[1]]C=p(12742)o=I[C]I=p(12786)I=o[I]I=I(o)I=p(12742)o=z[r[1]]C=nil o[I]=C o=16652759 else W=z[r[3]]N=o y=not W k=y o=y and 4358880 or 9482830 end else o=3061995 end else if o<9744920 then if o<9728909 then o=Y a=o X=p(12281)X=C[X]g=p(12128)X=X(C,g)o=X and 15565833 or 3645659 Y=X else I={k}o=u[p(12775)]end else o={}Z=1 k=z[r[9]]C=o N=k k=1 y=k k=0 W=y<k k=Z-y o=9848705 end end else if o<9780817 then if o<9758007 then if o<9751245 then m=p(12111)Q=X[m]m=0 P=Q>m D=P t=o o=P and 12360064 or 4425927 else o=I and 15335637 or 10943395 end else Y=p(12721)W=p(12407)I=z[r[10]]a=2 l=z[Z]y={[W]=l,[Y]=a}N=I(y)o=5300216 end else if o<9784649 then if o<9783740 then N=p(12281)y=p(12280)o=4196410 N=k[N]N=N(k,y)I=N else o=I and 7419343 or 15026911 end else Z=z[r[1]]C=not Z o=C and 7872311 or 13117 I=C end end end end else if o<9883235 then if o<9832121 then if o<9804989 then if o<9797651 then if o<9794689 then o=p(12310)o=C[o]o=o(C)N=p(12369)X=p(12801)k=o I=Z[N]Y=p(12801)o=p(12011)y=p(12369)o=k[o]o=o(k,I)I=u[y]y=p(12810)N=o o=I[y]l=z[r[1]]W=l[Y]l=p(12336)y=W[l]a=z[r[1]]Y=a[X]a=p(12778)l=Y[a]Y=99999 W=l+Y a=z[r[1]]X=p(12801)Y=a[X]a=p(12012)l=Y[a]I=o(y,W,l)W=p(12673)W=N[W]y=I o=p(12515)W=W(N)o=C[o]I=y*W o=o(C,I)I=1 W=3 l=W o=6484622 W=1 Y=W W=0 a=Y<W W=I-Y else y=p(12609)N=z[r[9]]y=N[y]o=13756135 y=y(N)N=nil z[r[9]]=N end else if o<9800947 then N=p(12409)I=u[N]N=p(12810)o=I[N]y=p(12833)N=p(12207)I=o(N)o=p(12270)N=I I=y..C y=p(12346)N[o]=I o=p(12299)o=k[o]o=o(k,N)z[r[2]]=o I=z[r[2]]y=I[y]o=Z and 1658216 or 8412406 y=y(I)else I={}o=u[p(12234)]end end else if o<9822910 then if o<9819634 then o=9619230 else g=p(12122)X=C[g]o=15815186 a=X[l]X=p(12350)Y=a[X]I=Y end else Z,y=k(C,Z)o=Z and 10386192 or 2241669 end end else if o<9848765 then if o<9847479 then if o<9846838 then o=z[r[2]]I=p(12786)I=o[I]I=I(o)o=9799630 else I=z[r[10]]o=I and 9780481 or 5300216 end else k=k+y Z=k<=N l=not W Z=l and Z l=k>=N l=W and l Z=l or Z l=12385572 o=Z and l Z=3029476 o=o or Z end else if o<9877262 then if o<9854966 then o=xy o=173055 I=sy else W=0 o=z[r[2]]k=p(12328)I=p(12350)Z=u[k]o[I]=Z y=3 N=p(12002)Z=p(12801)I=C[Z]k=u[N]N=p(12810)Z=k[N]N=0 k=Z(N,y,W)o=I+k Z=o I=p(12041)o=z[r[2]]I=o[I]k=p(12272)I=I(o,k)o=I and 11979230 or 7657874 end else o=u[p(12427)]I={}end end end else if o<9914000 then if o<9904941 then if o<9901703 then if o<9890310 then I=z[r[1]]C=x[1]Z=p(12810)o=I[Z]Z=p(12796)I=o(Z)o=p(12737)o=I[o]Z=p(12642)W=p(12356)y=p(12031)py=p(12409)o=o(I)q=p(12474)I=u[Z]k=z[r[2]]X=p(12425)W=k[W]N={W(k,y)}Z=I(s(N))I=p(12258)k=e()o=Z[I]V=p(12425)I=p(12642)N=e()F=e()Z=e()z[Z]=o o=B(6911457,{r[3]})z[k]=o o=d(10365583,{r[3]})M=18699545564 z[N]=o D=p(12425)o=u[I]a=z[r[2]]Y=a[X]a=p(12662)l=Y[a]Y=p(12638)i=e()W=l[Y]g=p(12425)l=p(12286)y=W[l]I=o(y)y=e()z[y]=I I=p(12642)P=p(12425)o=u[I]X=z[r[2]]a=X[g]X=p(12662)Y=a[X]a=p(12638)l=Y[a]Y=p(12012)W=l[Y]I=o(W)W=e()z[W]=I I=p(12642)o=u[I]g=z[r[2]]X=g[V]Q=18699541378 g=p(12662)a=X[g]sy=p(12049)X=p(12638)Y=a[X]a=p(12654)H=e()l=Y[a]I=o(l)l=e()z[l]=I I=p(12642)o=u[I]V=z[r[2]]g=V[D]V=p(12662)X=g[V]g=p(12638)oy=p(12409)a=X[g]X=p(12437)Y=a[X]I=o(Y)Y=e()m=18699542775 z[Y]=I I=p(12642)t=p(12425)o=u[I]D=z[r[2]]V=D[t]D=p(12662)g=V[D]V=p(12638)X=g[V]g=p(12055)a=X[g]I=o(a)a=e()z[a]=I I=p(12642)o=u[I]t=z[r[2]]h=e()D=t[P]t=p(12662)V=D[t]D=p(12638)g=V[D]A=p(12409)V=p(12324)n=p(12424)X=g[V]D=e()V=e()t=e()I=o(X)o=0 X=e()z[X]=I g=e()z[g]=o o=true z[V]=o o=nil z[D]=o o=false f=18637217215 I=18699539486 z[t]=o o=nil P=e()v=18637209873 z[P]=o o={I;Q;m;M}Q=e()I=p(12012)z[Q]=o R=18686496907 m=18637207623 M=p(12644)o={[I]=m,[M]=R,[n]=v,[q]=f}R=e()E=e()m=e()z[m]=o n=e()o=18686500373 uy=p(12409)b=e()M=e()z[M]=o o=18686502223 z[R]=o v=e()q=e()o=18637214138 z[n]=o o=18637218777 f=e()z[v]=o o=nil z[q]=o o=nil z[f]=o o=nil z[F]=o o=nil z[H]=o o=false z[i]=o I=u[py]ry=p(12318)py=p(12810)o=I[py]py=p(12722)I=o(py)py=e()o=false T=e()z[py]=I z[b]=o I=u[A]A=p(12810)o=I[A]A=p(12722)I=o(A)o=false A=e()z[A]=I z[h]=o I=u[uy]uy=p(12810)o=I[uy]uy=p(12722)I=o(uy)o={}uy=e()z[uy]=I z[T]=o o=nil z[E]=o I=u[oy]oy=p(12810)o=I[oy]oy=p(12207)I=o(oy)oy=e()z[oy]=I o=z[oy]I=p(12270)o[I]=sy xy=z[r[3]]sy=xy[ry]ry=p(12459)xy=p(12281)xy=sy[xy]xy=xy(sy,ry)I=xy o=xy and 6476768 or 5646628 else y=nil W=nil o=13976442 end else W=p(12801)y=Z[W]k=I N=k-y y=p(12762)I=N[y]N=450 o=I>N o=o and 12650093 or 5180926 end else if o<9908234 then if o<9905610 then Z=z[r[1]]C=not Z o=C and 13558364 or 16641492 I=C else I={}o=u[p(12561)]end else o=z[r[4]]I=o()o=2286953 end end else if o<9930759 then if o<9927027 then if o<9921832 then o=I and 16513794 or 15588665 else I={}o=u[p(12535)]end else Z,y=k(C,Z)o=Z and 7134538 or 8194826 end else if o<9936676 then if o<9933749 then I=z[r[1]]C=x[1]Z=p(12810)W=p(12425)o=I[Z]Z=p(12047)I=o(Z)o=p(12737)o=I[o]o=o(I)y=z[r[2]]N=y[W]y=p(12662)k=N[y]N=p(12051)Z=k[N]k=p(12091)I=Z[k]Z=p(12415)k=p(12799)o=I[Z]Z=o I=p(12281)I=Z[I]I=I(Z,k)o=not I o=o and 11808853 or 14175829 else Z=z[r[1]]C=not Z o=C and 13463477 or 11347836 I=C end else D=g t=o o=g and 538758 or 13209860 end end end end end else if o<10141301 then if o<10045505 then if o<10015056 then if o<9966115 then if o<9958262 then if o<9943702 then C=z[r[4]]o=C and 11002651 or 6651407 else I={k}o=u[p(12040)]end else if o<9963501 then Z=e()I=p(12822)o=p(12281)o=C[o]o=o(C,I)z[Z]=o I=z[Z]o=not I o=o and 2809975 or 5706341 else o=y and 6653350 or 11457700 N=Z end end else if o<10005430 then if o<9983849 then I=p(12822)o=p(12281)o=C[o]o=o(C,I)Z=o o=not Z o=o and 4397257 or 6229837 else I={}o=u[p(12635)]end else I={}o=u[p(12275)]end end else if o<10023045 then if o<10020520 then if o<10019940 then l=c(l)o=11330117 W=nil else Z=o N=z[r[2]]k=not N C=k o=k and 6904918 or 7284632 end else o=I and 2677233 or 4686636 end else if o<10033947 then if o<10025961 then o=7449725 k=z[r[1]]N=p(12007)Z=k[N]C=not Z I=C else y=p(12670)o=z[r[4]]N=p(12305)W=z[r[5]]k={[N]=Z;[y]=W}C=nil I=o(k)k=p(12719)I=u[k]k=p(12783)o=I[k]I=o()Z=nil o=14026734 end else n=p(12639)M=p(12695)o=u[M]R=u[n]M=o(R)o=p(12398)u[o]=M o=14415075 end end end else if o<10077702 then if o<10061218 then if o<10048022 then if o<10045954 then Z=z[r[1]]C=not Z I=C o=C and 1588701 or 13636067 else C=k o=N o=901666 end else I=z[r[1]]k=z[C]o=I[k]o=o and 15096276 or 4089702 end else if o<10074258 then if o<10072941 then xy=o Gy=z[r[3]]wy=p(12252)ry=Gy[wy]o=ry and 14841628 or 9848862 sy=ry else I=z[r[1]]C=p(12252)o=I[C]C=o I=C o=C and 15072882 or 9053538 end else f=i A=p(12290)b=p(12041)b=py[b]b=b(py,A)o=b and 4808057 or 16060070 end end else if o<10102304 then if o<10098992 then if o<10092453 then o=8793759 else N=p(12409)k=I I=u[N]N=p(12810)o=I[N]N=p(12207)I=o(N)o=p(12270)N=I I=p(12241)N[o]=I o=p(12299)o=k[o]o=o(k,N)k=nil y=o o=p(12045)I=false y[o]=I o=p(12346)o=y[o]o=o(y)W=y I=p(12547)o=z[r[1]]o[I]=W W=J(15232284,{r[1];r[3]})I=p(12178)o=y[I]N=nil I=p(12573)I=o[I]y=nil I=I(o,W)o=8908141 end else I=p(12801)o=Z[I]k=o I=p(12310)W=p(12002)I=C[I]I=I(C)a=p(12801)g=p(12801)N=p(12801)o=I[N]N=o o=N-k I=u[W]y=o W=p(12810)o=I[W]Y=z[r[1]]l=Y[a]Y=p(12336)W=l[Y]X=z[r[1]]a=X[g]g=p(12801)X=p(12778)Y=a[X]a=99999 l=Y+a X=z[r[1]]a=X[g]X=p(12012)Y=a[X]I=o(W,l,Y)Y=p(12369)l=u[Y]W=I Y=p(12810)I=l[Y]Y=W+y o=p(12515)o=C[o]l={I(Y)}I=1 o=o(C,s(l))l=3 Y=l l=1 a=l o=10648057 l=0 X=a<l l=I-a end else if o<10135169 then if o<10118803 then Z=I o=Z and 3463704 or 6897612 else N=p(12802)k=z[r[1]]Z=k[N]o=11156953 C=not Z I=C end else o=3610442 end end end end else if o<10263067 then if o<10216929 then if o<10177741 then if o<10173341 then if o<10146693 then D=p(12328)V=u[D]D=p(12370)g=V[D]a=g o=8172360 else Z=p(12252)o=z[r[1]]k=z[r[2]]y=z[r[3]]N=p(12670)C={[Z]=k,[N]=y}I=o(C)o=16463870 end else o=u[p(12516)]I={}end else if o<10215354 then if o<10201677 then o=u[p(12443)]I={}else I={}o=u[p(12183)]end else y=p(12153)N=C[y]Y=p(12585)l=u[Y]o=6327781 Y=p(12153)W=l[Y]l=p(12468)y=W[l]k=N==y I=k end end else if o<10232285 then if o<10221461 then if o<10219244 then o=k z[r[3]]=I o=5256345 else o=15520058 k=z[r[6]]Z=k==C I=Z end else a=p(12350)o=12674431 Y=z[r[5]]l=Y[a]y=l end else if o<10256333 then if o<10248455 then l=p(12368)o=u[l]X=z[r[1]]g={o(X)}l=g[1]o=6151608 Y=g[2]a=g[3]else o=13176767 y=p(12153)Y=p(12585)N=C[y]l=u[Y]Y=p(12153)W=l[Y]l=p(12671)y=W[l]k=N==y I=k end else o=I and 257226 or 4360275 end end end else if o<10322291 then if o<10300202 then if o<10290940 then if o<10270031 then o=7773285 k=z[r[1]]N=p(12350)Z=k[N]C=not Z I=C else o=3805161 C=nil end else l=I o=not l o=o and 6354312 or 13654174 end else if o<10308816 then if o<10308416 then I=z[r[3]]o=p(12299)o=C[o]o=o(C,I)z[r[2]]=o o=u[p(12696)]I=z[r[2]]k=true Z=p(12346)Z=I[Z]Z=Z(I)Z=p(12045)I=z[r[2]]C=nil I[Z]=k I={}else o=u[p(12230)]I={y}end else y=p(12833)C=x[1]l=p(12695)o=z[r[1]]W=u[l]Z=x[2]l=W(C)N=y..l y={o(N)}k=y[2]I=y[1]N=I I=N o=N and 6166727 or 4435317 end end else if o<10340599 then if o<10328199 then if o<10327557 then X=p(12280)o=p(12855)o=a[o]o=o(a,X)g=p(12822)X=o o=p(12281)o=a[o]V=X o=o(a,g)g=o o=X and 9751232 or 15837471 else o=W and 10308648 or 11623445 end else M=nil o=8070368 V=nil Q=nil m=nil end else if o<10359105 then if o<10354317 then o=u[p(12476)]I={}else I=p(12368)C=x[1]Z=x[2]o=u[I]W=p(12508)W=C[W]y={W(C)}W={o(s(y))}I=W[1]k=W[2]N=W[3]o=5544655 y=I end else o=nil I={o;k}o=u[p(12297)]end end end end end end end else if o<11331776 then if o<10832122 then if o<10658948 then if o<10569343 then if o<10439681 then if o<10387997 then if o<10371490 then if o<10367591 then C=x[1]o={}Z=x[2]I=p(12328)k=o o=u[I]N=p(12617)I=p(12281)I=o[I]I=I(o,N)N=I o=not N o=o and 14660365 or 8585092 else M=p(12530)M=m[M]M=M(m)o=3100483 end else if o<10386191 then o=I and 8583793 or 15562782 else Y=p(12343)N=Z l=p(12041)l=y[l]l=l(y,Y)W=l o=l and 14377013 or 10328109 end end else if o<10420161 then if o<10393794 then R,q=n(M,R)o=R and 10699453 or 15285547 else Y=p(12444)l=z[r[3]]W=l[Y]l=p(12801)o=4718382 y=W[l]k=y end else v=nil py=p(12801)f=p(12410)uy=p(12489)F=p(12481)o=z[r[4]]f=o[f]f=f(o,q,F)A=p(12002)F=20 o=p(12095)f=p(12836)oy=50 o=q[o]H=p(12369)o=o(q,f,F)o=p(12636)f=p(11996)F=p(12328)q[o]=f o=p(12350)f=u[F]q[o]=f F=u[H]H=p(12810)f=F[H]i=Z[py]b=u[A]A=p(12810)E=p(12489)py=b[A]T=50 h=u[uy]uy=p(12413)A=h[uy]uy=-50 h=A(uy,T)A=10 T=u[E]E=p(12413)uy=T[E]E=-50 T={uy(E,oy)}b=py(h,A,s(T))H=i+b o=p(12515)F={f(H)}o=q[o]o=o(q,s(F))o=z[V]f=o(q)q=nil o=10392801 end end else if o<10491226 then if o<10479902 then if o<10479594 then I={}C=nil o=u[p(12564)]Z=nil else I=p(12070)o=z[r[1]]I=o[I]I=I(o)o=I and 16086083 or 5931922 Z=x[2]C=x[1]end else F=p(12368)f=u[F]o=8590604 py={f(q)}i=py[3]F=py[1]H=py[2]end else if o<10565864 then if o<10506634 then y=p(12833)N=p(12409)I=u[N]N=p(12810)o=I[N]N=p(12207)I=o(N)N=I I=y..C o=p(12270)N[o]=I o=p(12299)o=k[o]o=o(k,N)y=p(12346)z[r[2]]=o I=z[r[2]]y=I[y]o=Z and 8279685 or 15741668 y=y(I)else C=p(12830)I=z[r[1]]o=I[C]o=o and 8042379 or 2800161 end else o=u[p(12664)]I={}end end end else if o<10633798 then if o<10596205 then if o<10590903 then if o<10589935 then Z=p(12810)I=z[r[1]]C=x[1]l=p(12425)o=I[Z]Z=p(12263)I=o(Z)o=p(12737)o=I[o]o=o(I)I=p(12642)C=nil o=u[I]W=z[r[2]]y=W[l]Y=p(12425)W=p(12662)N=y[W]y=p(12285)k=N[y]N=p(12457)Z=k[N]I=o(Z)Z=e()z[Z]=I I=p(12642)o=u[I]l=z[r[2]]W=l[Y]l=p(12662)y=W[l]W=p(12285)l=e()N=y[W]y=p(12803)g=1166 W=e()k=N[y]I=o(k)X=p(12441)N=e()o=false k=e()z[k]=I z[N]=o y=e()o=false z[y]=o o=false z[W]=o o=L(1793715,{r[3]})Y=e()a=e()z[l]=o o=S(15818332,{})z[Y]=o o=J(9935381,{y;N;W;l,Y,k,r[3];Z})z[a]=o I=z[r[4]]o=I[X]I=p(12573)X=S(2297598,{r[4];y,a})k=c(k)I=o[I]I=I(o,X)X=p(12408)I=z[r[4]]o=I[X]X=d(10479635,{r[4];y,a})I=p(12573)I=o[I]I=I(o,X)X=p(12409)I=u[X]X=p(12810)o=I[X]X=p(12343)I=o(X)X=I I=p(12112)o=p(12628)Y=c(Y)X[o]=I I=false o=p(12405)X[o]=I o=p(12095)I=p(12836)o=X[o]o=o(X,I,g)I=p(12343)l=c(l)o=p(12636)X[o]=I I=p(12238)o=X[I]g=L(12112391,{y,a})I=p(12573)a=c(a)I=o[I]I=I(o,g)I=p(12088)g=J(15429099,{y,W})o=X[I]I=p(12573)Z=c(Z)V=p(12318)I=o[I]I=I(o,g)g=B(5097914,{y;N,W})N=c(N)I=p(12531)W=c(W)o=X[I]I=p(12573)I=o[I]I=I(o,g)g=z[r[3]]I=g[V]o=p(12350)X[o]=I y=c(y)I={}X=nil o=u[p(12062)]else Z,y=k(C,Z)o=Z and 4266893 or 3477572 end else Z=p(12742)I=z[r[1]]o=I[Z]I=p(12786)I=o[I]Z=nil I=I(o)I=p(12742)o=z[r[1]]o[I]=Z o=7856780 end else if o<10614502 then if o<10611380 then I=p(12281)I=C[I]Z=p(12280)I=I(C,Z)Z=I o=Z and 10904479 or 5256345 else o=p(12281)o=a[o]X=p(12822)g=p(12280)o=o(a,X)X=o o=p(12855)V=X o=a[o]o=o(a,g)g=o o=X and 9937606 or 10756048 end else o=15117914 end end else if o<10650620 then if o<10647725 then if o<10643006 then C=z[r[1]]I=C o=C and 11756040 or 9751263 else o=16204961 Y=nil a=nil end else g=not X l=l+a I=l<=Y I=g and I g=l>=Y g=X and g I=g or I g=12292190 o=I and g I=4519145 o=o or I end else if o<10653815 then if o<10653569 then y=p(12029)I=p(12368)o=u[I]k=z[r[1]]y=k[y]N={y(k)}k={o(s(N))}C=k[2]I=k[1]o=9827727 Z=k[3]k=I else k=z[r[2]]I=k o=k and 968693 or 3600776 end else o=u[p(12145)]I={}end end end end else if o<10719355 then if o<10694322 then if o<10683545 then if o<10672229 then if o<10661624 then o=z[r[4]]I=p(12369)Z=z[r[1]]k=p(12369)C=Z[k]o[I]=C o=4150827 else o=z[r[2]]I=p(12786)I=o[I]I=I(o)o=10308051 end else if o<10682400 then y=p(12153)Y=p(12585)N=C[y]l=u[Y]Y=p(12153)W=l[Y]l=p(12468)y=W[l]k=N==y o=k and 6885120 or 3256119 I=k else o=z[r[4]]I=o()o=1655528 end end else if o<10687579 then if o<10687042 then C=p(12719)I=u[C]C=p(12783)o=I[C]I=o()o=z[r[4]]o=o and 2378114 or 3328818 else Y=z[r[5]]l=not Y W=o o=l and 9661412 or 2734252 y=l end else I=p(12524)N=p(12620)W=p(12113)Z=p(12738)g=L(7212686,{r[8];r[2];r[9],r[12]})y=p(12174)C={Z}Z=p(12834)l=B(3114090,{r[1];r[2];r[3];r[4],r[5],r[6],r[7]})a=B(3019704,{r[8];r[2],r[9],r[10];r[11]})k={[N]=y;[W]=l}W=p(12620)N=p(12150)X=p(12113)l=p(12867)Y=p(12113)y={[W]=l;[Y]=a}Y=p(12620)W=p(12447)a=p(12256)l={[Y]=a,[X]=g}o={[I]=C;[Z]=k;[N]=y;[W]=l}I={o}o=u[p(12537)]end end else if o<10705870 then if o<10701504 then if o<10698949 then I={}o=u[p(12605)]else v=R py=p(12508)f=p(12368)py=q[py]o=u[f]i={py(q)}py={o(s(i))}H=py[3]f=py[1]F=py[2]o=13602586 end else o=z[r[3]]I=o()C=I o=not C o=o and 7154515 or 521094 end else if o<10717494 then if o<10713801 then o=u[p(12522)]I={}else W=p(12585)k=p(12779)I=C[k]y=u[W]W=p(12779)N=y[W]y=p(12336)k=N[y]o=I==k o=o and 9910766 or 10682225 end else l=nil W=nil o=13682357 y=nil end end end else if o<10806698 then if o<10764788 then if o<10753553 then if o<10726724 then o=N C=k o=1779981 else l=p(12084)Z=e()Y=p(12318)k=e()z[Z]=x[2]C=x[1]z[k]=x[3]N=p(12409)I=u[N]N=p(12810)o=I[N]N=p(12343)I=o(N)N=I I=C o=p(12628)N[o]=I l=C[l]o=p(12405)I=false N[o]=I W=z[r[1]]l=l(C)y=W[l]W=1173 I=y or W y=I W=p(12836)I=p(12095)I=N[I]I=I(N,W,y)W=p(12343)I=p(12636)N[I]=W l=z[r[2]]I=p(12350)W=l[Y]l=p(12088)N[I]=W W=e()I=false Y=O(9605210,{W})z[W]=I I=N[l]l=p(12573)l=I[l]l=l(I,Y)Y=L(6283375,{W})l=p(12531)I=N[l]l=p(12573)l=I[l]l=l(I,Y)l=p(12238)Y=O(12040362,{W,k})I=N[l]l=p(12573)l=I[l]l=l(I,Y)l=z[r[2]]o=u[p(12805)]Y=p(12419)I=l[Y]Y=J(10809066,{Z,k})l=p(12573)l=I[l]l=l(I,Y)I={N}end else o=V and 330748 or 5390353 end else if o<10799027 then if o<10796117 then Z=z[r[2]]o=2368394 C=not Z I=C else A=p(12508)F=p(12723)f=u[F]py=z[M]A=py[A]b={A(py)}py={f(s(b))}i=py[3]H=py[2]F=py[1]o=765037 end else N=o W=z[r[3]]y=not W o=y and 11741602 or 14509572 k=y end end else if o<10816044 then if o<10814604 then if o<10809551 then C=x[1]I=p(12084)I=C[I]I=I(C)Z=z[r[1]]o=I==Z o=o and 12556761 or 11195294 else g=p(12041)V=p(12475)X=z[a]g=X[g]g=g(X,V)o=16069870 I=g end else Z=nil o=u[p(12579)]C=nil I={}end else if o<10831499 then if o<10822575 then a=e()g=65 D=p(12080)M=p(12695)z[a]=I X=3 t=L(14579412,{})o=z[l]I=o(X,g)X=e()o=0 g=o z[X]=I o=0 I=u[D]D={I(t)}V=o I=2 o={s(D)}D=o o=D[I]t=o I=p(12395)o=u[I]P=z[k]m=u[M]M=m(t)m=p(12250)Q=P(M,m)P={Q()}I=o(s(P))P=e()z[P]=I I=1 Q=z[X]m=Q Q=1 M=Q Q=0 R=M<Q Q=I-M o=1906874 else y=p(12742)o=10386098 N=z[r[1]]k=N[y]N=p(12622)Z=k[N]I=Z end else N=z[r[1]]y=p(12350)Z=o k=N[y]o=k and 8449704 or 2196080 C=k end end end end end else if o<11100632 then if o<10950679 then if o<10898432 then if o<10855152 then if o<10836254 then if o<10833448 then o=z[r[3]]I=o()o=12590321 else y=p(12544)I=p(12723)y=C[y]o=u[I]N={y(C)}y={o(s(N))}o=12359853 I=y[1]N=I Z=y[2]k=y[3]end else if o<10844859 then o=u[p(12651)]I={}else o=5210820 W=z[r[4]]y=not W k=y end end else if o<10882993 then if o<10872499 then N=p(12742)k=z[r[1]]Z=k[N]o=Z and 4185644 or 5138140 I=Z else C=e()Z=p(12199)z[C]=x[1]I=z[C]o=I[Z]o=o and 3942701 or 14609582 end else I={}o=u[p(12081)]end end else if o<10924590 then if o<10915428 then if o<10904778 then N=p(12281)N=Z[N]k=o y=p(12755)N=N(Z,y)I=N o=N and 10217832 or 7486764 else Z=z[r[1]]C=not Z I=C o=C and 7773285 or 10263162 end else Z=z[r[2]]k=z[r[3]]C=Z==k I=C o=15504397 end else if o<10942239 then if o<10937597 then I=p(12080)k=B(5676351,{Z})o=u[I]I=o(k)o=14147827 else k=z[r[2]]C=k Z=o o=k and 12001169 or 15482421 end else o=u[p(12553)]I={}end end end else if o<11002812 then if o<10972455 then if o<10965968 then if o<10959659 then o=15318185 b=p(12508)F=p(12723)f=u[F]b=m[b]py={b(m)}b={f(s(py))}F=b[1]H=b[2]i=b[3]else o=z[r[1]]o=o and 9161563 or 10706113 end else Z=false o=z[r[2]]I=o(C,Z)o=z[r[3]]I=o(C)o=3610442 end else if o<10986234 then if o<10984790 then o=z[r[5]]I=o()o=3419034 else N=z[r[2]]Z=o k=not N C=k o=k and 14223571 or 1779981 end else Z=p(12786)o=6651407 C=z[r[4]]Z=C[Z]Z=Z(C)C=nil z[r[4]]=C end end else if o<11054336 then if o<11028053 then if o<11020512 then W=z[y]I=W o=8273476 else C=p(12719)I=u[C]C=p(12392)o=I[C]C=z[r[1]]I=o(C)o=2736396 end else R=l o=1544205 end else if o<11086064 then if o<11068445 then o=p(12530)o=l[o]o=o(l)o=10718255 else o=u[p(12000)]I={}end else o=X o=a and 10820724 or 15963149 I=a end end end end else if o<11210281 then if o<11156522 then if o<11133461 then if o<11126733 then if o<11110175 then Z=z[r[1]]C=not Z o=C and 15663186 or 12895097 I=C else I=p(12689)Z=p(12134)o=u[I]C=z[r[1]]Z=o[Z]I={Z(o,C)}I={s(I)}o=u[p(12099)]end else if o<11127721 then o=1922192 C=c(C)else o=I and 9065599 or 195546 end end else if o<11154348 then if o<11139559 then o=u[p(12446)]I={}else o=z[r[1]]y=o W=z[r[2]]k=o o=W and 1632619 or 4024025 N=W C=p(12311)end else Z=p(12822)I=p(12281)I=C[I]I=I(C,Z)Z=e()z[Z]=I k=z[Z]I=not k o=I and 15193707 or 12379055 end end else if o<11182032 then if o<11167242 then if o<11162551 then o=I and 12039168 or 5906573 else C=x[1]o=not C o=o and 14170172 or 16758769 end else f=i f=nil A=true o=8590604 b=p(12450)py[b]=A py=nil end else if o<11204534 then if o<11195605 then o=u[p(12236)]C=nil I={}else I=p(12368)o=u[I]N=z[C]W=p(12029)W=N[W]y={W(N)}N={o(s(y))}I=N[1]k=N[3]Z=N[2]N=I o=13976442 end else k=p(12503)C=z[r[1]]Z=p(12281)Z=C[Z]Z=Z(C,k)I=Z o=Z and 2178064 or 10021455 end end end else if o<11261394 then if o<11224827 then if o<11216470 then if o<11211514 then I={}o=u[p(12736)]else Z=false o=z[r[3]]I=o(C,Z)Z=p(12350)k=p(12328)I=C[Z]Z=u[k]o=I==Z o=o and 15739731 or 2703492 end else o=u[p(12187)]I={}end else if o<11245621 then if o<11237533 then o=z[r[5]]I=o()o=4083076 else o=z[r[1]]I=p(12070)C=x[1]I=o[I]I=I(o)Z=x[2]o=I and 13157705 or 6433763 end else y=k W=o o=k and 13440961 or 11977351 end end else if o<11307730 then if o<11306604 then if o<11287476 then k=nil N=c(N)y=nil o=9263650 Z=c(Z)else a=p(12689)Y=u[a]X=p(12403)o=15069327 a=p(12394)a=Y[a]a=a(Y,X)W=a end else k=p(12350)o=4978944 Z=z[r[1]]C=Z[k]I=C end else if o<11328219 then if o<11323004 then Y=p(12719)l=u[Y]Y=p(12783)y=nil k=c(k)W=l[Y]I={}Z=c(Z)Y=.5 N=c(N)l=W(Y)W=false o=u[p(12072)]z[r[2]]=W C=nil else Z=z[r[1]]C=not Z o=C and 6660722 or 1696326 I=C end else y,l=k(N,y)o=y and 12269229 or 8402758 end end end end end end else if o<11834480 then if o<11608387 then if o<11453499 then if o<11367463 then if o<11340806 then if o<11334151 then if o<11332540 then R=a D={[t]=P;[Q]=m}t=p(12196)o=M Q=p(12607)M=p(12169)m=p(12281)m=W[m]n=o m=m(W,M)M=p(12574)o=a and 1544205 or 11034067 else D=o g=p(12281)g=W[g]V=p(12681)g=g(W,V)V=g o=g and 6654397 or 11787007 end else if o<11337762 then I={}o=u[p(12557)]else a=false N=p(12407)l=1.5 o=z[r[1]]k=z[r[2]]X=p(12842)Y=p(12792)Z=p(12147)D=p(12366)y=z[r[3]]W=p(12137)V=z[r[4]]g=V[D]C={[Z]=k;[N]=y;[W]=l;[Y]=a,[X]=g}I=o(C)I={}o=u[p(12211)]end end else if o<11351938 then if o<11347857 then o=13463477 C=z[r[2]]I=C else I=true o=nil Z=o z[r[1]]=o z[r[2]]=I k=z[r[3]]C=k o=k and 2086556 or 12129108 end else X=o V=p(12496)g=u[V]o=g and 15899941 or 5415928 a=g end end else if o<11401507 then if o<11382762 then if o<11371510 then Z=p(12135)I=z[r[1]]o=I[Z]I=p(12609)I=o[I]Z=nil I=I(o)o=z[r[1]]I=p(12135)o[I]=Z o=5603215 else N=p(12409)k=u[N]N=p(12810)Z=k[N]N=p(12755)o=2016341 k=Z(N,C)I=k end else f=p(12232)v=o q=u[f]o=q and 16643111 or 9541837 n=q end else if o<11438717 then if o<11410308 then v=z[r[4]]q=p(12252)R=o n=v[q]M=n o=n and 6366955 or 14595478 else o=xy o=6476768 I=sy end else o=u[p(12380)]I={}end end end else if o<11486203 then if o<11474328 then if o<11459476 then if o<11455968 then l=z[r[15]]o=15402550 Y=l()else o=5907269 N=nil y=nil end else Z=p(12252)o=true z[r[1]]=o C=z[r[2]]I=C[Z]C=I o=C and 8658715 or 1615894 end else if o<11482867 then if o<11481505 then D=p(12628)V=W[D]D=p(12084)D=V[D]X=a D=D(V)o=D==g o=o and 4451840 or 14771064 else k=nil o=8446016 end else o=p(12281)o=C[o]I=p(12822)o=o(C,I)Z=o o=not Z o=o and 33027 or 4603789 end end else if o<11560766 then if o<11533923 then if o<11496248 then o=z[r[3]]I=o()o=2286953 else X=1164 a=p(12409)I=u[a]a=p(12810)o=I[a]a=p(12343)I=o(a)o=p(12628)a=I I=p(12649)a[o]=I I=false o=p(12405)a[o]=I o=p(12095)N=c(N)y=c(y)o=a[o]I=p(12836)o=o(a,I,X)X=O(4599621,{k;l})o=p(12636)C=nil g=p(12318)I=p(12343)a[o]=I I=p(12238)o=a[I]I=p(12573)I=o[I]I=I(o,X)I=p(12088)X=S(6889221,{k})o=a[I]l=c(l)W=c(W)I=p(12573)I=o[I]I=I(o,X)I=p(12531)X=J(1404969,{k;Z})o=a[I]I=p(12573)I=o[I]k=c(k)I=I(o,X)X=z[r[3]]Z=c(Z)o=p(12350)Y=nil I=X[g]a[o]=I o=u[p(12269)]I={}a=nil end else V=z[r[11]]g=not V a=g X=o o=g and 5813843 or 5157502 end else if o<11591529 then if o<11580500 then o=nil I={o}o=u[p(12340)]else o=z[r[1]]I=p(12007)Z=true o[I]=Z Z=p(12366)I=z[r[1]]o=I[Z]Z=true I=p(12663)o[I]=Z I=z[r[2]]Z=p(12252)o=I[Z]I=p(12855)Z=p(12280)I=o[I]I=I(o,Z)Z=I o=Z and 1394600 or 8908141 end else k=e()Z=x[2]C=e()z[C]=x[1]z[k]=x[3]y=O(16547607,{C;k,r[3]})o=z[r[1]]C=c(C)k=c(k)I=o()N=83204770964519 o=z[r[2]]Z=nil I=o(N,y)o=u[p(12129)]I={}end end end end else if o<11718157 then if o<11691277 then if o<11635821 then if o<11623081 then if o<11620916 then N=z[r[9]]a=p(12801)Y=p(12424)l=z[r[10]]W=l[Y]l=false y=N(W,l)W=p(12409)y=u[W]W=p(12810)N=y[W]l=p(12327)W=p(12722)g=1 y=N(W)N=e()W=p(12628)z[N]=y y=z[N]X=.75 y[W]=l t=1.5 Y=O(15848207,{N})y=z[N]W=p(12663)l=true y[W]=l W=p(12350)l=Z y=z[N]y[W]=l l=p(12719)W=u[l]l=p(12027)y=W[l]l=10 W=y(l,Y)P=p(12252)W=p(12346)l=p(12259)y=z[r[11]]W=y[W]Y=Z[a]a=nil W=W(y,l,Y,a,X,g)a=p(12801)l=p(12456)y=z[r[11]]Y=Z[a]g=1.2 a=nil X=.7 W=p(12346)W=y[W]W=W(y,l,Y,a,X,g)a=p(12801)y=z[r[11]]Y=Z[a]a=nil g=1 X=.65 l=p(12388)R=3 Q=p(12147)W=p(12346)W=y[W]W=W(y,l,Y,a,X,g)l=p(12719)W=u[l]l=p(12027)o=3906897 D=p(12397)y=W[l]a=p(12670)l=2.5 Y=d(12546043,{k;r[11]})W=y(l,Y)X=nil M=p(12500)Y=p(12305)g=p(12034)y=z[r[12]]N=c(N)V=z[k]m=z[r[4]]l={[Y]=Z;[a]=X,[g]=V;[D]=t,[P]=C,[Q]=m,[M]=R}Y=L(6894577,{r[1],r[13];r[14],r[2];r[15]})W=y(l)l=p(12719)W=u[l]l=p(12027)y=W[l]l=.5 W=y(l,Y)else y=p(12683)N=z[r[2]]k=N[y]N=p(12365)N=k[N]o=220018 N=N(k)Z=N end else if o<11627640 then y=nil N=nil o=9827727 else v=p(12203)q=true n=p(12281)n=m[n]n=n(m,v,q)M=n o=12795478 end end else if o<11679364 then if o<11661083 then I={}C=c(C)o=u[p(12206)]else C=nil q=z[r[4]]Z=c(Z)Q=c(Q)N=c(N)f=p(12318)R=nil l=c(l)Y=c(Y)I={}n=nil g=c(g)X=c(X)v=q[f]W=c(W)y=c(y)q=p(12768)o=v[q]M=nil k=c(k)D=c(D)a=c(a)V=c(V)v=p(12573)v=o[v]P=c(P)v=v(o,m)o=u[p(12473)]m=nil t=c(t)end else o=4306036 l=nil W=nil end end else if o<11697046 then if o<11695738 then if o<11695382 then V=1 g=a[V]X=not g o=16400155 I=X else y=4 k=z[r[5]]N=1 I=k+N z[r[5]]=I N=z[r[5]]k=N>y o=k and 480428 or 14654313 end else Z=I o=not Z o=o and 468340 or 10060316 end else if o<11716253 then if o<11711340 then o=8373558 N=p(12723)I=u[N]l={I(k)}N=l[1]W=l[3]y=l[2]else Y=true o=8681521 l=p(12858)W[l]=Y end else I=z[r[1]]Z=p(12252)C=x[1]o=I[Z]Z=o o=not Z o=o and 12040697 or 8603357 end end end else if o<11784706 then if o<11748493 then if o<11741035 then if o<11723074 then y=S(9469173,{r[7]})o=u[p(12003)]N=p(12319)Z=k[N]N=p(12573)N=Z[N]I={}N=N(Z,y)k=nil z[r[6]]=N C=nil else N=Z W=p(12829)o=p(12041)o=y[o]o=o(y,W)o=o and 14443222 or 8152462 end else o=14509572 W=z[r[4]]y=not W k=y end else if o<11776033 then if o<11766168 then Z=o N=z[r[2]]k=not N C=k o=k and 9710591 or 4658083 else I={}o=true z[r[1]]=o o=u[p(12136)]end else I={}Z=nil o=u[p(12074)]C=nil end end else if o<11799123 then if o<11787428 then if o<11786275 then N=p(12489)o=nil k=o Y=p(12029)I=u[N]N=p(12606)o=I[N]N=o Y=Z[Y]I=p(12723)o=u[I]l={Y(Z)}Y={o(s(l))}W=Y[3]o=14299492 I=Y[1]l=I y=Y[2]else o=D o=V and 2073838 or 15820080 end else W=o l=p(12847)W=p(12841)y=Z and l N=y or W y=p(12281)y=k[y]y=y(k,N)W=not y o=W and 2289191 or 7112320 end else if o<11824993 then if o<11812350 then k=p(12409)I=u[k]k=p(12810)o=I[k]k=p(12258)I=o(k)k=I I=p(12799)o=p(12628)k[o]=I o=p(12482)I=p(12404)k[o]=I I=Z o=p(12350)k[o]=I k=nil o=14175829 else W=l D=p(12483)Q=10 V=u[D]D=p(12828)g=V[D]D=z[r[5]]P=Q*W t={D(C,P)}D=p(12483)V=g(y,s(t))V=u[D]D=p(12828)Q=-10 g=V[D]D=z[r[5]]P=Q*W W=nil t={D(C,P)}V=g(y,s(t))o=2463715 end else W=p(12407)Y=p(12721)I=z[r[11]]o=14174613 l=z[Z]a=2 y={[W]=l,[Y]=a}N=I(y)end end end end end else if o<12113654 then if o<12008347 then if o<11944787 then if o<11911493 then if o<11850674 then if o<11845047 then Z=p(12719)C=u[Z]Z=p(12392)I=C[Z]Z=z[r[2]]C=I(Z)I=nil o=8497679 z[r[2]]=I else o=X and 5596287 or 14633786 end else if o<11866215 then o=false I={o}o=u[p(12355)]else y=p(12369)N=u[y]o=p(12369)y=p(12810)I=N[y]N=I(Z)k[o]=N o=11482363 end end else if o<11925073 then if o<11915463 then I=z[r[3]]C=p(12252)o=I[C]C=o o=not C o=o and 12328538 or 9973425 else o=z[r[2]]I=o()o=8052525 end else k=p(12779)I=C[k]W=p(12585)y=u[W]W=p(12779)N=y[W]y=p(12012)k=N[y]o=I==k o=o and 10832229 or 12590321 end end else if o<11973043 then if o<11967125 then if o<11962180 then k=p(12252)Z=z[r[1]]C=Z[k]o=C and 7314955 or 6942703 I=C else C=p(12252)I=z[r[3]]o=I[C]C=o o=not C o=o and 2333370 or 11485031 end else C=k o=N o=3188629 end else if o<11993338 then if o<11978831 then I=y o=W o=15351032 else I=z[r[2]]k=p(11995)o=I[k]k=o o=k and 14505769 or 7603581 end else y=p(12350)N=z[r[2]]o=15482421 k=N[y]C=k end end end else if o<12059188 then if o<12039446 then if o<12030503 then if o<12009504 then o=u[p(12452)]I={}else I={}o=u[p(12314)]end else k=p(12252)Z=z[r[2]]C=Z[k]I=C o=C and 5296982 or 16735398 end else if o<12057317 then if o<12040646 then o=z[r[1]]o=o and 7827363 or 14772180 else o=u[p(12231)]I={}end else I=z[r[3]]C=p(12252)o=I[C]C=o o=not C o=o and 1859689 or 7888974 end end else if o<12103202 then if o<12080873 then if o<12063420 then o=p(12530)o=Z[o]o=o(Z)o=p(12530)k=c(k)o=C[o]I={}Z=nil o=o(C)C=nil o=u[p(12332)]else C=p(12830)I=z[r[1]]o=I[C]o=o and 2795983 or 7385504 end else q,H=f(v,q)o=q and 2023252 or 11670097 end else if o<12112810 then if o<12112408 then o=z[r[1]]o=o and 982229 or 9907230 else W,a=l(y,W)o=W and 5259740 or 9953635 end else X=p(12731)y=z[r[8]]Y=z[r[9]]a=z[r[5]]l=Y[a]a=p(12407)Y=false W=y(l,Y)z[r[7]]=W y=z[r[10]]g=z[r[5]]Y={[a]=Z,[X]=g}l=y(Y)y=z[r[7]]o=y and 5638983 or 1025536 end end end end else if o<12210902 then if o<12176896 then if o<12151473 then if o<12128409 then if o<12119034 then o=false z[r[1]]=o I={}o=u[p(12438)]else I=z[r[1]]C=x[1]Z=x[2]o=not I o=o and 5446591 or 8558598 end else o=Z o=C and 2899468 or 6057518 end else if o<12174529 then if o<12167402 then o=z[r[2]]o=o and 9846593 or 9799630 else C=p(12252)I=z[r[3]]o=I[C]C=o o=not C o=o and 14911 or 14376204 end else o=I and 9148623 or 5823820 end end else if o<12188620 then if o<12188109 then if o<12183783 then W=nil o=3616587 y=nil else o=u[p(12008)]I={}end else o=z[r[1]]C=z[r[2]]I=o(C)I={}o=u[p(12734)]end else if o<12203120 then if o<12196969 then V=p(12593)g=p(12281)g=C[g]g=g(C,V)a=g o=4231535 else o=false z[r[2]]=o I=z[r[3]]Z=false C=p(12663)I[C]=Z Z=p(12252)C=z[r[4]]I=C[Z]C=I I=not C o=I and 194765 or 16174062 end else t=p(12801)Y=true o=16052739 N=z[r[9]]l=z[r[13]]g=p(12460)W=N(l,Y)z[r[8]]=W Y=p(12483)l=u[Y]Y=p(12828)Q=p(12346)N=l[Y]Y=z[r[11]]P=1 a=z[r[12]]D=z[Z]Q=a[Q]V=D[t]t=.8 D=nil X={Q(a,g,V,D,t,P)}l=N(Y,s(X))end end end else if o<12262420 then if o<12237246 then if o<12220113 then if o<12213148 then o=z[r[1]]o=o and 15555631 or 9467858 else M=0 C=p(12719)Y=p(12411)I=u[C]C=p(12783)N=p(12489)o=I[C]k=u[N]m=p(12104)N=p(12413)P=0 Z=k[N]k=Z()Z=.2 C=k*Z I=o(C)t=0 Z=p(12369)C=p(12810)I=z[r[1]]o=I[C]y=p(12369)W=p(12416)N=u[y]X=p(12713)a=650 D=p(12104)y=p(12810)l=2.5 k=N[y]y=z[r[2]]N=k(y)k=p(12586)n=80 y=3 V=u[D]D=p(12720)g=V[D]D=0 V=g(D,t,P)g=p(12611)P=p(12030)t=u[P]P=p(12810)D=t[P]Q=u[m]m=p(12720)P=Q[m]m=0 R=0 Q=P(m,M,R)M=p(12104)m=u[M]M=p(12720)R=80 P=m[M]M=80 m={P(M,R,n)}t=D(Q,s(m))C={[Z]=N;[k]=y,[W]=l;[Y]=a,[X]=V,[g]=t}I=o(C)o=p(12464)o=I[o]o=o(I)o=u[p(12807)]I={}end else o=u[p(12728)]I={}end else if o<12245843 then if o<12240499 then C=z[r[2]]I=C o=15235745 else C=x[1]I=p(12723)o=u[I]N=z[r[1]]W=p(12029)W=N[W]y={W(N)}N={o(s(y))}k=N[3]Z=N[2]o=3616587 I=N[1]N=I end else I=p(12855)Z=p(12343)o=z[r[2]]I=o[I]I=I(o,Z)Z=I o=Z and 5802793 or 7183744 I=Z end end else if o<12271005 then if o<12269144 then if o<12267121 then y=p(12409)N=u[y]y=p(12810)k=N[y]o=8849495 y=p(12755)N=k(y,Z)I=N else o=nil I={o}o=u[p(12273)]end else I=e()a=p(12021)W=y z[I]=l Y=u[a]a=p(12435)l=I I=Y[a]Y=I(Z,W)o=Y and 3008455 or 10019807 end else if o<12288999 then if o<12283521 then k=p(12830)I=p(12740)C=true o=z[r[1]]o[I]=C Z=z[r[1]]C=Z[k]I=C o=C and 8931412 or 14843267 else C=z[r[4]]o=C and 3030469 or 7258045 end else o=z[r[1]]I=p(12369)g=l t=p(12369)D=u[t]t=p(12810)P=p(12801)V=D[t]t=Z[P]D=V(t)o[I]=D V=p(12719)I=u[V]V=p(12783)o=I[V]V=.05 g=nil I=o(V)o=10648057 end end end end end end end end else if o<14600372 then if o<13373210 then if o<12833643 then if o<12558765 then if o<12409535 then if o<12370284 then if o<12334303 then if o<12327806 then if o<12321320 then o=true z[r[1]]=o o=u[p(12652)]I={}else o=V o=2146777 X=g end else if o<12332576 then o=11216647 C=nil Z=nil else k=p(12644)o=z[r[3]]N=p(12801)Z=z[r[4]]C=Z[k]Z=true y=.5 I=o(C,Z)o=z[r[5]]k=z[r[6]]Z=k[N]C=p(12704)N=.7 I=p(12346)I=o[I]k=nil I=I(o,C,Z,k,N,y)o=6385332 end end else if o<12360030 then if o<12345840 then Z=p(12547)I=z[r[1]]o=I[Z]I=p(12786)I=o[I]I=I(o)o=7296560 else k,W=N(Z,k)o=k and 1477084 or 16045924 end else D=g o=4425927 end end else if o<12389967 then if o<12383941 then if o<12379893 then y=false Y=1 I=z[r[5]]k=I()l=p(12801)I=z[r[6]]N=z[r[7]]k=I(N,y)I=z[r[8]]W=z[Z]y=W[l]W=nil k=p(12346)k=I[k]N=p(12659)l=.8 k=k(I,N,y,W,l,Y)N=p(12719)k=u[N]N=p(12027)I=k[N]y=O(7868574,{r[8],Z})N=.2 k=I(N,y)N=p(12719)y=O(8742599,{r[8];Z})k=u[N]N=p(12027)I=k[N]N=.5 k=I(N,y)I=z[r[9]]N=z[Z]y=120 k=I(N,y)y=0 N=#k I=N>y o=I and 1486776 or 9847392 else o=z[r[1]]I=p(12070)I=o[I]I=I(o)Z=x[2]o=I and 10178903 or 1855060 C=x[1]end else o=z[r[1]]Z=k a=255 Y=0 l=o(Y,a)C[Z]=l Z=nil o=9848705 end else if o<12400765 then if o<12397184 then I=z[r[1]]C=p(12252)o=I[C]C=o o=C and 8676951 or 5744718 I=C else o=7734167 X=nil g=nil end else Y=p(12346)D=1 g=p(12801)o=z[r[2]]Y=o[Y]a=p(12132)X=l[g]g=nil V=1.1 Y=Y(o,a,X,g,V,D)o=6894372 end end end else if o<12515907 then if o<12482901 then if o<12462484 then if o<12415787 then C=x[1]I=z[r[1]]Z=p(12252)o=I[Z]Z=o o=not Z o=o and 10001167 or 8843186 else Z=z[r[2]]C=not Z o=5729569 I=C end else o=I and 2786895 or 2065117 end else if o<12503663 then if o<12489682 then C=nil Z=nil o=z[r[3]]I=o()o=u[p(12767)]I={}else Z=I o=not Z o=o and 11853435 or 5398181 end else o=z[r[3]]I=o()o=4699070 end end else if o<12530455 then if o<12527088 then if o<12521340 then N,l=y(k,N)o=N and 3597289 or 73751 else o=k o=Z and 16732768 or 336783 end else o=z[r[1]]C=false I=p(12007)o[I]=C k=p(12252)I=z[r[1]]C=p(12366)o=I[C]I=p(12663)C=false o[I]=C Z=z[r[2]]C=Z[k]I=C o=C and 5094957 or 16766561 end else if o<12552634 then if o<12540336 then P=p(12801)t=p(12801)D=X[t]t=C[P]V=D-t D=p(12762)o=V[D]V=o t=V<N D=t o=t and 13339045 or 4610700 else I=p(12723)o=u[I]k=z[r[1]]N={o(k)}C=N[2]I=N[1]o=10590436 Z=N[3]k=I end else o=z[r[2]]I=o()o=11195294 end end end end else if o<12709618 then if o<12626327 then if o<12586978 then if o<12562049 then if o<12560288 then q=p(12801)v=z[Z]n=v[q]H=p(12369)F=z[Z]o=13318427 f=F[H]F=p(12152)q=f[F]f=10 v=q*f R=n+v m=R else o=7970444 l=z[r[1]]N=l end else if o<12580793 then l=p(12041)l=W[l]Z=y Y=p(12829)l=l(W,Y)o=l and 11711761 or 8681521 else o=8140342 V=nil end end else if o<12614225 then if o<12596287 then k=p(12779)I=C[k]W=p(12585)y=u[W]W=p(12779)N=y[W]y=p(12336)k=N[y]o=I==k o=o and 16622914 or 13940619 else k=p(12830)Z=z[r[1]]C=Z[k]I=C o=C and 10125991 or 11156953 end else o=z[r[1]]o=o and 1525734 or 8319667 end end else if o<12682463 then if o<12662265 then if o<12641321 then Z=p(12526)N=p(12002)C=p(12409)I=u[C]C=p(12810)o=I[C]W=1 C=p(12415)a=p(12716)I=o(C)C=e()z[C]=I o=z[C]I=p(12628)o[I]=Z Z=1 I=p(12868)y=1 o=z[C]o[I]=Z I=p(12411)o=z[C]k=u[N]N=p(12810)Z=k[N]N=1 k=Z(N,y,W)Z=true o[I]=k o=z[C]l=p(12716)D=p(12104)v=1 i=30 I=p(12471)o[I]=Z o=z[C]k=p(12328)X=360 Z=false n=0 I=p(12858)o[I]=Z Y=0 M=p(12676)N=p(12177)o=z[C]g=p(12030)Z=u[k]I=p(12350)o[I]=Z I=p(12772)o=J(9060279,{C})Z=o W=u[l]l=p(12810)y=W[l]P=.564706 l=0 W=y(l,Y)Y=u[a]a=p(12810)l=Y[a]q=.4 R=1 a=-360 Y=l(a,X)X=u[g]y=p(12288)g=p(12810)l=p(12684)a=X[g]V=u[D]D=p(12810)g=V[D]t=0 D=.509804 V={g(D,t,P)}g=p(12814)H=p(12716)X=a(s(V))a=p(12861)V=p(12868)P=p(12125)t=u[P]P=p(12810)D=t[P]m=u[M]M=p(12810)Q=m[M]M=0 m=Q(M,R)R=p(12676)M=u[R]R=p(12810)Q=M[R]R=.5 M=Q(R,n)n=p(12676)R=u[n]n=p(12810)Q=R[n]n=1 R={Q(n,v)}P={m;M;s(R)}t=D(P)R=p(12125)v=p(12716)M=u[R]D=p(12170)P=1 n=0 Q=p(12411)R=p(12810)m=M[R]R=4.6875 M=m(R,n)m=p(12709)n=u[v]v=p(12810)R=n[v]v=.4 n=R(v,q)v=60 R=p(12225)F=u[H]H=p(12810)f=F[H]H=30 q=p(12782)F=f(H,i)k={[N]=W;[y]=Y;[l]=X;[a]=g,[V]=t;[D]=P;[Q]=M,[m]=n;[R]=v;[q]=F}Q=.1875 o=Z(I,k)D=.584314 P=p(12125)l=p(12716)N=p(12177)I=p(12014)W=u[l]Y=10 g=p(12104)v=p(12321)m=p(12716)q=-180 l=p(12810)y=W[l]a=p(12030)l=10 W=y(l,Y)Y=u[a]a=p(12810)y=p(12684)l=Y[a]X=u[g]g=p(12810)a=X[g]V=0 g=.388235 X={a(g,V,D)}g=p(12831)V=p(12411)Y=l(s(X))X=p(12861)l=p(12228)t=u[P]a=1 P=p(12810)D=t[P]P=0 t=D(P,Q)Q=u[m]m=p(12810)P=Q[m]m=.25 M=1 D=p(12709)Q=P(m,M)m=100 n=u[v]v=p(12810)P=p(12225)R=n[v]v=180 n=R(v,q)M=p(12130)v=180 R=p(12440)k={[N]=W;[y]=Y;[l]=a,[X]=g;[V]=t;[D]=Q;[P]=m;[M]=n,[R]=v}a=p(12030)q=-170 N=p(12177)o=Z(I,k)Q=.3 g=p(12104)P=p(12125)Y=10 l=p(12716)I=p(12510)W=u[l]V=0 l=p(12810)y=W[l]l=10 W=y(l,Y)y=p(12684)Y=u[a]a=p(12810)l=Y[a]X=u[g]g=p(12810)a=X[g]D=.407843 g=.266667 X={a(g,V,D)}M=1 Y=l(s(X))l=p(12228)v=p(12321)t=u[P]g=p(12831)X=p(12861)V=p(12411)P=p(12810)a=1 D=t[P]P=0 t=D(P,Q)m=p(12716)D=p(12709)Q=u[m]m=p(12810)P=Q[m]m=.25 Q=P(m,M)n=u[v]m=100 M=p(12130)P=p(12225)v=p(12810)R=n[v]v=170 n=R(v,q)R=p(12440)v=170 k={[N]=W;[y]=Y,[l]=a;[X]=g,[V]=t;[D]=Q;[P]=m,[M]=n;[R]=v}o=Z(I,k)k=p(12409)I=u[k]k=p(12810)o=I[k]k=p(12499)I=o(k)k=z[C]o=p(12350)I[o]=k o=z[C]I={o}o=u[p(12418)]else I={}o=u[p(12693)]end else o=W o=y and 3278533 or 15256356 end else if o<12700293 then if o<12696701 then D=z[r[1]]t=p(12252)V=D[t]g=a~=V X=g o=4656881 else C=nil Gy=p(12318)xy=p(12409)I=u[xy]xy=p(12810)ry=1262 o=I[xy]xy=p(12343)I=o(xy)o=p(12628)xy=I ey=e()I=p(12459)xy[o]=I Iy=e()Oy[1]=e()o=p(12405)cy=e()I=false xy[o]=I o=p(12095)I=p(12836)o=xy[o]o=o(xy,I,ry)wy=e()zy=e()I=p(12691)o=p(12636)xy[o]=I I=p(12271)ky=e()o=p(12293)xy[o]=I o=p(12350)ry=z[r[3]]I=ry[Gy]xy[o]=I o=L(15085195,{T})ry=e()Gy=e()z[ry]=o Zy=e()o=S(51664,{g;D})z[Gy]=o Ny=e()o=d(6993561,{D;g})z[wy]=o o=O(10913597,{H,r[3]})Cy=e()z[Iy]=o o=d(720178,{Iy,q})z[zy]=o o=O(1772123,{Iy;E;oy})z[Cy]=o Iy=c(Iy)I=p(12238)o=O(7408010,{E})z[ey]=o o=B(4448004,{t;V,r[3];D;g;ey,f,zy,Q,y,i;b,h;Cy,wy})Oy[2]=L(7131762,{t,Zy})Ly=e()z[Zy]=o y=c(y)yy=e()o=d(6551129,{t;i,r[3],py,ey,f;zy;m,Z,W})z[ky]=o o=S(9184326,{t,i;py;r[3];k,ey,zy,m,Z;W,b,h;Cy})z[Ny]=o D=c(D)o=O(909028,{t;b,r[3];A,ey,f;zy,M,l})z[cy]=o wy=c(wy)l=c(l)o=L(7989471,{t,b,A;r[3];ey;zy,R,Z,N;Y;a,i,h;Cy})z[yy]=o o=J(12702450,{t;h,r[3];ry,uy,ey;f;F;zy;v,T,Z,n,X})z[Ly]=o o=d(15852574,{t,h,uy,r[3];ey,F,ry;N;zy,m,Z,X;i,b,Cy,v})z[Oy[1]]=o n=c(n)R=c(R)o=xy[I]Y=c(Y)I=p(12573)I=o[I]N=c(N)I=I(o,Oy[2])I=p(12088)Oy[2]=L(11460671,{t,r[3];H,Cy,Gy;P,Zy})o=xy[I]I=p(12573)X=c(X)I=o[I]oy=c(oy)v=c(v)I=I(o,Oy[2])sy=nil T=c(T)W=c(W)Oy[2]=L(16219111,{t,ey,q,f;F;ry;Gy;V;P;i,py;b,A,h;uy})I=p(12531)Gy=c(Gy)o=xy[I]Z=c(Z)I=p(12573)I=o[I]M=c(M)I=I(o,Oy[2])I=z[r[4]]Oy[2]=p(12441)A=c(A)k=c(k)ry=c(ry)o=I[Oy[2]]b=c(b)q=c(q)E=c(E)I=p(12573)I=o[I]Oy[2]=B(1725083,{r[4],t;ky,cy,Ly;Zy})P=c(P)h=c(h)I=I(o,Oy[2])m=c(m)H=c(H)g=c(g)ey=c(ey)zy=c(zy)Ly=c(Ly)I=z[r[4]]i=c(i)py=c(py)Oy[2]=p(12229)F=c(F)V=c(V)uy=c(uy)xy=nil o=I[Oy[2]]Oy[2]=K(222474,{t;Ny;yy,Oy[1]})Ny=c(Ny)ky=c(ky)a=c(a)f=c(f)I=p(12573)t=c(t)Oy[1]=c(Oy[1])I=o[I]I=I(o,Oy[2])Cy=c(Cy)cy=c(cy)Q=c(Q)o=u[p(12148)]I={}yy=c(yy)Zy=c(Zy)end else Z=z[r[1]]C=not Z I=C o=C and 1734903 or 2421069 end end end else if o<12768188 then if o<12743411 then if o<12734569 then if o<12729224 then o=u[p(12414)]I={}else o=z[r[2]]o=o and 3358014 or 10492821 end else C=p(12252)I=z[r[3]]o=I[C]C=o o=not C o=o and 92115 or 16125698 end else if o<12751416 then if o<12746243 then o=z[r[1]]C=z[r[2]]I=o(C)I={}o=u[p(12507)]else N=p(12742)k=z[r[1]]Z=k[N]I=Z o=Z and 10823438 or 10386098 end else o=z[r[3]]I=p(12743)I=o[I]I=I(o)o=10687013 end end else if o<12786635 then if o<12782319 then if o<12776985 then Q=nil o=7171792 m=nil M=c(M)V=nil else o=k o=not I o=o and 733461 or 8207424 end else l=p(12801)o=z[r[2]]W=Z[l]I=o(W)N=nil W=p(12349)o=z[r[3]]l=p(12348)a=nil y=nil Z=nil Y=nil I=o(C,W,l,Y,a)k=nil I={}o=u[p(12702)]C=nil end else if o<12820308 then if o<12795234 then k=z[r[7]]y=z[r[8]]N=k(y)k=z[r[9]]o=k and 736805 or 2556080 else o=R R=m n=o o=m and 1506128 or 2571427 end else y=1 I=N[y]o=Z(I)o=3808717 end end end end end else if o<13131856 then if o<12968908 then if o<12919648 then if o<12878598 then if o<12856138 then if o<12850335 then I=false C=x[1]o=C z[r[1]]=o N=p(12719)z[r[2]]=I k=u[N]N=p(12783)Z=k[N]N=.15 k=Z(N)k=o N=z[r[3]]o=N and 4950885 or 12525875 Z=N else a,X=l(Y,a)o=a and 3689956 or 11316004 end else if o<12860620 then o=z[r[3]]I=o(C)o=10138307 else o=z[r[1]]o=o and 6993174 or 10695112 end end else if o<12910180 then if o<12891713 then o=I and 3963983 or 5407689 else k=z[r[1]]o=15663186 N=p(12350)Z=k[N]C=not Z I=C end else Y=p(12122)I=C[Y]o=I[l]I={o}o=u[p(11999)]end end else if o<12945128 then if o<12939191 then if o<12937123 then I={W}V=C g=p(12350)W[g]=V o=u[p(12362)]else l=z[r[7]]Y=p(12178)y=l[Y]Y=O(4604597,{r[7],r[2],r[1];r[11],r[12];r[13];r[14];r[15]})l=p(12573)l=y[l]o=15402550 l=l(y,Y)end else Z=p(12041)k=p(12343)C=x[1]Z=C[Z]Z=Z(C,k)I=Z o=Z and 1060311 or 5204090 end else if o<12960653 then if o<12953838 then I=z[r[1]]C=p(12830)o=I[C]o=o and 5387298 or 3805161 else N=z[r[1]]o=p(12350)k[o]=N Z=nil C=nil o=u[p(12433)]k=nil I={}end else o=3064338 Z=z[r[2]]C=not Z I=C end end end else if o<13036822 then if o<13000589 then if o<12974823 then if o<12971212 then Z=z[r[2]]o=7897678 k=p(12252)C=Z[k]k=p(12280)Z=p(12855)Z=C[Z]Z=Z(C,k)I=Z else l=p(12719)W=u[l]l=p(12783)o=W[l]l=.2 W=o(l)l=p(12830)W=z[r[1]]o=W[l]o=o and 3882579 or 11267730 end else l=I o=l and 2747478 or 11683063 end else if o<13033240 then if o<13008883 then C=p(12719)I=u[C]C=p(12783)o=I[C]C=.5 I=o(C)C=z[r[1]]I=C o=C and 2715505 or 6416324 else I={}o=u[p(12502)]end else o=z[r[1]]I={o}o=u[p(12032)]end end else if o<13093826 then if o<13060037 then if o<13039380 then v=m q=o o=m and 5036249 or 9409343 else g=p(12252)X=z[r[3]]a=X[g]g=p(12087)o=13653726 X=p(12281)X=a[X]X=X(a,g)l=X end else k=e()W=p(12425)C=x[1]I=z[r[1]]Z=p(12810)o=I[Z]Z=p(12859)I=o(Z)o=p(12737)o=I[o]o=o(I)I=p(12642)Z=e()o=false z[Z]=o o=false z[k]=o o=u[I]N=z[r[2]]y=p(12356)y=N[y]y=y(N,W)l=p(12356)W=p(12662)N=p(12356)N=y[N]N=N(y,W)W=p(12326)l=N[l]y={l(N,W)}N=e()I=o(s(y))z[N]=I I=p(12642)o=u[I]l=p(12425)Y=p(12356)W=p(12356)y=z[r[2]]W=y[W]W=W(y,l)y=p(12356)y=W[y]l=p(12662)X=p(12318)y=y(W,l)Y=y[Y]l=p(12353)W={Y(y,l)}y=e()I=o(s(W))o=L(10074015,{r[3]})z[y]=I W=e()z[W]=o o=L(10045506,{k,Z,W;N;y})l=e()Y=p(12441)z[l]=o I=z[r[4]]o=I[Y]I=p(12573)Y=d(12381926,{r[4];k;l})I=o[I]I=I(o,Y)a=z[r[3]]Y=a[X]a=p(12281)X=p(12649)a=Y[a]a=a(Y,X)o=a and 787038 or 5243408 I=a end else if o<13119567 then if o<13114859 then I={k}o=u[p(12493)]else o=I and 8715799 or 4382239 end else o=z[r[2]]I=o()o=10567974 end end end end else if o<13277266 then if o<13203122 then if o<13169905 then if o<13157917 then if o<13156478 then o=true N=true z[r[2]]=o k=p(12663)I=z[r[4]]I[k]=N I=z[r[5]]k=I()I=z[r[6]]o=I and 5040810 or 16654105 else I={}o=u[p(11997)]end else if o<13160815 then o=false z[r[2]]=o I=z[r[3]]C=p(12663)Z=false I[C]=Z C=z[r[4]]Z=p(12252)I=C[Z]C=I I=not C o=I and 2975379 or 11155346 else I={}C=nil Z=nil o=u[p(12191)]end end else if o<13201358 then if o<13178408 then o=I and 4523824 or 10815690 else o=7863369 l=nil a=nil Y=nil X=c(X)end else k=z[r[4]]N=p(12315)Z=k[N]o=3649669 N=z[r[3]]k=p(12288)Z[k]=N end end else if o<13227461 then if o<13210768 then if o<13209089 then o=z[r[3]]I=o()o=7142786 else V=D o=t o=10756048 end else I={}o=u[p(12320)]end else if o<13276135 then if o<13234875 then V=D o=t o=2948979 else Y=p(12719)I={}l=u[Y]Y=p(12668)o=u[p(12292)]N=l[Y]C=nil Y=B(2213586,{r[14],Z;r[5]})Z=c(Z)l=N(Y)end else V=o Q=p(12489)P=u[Q]m=p(12778)Q=p(12794)t=P[Q]Q=Y[m]P=t(Q)Q=p(12778)t=a[Q]D=P<t g=D o=D and 15964632 or 12321434 end end end else if o<13325052 then if o<13310612 then if o<13285518 then if o<13281457 then o=z[r[2]]I=o()o=15707944 else W=p(12801)y=z[r[3]]o=15914899 N=y[W]Z=N end else o=z[r[1]]g=l I=p(12369)t=p(12369)D=u[t]t=p(12810)P=p(12801)V=D[t]t=Z[P]D=V(t)o[I]=D V=p(12719)I=u[V]g=nil V=p(12783)o=I[V]V=.05 I=o(V)o=1570727 end else if o<13319760 then if o<13317094 then v=p(12080)R=o n=u[v]P=n o=n and 11400361 or 13400056 else o=M y={[W]=l;[Y]=a,[X]=g;[V]=D,[t]=P;[Q]=m}k=I(y)y=p(12719)N=c(N)k=u[y]W=O(3599399,{r[1],r[2],r[11],r[12],r[7],r[8]})y=p(12027)I=k[y]y=.3 k=I(y,W)y=p(12719)k=u[y]y=p(12027)o=u[p(12838)]I=k[y]y=.8 Z=c(Z)W=B(8451571,{r[1];r[2];r[11],r[12];r[13]})k=I(y,W)C=nil I={}end else i,py=F(H,i)o=i and 6266771 or 3357770 end end else if o<13350791 then if o<13344292 then if o<13328235 then C=x[1]I=z[r[1]]V=p(12425)Z=p(12810)t=p(12425)o=I[Z]Z=p(12584)I=o(Z)v=18637209873 o=p(12737)y=p(12031)X=p(12425)Z=p(12642)o=I[o]o=o(I)I=u[Z]g=p(12425)W=p(12356)k=z[r[2]]W=k[W]N={W(k,y)}k=e()Z=I(s(N))I=p(12258)N=e()o=Z[I]Z=e()z[Z]=o o=S(3807782,{r[3]})z[k]=o I=p(12642)D=p(12425)o=B(7594827,{r[3]})z[N]=o o=u[I]a=z[r[2]]Y=a[X]a=p(12662)l=Y[a]Y=p(12491)W=l[Y]l=p(12286)y=W[l]I=o(y)y=e()z[y]=I I=p(12642)oy=p(12409)o=u[I]X=z[r[2]]a=X[g]m=18699542775 X=p(12662)h=e()Y=a[X]a=p(12491)l=Y[a]Y=p(12012)W=l[Y]I=o(W)W=e()z[W]=I I=p(12642)n=p(12424)o=u[I]R=18686496907 g=z[r[2]]X=g[V]g=p(12662)a=X[g]X=p(12491)Y=a[X]a=p(12654)l=Y[a]I=o(l)l=e()b=e()M=18699545564 z[l]=I I=p(12642)o=u[I]V=z[r[2]]g=V[D]py=p(12409)V=p(12662)X=g[V]g=p(12491)a=X[g]X=p(12437)Y=a[X]I=o(Y)P=p(12425)Y=e()H=e()z[Y]=I E=e()sy=p(12049)I=p(12642)o=u[I]D=z[r[2]]V=D[t]D=p(12662)g=V[D]q=p(12474)Q=18699541378 V=p(12491)X=g[V]g=p(12055)a=X[g]I=o(a)a=e()z[a]=I I=p(12642)o=u[I]t=z[r[2]]D=t[P]t=p(12662)f=18637217215 V=D[t]D=p(12491)t=e()g=V[D]V=p(12324)X=g[V]I=o(X)D=e()X=e()o=0 g=e()z[X]=I V=e()z[g]=o o=true z[V]=o o=nil z[D]=o o=false z[t]=o P=e()I=18699539486 o=nil uy=p(12409)z[P]=o o={I,Q,m,M}I=p(12012)m=18637207623 M=p(12644)Q=e()z[Q]=o o={[I]=m;[M]=R;[n]=v;[q]=f}m=e()M=e()R=e()z[m]=o o=18686500373 z[M]=o o=18686502223 v=e()z[R]=o o=18637214138 f=e()i=e()n=e()z[n]=o o=18637218777 z[v]=o o=nil F=e()q=e()z[q]=o o=nil z[f]=o o=nil z[F]=o o=nil z[H]=o o=false z[i]=o I=u[py]py=p(12810)o=I[py]py=p(12722)I=o(py)o=false A=p(12409)T=e()py=e()z[py]=I z[b]=o I=u[A]A=p(12810)o=I[A]A=p(12722)I=o(A)o=false A=e()z[A]=I z[h]=o I=u[uy]uy=p(12810)ry=p(12318)o=I[uy]uy=p(12722)I=o(uy)uy=e()o={}z[uy]=I z[T]=o o=nil z[E]=o I=u[oy]oy=p(12810)o=I[oy]oy=p(12207)I=o(oy)oy=e()z[oy]=I o=z[oy]I=p(12270)o[I]=sy xy=z[r[3]]sy=xy[ry]ry=p(12853)xy=p(12281)xy=sy[xy]xy=xy(sy,ry)I=xy o=xy and 173055 or 10072627 else P=80 t=V<P D=t o=4610700 end else o=Y and 8097263 or 16204961 end else if o<13371072 then if o<13360878 then o=z[r[2]]I=o()o=7517424 else o=z[r[1]]X=W X=nil I=p(12369)D=p(12369)V=u[D]D=p(12810)t=p(12801)g=V[D]D=Z[t]V=g(D)g=p(12719)o[I]=V I=u[g]g=p(12783)o=I[g]g=.05 I=o(g)o=6484622 end else N=z[r[1]]y=p(12281)y=N[y]W=p(12054)y=y(N,W)k=y o=y and 676882 or 15211535 end end end end end end else if o<13966386 then if o<13645198 then if o<13488728 then if o<13425619 then if o<13406931 then if o<13388124 then if o<13384055 then C=z[r[1]]I=C o=C and 2272486 or 10258046 else o=Y o=l and 4909473 or 8672786 end else if o<13399373 then C=I o=z[r[3]]Z=true I=o(C,Z)o=z[r[1]]Z=1 I=p(12387)o[I]=Z I=z[r[1]]Z=p(12135)o=I[Z]o=o and 11371360 or 5603215 else o=R o=14098905 D=P end end else if o<13409816 then if o<13407606 then C=z[r[1]]I=C o=C and 5903779 or 4687556 else Z=N o=y o=8919117 end else y=z[r[7]]o=15878459 W=p(12786)W=y[W]W=W(y)end end else if o<13462463 then if o<13456700 then if o<13441232 then Y=#k a=0 l=Y>a y=l o=11977351 else Q=p(12128)V=p(12173)P=p(12281)M=o m=Y P=W[P]o=Y and 11332021 or 2510435 P=P(W,Q)t=p(12607)Q=p(12574)end else X=p(12041)a=o X=W[X]g=p(12777)X=X(W,g)Y=X o=X and 14648013 or 16376456 end else if o<13478484 then if o<13468523 then o=I and 11210943 or 9448481 else I=p(12281)I=C[I]Z=p(12822)I=I(C,Z)Z=e()z[Z]=I k=z[Z]I=not k o=I and 14562363 or 254539 end else o=I and 12028459 or 11962629 end end end else if o<13584245 then if o<13548632 then if o<13512262 then if o<13504127 then l=p(12547)W=z[r[1]]y=W[l]W=p(12622)N=y[W]o=7518063 k=not N C=k else o=z[r[6]]I=o()o=4390994 end else I=p(12347)o=u[I]C=z[r[1]]I=o(C)I={}o=u[p(12266)]end else if o<13579827 then if o<13565604 then o=I and 7555887 or 12058875 else o=4419387 C=z[r[2]]I=C end else t=o R=p(12124)P=u[R]D=P o=P and 13310654 or 14098905 end end else if o<13606891 then if o<13604602 then if o<13593067 then o=z[r[7]]o=o and 14722651 or 9747162 else H,py=f(F,H)o=H and 6382506 or 10435875 end else C=e()z[C]=x[1]o=z[C]o=o and 11199402 or 11640006 end else if o<13630450 then if o<13615951 then g=U(3148917,{})N=p(12642)Z={}k=u[N]Y=p(12687)V=p(12688)l=p(12689)W=u[l]l=p(12394)l=W[l]l=l(W,Y)W=p(12396)a=p(12687)y=l[W]N=k(y)W=p(12046)k=e()y=p(12689)z[k]=N N=u[y]l=p(12403)y=p(12394)y=N[y]y=y(N,W)W=p(12689)N=u[W]Y=p(12449)W=p(12394)W=N[W]W=W(N,l)N=e()l=p(12689)z[N]=W W=u[l]l=p(12394)l=W[l]l=l(W,Y)Y=p(12689)W=e()z[W]=l l=u[Y]Y=p(12394)Y=l[Y]Y=Y(l,a)l=e()z[l]=Y a=p(12689)X=p(12677)Y=u[a]a=p(12394)a=Y[a]a=a(Y,X)Y=e()X=p(12518)z[Y]=a a=y[X]X=e()z[X]=a a=e()z[a]=g g=U(6648710,{k;l,a,X,N,W})Z[V]=g V=p(12492)g=J(9888486,{k,l,X,W})Z[V]=g V=p(12025)g=O(13327479,{k,l;X;W})Z[V]=g V=p(12439)g=S(5828991,{k,X,a,Y})Z[V]=g V=p(12576)g=J(8327861,{k,X,a,N})Z[V]=g g=O(9931154,{k;l,X})V=p(12813)Z[V]=g V=p(12826)g=J(10580638,{k;l;X,W})Z[V]=g g=O(13087922,{k;l;X;W})V=p(12860)Z[V]=g g=d(7509338,{k,l;X,W})V=p(11998)Z[V]=g V=p(12331)g=J(7804891,{k;a})Z[V]=g V=p(12495)g=u[V]o=g and 16202725 or 7493438 else I=p(12056)o=W[I]l=o X=p(12122)a=C[X]Y=a[l]I=Y o=Y and 9821129 or 15815186 end else C=z[r[2]]o=1588701 I=C end end end end else if o<13818999 then if o<13742867 then if o<13660281 then if o<13654144 then if o<13651234 then l=p(12570)o=p(12041)o=W[o]y=k o=o(W,l)o=o and 1163778 or 9893355 else o=Y o=4821949 I=l end else if o<13654582 then Oy[4]=p(12321)A=p(12747)t=p(12375)uy=p(12033)Cy=p(12172)h=p(12385)g=p(12289)Gy=p(12536)zy=p(12218)Iy=p(12618)T=p(12247)Zy=p(12115)Ly=p(12431)b=p(12506)E=p(12300)M=p(12733)oy=p(12126)F=p(12864)Q=p(12657)a=p(12037)Oy[1]=p(12761)wy=p(12856)m=p(12005)X=p(12291)v=p(12505)n=p(12373)Ny=p(12096)yy=p(12176)I=p(12578)py=p(12244)P=p(12608)i=p(12851)H=p(12093)Oy[5]=609 cy=p(12780)f=p(12361)Y=p(12819)q=p(12185)V=p(12036)ky=p(12760)ry=p(12097)sy=p(12390)R=p(12674)D=p(12143)ey=p(12465)xy=p(12188)Oy[11]=761 Oy[7]=305 o={[I]=Y,[a]=X;[g]=V,[D]=t;[P]=Q,[m]=M;[R]=n,[v]=q,[f]=F;[H]=i,[py]=b,[A]=h,[uy]=T,[E]=oy,[sy]=xy;[ry]=Gy;[wy]=Iy;[zy]=Cy,[ey]=Zy,[ky]=Ny,[cy]=yy,[Ly]=Oy[1]}P=p(12321)M=1 m=p(12321)Q=457 X=p(12063)Y=e()I=p(12674)n=609 V=p(12149)z[Y]=o g=p(12068)h=305 v=p(12321)t=u[P]py=p(12321)P=p(12810)Zy=153 D=t[P]i=305 P=1 t=D(P,Q)a={[X]=g;[V]=t}t=p(12149)Q=u[m]f=p(12321)q=153 V=p(12063)R=p(12321)m=p(12810)P=Q[m]Oy[18]=p(12321)m=457 E=p(12321)yy=609 Oy[1]=457 A=p(12321)xy=305 X=p(12251)D=p(12068)Q=P(m,M)M=u[R]R=p(12810)F=1 P=p(12068)H=p(12321)g={[V]=D;[t]=Q}t=p(12063)T=153 m=M[R]V=p(12505)R=1 ey=p(12321)Oy[12]=p(12321)Q=p(12149)M=m(R,n)D={[t]=P;[Q]=M}m=p(12068)M=p(12149)Q=p(12063)Oy[13]=153 t=p(12465)n=u[v]v=p(12810)uy=p(12321)R=n[v]v=609 n=R(v,q)R=p(12393)q=u[f]P={[Q]=m,[M]=n}M=p(12063)Q=p(12793)f=p(12810)n=p(12149)v=q[f]f=609 q=v(f,F)Oy[22]=p(12321)m={[M]=R;[n]=q}q=p(12149)n=p(12063)v=p(12068)M=p(12390)F=u[H]H=p(12810)f=F[H]H=153 b=457 F=f(H,i)R={[n]=v;[q]=F}q=p(12063)ky=p(12321)i=u[py]F=p(12149)py=p(12810)f=p(12068)n=p(12431)H=i[py]py=305 i=H(py,b)v={[q]=f;[F]=i}ry=p(12321)b=u[A]q=p(12467)F=p(12063)A=p(12810)Oy[6]=p(12321)i=p(12149)py=b[A]A=609 H=p(12068)Oy[2]=p(12321)b=py(A,h)cy=p(12321)f={[F]=H,[i]=b}b=p(12149)i=p(12063)py=p(12068)h=u[uy]uy=p(12810)A=h[uy]F=p(12143)uy=1 h=A(uy,T)H={[i]=py,[b]=h}sy=p(12321)b=p(12063)Gy=457 h=p(12149)i=p(12780)wy=p(12321)A=p(12068)T=u[E]E=p(12810)oy=305 uy=T[E]E=305 Oy[25]=153 T=uy(E,oy)uy=p(12068)py={[b]=A;[h]=T}h=p(12063)oy=u[sy]T=p(12149)b=p(12005)sy=p(12810)E=oy[sy]sy=1 Oy[19]=1 oy=E(sy,xy)A={[h]=uy;[T]=oy}xy=u[ry]h=p(12298)E=p(12068)ry=p(12810)Iy=305 oy=p(12149)sy=xy[ry]ry=457 Oy[3]=457 T=p(12063)xy=sy(ry,Gy)uy={[T]=E,[oy]=xy}Gy=u[wy]T=p(12189)xy=p(12149)sy=p(12068)oy=p(12063)wy=p(12810)ry=Gy[wy]wy=761 Gy=ry(wy,Iy)Cy=457 E={[oy]=sy,[xy]=Gy}zy=p(12321)ry=p(12393)oy=p(12210)xy=p(12063)Gy=p(12149)Iy=u[zy]zy=p(12810)wy=Iy[zy]zy=457 Iy=wy(zy,Cy)sy={[xy]=ry;[Gy]=Iy}xy=p(12048)Cy=u[ey]Iy=p(12149)ey=p(12810)zy=Cy[ey]Ny=761 Gy=p(12063)wy=p(12068)ey=761 Cy=zy(ey,Zy)ry={[Gy]=wy;[Iy]=Cy}zy=p(12068)Ly=p(12321)Cy=p(12149)Gy=p(12634)Zy=u[ky]ky=p(12810)Iy=p(12063)ey=Zy[ky]ky=305 Zy=ey(ky,Ny)ey=p(12068)wy={[Iy]=zy,[Cy]=Zy}Iy=p(12381)Ny=u[cy]Oy[20]=p(12321)Zy=p(12149)cy=p(12810)ky=Ny[cy]cy=305 Ny=ky(cy,yy)Oy[23]=609 Cy=p(12063)ky=p(12393)zy={[Cy]=ey;[Zy]=Ny}Ny=p(12149)Cy=p(12037)Zy=p(12063)yy=u[Ly]Ly=p(12810)cy=yy[Ly]Ly=1 yy=cy(Ly,Oy[1])ey={[Zy]=ky;[Ny]=yy}Zy=p(12097)cy=p(12068)Ny=p(12063)Oy[1]=u[Oy[2]]yy=p(12149)Oy[2]=p(12810)Ly=Oy[1][Oy[2]]Oy[15]=457 Oy[2]=153 Oy[1]=Ly(Oy[2],Oy[3])ky={[Ny]=cy,[yy]=Oy[1]}yy=p(12063)Oy[3]=u[Oy[4]]Ly=p(12068)Oy[10]=p(12321)Oy[4]=p(12810)Oy[8]=p(12321)Oy[2]=Oy[3][Oy[4]]Oy[9]=761 Oy[4]=609 Ny=p(12235)Oy[3]=Oy[2](Oy[4],Oy[5])Oy[1]=p(12149)Oy[24]=p(12321)cy={[yy]=Ly,[Oy[1]]=Oy[3]}Oy[21]=1 yy=p(12301)Oy[1]=p(12063)Oy[2]=p(12393)Oy[5]=u[Oy[6]]Oy[6]=p(12810)Oy[4]=Oy[5][Oy[6]]Oy[3]=p(12149)Oy[6]=609 Oy[17]=761 Oy[5]=Oy[4](Oy[6],Oy[7])Ly={[Oy[1]]=Oy[2],[Oy[3]]=Oy[5]}Oy[5]=p(12149)Oy[1]=p(12361)Oy[4]=p(12068)Oy[7]=u[Oy[8]]Oy[3]=p(12063)Oy[8]=p(12810)Oy[6]=Oy[7][Oy[8]]Oy[8]=1 Oy[7]=Oy[6](Oy[8],Oy[9])Oy[2]={[Oy[3]]=Oy[4];[Oy[5]]=Oy[7]}Oy[7]=p(12149)Oy[9]=u[Oy[10]]Oy[5]=p(12063)Oy[3]=p(12739)Oy[10]=p(12810)Oy[8]=Oy[9][Oy[10]]Oy[14]=p(12321)Oy[6]=p(12068)Oy[10]=609 Oy[9]=Oy[8](Oy[10],Oy[11])Oy[4]={[Oy[5]]=Oy[6],[Oy[7]]=Oy[9]}Oy[9]=p(12149)Oy[11]=u[Oy[12]]Oy[5]=p(12300)Oy[8]=p(12068)Oy[7]=p(12063)Oy[12]=p(12810)Oy[10]=Oy[11][Oy[12]]Oy[12]=153 Oy[11]=Oy[10](Oy[12],Oy[13])Oy[6]={[Oy[7]]=Oy[8],[Oy[9]]=Oy[11]}Oy[13]=u[Oy[14]]Oy[10]=p(12068)Oy[7]=p(12511)Oy[14]=p(12810)Oy[12]=Oy[13][Oy[14]]Oy[9]=p(12063)Oy[14]=609 Oy[11]=p(12149)Oy[13]=Oy[12](Oy[14],Oy[15])Oy[8]={[Oy[9]]=Oy[10],[Oy[11]]=Oy[13]}Oy[12]=p(12393)Oy[11]=p(12063)Oy[16]=p(12321)Oy[13]=p(12149)Oy[15]=u[Oy[16]]Oy[16]=p(12810)Oy[9]=p(12608)Oy[14]=Oy[15][Oy[16]]Oy[16]=1 Oy[15]=Oy[14](Oy[16],Oy[17])Oy[10]={[Oy[11]]=Oy[12],[Oy[13]]=Oy[15]}Oy[11]=p(12093)Oy[13]=p(12063)Oy[15]=p(12149)Oy[17]=u[Oy[18]]Oy[18]=p(12810)Oy[14]=p(12068)Oy[16]=Oy[17][Oy[18]]Oy[18]=153 Oy[17]=Oy[16](Oy[18],Oy[19])Oy[16]=p(12068)Oy[12]={[Oy[13]]=Oy[14],[Oy[15]]=Oy[17]}Oy[15]=p(12063)Oy[17]=p(12149)Oy[19]=u[Oy[20]]Oy[13]=p(12244)Oy[20]=p(12810)Oy[18]=Oy[19][Oy[20]]Oy[20]=305 Oy[19]=Oy[18](Oy[20],Oy[21])Oy[14]={[Oy[15]]=Oy[16],[Oy[17]]=Oy[19]}Oy[21]=u[Oy[22]]Oy[22]=p(12810)Oy[17]=p(12063)Oy[20]=Oy[21][Oy[22]]Oy[18]=p(12068)Oy[22]=761 Oy[15]=p(12428)Oy[19]=p(12149)Oy[21]=Oy[20](Oy[22],Oy[23])Oy[23]=u[Oy[24]]Oy[16]={[Oy[17]]=Oy[18];[Oy[19]]=Oy[21]}Oy[21]=p(12149)Oy[20]=p(12068)Oy[17]=p(12218)Oy[19]=p(12063)Oy[24]=p(12810)Oy[22]=Oy[23][Oy[24]]Oy[24]=305 Oy[23]=Oy[22](Oy[24],Oy[25])Oy[18]={[Oy[19]]=Oy[20],[Oy[21]]=Oy[23]}o={[I]=a;[X]=g;[V]=D;[t]=P;[Q]=m,[M]=R,[n]=v,[q]=f,[F]=H;[i]=py;[b]=A,[h]=uy;[T]=E,[oy]=sy;[xy]=ry;[Gy]=wy,[Iy]=zy,[Cy]=ey;[Zy]=ky;[Ny]=cy,[yy]=Ly,[Oy[1]]=Oy[2];[Oy[3]]=Oy[4],[Oy[5]]=Oy[6],[Oy[7]]=Oy[8];[Oy[9]]=Oy[10],[Oy[11]]=Oy[12];[Oy[13]]=Oy[14];[Oy[15]]=Oy[16];[Oy[17]]=Oy[18]}a=e()z[a]=o o={}P=e()V=e()X=e()g=e()Q=e()M=p(12319)z[X]=o D=e()o=K(10355287,{})z[g]=o o=d(4943347,{X,C;Y;N,g;k})m=e()t=e()z[V]=o o=B(15517569,{})z[D]=o o=O(10650910,{N,C})z[t]=o o=J(7772757,{k})z[P]=o o=S(1065245,{a})v=p(12029)v=l[v]z[Q]=o o=B(2377519,{r[1];X,t,P;D,r[3],Q,g,C,V})z[m]=o I=z[y]o=I[M]M=S(9416892,{y;C;r[4],m})I=p(12573)I=o[I]I=I(o,M)I=p(12368)o=u[I]n={v(l)}v={o(s(n))}M=v[2]I=v[1]n=I o=10392801 R=v[3]else N=z[r[2]]k=not N I=k o=k and 13115637 or 14719971 end end else if o<13721462 then if o<13697074 then k,W=N(Z,k)o=k and 16163039 or 8789274 else o=5390353 V=nil end else o=15188877 Z=p(12281)Z=C[Z]k=p(12822)Z=Z(C,k)I=Z end end else if o<13791104 then if o<13777315 then if o<13756282 then Y=false o=u[p(12646)]y=false I={}z[r[10]]=y W=z[r[11]]l=p(12663)W[l]=Y W=false z[r[12]]=W l=z[r[13]]Y=p(12663)X=false a=false l[Y]=a l=false z[r[14]]=l a=p(12663)Y=z[r[15]]Y[a]=X else o=4587956 k=p(12786)I=z[r[6]]k=I[k]k=k(I)I=nil z[r[6]]=I end else C=z[r[1]]o=C and 6974479 or 5522507 I=C end else if o<13808319 then if o<13799479 then N=p(12719)y=O(12115406,{r[2]})k=u[N]N=p(12027)I=k[N]N=4 o=u[p(12643)]k=I(N,y)C=nil I={}Z=c(Z)else V=o t=z[r[12]]D=not t o=D and 3228609 or 5913060 g=D end else C=nil I={}o=u[p(12487)]end end end else if o<13938394 then if o<13871015 then if o<13836616 then if o<13825614 then I=C o=Z o=6252198 else t=p(12801)P=p(12801)D=g[t]t=C[P]V=D-t D=p(12762)o=V[D]V=o o=V<Z o=o and 16193781 or 12584962 end else I=z[r[5]]k=I()I=z[r[6]]o=I and 13756404 or 4587956 end else if o<13928835 then if o<13894444 then k=p(12786)I=z[r[6]]k=I[k]o=8626194 k=k(I)I=nil z[r[6]]=I else o=false z[r[1]]=o I=false z[r[2]]=I I={}o=u[p(12746)]end else o=z[r[1]]o=o and 14844262 or 14685537 C=x[1]end end else if o<13948433 then if o<13941139 then if o<13940207 then y=z[k]l=p(12002)W=p(12801)I=y[W]W=u[l]l=p(12810)a=0 y=W[l]l=0 Y=2 W=y(l,Y,a)o=I+W y=o o=z[k]I=p(12369)Y=p(12369)l=u[Y]Y=p(12810)a=e()W=l[Y]l=W(y)Y=e()o[I]=l o=z[r[2]]I=o()W=e()z[W]=I I=p(12283)P=p(12233)o=z[C]l=z[W]m=J(15705515,{a})g=p(12233)o[I]=l l=e()z[l]=y Q=p(12719)o=0 X=e()z[Y]=o o=200 z[a]=o o=nil z[X]=o D=p(12719)I=z[r[3]]o=I[g]I=p(12573)I=o[I]g=d(14475830,{k,l,Y;W})I=I(o,g)z[X]=I o=true g=e()z[g]=o V=u[D]D=p(12668)o=V[D]D=J(4838029,{g,Z})V=o(D)o=0 V=e()z[V]=o t=z[r[3]]o=nil D=o o=t[P]P=U(6368438,{Y;a,V;C})t=p(12573)t=o[t]t=t(o,P)D=t P=u[Q]Q=p(12027)o=P[Q]Q=.5 P=o(Q,m)o={}P=o o=z[r[4]]m=p(12022)Q=o(P)o=z[r[5]]Q=o()Q=z[C]o=Q[m]o=o and 237835 or 15607685 else W=p(12585)k=p(12779)I=C[k]y=u[W]W=p(12779)N=y[W]y=p(12324)k=N[y]o=I==k o=o and 5416933 or 4925922 end else I=z[r[2]]C=p(12252)o=I[C]C=o I=C o=C and 4333896 or 10112786 end else if o<13953479 then if o<13951848 then N=p(12147)V=p(12801)l=p(12795)W=p(12407)o=z[r[4]]y=z[r[2]]P=p(12369)a=p(12801)Y=C[a]a=p(12824)g=C[V]t=C[P]P=p(12152)D=t[P]t=60 V=D*t X=g+V g=p(12513)V=1 k={[N]=y;[W]=C;[l]=Y;[a]=X,[g]=V}I=o(k)Z=nil o=7666236 else o=V and 12531518 or 12399565 end else Z=z[r[1]]k=p(12830)C=Z[k]o=C and 6447518 or 15623557 I=C end end end end end else if o<14330514 then if o<14174853 then if o<14081745 then if o<13993666 then if o<13978761 then if o<13970249 then g=p(12252)X=z[r[3]]Y=o a=X[g]l=a o=a and 13042229 or 13653726 else k,W=N(Z,k)o=k and 13646164 or 6372566 end else if o<13983752 then I=p(12080)o=u[I]y=L(13515166,{Z})I=o(y)o=3520909 else N=1.2577049825842e+14 k=e()C=e()z[C]=x[1]y=O(5980848,{C;k,r[3]})z[k]=x[3]C=c(C)k=c(k)o=z[r[1]]I=o()o=z[r[2]]Z=x[2]Z=nil I=o(N,y)I={}o=u[p(12631)]end end else if o<14067994 then if o<14056354 then C=z[r[1]]I=C o=C and 16284847 or 15394835 else Z,y=k(C,Z)o=Z and 16569335 or 4933140 end else y=z[r[3]]o=9676383 W=p(12801)N=y[W]Z=N end end else if o<14121048 then if o<14098321 then if o<14094292 then o=z[r[3]]k=p(12644)Z=z[r[4]]C=Z[k]y=.5 Z=true N=p(12801)I=o(C,Z)C=p(12704)o=z[r[5]]k=z[r[6]]Z=k[N]k=nil I=p(12346)I=o[I]N=.7 I=I(o,C,Z,k,N,y)o=10012848 else m=R o=n o=R and 13318427 or 12559808 end else g=D o=t o=7675736 end else if o<14172878 then if o<14161836 then I=p(12080)N=J(11124431,{C})o=u[I]y={o(N)}k=y[2]I=y[1]y=z[Z]o=y and 8256998 or 8609855 N=I I=y else I={}o=u[p(12323)]end else y=p(12719)C=nil Z=c(Z)N=u[y]y=p(12027)I=N[y]k=nil o=u[p(12741)]y=.5 W=B(13407531,{r[1];r[12],r[2];r[13],r[14]})N=I(y,W)I={}end end end else if o<14234950 then if o<14210261 then if o<14206633 then if o<14189874 then I=p(12642)l=p(12425)C=nil o=u[I]W=z[r[2]]y=W[l]W=p(12662)N=y[W]y=p(12051)k=N[y]I=o(k)k=e()N=p(12409)z[k]=I I=u[N]N=p(12810)o=I[N]N=p(12343)I=o(N)N=I y=1183 o=p(12628)I=p(12051)N[o]=I I=false o=p(12405)N[o]=I I=false W=p(12318)o=p(12017)N[o]=I I=p(12836)o=p(12095)o=N[o]o=o(N,I,y)o=p(12636)Z=nil I=p(12343)N[o]=I o=p(12350)y=z[r[3]]I=y[W]N[o]=I o=z[r[3]]I=p(12560)I=o[I]y=e()I=I(o)W=e()z[y]=I l=J(16278437,{W})I=p(12088)o=false z[W]=o o=N[I]I=p(12573)I=o[I]I=I(o,l)l=S(9558439,{W})I=p(12531)o=N[I]I=p(12573)I=o[I]I=I(o,l)I=p(12238)o=N[I]I=p(12573)N=nil I=o[I]l=J(14300506,{W,r[3],y,k})W=c(W)I=I(o,l)k=c(k)I={}o=u[p(12109)]y=c(y)else g=p(12041)V=p(12272)g=a[g]Y=W g=g(a,V)o=g and 6394549 or 2635347 X=g end else C=nil Z=nil o=u[p(12785)]I={}end else if o<14221930 then if o<14217891 then k=p(12016)Z=p(12041)o=14784866 Z=C[Z]Z=Z(C,k)I=Z else W=N o=p(12041)Y=p(12829)o=l[o]o=o(l,Y)o=o and 14814780 or 15641476 end else W=z[r[3]]N=o y=not W k=y o=y and 16171265 or 10725692 end end else if o<14299850 then if o<14293131 then if o<14251482 then C=nil N=p(12319)y=S(5356422,{r[7]})Z=k[N]N=p(12573)N=Z[N]k=nil o=u[p(12212)]N=N(Z,y)I={}z[r[6]]=N else o=N C=k o=12129108 end else W,a=l(y,W)o=W and 9655634 or 5129300 end else if o<14309250 then if o<14301376 then I=z[r[1]]o=not I o=o and 2717192 or 886443 else k=p(12779)I=C[k]W=p(12585)y=u[W]W=p(12779)N=y[W]y=p(12336)k=N[y]o=I==k o=o and 10683102 or 1655528 end else o=I and 15282307 or 8089525 end end end end else if o<14478904 then if o<14414507 then if o<14378877 then if o<14376749 then if o<14345454 then o=C and 14642479 or 13808565 else I=p(12822)o=p(12281)o=C[o]o=o(C,I)Z=o o=not Z o=o and 15775963 or 6533074 end else o=10328109 a=p(12636)Y=y[a]a=p(11996)l=Y==a W=l end else if o<14411501 then if o<14388209 then A=p(12695)n=e()E=10000 v=p(12489)q=100 z[n]=Q I=u[v]v=p(12413)o=I[v]v=1 I=o(v,q)i=2 f=255 q=0 v=e()T=0 H=1 z[v]=I o=z[l]I=o(q,f)q=e()f=1 z[q]=I o=z[l]F=z[v]I=o(f,F)f=e()z[f]=I I=z[l]F=I(H,i)I=1 o=F==I F=e()I=p(12250)i=p(12103)z[F]=o b=u[A]h=z[l]uy={h(T,E)}A=b(s(uy))b=p(12103)o=p(12120)py=A..b H=i..py o=t[o]o=o(t,I,H)H=e()z[H]=o i=p(12080)I=u[i]py=O(14493219,{l,n,X;k;Z;P,F,H;v,f,q,a})i={I(py)}o={s(i)}i=o o=z[F]o=o and 8034687 or 5219455 else I=p(12346)C=p(12217)o=z[r[1]]I=o[I]k=z[r[2]]y=1 N=p(12801)Z=k[N]k=nil N=.6 I=I(o,C,Z,k,N,y)I=p(12346)C=p(12351)N=p(12801)o=z[r[1]]k=z[r[2]]y=1 Z=k[N]k=nil N=.65 I=o[I]I=I(o,C,Z,k,N,y)I=p(12346)o=z[r[1]]k=z[r[2]]C=p(12384)N=p(12801)Z=k[N]I=o[I]y=1.1 N=.6 k=nil I=I(o,C,Z,k,N,y)o=u[p(12179)]I={}end else I=z[r[6]]o=990650 k=p(12786)k=I[k]k=k(I)I=nil z[r[6]]=I end end else if o<14438053 then if o<14422757 then if o<14420084 then o=8251036 else Z=z[r[2]]k=p(12252)C=Z[k]Z=p(12855)k=p(12280)o=16643586 Z=C[Z]Z=Z(C,k)I=Z end else l=W X=p(12822)a=1 I=Y[a]a=I I=p(12281)I=a[I]I=I(a,X)X=e()z[X]=I I=z[X]o=I and 6657064 or 8252109 end else if o<14462327 then if o<14456630 then W=false o=p(12858)y[o]=W o=8152462 else I=z[r[2]]o=not I o=o and 11335705 or 5686269 end else C=z[r[1]]I=C o=C and 10832105 or 9301455 end end end else if o<14516441 then if o<14493429 then if o<14493209 then if o<14484815 then N=z[r[9]]W=z[r[16]]l=false y=N(W,l)z[r[6]]=y N=z[r[6]]o=N and 9334893 or 1096487 else I=z[k]o=not I o=o and 484415 or 12062718 end else y=2 N=1 Z=z[r[1]]k=Z(N,y)Z=1 C=k==Z I=C o=C and 15504397 or 10918140 end else if o<14508383 then if o<14498617 then k=z[r[6]]N=k()k=z[r[7]]N=k()k=true z[r[8]]=k N=z[r[9]]o=N and 9795762 or 13756135 else W=p(12369)o=z[r[2]]I=p(12090)y=u[W]I=o[I]W=p(12810)N=y[W]y={N(Z)}I=I(o,s(y))o=7603581 end else o=N o=2892823 C=k end end else if o<14580235 then if o<14577602 then if o<14566603 then I={}o=u[p(12209)]else C=z[r[1]]o=C and 14883107 or 2537710 I=C end else I=13391740 k=5556669 Z=p(12601)C=Z^k o=I-C C=o I=p(12770)o=I/C I={o}o=u[p(12870)]end else if o<14592622 then if o<14587678 then o=z[r[3]]I=o()o=4523737 else k=p(12823)Z=p(12038)C=p(12156)I=p(12333)N=p(12552)o={I,C,Z;k;N}I=p(12368)C=o o=u[I]N={o(C)}k=N[3]I=N[1]Z=N[2]N=I o=13682357 end else o=R o=8674891 I=M end end end end end end end else if o<15650100 then if o<15093390 then if o<14842799 then if o<14759218 then if o<14675086 then if o<14647784 then if o<14640716 then if o<14619798 then I=p(12199)o=z[C]Z=true o[I]=Z N=p(12252)k=z[r[1]]Z=k[N]I=Z o=Z and 15397495 or 256726 else Y=nil o=12112628 a=nil end else if o<14644514 then k=p(12483)Z=u[k]k=p(12015)o=Z[k]Z=o(C)o=13808565 else o=J(5405770,{N})m={o()}I={s(m)}o=u[p(12757)]end end else if o<14656114 then if o<14649089 then o=a l=Y o=4401379 else N=z[r[6]]y=N()N=false z[r[2]]=N y=z[r[7]]o=y and 13412365 or 15878459 end else o=u[p(12774)]I={k}end end else if o<14723798 then if o<14721698 then if o<14714249 then I=p(12338)I=C[I]Z=z[r[2]]I=I(C,Z)o=not I o=o and 11139008 or 5288413 else o=13115637 k=z[r[3]]I=k end else C=p(12253)k=0 o=u[C]Z=z[r[8]]C=o(Z,k)o=9747162 end else if o<14752670 then if o<14746904 then Y=p(12801)l=z[r[2]]W=l[Y]o=9441769 N=W else y=p(12409)N=u[y]y=p(12810)k=N[y]o=16252701 y=p(12755)N=k(y,Z)I=N end else o=y Z=N o=N and 9676383 or 14080365 end end end else if o<14787120 then if o<14770462 then if o<14765896 then if o<14761936 then o=12998673 Y=1 l=W[Y]I=l else Y=p(12585)y=p(12153)N=C[y]l=u[Y]Y=p(12153)W=l[Y]l=p(12671)y=W[l]k=N==y I=k o=k and 6327781 or 10215406 end else o=z[r[1]]o=o and 9668727 or 10841915 end else if o<14773834 then if o<14771310 then o=6151608 X=nil g=nil else o=u[p(12753)]I={}end else o=I and 15075709 or 12248869 end end else if o<14815537 then if o<14805812 then if o<14801488 then D=p(12369)X=W I=p(12369)o=z[r[1]]t=p(12801)V=u[D]X=nil D=p(12810)g=V[D]D=Z[t]V=g(D)g=p(12719)o[I]=V I=u[g]g=p(12783)o=I[g]g=.05 I=o(g)o=6221113 else o=I and 4240443 or 1922192 end else o=p(12858)Y=not Z l[o]=Y o=15641476 end else if o<14841654 then if o<14836662 then o=z[r[3]]I=p(12743)I=o[I]I=I(o)o=1378526 else wy=p(12252)Gy=z[r[3]]ry=Gy[wy]Gy=p(12281)wy=p(12853)Gy=ry[Gy]Gy=Gy(ry,wy)sy=Gy o=9848862 end else a=p(12213)Y=1 l=W[Y]Y=p(12281)Y=l[Y]Y=Y(l,a)I=Y o=Y and 10292527 or 7197144 end end end end else if o<14981693 then if o<14931467 then if o<14884839 then if o<14869283 then if o<14843892 then o=I and 11923722 or 8052525 else o=u[p(12044)]I={}end else if o<14882149 then o=I and 9686407 or 5533142 else N=z[r[2]]Z=o k=not N C=k o=k and 10801762 or 2892823 end end else if o<14926069 then if o<14891743 then o=u[p(12686)]I={k}else k=p(12719)I=u[k]k=p(12392)o=I[k]k=z[r[4]]I=o(k)o=nil z[r[4]]=o o=11695730 end else N=z[r[2]]y=p(12252)k=N[y]N=p(12855)y=p(12280)N=k[N]N=N(k,y)y=p(12755)k=p(12281)o=13823429 k=N[k]k=k(N,y)C=k end end else if o<14952416 then if o<14934969 then if o<14932360 then o=2415955 l=z[r[1]]N=l else N=p(12786)k=z[r[8]]o=5381746 N=k[N]N=N(k)k=nil z[r[8]]=k end else I={}o=false z[r[1]]=o o=u[p(12532)]end else if o<14977006 then if o<14962477 then y=p(12409)N=u[y]y=p(12810)k=N[y]y=p(12755)N=k(y,Z)I=N o=10095924 else k=p(12779)W=p(12585)I=C[k]y=u[W]W=p(12779)N=y[W]y=p(12012)k=N[y]o=I==k o=o and 11486519 or 10714522 end else l=p(12369)o=true z[r[2]]=o Z=p(12801)I=C[Z]Z=e()z[Z]=I k=z[Z]W=C[l]l=p(12152)y=W[l]W=600 N=y*W I=k+N k=e()y=p(12719)z[k]=I o=u[p(12341)]N=u[y]y=p(12668)I=N[y]y=O(3559885,{r[4];Z,k})N=I(y)I=false C=nil z[r[2]]=I k=c(k)Z=c(Z)I={}end end end else if o<15063956 then if o<15024339 then if o<14991216 then if o<14983278 then k=p(12281)N=p(12755)k=Z[k]k=k(Z,N)I=k o=k and 4985926 or 2942734 else I=p(12387)W=p(12387)o=z[r[1]]y=z[r[1]]N=y[W]y=4 k=N%y N=1 Z=k+N o[I]=Z Z=p(12135)I=z[r[1]]o=I[Z]o=o and 5615752 or 7956505 end else o=I and 6151936 or 10616035 end else if o<15055092 then if o<15029521 then o=u[p(12082)]I={}else k=k+y l=not W I=k<=N I=l and I l=k>=N l=W and l I=l or I l=928859 o=I and l I=13798450 o=o or I end else k=p(12779)W=p(12585)I=C[k]y=u[W]W=p(12779)N=y[W]y=p(12012)k=N[y]o=I==k o=o and 13279514 or 15707944 end end else if o<15076514 then if o<15074250 then if o<15072524 then o=l N=W o=15820569 else Z=p(12281)k=p(12822)Z=C[Z]Z=Z(C,k)o=9053538 I=Z end else o=u[p(12386)]I={}end else if o<15085117 then if o<15078483 then C=k o=N o=15104 else o=u[p(12138)]I={}end else I=p(12723)o=u[I]k=z[r[1]]N={o(k)}I=N[1]k=I Z=N[3]C=N[2]o=9930241 end end end end end else if o<15349823 then if o<15241626 then if o<15201641 then if o<15164083 then if o<15114756 then if o<15101111 then I=z[r[1]]k=z[C]o=I[k]k=nil I=p(12609)I=o[I]I=I(o)o=z[r[1]]I=z[C]o[I]=k o=4089702 else W=p(12744)o=z[r[1]]Y=p(12821)m=p(12104)a=80 Z=p(12264)g=16 k=z[r[2]]N=p(12155)X=p(12626)l=60 M=255 V=p(12709)y=z[r[2]]D=.3 Q=u[m]m=p(12720)t=p(12684)P=Q[m]m=255 R=255 Q=P(m,M,R)C={[Z]=k,[N]=y,[W]=l;[Y]=a;[X]=g;[V]=D,[t]=Q}I=o(C)o=u[p(12759)]I={}end else if o<15132854 then o=u[p(12707)]C=nil I={}Z=nil else o=u[p(12614)]C=nil I={}end end else if o<15191019 then if o<15181173 then k=z[r[8]]o=k and 14932694 or 5381746 else I={I}o=u[p(12730)]end else o=u[p(12852)]I={}end end else if o<15231289 then if o<15218927 then if o<15210689 then I=p(12723)o=u[I]k=z[r[1]]N={o(k)}C=N[2]I=N[1]Z=N[3]k=I o=14058253 else N=z[r[2]]o=676882 k=N end else I=z[r[3]]C=p(12786)C=I[C]C=C(I)I=nil z[r[3]]=I o=12287834 end else if o<15236546 then if o<15234891 then Z=z[r[1]]k=p(12830)C=Z[k]o=C and 10023058 or 7449725 I=C else o=I and 12332607 or 6385332 end else k,y=C(Z,k)o=k and 2460311 or 6902637 end end end else if o<15288120 then if o<15282764 then if o<15279547 then if o<15255628 then I={}o=u[p(12666)]else k=nil o=8676261 end else I=z[r[1]]C=p(12547)o=I[C]C=0 I=p(12786)I=o[I]I=I(o,C)o=8089525 end else if o<15285841 then if o<15284462 then v=z[r[4]]o=617816 q=p(12683)n=v[q]v=p(12365)v=n[v]v=v(n)I=v else R=p(12689)M=u[R]l=nil R=p(12539)Q=c(Q)o=M[R]R=J(4958596,{X})Z=nil t=c(t)M=p(12573)M=o[M]M=M(o,R)M=z[C]I={}a=c(a)R=p(12768)o=M[R]D=c(D)M=p(12573)k=c(k)P=c(P)M=o[M]R=S(5757503,{r[4];g})M=M(o,R)M=z[C]R=p(12540)W=nil o=M[R]R=S(12940717,{r[4],N,g;V})M=p(12573)M=o[M]Y=c(Y)M=M(o,R)M=z[N]y=c(y)R=p(12768)o=M[R]R=B(5318191,{r[4];g})M=p(12573)M=o[M]M=M(o,R)R=p(12540)M=z[N]X=c(X)N=c(N)m=c(m)o=M[R]M=p(12573)M=o[M]R=U(9164832,{r[4],g,V;C})C=c(C)M=M(o,R)o=u[p(12763)]V=c(V)g=c(g)end else I={}o=u[p(12202)]end end else if o<15318269 then if o<15301444 then if o<15293417 then C=nil I={}o=u[p(12781)]Z=nil else o=p(12609)o=D[o]o=o(D)o=nil D=o o=9396756 end else i,py=F(H,i)o=i and 9026034 or 10480851 end else if o<15340851 then if o<15333006 then W=p(12627)o=z[r[3]]I=o(W)W=I o=W and 14760510 or 12998673 I=W else o=z[r[5]]I=o()o=10943395 end else k=z[r[1]]N=p(12742)Z=k[N]k=p(12622)C=Z[k]o=4634155 I=C end end end end else if o<15523668 then if o<15412896 then if o<15389599 then if o<15360952 then if o<15355845 then o=I and 14885132 or 10364925 else I=p(12786)o=z[r[2]]I=o[I]I=I(o)o=9019068 end else if o<15373598 then N=z[r[6]]y=N()N=false z[r[2]]=N y=z[r[7]]o=y and 5877337 or 12113221 else o=z[r[1]]I={o}o=u[p(12840)]end end else if o<15398511 then if o<15397409 then o=I and 3214815 or 900421 else k=p(12822)Z=e()z[Z]=I I=p(12356)o=z[Z]I=o[I]I=I(o,k)k=e()z[k]=I o=z[C]I=p(12588)N=z[Z]o[I]=N o=z[C]N=z[k]I=p(12407)o[I]=N o=z[Z]N=p(12280)I=p(12281)I=o[I]I=I(o,N)N=e()z[N]=I o=z[N]o=o and 8392525 or 13939516 end else o=u[p(12242)]I={}Z=nil C=nil end end else if o<15514759 then if o<15494394 then if o<15446306 then I=true o=true z[r[1]]=o z[r[2]]=I o=u[p(12682)]I={}else o=Z o=9784201 I=C end else o=I and 5446007 or 13587473 end else if o<15520180 then if o<15519042 then I=p(12575)C=x[1]N=p(12432)y=p(12083)k=p(12120)k=C[k]k=k(C,N,y)N=p(12773)N=k[N]y=p(12255)N=N(k,y)k=p(12749)Z=N..k o=I..Z I={o}o=u[p(12718)]else C=nil o=13587473 z[r[5]]=I end else o=336783 end end end else if o<15583812 then if o<15559220 then if o<15555425 then if o<15545085 then o=I and 10661289 or 4150827 else Z=z[r[1]]k=p(12830)C=Z[k]o=C and 5872031 or 1529440 I=C end else C=p(12719)I=u[C]C=p(12392)o=I[C]C=z[r[1]]I=o(C)o=9467858 end else if o<15571811 then if o<15563251 then Z=p(12547)I=z[r[1]]o=I[Z]o=o and 12334403 or 7296560 else o=a g=p(12281)V=p(12169)g=C[g]g=g(C,V)X=o o=g and 4231535 or 12192271 a=g end else W=p(12409)y=u[W]W=p(12810)N=y[W]o=4503471 W=p(12755)y=N(W,Z)I=y end end else if o<15608268 then if o<15601042 then if o<15588878 then I={}o=u[p(12094)]C=nil else F=p(12368)f=u[F]py={f(q)}H=py[2]i=py[3]F=py[1]o=13319929 end else m=p(12409)Q=u[m]R=p(12282)m=p(12810)o=Q[m]n=p(12321)m=p(12488)Q=o(m)M=z[C]o=p(12628)m=M[R]Q[o]=m m=false o=p(12442)q=.45 M=p(12356)i=p(12585)R=p(12075)Q[o]=m o=p(12350)m=z[r[1]]M=m[M]M=M(m,R)Q[o]=M M=p(12409)m=u[M]M=p(12810)o=m[M]M=p(12475)F=0 m=o(M)o=p(12551)M=1 m[o]=M M=Q o=p(12350)m[o]=M R=u[n]o=p(12216)n=p(12810)M=R[n]v=.5 n=.5 R=M(n,v)H=350 n=p(12699)f=0 m[o]=R o=p(12801)R=u[n]n=p(12810)M=R[n]v=0 n=.5 R=M(n,v,q,f)m[o]=R o=p(12411)n=p(12699)v=250 q=0 R=u[n]n=p(12810)M=R[n]n=0 f=250 R=M(n,v,q,f)m[o]=R n=p(12590)R=z[C]o=p(12661)M=R[n]m[o]=M R=p(12454)M=p(12689)o=u[M]M=p(12394)f=350 q=p(12699)M=o[M]M=M(o,R)v=u[q]q=p(12810)R=p(12411)n=v[q]q=0 v=n(q,f,F,H)o={[R]=v}v=p(12278)n=u[v]R=o v=p(12810)o=n[v]H=p(12585)v=.5 F=u[H]H=p(12116)f=F[H]F=p(12377)q=f[F]H=u[i]i=p(12308)F=H[i]H=p(12726)f=F[H]n=o(v,q,f)F=O(12842116,{l;g;Z})q=Q o=p(12245)o=M[o]v=p(12346)o=o(M,m,n,R)v=o[v]v=v(o)v=p(12022)o=z[C]o[v]=q o=z[C]v=p(12315)q=m o[v]=q q=p(12719)v=u[q]q=p(12783)o=v[q]q=1 v=o(q)v=z[C]q=p(12144)o=v[q]q=z[k]f=z[Z]v=o(q,f,F)q=p(12719)v=u[q]q=p(12783)o=v[q]q=.5 v=o(q)v=z[C]q=p(12315)o=v[q]o=o and 15943623 or 4418458 end else if o<15642290 then if o<15627514 then o=I and 12529521 or 9549860 else l=nil o=5544655 W=nil end else m=p(12111)Q=g[m]m=0 P=Q>m o=7503427 D=P end end end end end end else if o<16158735 then if o<15900868 then if o<15803113 then if o<15739043 then if o<15707202 then if o<15677603 then if o<15660648 then N=o W=z[r[3]]y=not W o=y and 6533369 or 466342 k=y else o=I and 13947596 or 13033508 end else if o<15693731 then y,W=k(N,y)o=y and 12578204 or 15521383 else o=400 z[r[1]]=o I={}o=u[p(12307)]end end else if o<15729778 then if o<15715266 then k=p(12779)W=p(12585)I=C[k]y=u[W]W=p(12779)N=y[W]y=p(12336)k=N[y]o=I==k o=o and 14586985 or 4523737 else o=z[r[1]]I=p(12369)N=p(12369)k=u[N]y=p(12369)N=p(12810)Z=k[N]a=p(12489)W=0 N=z[r[2]]k=Z(N)N=u[y]y=p(12630)Z=N[y]y=0 Y=u[a]a=p(12065)l=Y[a]a=z[r[3]]Y={l(a)}N=Z(y,W,s(Y))C=k*N o[I]=C C=z[r[4]]I=C o=C and 16405528 or 15540597 end else m=R o=n o=R and 543324 or 5261219 end end else if o<15777733 then if o<15749149 then if o<15741600 then o=z[r[4]]I=o(C)o=2703492 else o=u[p(12788)]I=z[r[2]]I={I}end else o=u[p(12151)]I={}end else if o<15795986 then if o<15782019 then N=z[r[2]]y=p(12252)k=N[y]y=p(12280)Z=o N=p(12855)N=k[N]N=N(k,y)C=N o=N and 14928251 or 13823429 else o=u[p(12378)]I={}end else t=o o=g and 15649868 or 7503427 D=g end end end else if o<15847208 then if o<15820557 then if o<15818374 then if o<15815454 then o=I and 12918822 or 6352224 else y=p(12369)C=x[1]N=u[y]Z=x[2]l=p(12002)y=p(12810)k=N[y]a=p(12489)W=u[l]l=p(12059)y=W[l]N=k(y,C)W=p(12369)y=u[W]W=p(12630)k=y[W]Y=u[a]a=p(12065)l=Y[a]Y=l(Z)W=0 l=0 y=k(W,Y,l)I=N*y k=p(12152)o=I[k]I={o}o=u[p(12837)]end else o=12936501 g=nil end else if o<15842103 then if o<15828752 then Z=N o=y o=N and 8919117 or 4141289 else o=V and 1301566 or 4649275 end else o=nil I={o}o=u[p(12430)]end end else if o<15877789 then if o<15872422 then if o<15852424 then o=z[r[1]]o=o and 72831 or 9802922 else Z=z[r[1]]C=not Z I=C o=C and 5729569 or 12461109 end else y=p(12153)Y=p(12585)N=C[y]l=u[Y]Y=p(12153)W=l[Y]l=p(12671)y=W[l]k=N==y I=k o=k and 3966693 or 7077489 end else if o<15899487 then if o<15891972 then y=z[r[8]]Y=z[r[9]]a=z[r[5]]l=Y[a]Y=false W=y(l,Y)a=p(12407)z[r[7]]=W X=p(12731)y=z[r[10]]g=z[r[5]]Y={[a]=Z;[X]=g}l=y(Y)y=z[r[7]]o=y and 12937659 or 16266641 else o=I and 12728923 or 12740279 end else t=p(12060)V=o D=u[t]o=D and 13583300 or 7675736 g=D end end end end else if o<16080127 then if o<16024193 then if o<15953177 then if o<15936283 then if o<15915969 then o=k N=.8 y=1 k=nil I=p(12346)I=o[I]I=I(o,C,Z,k,N,y)o=z[r[1]]y=o k=o C=p(12302)W=z[r[2]]o=W and 1497938 or 14758888 N=W else W=p(12585)k=p(12779)I=C[k]y=u[W]W=p(12779)N=y[W]y=p(12012)k=N[y]o=I==k o=o and 1351958 or 14302543 end else if o<15951178 then F=p(12699)f=u[F]H=250 F=p(12810)b=p(12585)q=f[F]v=p(12411)py=250 F=0 i=0 f=q(F,H,i,py)F=1 q=p(12632)o={[v]=f;[q]=F}v=o f=p(12278)q=u[f]f=p(12810)o=q[f]f=.3 py=p(12585)i=u[py]py=p(12116)H=i[py]i=p(12377)F=H[i]py=u[b]b=p(12308)i=py[b]py=p(12726)H=i[py]q=o(f,F,H)f=p(12689)o=u[f]F=p(12454)f=p(12394)f=o[f]f=f(o,F)H=z[C]i=p(12315)o=p(12245)o=f[o]F=H[i]o=o(f,F,q,v)f=o o=p(12346)v=nil o=f[o]o=o(f)F=p(12787)q=nil o=f[F]f=nil F=p(12365)F=o[F]F=F(o)o=4418458 else k=p(12786)Z=z[r[5]]k=Z[k]o=14495562 k=k(Z)Z=nil z[r[5]]=Z end end else if o<15993927 then if o<15963166 then o=10820724 X=p(12583)a=u[X]I=a else Q=p(12489)o=12321434 P=u[Q]Q=p(12794)t=P[Q]m=p(12012)Q=Y[m]P=t(Q)Q=p(12012)t=a[Q]D=P<t g=D end else Y=p(12801)o=z[r[2]]X=nil y=nil l=Z[Y]Y=p(12348)I=o(l)o=z[r[3]]k=nil a=nil N=nil l=p(12850)W=nil I=o(C,l,Y,a,X)o=3751785 end end else if o<16050738 then if o<16048026 then if o<16045667 then I={}o=u[p(12200)]else o=6377126 end else o=0 I=nil z[r[1]]=o z[r[2]]=I o=u[p(12509)]I={}end else if o<16064797 then if o<16057152 then o=u[p(12660)]C=nil Y=p(12719)l=u[Y]Y=p(12668)N=l[Y]Y=S(533669,{r[14],Z,r[5]})l=N(Y)Z=c(Z)I={}else py=nil f=nil o=3877213 end else o=Y o=I and 16372636 or 7465918 end end end else if o<16125227 then if o<16097223 then if o<16086082 then if o<16085505 then o=p(12530)o=M[o]o=o(M)o=6498252 else o=u[p(12401)]I={}end else I={}o=u[p(12690)]end else if o<16112719 then if o<16098946 then k=7 N=k k=1 I=1 y=k k=0 o=15034608 W=y<k k=I-y else Z=z[r[1]]C=not Z I=C o=C and 12465175 or 3364854 end else Z=z[r[2]]o=16153468 k=p(12683)C=Z[k]Z=p(12365)Z=C[Z]Z=Z(C)I=Z end end else if o<16138798 then if o<16138035 then if o<16131191 then o=p(12281)I=p(12822)o=C[o]o=o(C,I)Z=e()z[Z]=o I=z[Z]o=not I o=o and 1660235 or 4008432 else o=z[r[1]]o=o and 10157313 or 16463870 end else W=p(12547)o=14870124 y=z[r[1]]N=y[W]y=p(12622)k=N[y]I=k end else if o<16148099 then if o<16147084 then Z=false o=false C=p(12663)z[r[2]]=o I=z[r[3]]I[C]=Z Z=p(12252)C=z[r[4]]I=C[Z]C=I I=not C o=I and 5056648 or 8251088 else o=I and 1429843 or 5722280 end else C=I I=p(12822)o=p(12356)o=C[o]o=o(C,I)W=z[r[3]]l=p(12444)N=o y=W[l]Z=o o=y and 10396687 or 4718382 k=y end end end end end else if o<16418495 then if o<16253398 then if o<16202987 then if o<16188694 then if o<16171936 then if o<16166520 then y=k l=p(12328)o=u[l]l=p(12281)l=o[l]l=l(o,W)o=l and 11065565 or 10718255 else W=z[r[4]]y=not W o=10725692 k=y end else if o<16174168 then Z=p(12822)I=p(12281)I=C[I]I=I(C,Z)Z=e()z[Z]=I k=z[Z]I=not k o=I and 6201734 or 429835 else l=p(12555)N=p(12315)I=p(12199)C=false Y=p(12590)Z=p(12022)y=nil W=p(12282)a=p(12621)k=nil o={[I]=C,[Z]=k,[N]=y;[W]=l,[Y]=a}C=e()z[C]=o I=p(12144)Z=U(13983923,{r[1];r[2],r[3]})k=p(12313)o=z[C]o[I]=Z N=d(6513213,{r[5],C})o=z[r[4]]Z=p(12752)C=c(C)I=o(Z,k,N)I={}o=u[p(12545)]end end else if o<16200201 then if o<16198369 then t=p(12483)Q=p(12801)D=u[t]t=p(12828)o=D[t]P=g[Q]t={a;P}D=o(k,t)o=12584962 else o=u[p(12619)]I={}end else V=p(12495)g=u[V]V=g()o=7493438 g=p(12538)D=Z V[g]=D end end else if o<16214510 then if o<16205661 then if o<16204549 then o=z[r[5]]I=o()o=12184091 else l=nil o=12520123 W=nil end else y=p(12124)N=u[y]y=N(Z)o=12176526 N=p(12021)k=y~=N I=k end else if o<16223791 then if o<16218181 then Z=p(12822)I=p(12281)I=C[I]I=I(C,Z)Z=I I=not Z o=I and 12008566 or 13865511 else o=false z[r[1]]=o I=z[r[2]]C=I()I=z[r[3]]o=I and 15229822 or 12287834 end else o=6152094 z[r[1]]=I end end end else if o<16336511 then if o<16284771 then if o<16274026 then if o<16258240 then Y=p(12409)I=u[Y]Y=p(12810)o=I[Y]Y=p(12343)I=o(Y)Y=I o=p(12628)I=p(12087)l=nil Y[o]=I a=1165 I=false o=p(12405)Y[o]=I o=p(12095)o=Y[o]X=p(12318)I=p(12836)o=o(Y,I,a)I=p(11996)o=p(12636)Y[o]=I I=p(12238)o=Y[I]I=p(12573)I=o[I]a=B(29517,{k,W})I=I(o,a)C=nil I=p(12088)a=O(1153783,{k})o=Y[I]I=p(12573)I=o[I]I=I(o,a)I=p(12531)o=Y[I]I=p(12573)a=B(13908668,{k;Z})I=o[I]Z=c(Z)I=I(o,a)y=c(y)o=p(12350)a=z[r[3]]W=c(W)N=c(N)I=a[X]Y[o]=I o=u[p(12758)]k=c(k)I={}Y=nil else y=true z[r[2]]=y a=z[r[1]]Y=o o=a and 9287800 or 457163 l=a end else o=true z[r[1]]=o o=u[p(12789)]I={}end else if o<16329250 then if o<16296211 then C=z[r[2]]o=15394835 I=C else o=z[r[2]]o=o and 15357273 or 9019068 end else o=z[r[2]]Z=true I=o(C,Z)o=582324 end end else if o<16374557 then if o<16349091 then if o<16346576 then W=o Y=z[r[5]]l=not Y o=l and 1891401 or 840107 y=l else X=nil g=p(12034)a=p(12670)M=p(12500)V=nil Q=p(12147)o=3906897 D=p(12397)t=1 Y=p(12305)P=p(12252)N=z[r[12]]m=z[r[4]]R=0 l={[Y]=Z,[a]=X;[g]=V,[D]=t;[P]=C;[Q]=m,[M]=R}W=N(l)end else X=O(2181190,{a;l})Y=p(12080)I=u[Y]Y=I(X)o=7465918 end else if o<16400501 then if o<16399683 then g=p(12295)X=p(12041)X=W[X]o=14648013 X=X(W,g)Y=X else o=I and 8515446 or 7152526 end else Z=z[r[4]]k=p(12350)o=15540597 C=Z[k]I=C end end end end else if o<16643527 then if o<16576059 then if o<16547166 then if o<16517782 then if o<16487336 then I={}o=u[p(12107)]else k=p(12328)Z=p(12350)I=C[Z]Z=u[k]o=I==Z o=o and 10968553 or 7023835 end else P,Q=D(t,P)o=P and 16636833 or 9026128 end else if o<16571838 then if o<16560115 then o=p(12350)Z=p(12328)C=x[1]I=u[Z]C[o]=I o=p(12281)I=p(12596)Z=true o=C[o]o=o(C,I,Z)Z=o o=Z and 9792160 or 10452875 else N=Z W=1 o=y[W]l=p(12822)W=o o=p(12281)o=W[o]o=o(W,l)l=o o=l and 12402094 or 6894372 end else a=1 k=z[r[7]]W=z[r[8]]l=p(12012)y=W[l]W=false N=k(y,W)C=nil k=z[r[9]]N=p(12346)Y=p(12801)l=z[Z]W=l[Y]l=nil N=k[N]o=u[p(12623)]Y=.8 y=p(12019)N=N(k,y,W,l,Y,a)y=p(12719)N=u[y]y=p(12668)k=N[y]y=S(821993,{r[2],r[1];r[3];r[10],r[4]})N=k(y)I={}y=p(12719)N=u[y]y=p(12668)k=N[y]y=B(2722459,{r[2];r[1],r[7],r[8];r[9];Z})N=k(y)Z=c(Z)end end else if o<16630503 then if o<16626582 then if o<16585245 then y=e()l=p(12080)C=x o=true Y=O(11770827,{y})Z=e()N=e()k=p(12021)z[Z]=o I=u[k]k=p(12534)o=I[k]k=e()z[k]=o o=L(667383,{})z[N]=o o=false z[y]=o W=u[l]l=W(Y)I=l o=l and 11018049 or 8273476 else o=z[r[4]]I=o()o=13940619 end else o=z[r[2]]I=o()o=1873297 end else if o<16642460 then if o<16639047 then m=p(12281)V=P m=W[m]m=m(W,Q)o=m and 10369004 or 3100483 else C=z[r[2]]I=C o=13558364 end else o=9541837 f=p(12546)q=u[f]n=q end end end else if o<16725329 then if o<16655721 then if o<16653543 then if o<16645364 then C=I o=C and 2759719 or 10289638 else k=p(12547)Z=z[r[1]]C=Z[k]I=C o=C and 4411113 or 14323680 end else k=z[r[7]]a=1 l=p(12012)W=z[r[8]]y=W[l]W=false Y=p(12801)N=k(y,W)N=p(12346)k=z[r[9]]y=p(12019)l=z[Z]W=l[Y]Y=.8 N=k[N]l=nil N=N(k,y,W,l,Y,a)y=p(12719)o=u[p(12114)]I={}N=u[y]y=p(12668)C=nil k=N[y]y=B(5829867,{r[2];r[1],r[3],r[10];r[4]})N=k(y)y=p(12719)N=u[y]y=p(12668)k=N[y]y=B(13002105,{r[2];r[1],r[7];r[8],r[9],Z})N=k(y)Z=c(Z)end else if o<16713974 then if o<16680699 then o=a o=Y and 2111409 or 11351964 W=Y else o=X and 682704 or 2021881 end else I={}o=u[p(12562)]end end else if o<16759643 then if o<16744207 then if o<16734164 then k=p(12368)Y=p(12508)Z=u[k]W=z[r[3]]Y=W[Y]o=15692446 l={Y(W)}W={Z(s(l))}y=W[3]N=W[2]k=W[1]else C=I o=C and 12749911 or 7666236 end else o=p(12350)Z=p(12328)I=u[Z]C[o]=I I=p(12596)o=p(12281)Z=true o=C[o]o=o(C,I,Z)Z=o o=not Z o=o and 590688 or 393852 end else if o<16766228 then if o<16761689 then o=16694559 D=p(12475)g=z[a]V=p(12041)V=g[V]V=V(g,D)X=V else o=3688600 k=z[r[5]]N=k()end else C=e()z[C]=I o=z[C]o=o and 106381 or 9263650 end end end end end end end end end end end o=#G return s(I)end,function(u,p)local s=k(p)local x=function(x,r)return o(u,{x,r},p,s)end return x end,{},function(u,p)local s=k(p)local x=function()return o(u,{},p,s)end return x end,function(u)for p=1,#u,1 do C[u[p]]=C[u[p]]+1 end if x then local o=x(true)local s=G(o)s[p(12600)],s[p(12667)],s[p(12140)]=u,N,function()return 316242 end return o else return r({},{[p(12667)]=N,[p(12600)]=u;[p(12140)]=function()return 316242 end})end end,function(u,p)local s=k(p)local x=function(x,r,G,w,I,z,C,e)return o(u,{x,r;G,w,I;z;C;e},p,s)end return x end,function(u,p)local s=k(p)local x=function(x,r,G)return o(u,{x,r;G},p,s)end return x end,0 return(y(16577149,{}))(s(I))end)(getfenv and getfenv()or _ENV,unpack or table[p(12583)],newproxy,setmetatable,getmetatable,select,{...})end)(...)

]=]

local OnionCoreSource = [=[
local OnionBundle, OnionConfig = ...
-- Branding adapter for the bundled UI. Only roots identified as this hub are edited.
local OnionCreatingInterface = false
local function InstallOnionBranding()
    local roots, watched, tracked = {}, {}, {}
    local connections = {}
    local styling = setmetatable({}, {__mode = "k"})
    local palette = {
        Background = Color3.fromRGB(13, 18, 25),
        Surface = Color3.fromRGB(20, 28, 37),
        Border = Color3.fromRGB(41, 62, 73),
        Accent = Color3.fromRGB(48, 222, 190),
        Text = Color3.fromRGB(225, 235, 241),
        Muted = Color3.fromRGB(157, 178, 189),
    }
    local function accent(color)
        for _, themeColor in pairs(palette) do
            if color == themeColor then return color end
        end
        local h, s, v = color:ToHSV()
        if h >= 0.56 and h <= 0.87 and s > 0.25 then
            return Color3.fromHSV(0.47, math.clamp(s, 0.45, 0.82), math.clamp(v, 0.22, 0.94))
        end
        return color
    end
    local function set(object, property, value)
        if object[property] ~= value then object[property] = value end
    end
    local function style(object)
        if styling[object] then return end
        styling[object] = true
        local ok, reason = pcall(function()
            if object:IsA("GuiObject") then
                local color = object.BackgroundColor3
                local _, saturation, value = color:ToHSV()
                if saturation < 0.18 and value < 0.19 then
                    set(object, "BackgroundColor3", value < 0.055 and palette.Background or palette.Surface)
                else
                    set(object, "BackgroundColor3", accent(color))
                end
            end
            if object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox") then
                local color = object.TextColor3
                local _, saturation, value = color:ToHSV()
                if saturation < 0.12 and value >= 0.4 then
                    set(object, "TextColor3", value >= 0.78 and palette.Text or palette.Muted)
                else
                    set(object, "TextColor3", accent(color))
                end
                if object.Font == Enum.Font.FredokaOne or object.Font == Enum.Font.Cartoon then
                    set(object, "Font", Enum.Font.GothamMedium)
                end
            elseif object:IsA("ImageLabel") or object:IsA("ImageButton") then
                set(object, "ImageColor3", accent(object.ImageColor3))
            elseif object:IsA("UIStroke") then
                set(object, "Color", accent(object.Color))
            elseif object:IsA("UIGradient") then
                local points, changed = {}, false
                for _, point in ipairs(object.Color.Keypoints) do
                    local color = accent(point.Value)
                    if color ~= point.Value then changed = true end
                    table.insert(points, ColorSequenceKeypoint.new(point.Time, color))
                end
                if changed then object.Color = ColorSequence.new(points) end
            end
            if object:IsA("ScrollingFrame") then
                set(object, "ScrollBarImageColor3", palette.Accent)
                set(object, "ScrollBarThickness", 4)
            end
            if object:IsA("TextBox") then
                set(object, "PlaceholderColor3", palette.Muted)
            end
            if object:IsA("Frame") and object.BackgroundTransparency < 0.2 then
                local size = object.AbsoluteSize
                if size.X >= 180 and size.Y >= 100 then
                    if not object:FindFirstChildOfClass("UICorner") then
                        local corner = Instance.new("UICorner")
                        corner.Name = "OnionPanelCorner"
                        corner.CornerRadius = UDim.new(0, 12)
                        corner.Parent = object
                    end
                    if not object:FindFirstChildOfClass("UIStroke") then
                        local stroke = Instance.new("UIStroke")
                        stroke.Name = "OnionPanelBorder"
                        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                        stroke.Color = palette.Border
                        stroke.Transparency = 0.45
                        stroke.Thickness = 1
                        stroke.Parent = object
                    end
                end
            end
        end)
        styling[object] = nil
        if not ok then warn("[Onion UI] " .. tostring(reason)) end
    end
    local function branded(text)
        local value = string.lower(tostring(text or ""))
        return value:find("quantum", 1, true) or value:find("onyx", 1, true)
    end
    local function rename(text)
        return (text:gsub("[Qq][Uu][Aa][Nn][Tt][Uu][Mm]%s*[Oo][Nn][Yy][Xx]", "Onion")
            :gsub("[Qq][Uu][Aa][Nn][Tt][Uu][Mm]", "Onion")
            :gsub("[Oo][Nn][Yy][Xx]", "Onion")
            :gsub("OnionHub", "Onion"))
    end
    local function connect(signal, callback)
        local connection = signal:Connect(callback)
        table.insert(connections, connection)
        return connection
    end
    local function isText(object)
        return object:IsA("TextLabel") or object:IsA("TextButton") or object:IsA("TextBox")
    end
    local function markLogo(object)
        if not (object:IsA("ImageLabel") or object:IsA("ImageButton")) then return end
        local name = object.Name:lower()
        local size = object.AbsoluteSize
        local parent = object.Parent
        local floating = object:IsA("ImageButton") and parent and
            (parent:IsA("ScreenGui") or (parent.Parent and parent.Parent:IsA("ScreenGui"))) and
            size.X >= 40 and size.X <= 100 and math.abs(size.X - size.Y) <= 3
        if not (name:find("logo", 1, true) or branded(name) or floating) then return end
        if object:FindFirstChild("OnionBrandMark") then return end
        object.ImageTransparency = 1
        local label = Instance.new("TextLabel")
        label.Name = "OnionBrandMark"
        label.Size = UDim2.fromScale(1, 1)
        label.BackgroundColor3 = Color3.fromRGB(12, 22, 29)
        label.BorderSizePixel = 0
        label.Text = "O"
        label.Font = Enum.Font.GothamBold
        label.TextColor3 = palette.Accent
        label.TextScaled = true
        label.Active = false
        label.ZIndex = object.ZIndex + 1
        label.Parent = object
        local padding = Instance.new("UIPadding")
        padding.PaddingTop = UDim.new(0.18, 0)
        padding.PaddingBottom = UDim.new(0.18, 0)
        padding.Parent = label
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(1, 0)
        corner.Parent = label
    end
    local function edit(object)
        if isText(object) then
            local updated = rename(object.Text)
            if updated ~= object.Text then object.Text = updated end
        end
        markLogo(object)
        style(object)
    end
    local enroll, observe
    observe = function(object, root)
        if tracked[object] then return end
        tracked[object] = true
        local function update()
            if not roots[root] and (branded(object.Name) or (isText(object) and branded(object.Text))) then
                enroll(root)
            end
            if roots[root] then edit(object) end
        end
        if isText(object) then connect(object:GetPropertyChangedSignal("Text"), update) end
        if object:IsA("ImageLabel") or object:IsA("ImageButton") then
            connect(object:GetPropertyChangedSignal("AbsoluteSize"), update)
        end
        local properties = {}
        if object:IsA("GuiObject") then table.insert(properties, "BackgroundColor3") end
        if isText(object) then table.insert(properties, "TextColor3") end
        if object:IsA("ImageLabel") or object:IsA("ImageButton") then table.insert(properties, "ImageColor3") end
        if object:IsA("UIStroke") or object:IsA("UIGradient") then table.insert(properties, "Color") end
        for _, property in ipairs(properties) do
            connect(object:GetPropertyChangedSignal(property), function()
                if roots[root] then style(object) end
            end)
        end
        if object:IsA("Frame") then
            connect(object:GetPropertyChangedSignal("AbsoluteSize"), function()
                if roots[root] then style(object) end
            end)
        end
        update()
    end
    enroll = function(root)
        if roots[root] then return end
        roots[root] = true
        for _, object in ipairs(root:GetDescendants()) do edit(object) end
    end
    local function inspectRoot(root)
        if not root:IsA("ScreenGui") or watched[root] then return end
        watched[root] = true
        connect(root.DescendantAdded, function(object) observe(object, root) end)
        if OnionCreatingInterface or branded(root.Name) or root.Name:lower():find("onion", 1, true) then enroll(root) end
        for _, object in ipairs(root:GetDescendants()) do observe(object, root) end
    end
    local containers = {game:GetService("CoreGui"), game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")}
    if gethui then
        local ok, container = pcall(gethui)
        if ok and container then table.insert(containers, container) end
    end
    local seen = {}
    for _, container in ipairs(containers) do
        if not seen[container] then
            seen[container] = true
            pcall(function()
                inspectRoot(container)
                connect(container.DescendantAdded, inspectRoot)
                for _, object in ipairs(container:GetDescendants()) do inspectRoot(object) end
            end)
        end
    end
    return function()
        for _, connection in ipairs(connections) do connection:Disconnect() end
        table.clear(connections)
    end
end
local OnionBrandingCleanup = nil -- New UI supplies Onion Project branding directly.

	local fn = cloneref or function(arg)
		return arg
	end

	while true do
		task.wait()
		if not (game:IsLoaded() and game.Players.LocalPlayer:FindFirstChild("DataLoaded")) then
			continue
		end
		break
	end

	local v = fn(game:GetService("Players"))

	if v.LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)") then
		if not getgenv().Team or getgenv().Team == "" then
			getgenv().Team = "Pirates"
		end

		local container = v.LocalPlayer.PlayerGui["Main (minimal)"]:WaitForChild("ChooseTeam"):WaitForChild("Container")
		local textButton = nil

		if getgenv().Team == "Pirates" then
			textButton = container:WaitForChild("Pirates"):WaitForChild("Frame"):WaitForChild("TextButton")
		elseif getgenv().Team == "Marines" then
			textButton = container:WaitForChild("Marines"):WaitForChild("Frame"):WaitForChild("TextButton")
		end

		if textButton then
			repeat
				task.wait()

				pcall(function()
					firesignal(textButton.Activated)
				end)
			until not v.LocalPlayer.PlayerGui:FindFirstChild("Main (minimal)")
		end
	end

	repeat
		task.wait()
	until v.LocalPlayer.PlayerGui:FindFirstChild("Main")

	if getgenv().OnionHubActive then
		return print("already running")
	end
	getgenv().OnionHubActive = true
	local request_ = nil

	if syn and syn.request then
		request_ = syn.request
	elseif http_request then
		request_ = http_request
	elseif http and http.request then
		request_ = http.request
	else
		request_ = request or httprequest or request_
	end

	local function fn2(arg)
		if not request_ then
			return nil
		end
		return request_(arg)
	end

	local tbl = {
		AutoAttack = true,
		FastSettings = "Fast Attack",
		FastAttackDelay = 0,
		attackmobs = true,
		BringMonster = true,
		BringMonsterRadius = 250,
		MasteryFarm = false,
		HealthMob = 50,
		HopDelay = 10,
		StopHopEliteIfChalice = true,
	}

	local tbl2 = {
		Services = {},
		Player = {},
		Environment = {},
		Remotes = {},
		Modules = {},
		Preload = {},
		Cache = {},
		Runtime = {},
		Performance = {},
		Webhook = {},
	}

	setmetatable(tbl2.Services, { __index = function(arg, arg2)
		local ok, result = pcall(game.GetService, game, arg2)

		if ok and result then
			local v2 = fn(result)
			rawset(arg, arg2, v2)
			return v2
		end

		return nil
	end })

	local v2 = fn(game:GetService("Workspace"))
	local v3 = fn(game:GetService("Players"))
	local v4 = fn(game:GetService("ReplicatedStorage"))
	local v5 = fn(game:GetService("CollectionService"))
	local v6 = fn(game:GetService("RunService"))
	local v7 = fn(game:GetService("Lighting"))
	local v8 = fn(game:GetService("VirtualInputManager"))
	local v9 = fn(game:GetService("HttpService"))
	local v10 = fn(game:GetService("UserInputService"))
	local v11 = fn(game:GetService("LogService"))
	local v12 = fn(game:GetService("ScriptContext"))
	local v13 = fn(game:GetService("StarterGui"))
	local v14 = fn(game:GetService("Stats"))
	local v15 = fn(game:GetService("TeleportService"))
	local v16 = fn(game:GetService("GuiService"))
	local v17 = fn(game:GetService("VirtualUser"))
	tbl2.Services.Workspace = v2
	tbl2.Services.Players = v3
	tbl2.Services.ReplicatedStorage = v4
	tbl2.Services.CollectionService = v5
	tbl2.Services.RunService = v6
	tbl2.Services.Lighting = v7
	tbl2.Services.VirtualInputManager = v8
	tbl2.Services.HttpService = v9
	tbl2.Services.UserInputService = v10
	tbl2.Services.LogService = v11
	tbl2.Services.ScriptContext = v12
	tbl2.Services.StarterGui = v13
	tbl2.Services.Stats = v14
	tbl2.Services.TeleportService = v15
	tbl2.Services.GuiService = v16
	tbl2.Services.VirtualUser = v17
	local tbl3 = {}
	local tbl4 = {}
	local obj = setmetatable({}, { __mode = "k" })
	local tbl5 = {}
	local obj2 = setmetatable({}, { __mode = "k" })
	local obj3 = setmetatable({}, { __mode = "k" })
	local localPlayer = v3.LocalPlayer
	local v18 = localPlayer
	local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
	local humanoid = character:WaitForChild("Humanoid", 10)
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 10)
	local data = localPlayer:WaitForChild("Data")
	local level = data:WaitForChild("Level")
	local fragments = data:WaitForChild("Fragments")
	local beli = data:WaitForChild("Beli")

	tbl2.Player = {
		LocalPlayer = localPlayer,
		Character = character,
		Humanoid = humanoid,
		HumanoidRootPart = humanoidRootPart,
		Data = data,
		Level = level,
		Fragments = fragments,
		Beli = beli,
		Money = beli,
	}

	local function fn3(character2)
		if not character2 then
			return
		end
		character = character2
		humanoid = character2:WaitForChild("Humanoid", 10)
		humanoidRootPart = character2:WaitForChild("HumanoidRootPart", 10)
		tbl2.Player.Character = character2
		tbl2.Player.Humanoid = humanoid
		tbl2.Player.HumanoidRootPart = humanoidRootPart
	end

	localPlayer.CharacterAdded:Connect(fn3)
	local enemies = v2:WaitForChild("Enemies")
	local seaBeasts = v2:WaitForChild("SeaBeasts")
	local boats = v2:WaitForChild("Boats")
	local map = v2:WaitForChild("Map")
	local worldOrigin = v2:WaitForChild("_WorldOrigin")
	local attribute = v2:GetAttribute("MAP")
	local flag = attribute == "Sea1"
	local flag2 = attribute == "Sea2"
	local flag3 = attribute == "Sea3"

	tbl2.Environment = {
		Workspace = v2,
		Enemies = enemies,
		SeaBeasts = seaBeasts,
		Boats = boats,
		Map = map,
		WorldOrigin = worldOrigin,
		MAPA = attribute,
		Sea_1 = flag,
		Sea_2 = flag2,
		Sea_3 = flag3,
	}

	local remotes = v4:WaitForChild("Remotes")
	local commF = remotes:WaitForChild("CommF_")
	local commE = v4.Remotes.CommE
	local modules = v4:WaitForChild("Modules")
	local net = modules:WaitForChild("Net")
	tbl2.Remotes = { Remotes = remotes, CommF_ = commF, CommE = commE, Modules = modules, Net = net }
	local GuideModule = require(v4:WaitForChild("GuideModule"))
	local GetWaterHeightAtLocation = require(v4.Util.GetWaterHeightAtLocation)
	local DangerDistance = require(v4.DangerDistance)
	local Net = require(game.ReplicatedStorage.Modules.Net)
	local ItemConfig = require(game.ReplicatedStorage.ItemConfig)

	pcall(function()
		local CombatUtil = require(v4:WaitForChild("Modules"):WaitForChild("CombatUtil"))

		if CombatUtil and CombatUtil.CanAttack and hookfunction then
			hookfunction(CombatUtil.CanAttack, function()
				return true
			end)
		end
	end)

	tbl2.Modules = { GuideModule = GuideModule, GetWaterHeight = GetWaterHeightAtLocation, DangerDistance = DangerDistance, Net3 = Net, ItemConfig = ItemConfig }
	local str = "https://api.quantumonyx.cc"
	local str2 = "QnTmOnyX"

	local function fn4(arg, arg2)
		return (arg - ("QnTmOnyX"):byte((arg2 - 1) % #str2 + 1) - arg2) % 32
	end

	local function fn5(arg)
		local str3 = arg:gsub("^%.", ""):gsub("%.$", "")
		local tbl6 = {}
		local n = 0
		local _vm___1 = 1

		for i = 1, #str3 do
			n += 1

			if n % 5 ~= 0 then
				table.insert(tbl6, str3:sub(i, i))
			end
		end

		local _vm___0
		_vm___1 = _vm___0
		local str4 = table.concat(tbl6)
		local tbl7 = {}
		local n2 = 1
		local n3 = 1

		while n2 <= #str4 do
			local str5 = str4:sub(n2, n2)
			local str6 = str4:sub(n2 + 1, n2 + 1)
			local n4 = ("kQ9mZ2xW7nR4vB1jY6tF3hD8pL5cG0sA"):find(str5, 1, true) - 1
			local n5 = ("kQ9mZ2xW7nR4vB1jY6tF3hD8pL5cG0sA"):find(str6, 1, true) - 1
			table.insert(tbl7, string.char(fn4(n4, n3) + fn4(n5, n3 + 100) * 32))
			n2 += 2
			n3 += 1
		end

		return table.concat(tbl7)
	end

	local str3 = "https://raw.githubusercontent.com/flazhy/QuantumOnyx/main/"
	local tbl6 = {}
	local tbl7 = {}

	local function fn6(path)
        if tbl7[path] ~= nil then return tbl7[path] end
        local source = OnionBundle[path]
        assert(type(source) == "string", "Onion bundled module missing: " .. tostring(path))
        local chunk, compileError = loadstring(source, "@Onion/" .. path)
        assert(chunk, compileError)
        local ok, result = pcall(chunk)
        if not ok then error("Onion module " .. path .. ": " .. tostring(result), 2) end
        if result ~= nil then tbl7[path] = result end
        return result
    end

	local lua = fn6("Util/BloxFruitModule/Preload/Data.lua") or {}
	local lua2 = fn6("Util/BloxFruitModule/Preload/Visuals.lua") or {}
	local lua3 = fn6("dev/testers.lua")
	local materialEnemies = lua.MaterialEnemies
	local quests = lua.QUESTS
	local bossList = lua.BossList
	local itemsToBuy = lua.ItemsToBuy
	local islands = lua.Islands
	local melees = lua.Melees
	local swordData = lua.SwordData

	tbl6.FireInvoke = function(...)
		return commF:InvokeServer(select(2, ...))
	end

	tbl2.Cache = {
		MonCached = obj,
		IslandSent = tbl5,
		DistanceCache = obj2,
		TargetCache = obj3,
		Clean = function()
			for k in pairs(tbl5) do
				if not worldOrigin.Locations:FindFirstChild(k) then
					tbl5[k] = nil
				end
			end
		end,
	}

	local state = {
		CurrentDracoStage = 1,
		DracoSequence = { "Relic1", "EndRelic1", "Relic2", "EndRelic2", "Relic3", "EndRelic3" },
		SwordList = { "Shizu", "Saishi", "Oroshi" },
		ActiveSword = nil,
		JoinTime = os.time(),
		CamLockConn = nil,
		BlueMoonState = "FIND_ISLAND",
	}

	tbl2.State = state

	tbl6.IsReady = function(arg, arg2)
		if not arg2 or not arg2.Parent or not arg2:IsDescendantOf(v2) then
			return false
		end

		if arg2.Parent == boats or arg2:GetAttribute("IsBoat") or arg2.Name:find("Brigade") or arg2.Name:find("Boat") or arg2.Name:find("Ship") then
			local health = arg2:FindFirstChild("Health")

			if health then
				local flag4 = health:IsA("ValueBase") and health.Value <= 0

				if flag4 then
					health = flag4
				else
					health = type(health.Value) == "number" and health.Value <= 0
				end
			end

			if health then
				return false
			end
			local humanoid2 = arg2:FindFirstChildOfClass("Humanoid") or arg2:FindFirstChild("Humanoid")

			if humanoid2 then
				local flag4 = humanoid2:IsA("Humanoid") and humanoid2.Health <= 0

				if flag4 then
					humanoid2 = flag4
				else
					humanoid2 = humanoid2:IsA("ValueBase") and humanoid2.Value <= 0
				end
			end

			if humanoid2 then
				return false
			end

			if arg2:GetAttribute("Dead") == true or arg2:GetAttribute("Sunk") == true then
				return false
			end
			local engine = arg2:FindFirstChild("Engine") or arg2.PrimaryPart or arg2:FindFirstChildWhichIsA("BasePart")
			if not engine or engine.Position.Y < -15 then
				return false
			end
			return true
		end

		if arg2.Parent == seaBeasts then
			local health = arg2:FindFirstChild("Health")
			return health and health.Value > 0
		end
		local humanoid2 = arg2:FindFirstChildOfClass("Humanoid")
		local humanoidRootPart2 = arg2:FindFirstChild("HumanoidRootPart")
		humanoidRootPart2 = humanoidRootPart2 or arg2.PrimaryPart
		if humanoid2 and humanoid2.Health > 0 and humanoidRootPart2 then
			return true
		end
		return false
	end

	local function fn7()
		if not character then
			return 0
		end
		return DangerDistance(character:GetPivot().Position)
	end

	local runtime = { StartTime = tick() }
	runtime.StartLevel = level and level.Value or 0
	runtime.StartBeli = beli and beli.Value or 0
	runtime.StartFragments = fragments and fragments.Value or 0
	runtime.LastDataLogTick = 0
	runtime.LastErrorTick = {}
	runtime.ErrorLogs = {}
	runtime.FarmsCompleted = 0
	runtime.ChestsCollected = 0
	runtime.MobsKilled = 0
	runtime.BossesKilled = 0
	runtime.LevelGained = 0
	runtime.BeliGained = 0
	runtime.FragmentsGained = 0
	runtime.ActiveFarm = "None"
	tbl2.Runtime = runtime

	local function fn8()
		pcall(function()
			if collectgarbage then
				collectgarbage("step", 200)
			end

			tbl2.Cache.Clean()
		end)
	end

	tbl2.Performance = {
		CleanMemory = fn8,
		ClearDebris = function()
			pcall(function()
				local v19 = next
				local children, v20 = v2:GetChildren()

				for _, v21 in v19, children, v20 do
					if v21:IsA("Tool") and (not v21.Parent or not v21.Parent:FindFirstChildOfClass("Humanoid")) then
						v21:Destroy()
					elseif v21.Name == "Debris" or v21.Name == "Effect" or v21.Name == "Effects" then
						v21:ClearAllChildren()
					else
						local isBasePart = v21:IsA("BasePart")

						if isBasePart then
							local pos = v21.Name:find("Slash")
							isBasePart = pos or v21.Name:find("HitEffect") or v21.Name:find("Particle") or v21.Name:find("Explosion")
						end

						if isBasePart then
							v21:Destroy()
						end
					end
				end

				if v2:FindFirstChild("Characters") then
					local v21 = next
					local children2, v22 = v2.Characters:GetChildren()

					for _, v23 in v21, children2, v22 do
						local humanoid2 = v23:FindFirstChildOfClass("Humanoid")

						if humanoid2 and humanoid2.Health <= 0 and v23 ~= v18.Character then
							v23:Destroy()
						end
					end
				end
			end)
		end,
		OptimizeClient = function()
			pcall(function()
				local terrain = v2:FindFirstChildOfClass("Terrain")

				if terrain then
					terrain.WaterWaveSize = 0
					terrain.WaterWaveSpeed = 0
					terrain.WaterReflectance = 0
					terrain.WaterTransparency = 0
				end

				v7.GlobalShadows = false
				v7.FogEnd = 9e9
				settings().Rendering.QualityLevel = 1

				for _, descendant in ipairs(v7:GetDescendants()) do
					if descendant:IsA("BlurEffect") or descendant:IsA("SunRaysEffect") or descendant:IsA("ColorCorrectionEffect") or descendant:IsA("BloomEffect") or descendant:IsA("DepthOfFieldEffect") then
						descendant.Enabled = false
					end
				end
			end)
		end,
		ClearNew = function(arg)
			if arg then
				table.clear(arg)
				return arg
			end
			return {}
		end,
		CreateDictionary = function(arg, arg2)
			local tbl8 = {}
			arg2 = arg2 ~= nil and arg2 or true

			if arg then
				local _vm___1 = 1

				for i = 1, #arg do
					tbl8[arg[i]] = arg2
				end

				local _vm___0
				_vm___1 = _vm___0
			end

			return tbl8
		end,
		CreateAutoCache = function(arg)
			local tbl8 = {}

			setmetatable(tbl8, { __index = function(arg2, arg3)
				if arg3 == nil then
					return nil
				end
				local v19 = arg(arg3)
				rawset(arg2, arg3, v19)
				return v19
			end })

			return tbl8
		end,
		FastMode = false,
		SetFastMode = function(fastMode)
			if fastMode == nil then
				fastMode = true
			end

			tbl2.Performance.FastMode = fastMode

			task.spawn(function()
				pcall(function()
					local playerGui = v18 and v18:FindFirstChild("PlayerGui")
					local fastMode2 = playerGui and playerGui:FindFirstChild("Main") and playerGui.Main:FindFirstChild("SettingsMenu") and playerGui.Main.SettingsMenu:FindFirstChild("Content") and playerGui.Main.SettingsMenu.Content:FindFirstChild("ScrollingFrame") and playerGui.Main.SettingsMenu.Content.ScrollingFrame:FindFirstChild("FastMode")

					if fastMode2 and firesignal then
						local firstButton = fastMode and fastMode2:FindFirstChild("FirstButton") or fastMode2:FindFirstChild("SecondButton")

						if firstButton and firstButton:IsA("GuiButton") then
							firesignal(firstButton.Activated)
						end
					end
				end)
			end)

			return tbl2.Performance.FastMode
		end,
	}

	local clearNew = tbl2.Performance.ClearNew
	local createDictionary = tbl2.Performance.CreateDictionary
	local createAutoCache = tbl2.Performance.CreateAutoCache

	tbl2.Scheduler = {
		Phase = 1,
		PhaseStart = tick(),
		LastHop = tick(),
		LastRejoin = tick(),
		LastFruitRoll = 0,
		_IsHopping = false,
		_CancelHop = false,
		StopHop = function()
			tbl2.Scheduler._CancelHop = true
			tbl2.Scheduler._IsHopping = false

			if tbl4 then
				for k in pairs(tbl4) do
					tbl4[k] = false
				end
			end

			for _, v19 in ipairs({
				"AutoAfkJoinCastleRaid",
				"AutoAfkJoinFactoryRaid",
				"AutoAfkJoinBossRaid",
				"AutoAfkJoinEliteHunter",
				"AutoAfkJoinFruit",
			}) do
				if tbl then
					tbl[v19] = false
				end

				if tbl6 and tbl6.Toggles and tbl6.Toggles[v19] and tbl6.Toggles[v19].Update then
					pcall(function()
						tbl6.Toggles[v19].Update(false)
					end)
				end
			end

			if tbl6 and tbl6.SendNotify then
				tbl6:SendNotify("AFK Farm", "AFK farm & server hop stopped.", 3)
			end
		end,
		ServerHop = function(arg)
			tbl2.Scheduler._CancelHop = false

			task.spawn(function()
				tbl2.Scheduler._IsHopping = true
				local n = arg or tbl and tonumber(tbl.HopDelay) or 0

				local tbl8 = {
					{
						Text = "Stop Hop",
						Callback = function()
							tbl2.Scheduler.StopHop()
						end,
					},
				}

				if n > 0 then
					if tbl6 and tbl6.SendNotify then
						tbl6:SendNotify("Server Hop", string.format("Hopping server in %d seconds...", math.floor(n)), math.min(math.floor(n), 5), tbl8)
					end

					local n2 = 0

					while n2 < n do
						if tbl2.Scheduler._CancelHop then
							tbl2.Scheduler._IsHopping = false
							return
						end
						task.wait(0.2)
						n2 += 0.2
					end
				end

				if tbl2.Scheduler._CancelHop then
					tbl2.Scheduler._IsHopping = false
					return
				end
				local jobId = game.JobId
				local flag4 = false
				local _vm___1 = 1
				local _vm___0

				for i = 1, 100 do
					if tbl2.Scheduler._CancelHop then
						_vm___1 = _vm___0
						tbl2.Scheduler._IsHopping = false
						return
					end

					task.spawn(function()
						if flag4 or tbl2.Scheduler._CancelHop then
							return
						end

						local ok, result = pcall(function()
							return v4.__ServerBrowser:InvokeServer(i)
						end)

						if ok and type(result) == "table" then
							for k, v19 in pairs(result) do
								if not flag4 and not tbl2.Scheduler._CancelHop and type(v19) == "table" and v19.Count and v19.Count < 12 and k ~= game.JobId then
									flag4 = true

									if tbl6 and tbl6.SendNotify then
										tbl6:SendNotify("Hopping", "Server found! Teleporting...", 5, nil, "ServerHop")
									end

									pcall(function()
										if not tbl2.Scheduler._CancelHop then
											v4.__ServerBrowser:InvokeServer("teleport", k)
										end
									end)
								end
							end
						end
					end)
				end

				_vm___1 = _vm___0
				tbl2.Scheduler._IsHopping = false
			end)
		end,
		Rejoin = function()
			if tbl6 and tbl6.SendNotify then
				tbl6:SendNotify("Rejoin", "Rejoining current server...", 3)
			end

			pcall(function()
				v4.__ServerBrowser:InvokeServer("teleport", game.JobId)
			end)
		end,
	}

	tbl2.StopAfkFarm = tbl2.Scheduler.StopHop
	tbl6.StopAfkFarm = tbl2.Scheduler.StopHop

	pcall(function()
		v15.TeleportInitFailed:Connect(function(arg, arg2, arg3)
			pcall(function()
				v16:ClearError()
			end)

			if not tbl2.Scheduler._IsHopping and not tbl2.Scheduler._IsJoiningActive then
				if tbl6 and tbl6.SendNotify then
					tbl6:SendNotify("Onion API", "Teleport failed: " .. tostring(arg3 or "Server full"), 2)
				end
			end
		end)
	end)

	local function joinAPI(arg, arg2)
		pcall(function()
			v16:ClearError()
		end)

		if tbl4[arg] then
			if tbl6 and tbl6.SendNotify then
				tbl6:SendNotify("Onion API", "Already searching servers for " .. tostring(arg) .. "...", 2)
			end

			return
		end

		local tbl8 = {
			{
				Text = "Stop Hop",
				Callback = function()
					tbl2.Scheduler.StopHop()
				end,
			},
		}

		local str4 = "/api/logs/" .. tostring(arg):lower()
		local now = os.clock()
		local n = tbl3[arg] or 0

		if arg2 and now - n < arg2 then
			local v19 = math.ceil(arg2 - now - n)

			if tbl6 and tbl6.SendNotify then
				tbl6:SendNotify("Cooldown", string.format("Wait %ds before next %s", v19, arg), 2)
			end

			return
		end

		tbl2.Scheduler._CancelHop = false
		tbl2.Scheduler._IsJoiningActive = true
		tbl4[arg] = true
		tbl3[arg] = now

		task.spawn(function()
			local ok, result = pcall(function()
				return fn2({ Url = str .. str4, Method = "GET", Headers = { ["Content-Type"] = "application/json" } })
			end)

			if not ok or not result or result.StatusCode ~= 200 then
				tbl4[arg] = false
				tbl2.Scheduler._IsJoiningActive = false
				local sendNotify = tbl6

				if tbl6 then
					sendNotify = tbl6.SendNotify
				end

				if sendNotify then
					tbl6:SendNotify("Error", "Failed to fetch " .. arg .. " data", 3)
				end

				return
			end

			if tbl2.Scheduler._CancelHop then
				tbl4[arg] = false
				tbl2.Scheduler._IsJoiningActive = false
				return
			end

			local data2 = v9:JSONDecode(result.Body)
			local v19 = data2[tostring(arg):lower()]

			if not v19 or #v19 == 0 then
				tbl4[arg] = false
				tbl2.Scheduler._IsJoiningActive = false
				if tbl2.Scheduler._CancelHop then
					return
				end

				if tbl6 and tbl6.SendNotify then
					tbl6:SendNotify("Hopping Server", "No recent report found, hopping server...", 3, tbl8, "ServerHop")
				end

				tbl2.Scheduler.ServerHop(0, true)
				return
			end

			local tbl9 = {}
			local _vm___1 = -1

			for i = #v19, 1, -1 do
				local v20 = v19[i]

				if v20.jobId and v20.jobId ~= "" then
					local v21 = fn5(v20.jobId)

					if v21 and v21 ~= "" and v21 ~= game.JobId then
						local flag4 = not v20.placeId

						if not flag4 then
							local v22 = tostring
							flag4 = tostring(v20.placeId) == v22(game.PlaceId)
						end

						if flag4 then
							if not table.find(tbl9, v21) then
								table.insert(tbl9, v21)
							end
						end
					end
				end
			end

			local _vm___0
			_vm___1 = _vm___0

			if #tbl9 == 0 then
				tbl4[arg] = false
				tbl2.Scheduler._IsJoiningActive = false
				if tbl2.Scheduler._CancelHop then
					return
				end

				if tbl6 and tbl6.SendNotify then
					tbl6:SendNotify("Hopping Server", "No active server found, hopping server...", 3, tbl8, "ServerHop")
				end

				tbl2.Scheduler.ServerHop(0, true)
				return
			end

			local jobId = game.JobId
			local exitTo = nil

			for i, v20 in ipairs(tbl9) do
				if game.JobId ~= jobId or tbl2.Scheduler._CancelHop then
					exitTo = 1
					break
				else
					pcall(function()
						v16:ClearError()
					end)

					local sendNotify = tbl6

					if tbl6 then
						sendNotify = tbl6.SendNotify
					end

					if sendNotify then
						tbl6:SendNotify("Hopping Server", i == 1 and string.format("Connecting to server (%d/%d)...", i, #tbl9) or string.format("Server full!\nRetrying with server (%d/%d)...", i, #tbl9), 30, tbl8, "ServerHop")
					end

					local flag4 = false
					local flag5 = false
					local v21 = coroutine.running()

					local connection = v15.TeleportInitFailed:Connect(function()
						flag4 = true

						pcall(function()
							v16:ClearError()
						end)

						if not flag5 then
							flag5 = true
							task.spawn(v21)
						end
					end)

					task.spawn(function()
						pcall(function()
							if not tbl2.Scheduler._CancelHop then
								v4.__ServerBrowser:InvokeServer("teleport", v20)
							end
						end)
					end)

					task.delay(6, function()
						if not flag5 then
							flag5 = true
							task.spawn(v21)
						end
					end)

					coroutine.yield()

					local function fn9()
						connection:Disconnect()
					end

					pcall(fn9)

					pcall(function()
						v16:ClearError()
					end)

					local flag6 = game.JobId ~= jobId

					if flag6 or tbl2.Scheduler._CancelHop then
						exitTo = 2
						break
					else
						if flag4 then
							task.wait(0.8)
						end
					end
				end
			end

			if exitTo ~= 1 then
				if exitTo == 2 then
				end
			end

			_vm___1 = _vm___0
			tbl4[arg] = false
			tbl2.Scheduler._IsJoiningActive = false

			if game.JobId == jobId and not tbl2.Scheduler._CancelHop then
				if tbl6 and tbl6.SendNotify then
					tbl6:SendNotify("Hopping Server", "All candidate servers were full. Hopping to random server...", 5, tbl8, "ServerHop")
				end

				tbl2.Scheduler.ServerHop(0, true)
			end
		end)
	end

	tbl6.JoinAPI = joinAPI

	tbl6.JoinAPI = function(arg, arg2, arg3)
		return joinAPI(arg2, arg3)
	end

	local function fn9()
		local tbl8 = {
			ActiveTween = nil,
			ActiveTweenTarget = nil,
			ActiveBoatTween = nil,
			PlayerSpawns = worldOrigin.PlayerSpawns.Pirates,
			Locations = worldOrigin.Locations,
			StopBoatFlag = false,
			StopCurrentTween = nil,
		}

		local n = 0
		local tbl9 = {}
		local sea1 = {}
		local vector = Vector3.new
		local vector2 = Vector3.new
		local vector3 = Vector3.new
		local vector4 = Vector3.new
		sea1[1] = Vector3.new(-7894.62, 5545.49, -380.25)
		sea1[2] = Vector3.new(-4607.82, 872.54, -1667.56)
		sea1[3] = Vector3.new(61163.85, 11.76, 1819.78)
		sea1[4] = Vector3.new(3876.28, 35.11, -1939.32)
		tbl9.Sea_1 = sea1
		local sea2 = {}
		local vector5 = Vector3.new
		local vector6 = Vector3.new
		local vector7 = Vector3.new
		local vector8 = Vector3.new
		sea2[1] = Vector3.new(-288.46, 306.13, 598)
		sea2[2] = Vector3.new(2284.91, 15.15, 905.48)
		sea2[3] = Vector3.new(923.21, 126.98, 32852.83)
		sea2[4] = Vector3.new(-6508.56, 89.03, -132.84)
		tbl9.Sea_2 = sea2
		local sea3 = {}
		local vector9 = Vector3.new
		local vector10 = Vector3.new
		local vector11 = Vector3.new
		local vector12 = Vector3.new
		sea3[1] = Vector3.new(-5058, 314, -3170)
		sea3[2] = Vector3.new(-12463, 374, -7550)
		sea3[3] = Vector3.new(5670, 1020, -340)
		sea3[4] = Vector3.new(28286, 14897, 103)
		tbl9.Sea_3 = sea3
		local flag4 = false
		local flag5 = false
		local n2 = 0
		local n3 = 5
		local bodyVelocity = nil

		local function fn10(character2)
			character = character2
			humanoid = character2:WaitForChild("Humanoid", 10)
			humanoidRootPart = character2:WaitForChild("HumanoidRootPart", 10)
		end

		local function fn11()
			local v19 = next
			local children, v20 = v18.Character:GetChildren()

			for _, v21 in v19, children, v20 do
				if v21:IsA("BasePart") and v21.CanCollide then
					v21.CanCollide = false
				end
			end
		end

		local function fn12()
			if not humanoidRootPart then
				return
			end

			if not humanoidRootPart:FindFirstChild("PartVelocuty") then
				if bodyVelocity then
					bodyVelocity:Destroy()
				end

				bodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
				bodyVelocity.Name = "PartVelocuty"
				local v19 = bodyVelocity
				local vector13 = Vector3.new
				v19.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bodyVelocity.Velocity = Vector3.zero
				bodyVelocity.P = 1000
			end
		end

		v18.CharacterAdded:Connect(fn10)

		if v18.Character then
			fn10(v18.Character)
		end

		local locations = tbl8.Locations

		local function fn13()
			local v19 = humanoidRootPart
			if not v19 or not v19.Parent then
				return false
			end
			local humanoid2 = v19.Parent:FindFirstChildOfClass("Humanoid")
			return humanoid2 and humanoid2.Parent and humanoid2.Health > 0
		end

		local function fn14(arg)
			local position = arg.Position
			local v19 = next
			local children, v20 = locations:GetChildren()

			for _, v21 in v19, children, v20 do
				if (position - v21.Position).Magnitude <= v21.Mesh.Scale.X then
					return v21
				end
			end

			return { Name = "" }
		end

		local function fn15(arg)
			local position = arg.Position
			local sea12 = flag and tbl9.Sea_1 or flag2 and tbl9.Sea_2 or flag3 and tbl9.Sea_3 or {}
			local huge = math.huge
			local v19 = nil

			for _, v20 in ipairs(sea12) do
				local magnitude = (v20 - position).Magnitude

				if magnitude < huge then
					huge = magnitude
					v19 = v20
				end
			end

			return huge <= (position - humanoidRootPart.Position).Magnitude and v19 or nil
		end

		local function fn16(arg)
			if (humanoidRootPart.Position - arg).Magnitude > 300 then
				tbl6:FireInvoke("requestEntrance", arg)
				task.wait(0.1)
				fn12()
				humanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(0, 20)
				task.wait(0.5)
			end
		end

		local function fn17(arg)
			local position = arg.Position
			local v19 = next
			local children, v20 = tbl8.PlayerSpawns:GetChildren()

			for _, v21 in v19, children, v20 do
				if (v21.Part.Position - position).Magnitude <= 2500 then
					return v21
				end
			end
		end

		local function fn18(arg)
			local name = fn14(arg).Name
			if name == "" then
				return false
			end
			local pos = name:find("Dimension")
			if pos or name:find("Cursed") or name:find("Submerged") or name == "Sealed Cavern" or name:lower():find("under") or data.LastSpawnPoint.Value == "SubmergedIsland" then
				return false
			end
			return (arg.Position - humanoidRootPart.Position).Magnitude > 3500
		end

		local function fn19(arg)
			local v19 = fn17(humanoidRootPart)
			local magnitude = (arg.Position - humanoidRootPart.Position).Magnitude
			local position = humanoidRootPart.Position
			local position2 = arg.Position
			local v20 = next
			local children, v21 = tbl8.PlayerSpawns:GetChildren()
			local huge = math.huge
			local v22 = nil

			for _, v23 in v20, children, v21 do
				local position3 = v23.Part.Position
				local magnitude2 = (position3 - position2).Magnitude
				local magnitude3 = (position3 - position).Magnitude

				if magnitude >= 3000 and fn17(v23.Part) ~= v19 and magnitude3 <= 10200 and magnitude2 <= huge then
					huge = magnitude2
					v22 = v23
				end
			end

			return v22
		end

		local function fn20(arg)
			if not fn14(humanoidRootPart).Name:find("Submerged") or fn14(arg).Name:find("Submerged") then
				return
			end
			local v19 = humanoidRootPart

			while true do
				tbl8:topos(CFrame.new(11426, -2155, 9732))
				task.wait(2)
				net:WaitForChild("RF/SubmarineTransportation"):InvokeServer("InitiateTeleport", "Tiki Outpost")
				task.wait(2)
				local flag6 = not fn14(v19).Name:find("Submerged")
				if not (flag6 or not fn13()) then
					continue
				end
				break
			end
		end

		local function fn21(arg)
			local _vm___0

			while true do
				local v19 = fn19(arg)

				if not v19 then
					break
				else
					local _vm___1 = 1

					for i = 1, 3 do
						tbl6:FireInvoke("SetLastSpawnPoint", v19.Name)
						tbl6:FireInvoke("SetSpawnPoint")
						v18.Character:PivotTo(v19.Part.CFrame)
						local humanoid2 = v18.Character:FindFirstChild("Humanoid")

						if humanoid2 then
							humanoid2.Health = 0
						end
					end

					_vm___1 = _vm___0
					task.wait(0.1)

					while true do
						task.wait(0.1)
						if not (v18.Character and v18.Character:FindFirstChild("HumanoidRootPart") and v18.Character:FindFirstChild("Humanoid") and v18.Character:FindFirstChild("Humanoid").Health > 0) then
							continue
						end
						break
					end

					if not (not fn18(arg) or not fn19(arg)) then
						continue
					end
					break
				end
			end
		end

		local function fn22(arg)
			local v19 = fn15(arg)

			if v19 and tick() - n2 >= n3 then
				fn16(v19)
				n2 = tick()
				task.wait(1)
			end
		end

		local function fn23(arg)
			if typeof(arg) == "Vector3" then
				return CFrame.new(arg)
			end

			if typeof(arg) == "CFrame" then
				return arg
			end

			if typeof(arg) == "Instance" and arg:IsA("BasePart") then
				return arg.CFrame
			end
		end

		local function fn24(cFrame, arg)
			if flag5 then
				return
			end
			n += 1
			local v19 = n
			flag4 = false
			flag5 = true
			if not humanoidRootPart or not humanoid then
				flag5 = false
				return
			end

			task.spawn(function()
				local cFrame2 = humanoidRootPart.CFrame
				local magnitude = (cFrame.Position - cFrame2.Position).Magnitude
				if magnitude <= 5 then
					flag5 = false
					return
				end
				local now = tick()
				local n4 = 0

				while not (v19 ~= n or flag4) do
					if not humanoid or humanoid.Health <= 0 then
						break
					end

					if not humanoidRootPart or not humanoidRootPart.Parent then
						break
					end
					local now2 = tick()
					local n5 = now2 - now
					n4 += math.max((tonumber(tbl.TweenSpeed) or 250) * (arg or 1), 0.1) * n5
					local n6 = math.clamp(n4 / magnitude, 0, 1)
					humanoidRootPart.CFrame = cFrame2:Lerp(cFrame, n6)
					if n6 >= 1 or (cFrame.Position - humanoidRootPart.Position).Magnitude <= 10 then
						humanoidRootPart.CFrame = cFrame
						break
					end
					task.wait()
					now = now2
				end

				flag5 = false
			end)
		end

		tbl8.StopTween = function()
			flag4 = true
			n += 1
			flag5 = false

			if bodyVelocity then
				pcall(function()
					if bodyVelocity.Parent then
						bodyVelocity:Destroy()
					end
				end)

				bodyVelocity = nil
			end

			if humanoidRootPart then
				local partVelocuty = humanoidRootPart:FindFirstChild("PartVelocuty")

				if partVelocuty then
					partVelocuty:Destroy()
				end
			end
		end

		local function topos(arg, arg2, arg3, arg4, arg5)
			if flag5 then
				return
			end

			if not fn13() then
				return
			end
			local v19 = fn23(arg2)
			if not v19 then
				return
			end
			fn20(v19)
			if not fn13() then
				return
			end
			local pos = flag3 and fn14(humanoidRootPart).Name:find("Temple of Time") or fn14(v19).Name:find("Temple of Time")

			if tbl.BypassTP and fn18(v19) and not pos then
				fn21(v19)
				if not fn13() then
					return
				end
			else
				fn22(v19)
			end

			if tbl.ForceAnchoredY and not pos then
				humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.CFrame.X, v19.Y, humanoidRootPart.CFrame.Z)
			end

			fn11()
			fn24(v19, arg5)
			if flag4 then
				arg:StopTween()
				return
			end

			if arg3 then
				fn12()
			elseif not arg4 and humanoidRootPart then
				local partVelocuty = humanoidRootPart:FindFirstChild("PartVelocuty")

				if partVelocuty then
					partVelocuty:Destroy()
				end
			end
		end

		tbl8.topos = topos

		GetAllBoats = function()
			local tbl10 = { "My Boat" }
			local boats2 = v2:FindFirstChild("Boats")

			if boats2 then
				for _, child in ipairs(boats2:GetChildren()) do
					local owner = child:FindFirstChild("Owner")

					if owner and owner.Value then
						local value = owner.Value
						local name = typeof(value) == "Instance" and value.Name or tostring(value)

						if name ~= v18.Name and value ~= v18 and value ~= v18.Character then
							tbl10[#tbl10 + 1] = child.Name .. " [" .. name .. "]"
						end
					end
				end
			end

			return tbl10
		end

		GetSelectedBoat = function()
			local sailTargetBoat = tbl.SailTargetBoat
			local v19 = next
			local children, v20 = v2.Boats:GetChildren()

			for _, v21 in v19, children, v20 do
				local owner = v21:FindFirstChild("Owner")

				if owner then
					if not sailTargetBoat or sailTargetBoat == "My Boat" then
						if tostring(owner.Value) == v18.Name then
							return v21
						end
						continue
					end

					if v21.Name .. " [" .. tostring(owner.Value) .. "]" == sailTargetBoat then
						return v21
					end
				end
			end

			return nil
		end

		local function stopBoatTween()
			tbl8.StopBoatFlag = true
			tbl8.ActiveBoatTween = nil
		end

		tbl8.StopBoatTween = stopBoatTween

		tbl8.toposboat = function(arg, arg2)
			if tbl8.ActiveBoatTween then
				return
			end
			local v19 = GetSelectedBoat()
			local vehicleSeat = v19 and v19:FindFirstChild("VehicleSeat")
			local cframe = typeof(arg2) == "Vector3" and CFrame.new(arg2) or arg2
			if not (v19 and vehicleSeat and humanoid and humanoid.Sit and cframe) then
				return
			end
			local n4 = tonumber(tbl.BoatPosY) or 31
			local cframe2 = CFrame.new(cframe.X, n4, cframe.Z)
			local cframe3 = CFrame.new(vehicleSeat.CFrame.X, n4, vehicleSeat.CFrame.Z)
			local magnitude = (cframe2.Position - cframe3.Position).Magnitude
			if magnitude <= 25 then
				return
			end
			tbl8.ActiveBoatTween = true
			tbl8.StopBoatFlag = false
			local bodyVelocity2 = Instance.new("BodyVelocity")
			local vector13 = Vector3.new
			bodyVelocity2.MaxForce = Vector3.new(1e9, 1e9, 1e9)
			bodyVelocity2.Velocity = Vector3.zero
			bodyVelocity2.P = 1e9
			bodyVelocity2.Parent = vehicleSeat

			local function fn25()
				local now = tick()
				local n5 = 0

				while not tbl8.StopBoatFlag and humanoid.Health > 0 and humanoid.Sit do
					local now2 = tick()
					local n6 = now2 - now
					local n7 = math.max(tonumber(tbl.SpeedBoat) or 250, 0.1)
					n5 += n7 * n6
					local n8 = math.clamp(n5 / magnitude, 0, 1)
					local v20 = cframe3:Lerp(cframe2, n8)
					local v21 = bodyVelocity2
					v21.Velocity = (v20.Position - vehicleSeat.CFrame.Position).Magnitude > 0.1 and (v20.Position - vehicleSeat.CFrame.Position).Unit * n7
					vehicleSeat.CFrame = v20
					if n8 >= 1 or (cframe2.Position - vehicleSeat.CFrame.Position).Magnitude <= 25 then
						vehicleSeat.CFrame = cframe2
						break
					end
					task.wait()
					now = now2
				end

				if tbl8.StopBoatFlag then
					bodyVelocity2.Velocity = Vector3.zero
					bodyVelocity2:Destroy()
				end

				tbl8.ActiveBoatTween = nil
				tbl8.StopBoatFlag = false
			end

			task.spawn(fn25)
		end

		return tbl8
	end

	tbl6.TweenManager = fn9()
	local tweenManager = tbl6.TweenManager

	local function fn10(arg)
		local flag4 = not (arg.Team == v18.Team and tostring(arg.Team) == "Marines")

		if flag4 then
			flag4 = not (arg:HasTag("Ally" .. v18.Name) or v18:HasTag("Ally" .. arg.Name))
		end

		return flag4
	end

	local function fn11()
		local obj4 = setmetatable({}, {
			__index = {
				BodyParts = {
					"RightLowerArm",
					"RightUpperArm",
					"LeftLowerArm",
					"LeftUpperArm",
					"RightHand",
					"LeftHand",
				},
				LastCombo = 0,
				ComboTime = 0,
				GunDebounce = 0,
				MaxHits = 2,
				IgnoredTools = {},
				OverheatData = {
					Dragonstorm = { MaxOverheat = 3, Cooldown = 0, TotalOverheat = 0, Distance = 500, Shooting = false },
				},
				ShootsPerTarget = { ["Dual Flintlock"] = 2 },
				ShootStyles = {
					["Skull Guitar"] = "TAP",
					Bazooka = "Position",
					Cannon = "Position",
					Dragonstorm = "Overheat",
				},
				RemoteFruits = { ["Blade-Blade"] = true, ["Gas-Gas"] = true },
				NormalFruits = { ["Light-Light"] = true, ["Ice-Ice"] = true },
			},
		})

		local CombatUtil = require(v4.Modules.CombatUtil)
		local CombatController = require(v4.Controllers.CombatController)
		local validator2 = remotes:WaitForChild("Validator2")
		local reRegisterAttack = net:WaitForChild("RE/RegisterAttack")
		local reShootGunEvent = net:FindFirstChild("RE/ShootGunEvent")
		local RegisterHit = require(v4.Modules.Net):RemoteEvent("RegisterHit", true)

		local ok, result = pcall(function()
			return getupvalue(CombatController.Attack, 9)
		end)

		local function fn12()
			if not result then
				pcall(function()
					result = getupvalue(CombatController.Attack, 9)
				end)
			end

			if not result then
				return 0, 0
			end
			local v19 = getupvalue(result, 15)
			local v20 = getupvalue(result, 13)
			local v21 = getupvalue(result, 16)
			local v22 = getupvalue(result, 17)
			local v23 = getupvalue(result, 14)
			local v24 = getupvalue(result, 18)
			local v25 = getupvalue(result, 19)
			if not v19 or not v20 or not v21 or not v22 or not v23 or not v24 or not v25 then
				return 0, 0
			end
			local n = ((v19 * v23 + v20 * v21) % v22 * v22 + v20 * v23) % v24
			local n2 = math.floor(n / v22)
			local n3 = n - n2 * v22
			local n4 = v25 + 1

			pcall(function()
				setupvalue(result, 15, n2)
				setupvalue(result, 13, n3)
				setupvalue(result, 19, n4)
			end)

			return math.floor(n / v24 * 16777215), n4
		end

		local function fn13()
			pcall(function()
				local equippedWeapon = character:FindFirstChild("EquippedWeapon")
				if not humanoid or not equippedWeapon then
					return
				end
				local movesetAnimCache = CombatUtil:GetMovesetAnimCache(humanoid)
				local weaponName = CombatUtil:GetWeaponName(equippedWeapon)
				local v19 = movesetAnimCache[CombatUtil:GetPureWeaponName(weaponName) .. "-basic" .. math.random(1, #CombatUtil:GetWeaponData(weaponName).Moveset.Basic)]

				if v19 and not tbl.RemoveAnimationFast then
					v19:Play(0, 1, (v19:GetAttribute("SpeedMult") or 1) * 5)
					v19.TimePosition = 0.01
				end
			end)
		end

		local function fn14()
			if humanoidRootPart and humanoidRootPart:FindFirstChild("Buddha") then
				return 10
			end
			return obj4.MaxHits
		end

		local tbl8 = {}

		local function fn15(arg, arg2)
			local tbl9 = {}
			local v19 = obj4.BodyParts[math.random(#obj4.BodyParts)]
			arg2 = arg2 or 50
			local humanoidRootPart2 = humanoidRootPart or v18.Character and (v18.Character:FindFirstChild("HumanoidRootPart") or v18.Character.PrimaryPart)
			if not humanoidRootPart2 then
				return tbl9
			end
			local v20 = fn14()
			local tbl10 = {}
			local _vm___1, _vm___0

			if tbl.attackmobs then
				local children = enemies:GetChildren()
				_vm___1 = 1

				for i = 1, #children do
					local v21 = children[i]

					if not v21:GetAttribute("IsBoat") and tbl6:IsReady(v21) then
						local humanoidRootPart3 = v21:FindFirstChild("HumanoidRootPart") or v21.PrimaryPart

						if humanoidRootPart3 then
							local magnitude = (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude

							if magnitude <= arg2 then
								local masteryFarm = not arg and tbl.MasteryFarm
								local flag4 = false

								if masteryFarm then
									local humanoid2 = v21:FindFirstChildOfClass("Humanoid")
									humanoid2 = humanoid2 and humanoid2.Health / humanoid2.MaxHealth <= tbl.HealthMob / 100
									local flag5 = false

									if humanoid2 then
										flag4 = true
									else
										flag4 = flag5
									end
								end

								if not flag4 then
									local insert = table.insert
									local tbl11 = {}
									local v22 = v21:FindFirstChild(v19)
									v22 = v22 or humanoidRootPart3
									tbl11[1] = v21
									tbl11[2] = v22
									tbl11[3] = magnitude
									insert(tbl10, tbl11)
								end
							end
						end
					end
				end

				_vm___1 = _vm___0
			end

			if tbl.attackplayers and not v18:GetAttribute("PvpDisabled") then
				local children = v2.Characters:GetChildren()
				local character2 = v18 and v18.Character

				for _, child in pairs(children) do
					if child ~= character2 then
						local playerFromCharacter = v3:GetPlayerFromCharacter(child)
						local autoKillPlayerinTrial

						if playerFromCharacter then
							autoKillPlayerinTrial = tbl.AutoKillPlayerinTrial or fn10(playerFromCharacter)
						else
							autoKillPlayerinTrial = playerFromCharacter
						end

						if autoKillPlayerinTrial then
							local humanoidRootPart3 = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart

							if humanoidRootPart3 then
								local magnitude = (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude

								if magnitude <= arg2 then
									table.insert(tbl10, { child, humanoidRootPart3, magnitude })
								end
							end
						end
					end
				end

				_vm___1 = _vm___0
			end

			table.sort(tbl10, function(arg3, arg4)
				return arg3[3] < arg4[3]
			end)

			_vm___1 = 1

			for i = 1, math.min(#tbl10, v20) do
				local insert = table.insert
				local tbl11 = {}
				local v21 = tbl10[i][1]
				local v22 = tbl10[i][2]
				tbl11[1] = v21
				tbl11[2] = v22
				insert(tbl9, tbl11)
			end

			_vm___1 = _vm___0
			return tbl9
		end

		local function fn16(arg, arg2, arg3)
			tbl8 = {}
			arg = arg or 500
			local character2 = v18.Character or character
			local humanoidRootPart2

			if character2 then
				humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart") or character2.PrimaryPart
			else
				humanoidRootPart2 = character2
			end

			if not humanoidRootPart2 then
				return
			end
			local tbl9 = {}

			if arg2 or tbl.attackmobs then
				for _, child in ipairs(enemies:GetChildren()) do
					local flag4 = not child:GetAttribute("IsBoat")
					local v19 = tbl6:IsReady(child)

					if flag4 and v19 and child ~= character2 then
						local primaryPart = child.PrimaryPart or child:FindFirstChild("HumanoidRootPart")
						local playerFromCharacter = v3:GetPlayerFromCharacter(child)

						if primaryPart and (child.Parent ~= v2.Characters or playerFromCharacter and fn10(playerFromCharacter)) then
							local magnitude = (humanoidRootPart2.Position - primaryPart.Position).Magnitude

							if magnitude <= arg then
								table.insert(tbl9, { child, primaryPart, magnitude })
							end
						end
					end
				end
			end

			if arg2 or tbl.attackplayers and not v18:GetAttribute("PvpDisabled") then
				for _, child in ipairs(v2.Characters:GetChildren()) do
					if child ~= character2 then
						local playerFromCharacter = v3:GetPlayerFromCharacter(child)
						local autoKillPlayerinTrial

						if playerFromCharacter then
							autoKillPlayerinTrial = tbl.AutoKillPlayerinTrial or fn10(playerFromCharacter)
						else
							autoKillPlayerinTrial = playerFromCharacter
						end

						if autoKillPlayerinTrial then
							local humanoidRootPart3 = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart

							if humanoidRootPart3 then
								local magnitude = (humanoidRootPart2.Position - humanoidRootPart3.Position).Magnitude

								if magnitude <= arg then
									table.insert(tbl9, { child, humanoidRootPart3, magnitude })
								end
							end
						end
					end
				end
			end

			if arg3 then
				for _, child in ipairs(seaBeasts:GetChildren()) do
					local meshPart = child:FindFirstChildOfClass("MeshPart") or child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart

					if tbl6:IsReady(child) and meshPart then
						local magnitude = (humanoidRootPart2.Position - meshPart.Position).Magnitude

						if magnitude < arg then
							table.insert(tbl9, { child, meshPart, magnitude })
						end
					end
				end

				for _, child in ipairs(enemies:GetChildren()) do
					if child:GetAttribute("IsBoat") then
						local meshPart = child:FindFirstChildOfClass("MeshPart") or child.PrimaryPart or child:FindFirstChildWhichIsA("BasePart")

						if tbl6:IsReady(child) and meshPart then
							local magnitude = (humanoidRootPart2.Position - meshPart.Position).Magnitude

							if magnitude < arg then
								table.insert(tbl9, { child, meshPart, magnitude })
							end
						end
					end
				end
			end

			table.sort(tbl9, function(arg4, arg5)
				return arg4[3] < arg5[3]
			end)

			for _, v19 in ipairs(tbl9) do
				local insert = table.insert
				local v20 = tbl8
				local tbl10 = {}
				local v21 = v19[1]
				local v22 = v19[2]
				tbl10[1] = v21
				tbl10[2] = v22
				insert(v20, tbl10)
			end
		end

		local function fn17()
			if #tbl8 == 0 then
				return nil, nil
			end
			local v19 = tbl8[1]
			if not v19 or not v19[2] then
				return nil, nil
			end
			return v19[2].Position, v19[2]
		end

		local function fn18(arg)
			fn16(arg, true, true)
			if #tbl8 > 0 and tbl8[1] and tbl8[1][2] then
				return tbl8[1][2]
			end
			return nil
		end

		local handlers = { ["Skull Guitar"] = function(arg, arg2)
			arg.RemoteEvent:FireServer("TAP", arg2)
		end }

		local function fn19()
			local character2 = v18.Character or character
			local tool = character2 and character2:FindFirstChildOfClass("Tool")

			if not tool or tool.ToolTip ~= "Gun" then
				if v18.Backpack then
					local exitTo = nil

					for _, child in ipairs(v18.Backpack:GetChildren()) do
						if child:IsA("Tool") and child.ToolTip == "Gun" then
							exitTo = 1
							break
						end
					end

					if exitTo == 1 then
						if character2 and character2:FindFirstChildOfClass("Humanoid") then
							character2.Humanoid:EquipTool(t4)
							tool = t4
							task.wait(0.05)
						end
					end
				end
			end

			if not tool or not tool.Enabled then
				return
			end
			tool.Enabled = true
			tool:SetAttribute("IsReloading_Client", false)
			tool:SetAttribute("LocalShotsLeft", 100)
			tool:SetAttribute("LocalTotalShots", (tool:GetAttribute("LocalTotalShots") or 0) + 1)
			local distance = obj4.OverheatData[tool.Name] and obj4.OverheatData[tool.Name].Distance
			local n = 500

			if distance then
				n = obj4.OverheatData[tool.Name].Distance
			end

			fn16(n, false, true)

			if #tbl8 == 0 then
				local v19 = fn18(n)

				if v19 then
					table.insert(tbl8, { v19.Parent, v19 })
				end
			end

			if #tbl8 == 0 then
				return
			end
			local v19, v20 = fn17()
			if not v19 or not v20 then
				return
			end

			if handlers[tool.Name] then
				handlers[tool.Name](tool, v19)
				return
			end
			local str4 = obj4.ShootStyles[tool.Name]

			if not str4 then
				local remoteEvent = tool:FindFirstChild("RemoteEvent")
				str4 = remoteEvent and "TAP" or "Normal"
			end

			local n2 = obj4.ShootsPerTarget[tool.Name] or 1

			pcall(function()
				local v21, v22 = fn12()
				validator2:FireServer(v21, v22)
				local remoteEvent = tool:FindFirstChild("RemoteEvent")

				if remoteEvent and (str4 == "TAP" or tool.Name == "Skull Guitar") then
					tool.RemoteEvent:FireServer("TAP", v19)
				elseif reShootGunEvent then
					local _vm___1 = 1

					for i = 1, n2 do
						reShootGunEvent:FireServer(v19, { v20 })
					end

					local _vm___0
					_vm___1 = _vm___0
				end
			end)
		end

		local function fn20(arg, arg2)
			if not arg2 or not arg2:FindFirstChild("LeftClickRemote") then
				return
			end
			local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart2 then
				return
			end
			local position = humanoidRootPart2.Position

			for _, child in ipairs(enemies:GetChildren()) do
				local v19 = tbl6:IsReady(child)

				if v19 and not child:GetAttribute("IsBoat") then
					local primaryPart = child.PrimaryPart or child:FindFirstChild("HumanoidRootPart")

					if primaryPart and (primaryPart.Position - position).Magnitude <= 60 then
						arg2.LeftClickRemote:FireServer((primaryPart.Position - position).Unit, arg)
					end
				end
			end

			for _, child in ipairs(seaBeasts:GetChildren()) do
				if tbl6:IsReady(child) then
					local meshPart = child:FindFirstChildOfClass("MeshPart") or child.PrimaryPart

					if meshPart and (meshPart.Position - position).Magnitude <= 70 then
						local leftClickRemote = arg2.LeftClickRemote
						local fireServer = leftClickRemote.FireServer
						local vector = Vector3.new
						fireServer(leftClickRemote, Vector3.new(0.01, -500, 0.01), 1, true)
					end
				end
			end
		end

		local function fn21(arg)
			local character2 = v18.Character or character
			local tool = character2 and character2:FindFirstChildOfClass("Tool")

			if not tool or tool.ToolTip ~= "Gun" then
				if v18.Backpack then
					local exitTo = nil

					for _, child in ipairs(v18.Backpack:GetChildren()) do
						if child:IsA("Tool") and child.ToolTip == "Gun" then
							exitTo = 1
							break
						end
					end

					if exitTo == 1 then
						if character2 and character2:FindFirstChildOfClass("Humanoid") then
							character2.Humanoid:EquipTool(t4)
							tool = t4
							task.wait(0.05)
						end
					end
				end
			end

			if not tool or not tool.Enabled then
				return
			end
			tool.Enabled = true
			tool:SetAttribute("IsReloading_Client", false)
			tool:SetAttribute("LocalShotsLeft", 100)
			local setAttribute = tool.SetAttribute
			local v19 = tool
			local attribute2 = tool:GetAttribute("LocalTotalShots")
			setAttribute(v19, "LocalTotalShots", (attribute2 or 0) + 1)
			if handlers[tool.Name] then
				return handlers[tool.Name](tool, arg)
			end

			pcall(function()
				local v20, v21 = fn12()
				validator2:FireServer(v20, v21)

				if obj4.ShootStyles[tool.Name] == "TAP" and tool:FindFirstChild("RemoteEvent") then
					tool.RemoteEvent:FireServer("TAP", arg)
				elseif reShootGunEvent then
					reShootGunEvent:FireServer(arg, { character2 and (character2:FindFirstChild("HumanoidRootPart") or character2.PrimaryPart) })
				end
			end)
		end

		local function fn22()
			for _, child in ipairs(v18.Backpack:GetChildren()) do
				local isTool = child:IsA("Tool")
				if isTool and child.ToolTip == "Blox Fruit" and child:FindFirstChild("LeftClickRemote") then
					return child
				end
			end

			return nil
		end

		local function fn23()
			local tool = character:FindFirstChildOfClass("Tool")
			local toolTip = tool and tool.ToolTip or nil

			if tbl.DoubleAttack then
				local v19 = fn22()

				if v19 and v19:FindFirstChild("LeftClickRemote") then
					pcall(function()
						local leftClickRemote = v19.LeftClickRemote
						local fireServer = leftClickRemote.FireServer
						local vector = Vector3.new
						fireServer(leftClickRemote, Vector3.new(0.01, -500, 0.01), 1, true)
					end)
				end
			end

			if not tool then
				if not tbl.DoubleAttack then
					return
				end
				local v19 = fn22()
				if not v19 then
					return
				end
				tool = v19
				toolTip = "Blox Fruit"
			end

			if not table.find({ "Melee", "Blox Fruit", "Sword", "Gun" }, toolTip) then
				return
			end

			if tbl.FastSettings == "Fast Attack" then
				if toolTip == "Gun" then
					fn19()
					return
				end
				local leftClickRemote = tool:FindFirstChild("LeftClickRemote")
				local v19 = fn15(toolTip == "Blox Fruit" and leftClickRemote ~= nil)

				if toolTip == "Blox Fruit" and not obj4.NormalFruits[tool.Name] and not obj4.RemoteFruits[tool.Name] then
					if tool:FindFirstChild("LeftClickRemote") and (tbl.DoubleAttack or character:FindFirstChildOfClass("Tool") == tool) then
						pcall(function()
							local leftClickRemote2 = tool.LeftClickRemote
							local fireServer = leftClickRemote2.FireServer
							local vector = Vector3.new
							fireServer(leftClickRemote2, Vector3.new(0.01, -500, 0.01), 1, true)
						end)
					end
				elseif toolTip == "Blox Fruit" and obj4.RemoteFruits[tool.Name] then
					local lastCombo = obj4.LastCombo

					if tick() - obj4.ComboTime > 0.65 then
						lastCombo = 0
					end

					local lastCombo2

					if lastCombo >= 5 then
						lastCombo2 = 1
					else
						lastCombo2 = lastCombo + 1
					end

					obj4.LastCombo = lastCombo2
					obj4.ComboTime = tick()

					if tool:FindFirstChild("LeftClickRemote") then
						fn20(lastCombo2, tool)
					end
				else
					reRegisterAttack:FireServer(tbl.FastAttackDelay or 0.3)
					fn13()
					local tbl9 = {}
					local v20 = nil

					for _, v21 in ipairs(v19) do
						if v21[1] and v21[2] then
							table.insert(tbl9, v21)
							v20 = v20 or v21[2]
						end
					end

					if v20 and RegisterHit then
						RegisterHit:FireServer(v20, tbl9, nil, nil, tostring(v18.UserId):sub(2, 4) .. tostring(coroutine.running()):sub(11, 15))
					end
				end

				if tbl.DoubleAttack and toolTip == "Blox Fruit" then
					local v20 = fn22()

					if v20 and v20 ~= tool and v20:FindFirstChild("LeftClickRemote") then
						if obj4.RemoteFruits and obj4.RemoteFruits[v20.Name] then
							fn20(obj4.LastCombo or 1, v20)
						else
							pcall(function()
								local leftClickRemote2 = v20.LeftClickRemote
								local fireServer = leftClickRemote2.FireServer
								local vector = Vector3.new
								fireServer(leftClickRemote2, Vector3.new(0.01, -500, 0.01), 1, true)
							end)
						end
					end
				end
			elseif tbl.FastSettings == "Legit Attack" then
				local function fn24(arg)
					local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart")
					local upperTorso = arg:FindFirstChild("UpperTorso")

					if humanoidRootPart2 and upperTorso and (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude <= 50 then
						local vector = Vector3.new
						upperTorso.Size = Vector3.new(70, 70, 70)
						upperTorso.Transparency = 1
						upperTorso.CanCollide = false
						upperTorso.Massless = true
						CombatController:Attack(tool)
					end
				end

				for _, child in ipairs(enemies:GetChildren()) do
					if tbl6:IsReady(child) then
						fn24(child)
					end
				end

				if tbl.attackplayers and not v18:GetAttribute("PvpDisabled") then
					for _, child in ipairs(v2.Characters:GetChildren()) do
						if child ~= v18.Character then
							local playerFromCharacter = v3:GetPlayerFromCharacter(child)

							if playerFromCharacter then
								playerFromCharacter = tbl.AutoKillPlayerinTrial or fn10(playerFromCharacter)
							end

							if playerFromCharacter then
								fn24(child)
							end
						end
					end
				end
			end
		end

		return (setmetatable({ Attack = fn23, ShootGun = fn19, CustomShoot = fn21, GetHits = fn15, AttackManager = obj4 }, { __call = function(...)
			return fn23(select(2, ...))
		end }))
	end

	tbl6.FastAttack = fn11()
	local fastAttack = tbl6.FastAttack
	local shootGun = fastAttack.ShootGun
	local customShoot = fastAttack.CustomShoot

	local function fn12()
		return { GetFruitStock = function()
			local ok, result = pcall(function()
				return tbl6:FireInvoke("GetFruits")
			end)

			local ok2, result2 = pcall(function()
				return tbl6:FireInvoke("GetFruits", true)
			end)

			local tbl8 = {}
			local tbl9 = {}

			if ok and typeof(result) == "table" then
				for _, v19 in next, result, nil do
					if type(v19) == "table" and (v19.OnSale == true or v19.InStock == true) then
						local str4 = tostring(v19.Name or "Unknown"):gsub("%-.*", "")
						tbl8[#tbl8 + 1] = "<font color=\"#00BFFF\">[ * ]</font> " .. str4 .. " — $" .. math.floor(tonumber(v19.Price) or 0)
					end
				end
			end

			if ok2 and typeof(result2) == "table" then
				for _, v19 in next, result2, nil do
					if type(v19) == "table" and (v19.OnSale == true or v19.InStock == true) then
						local str4 = tostring(v19.Name or "Unknown"):gsub("%-.*", "")
						local floor = math.floor
						local num = tonumber(v19.Price)
						tbl9[#tbl9 + 1] = "<font color=\"#FFD700\">[  ]</font> " .. str4 .. " — $" .. floor(num or 0)
					end
				end
			end

			local restockIn = type(result) == "table" and result.RestockIn or 14400 - os.time() % 14400
			local restockIn2 = type(result2) == "table" and result2.RestockIn or 7200 - os.time() % 7200

			local function fn13(arg)
				local n = math.floor(arg / 3600)
				local n2 = math.floor(arg % 3600 / 60)
				local n3 = arg % 60
				return n > 0 and n .. "h " .. n2 .. "m " .. n3 .. "s" or n2 > 0 and n2 .. "m " .. n3 .. "s" or n3 .. "s"
			end

			return ([[<font color="#00BFFF"><b>Normal Dealer</b></font>
%s
Restock: %s

%s

<font color="#FFD700"><b>Mirage Dealer</b></font>
%s
Restock: %s

%s]]):format("<font color=\"#333333\">────────────────────</font>", fn13(restockIn), #tbl8 > 0 and table.concat(tbl8, "\n") or "No fruits in stock", "<font color=\"#333333\">────────────────────</font>", fn13(restockIn2), #tbl9 > 0 and table.concat(tbl9, "\n") or "No fruits in stock")
		end }
	end

	tbl6.ServerStatus = fn12()
	local serverStatus = tbl6.ServerStatus

	tbl6.DataList = {
		BonesList = {
			["Reborn Skeleton"] = true,
			["Living Zombie"] = true,
			["Demonic Soul"] = true,
			["Posessed Mummy"] = true,
		},
		CakesList = {
			["Head Baker"] = true,
			["Baking Staff"] = true,
			["Cake Guard"] = true,
			["Cookie Crafter"] = true,
		},
		RaceList = {
			Fishman = CFrame.new(28224.057, 14889.427, -210.587),
			Human = CFrame.new(29237.295, 14889.427, -206.95),
			Cyborg = CFrame.new(28492.414, 14894.427, -422.11),
			Skypiea = CFrame.new(28967.408, 14918.075, 234.312),
			Ghoul = CFrame.new(28672.721, 14889.128, 454.596),
			Mink = CFrame.new(29020.66, 14889.427, -379.268),
		},
		HumanRace = { Orbitus = true, Diamond = true, Jeremy = true },
		TyrantList = {
			["Serpent Hunter"] = true,
			["Skull Slayer"] = true,
			["Isle Champion"] = true,
			["Sun-kissed Warrior"] = true,
		},
	}

	local function fn13()
		local function fn14()
			if not v18.Character:HasTag("Buso") and beli.Value >= 25000 then
				tbl6:FireInvoke("BuyHaki", "Buso")
			elseif v18.Character:HasTag("Buso") and not v18.Character:FindFirstChild("HasBuso") then
				tbl6:FireInvoke("Buso")
			end
		end

		local tbl8 = {
			ActiveTweens = {},
			SpawnCache = {},
			MobCycle = {},
			NextSpawnCooldown = {},
			OrbitAngle = 0,
			OrbitSpeed = 3,
			LastTick = tick(),
			GetFarmCFrame = function(arg, arg2)
				if not arg2 then
					return nil
				end
				local posMethod = tbl.PosMethod or "Above"
				local position = arg2.Position
				local tool = character and character:FindFirstChildOfClass("Tool")
				tool = tool and tool.ToolTip == "Blox Fruit"
				local n = tonumber(tbl.PosY) or tool and 6 or 18
				local n2

				if tool then
					n2 = math.clamp(n, 3, 8)
				else
					n2 = math.clamp(n, 5, 25)
				end

				if posMethod == "Orbit" then
					local now = tick()
					local n3 = now - arg.LastTick
					arg.LastTick = now
					arg.OrbitAngle = arg.OrbitAngle + arg.OrbitSpeed * n3
					local n4 = tonumber(tbl.CircleRadius) or tool and 6 or n2
					return CFrame.new(position + Vector3.new(math.cos(arg.OrbitAngle) * n4, n2, math.sin(arg.OrbitAngle) * n4))
				end

				return CFrame.new(position + Vector3.new(0, n2, 0.5))
			end,
			GetDistance = function(arg, arg2)
				if typeof(arg2) == "CFrame" then
					return v18:DistanceFromCharacter(arg2.Position)
				end

				if typeof(arg2) == "Vector3" then
					return v18:DistanceFromCharacter(arg2)
				end
			end,
			AutoHaki = fn14,
			CheckToolName = function(arg, arg2)
				local backpack = v18 and v18.Backpack
				if character then
					return character:FindFirstChild(arg2) or backpack:FindFirstChild(arg2)
				end
			end,
			Checkfruit = function()
				local backpack = v18 and v18.Backpack
				local character2 = v18 and v18.Character
				local tbl8 = {}

				if backpack then
					table.insert(tbl8, backpack:GetChildren())
				end

				if character2 then
					table.insert(tbl8, character2:GetChildren())
				end

				local v19, v20, v21 = ipairs(tbl8)
				local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v19, v20, v21)

				for _, v22 in v19, v20, v21 do
					for _, v23 in pairs(v22) do
						if v23:IsA("Tool") then
							if v23:FindFirstChild("EatRemote") or v23:FindFirstChild("DropRemote") or v23:GetAttribute("IsPhysical") or v23:GetAttribute("Fruit") or v23.ToolTip ~= "Blox Fruit" and string.find(v23.Name, "Fruit") then
								return v23.Name
							end
						end
					end
				end

				local _vm_a_0
				_vm_a_1 = _vm_a_0
				local _vm_U_0
				local _vm_U_1 = _vm_U_0
				local _vm___0
				local _vm___1 = _vm___0
				return nil
			end,
			EquipTool = function(arg, arg2)
				local backpack = v18 and v18.Backpack

				if backpack and humanoid and backpack:FindFirstChild(arg2) then
					humanoid:EquipTool(backpack[arg2])
				end
			end,
			EquipWeapon = function(arg, arg2)
				local selectWeapon = arg2 or tbl.SelectWeapon
				local backpack = v18 and v18.Backpack

				for _, child in ipairs(backpack:GetChildren()) do
					if child and child:IsA("Tool") and child.ToolTip == selectWeapon then
						arg:EquipTool(child.Name)
						return true
					end
				end
			end,
		}

		tbl6.CheckInventory = function(arg, arg2)
			local ok, result = pcall(function()
				return Net:RemoteFunction("GetAllItemValues"):InvokeServer()
			end)

			if not ok or not result then
				return nil
			end
			local tbl9 = {}

			for _, v19 in next, result, nil do
				local v20 = tostring
				local str4 = tostring(v19.ItemId) .. "_" .. v20(v19.NetworkedUID)
				tbl9[str4] = tbl9[str4] or { ItemId = v19.ItemId, UID = v19.NetworkedUID, Attributes = {} }

				if v19.Value ~= nil then
					tbl9[str4].Attributes[v19.Key] = v19.Value
				end
			end

			for _, v19 in next, tbl9, nil do
				local ok2, result2 = pcall(function()
					return ItemConfig.match(v19.ItemId)
				end)

				ok2 = ok2 and result2 and result2:isOk()
				local str4 = nil

				if ok2 then
					local v20 = result2:unwrap()
					local debugLabel = v20 and v20.Index and v20.Index.DebugLabel
					str4 = nil

					if debugLabel then
						str4 = tostring(v20.Index.DebugLabel)
					end
				end

				if str4 then
					str4 = str4:match("^(.-)%s*%[") or str4
				end

				local attributes = v19.Attributes

				if str4 == arg2 and attributes.IsOwned == true then
					return {
						Name = str4,
						ItemId = v19.ItemId,
						UID = v19.UID,
						Quantity = attributes.Quantity,
						Mastery = attributes.Mastery,
						IsOwned = attributes.IsOwned,
						IsEquipped = attributes.IsEquipped,
						Attributes = attributes,
					}
				end
			end

			return nil
		end

		tbl8.CheckInventory = function(arg, arg2, arg3, arg4)
			local ok, result = pcall(function()
				return Net:RemoteFunction("GetAllItemValues"):InvokeServer()
			end)

			if not ok or not result then
				local n = arg2 == "Material" and 0
				local n2

				if n then
					n2 = n
				else
					n2 = arg2 == "Sword" and 0
				end

				return n2 or false
			end

			local tbl9 = {}

			for _, v19 in next, result, nil do
				local v20 = tostring
				local str4 = tostring(v19.ItemId) .. "_" .. v20(v19.NetworkedUID)
				tbl9[str4] = tbl9[str4] or { ItemId = v19.ItemId, UID = v19.NetworkedUID, Attributes = {} }

				if v19.Value ~= nil then
					tbl9[str4].Attributes[v19.Key] = v19.Value
				end
			end

			for _, v19 in next, tbl9, nil do
				local ok2, result2 = pcall(function()
					return ItemConfig.match(v19.ItemId)
				end)

				ok2 = ok2 and result2 and result2:isOk()
				local str4 = nil

				if ok2 then
					local v20 = result2:unwrap()
					local debugLabel = v20 and v20.Index and v20.Index.DebugLabel
					str4 = nil

					if debugLabel then
						str4 = tostring(v20.Index.DebugLabel)
					end
				end

				if str4 then
					if string.lower(str4:match("^(.-)%s*%[") or str4) == string.lower(arg3) then
						local attributes = v19.Attributes
						if arg2 == "Material" then
							return attributes.Quantity or 0
						end

						if arg2 == "Moveset" then
							return attributes.Mastery or 0
						end

						if arg2 == "Mastery" then
							return (attributes.Mastery or 0) >= (arg4 or 0)
						end
					end
				end
			end

			return arg2 == "Material" and 0 or arg2 == "Sword" and 0 or false
		end

		tbl8.GetConnectMon = function(arg, arg2, arg3)
			local humanoidRootPart2 = v18.Character and v18.Character:FindFirstChild("HumanoidRootPart")
			local flag4 = type(arg2) == "table"
			local flag5 = type(arg2) == "string"
			if arg3 and not humanoidRootPart2 then
				return nil
			end
			local tbl9 = {}

			if enemies then
				table.insert(tbl9, enemies)
			end

			table.insert(tbl9, v4)
			local v19 = next
			local huge = math.huge
			local v20 = nil
			local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v19, tbl9, nil)
			local _vm_U_1, _vm___1

			for _, v21 in v19, tbl9, nil do
				local v22 = next
				local children, v23 = v21:GetChildren()
				local _vm_a_2 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v22, children, v23)

				for _, v24 in v22, children, v23 do
					if flag5 then
						if v24.Name == arg2 then
							local v25 = v24:IsDescendantOf(v2)
							local flag6 = v24.Parent == v4
							flag6 = flag6 or v24:IsDescendantOf(v4)

							if v25 and tbl6:IsReady(v24) or flag6 and v24:FindFirstChild("HumanoidRootPart") ~= nil then
								if not arg3 then
									return v24
								end
								local humanoidRootPart3 = v24:FindFirstChild("HumanoidRootPart") or v24.PrimaryPart

								if humanoidRootPart3 then
									local magnitude = (humanoidRootPart2.Position - humanoidRootPart3.Position).Magnitude

									if flag6 then
										magnitude += 50000
									end

									if magnitude < huge then
										huge = magnitude
										v20 = v24
									end
								end

								continue
							end

							continue
						end

						if string.lower(v24.Name) ~= string.lower(arg2) then
							continue
						end
						local v25 = v24:IsDescendantOf(v2)
						local flag6 = v24.Parent == v4 or v24:IsDescendantOf(v4)

						if v25 and tbl6:IsReady(v24) or flag6 and v24:FindFirstChild("HumanoidRootPart") ~= nil then
							if not arg3 then
								return v24
							end
							local humanoidRootPart3 = v24:FindFirstChild("HumanoidRootPart") or v24.PrimaryPart

							if humanoidRootPart3 then
								local magnitude = (humanoidRootPart2.Position - humanoidRootPart3.Position).Magnitude

								if flag6 then
									magnitude += 50000
								end

								if magnitude < huge then
									huge = magnitude
									v20 = v24
								end
							end

							continue
						end

						continue
					end

					if flag4 then
						local flag6 = arg2[v24.Name] == true or table.find(arg2, v24.Name) ~= nil

						if not flag6 then
							local exitTo = nil

							for _, v25 in next, arg2, nil do
								if typeof(v25) == "string" and string.lower(v25) == string.lower(v24.Name) then
									exitTo = 1
									break
								end
							end

							if exitTo == 1 then
								flag6 = true
							end

							if flag6 then
								local v25 = v24:IsDescendantOf(v2)
								local flag7 = v24.Parent == v4 or v24:IsDescendantOf(v4)

								if v25 and tbl6:IsReady(v24) or flag7 and v24:FindFirstChild("HumanoidRootPart") ~= nil then
									if not arg3 then
										return v24
									end
									local humanoidRootPart3 = v24:FindFirstChild("HumanoidRootPart") or v24.PrimaryPart

									if humanoidRootPart3 then
										local magnitude = (humanoidRootPart2.Position - humanoidRootPart3.Position).Magnitude

										if flag7 then
											magnitude += 50000
										end

										if magnitude < huge then
											huge = magnitude
											v20 = v24
										end
									end

									continue
								end

								continue
							end

							continue
						end

						if flag6 then
							local v25 = v24:IsDescendantOf(v2)
							local flag7 = v24.Parent == v4 or v24:IsDescendantOf(v4)

							if v25 and tbl6:IsReady(v24) or flag7 and v24:FindFirstChild("HumanoidRootPart") ~= nil then
								if not arg3 then
									return v24
								end
								local humanoidRootPart3 = v24:FindFirstChild("HumanoidRootPart") or v24.PrimaryPart

								if humanoidRootPart3 then
									local magnitude = (humanoidRootPart2.Position - humanoidRootPart3.Position).Magnitude

									if flag7 then
										magnitude += 50000
									end

									if magnitude < huge then
										huge = magnitude
										v20 = v24
									end
								end

								continue
							end
						end
					end
				end

				_vm_a_2 = _vm_a_1
				local _vm_U_2 = _vm_U_1
				local _vm___2 = _vm___1
			end

			local _vm_a_0
			_vm_a_1 = _vm_a_0
			local _vm_U_0
			_vm_U_1 = _vm_U_0
			local _vm___0
			_vm___1 = _vm___0
			return v20
		end

		local function checkMon(arg, arg2)
			return arg:GetConnectMon(arg2) ~= nil
		end

		tbl8.CheckMon = checkMon

		tbl8.GetEnemies = function(arg, arg2)
			return arg:GetConnectMon(arg2, true)
		end

		tbl8.BringCache = {}
		local n = 0
		local n2 = 0

		tbl8.BringEnemies = function(arg, arg2)
			if not tbl.BringMonster then
				return
			end
			local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
			local humanoidRootPart3 = arg2 and (arg2:FindFirstChild("HumanoidRootPart") or arg2.PrimaryPart)
			if not humanoidRootPart2 or not humanoidRootPart3 then
				return
			end
			local now = tick()
			if now - n < 0.25 then
				return
			end
			n = now
			local n3 = tonumber(tbl.BringMonsterRadius) or 350
			local n4 = math.clamp(n3 + 50, 100, 500)

			if now - n2 > 3 then
				n2 = now

				pcall(function()
					sethiddenproperty(v18, "SimulationRadius", n4)
					sethiddenproperty(v18, "MaxSimulationRadius", n4)
				end)
			end

			tbl8.BringCache[arg2.Name] = humanoidRootPart3.CFrame
			local tagged = v5:GetTagged("OnionBringTag")
			local v19 = next
			local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v19, tagged, nil)

			for _, v20 in v19, tagged, nil do
				local humanoid2 = v20:FindFirstChildOfClass("Humanoid")

				if not v20.Parent or not humanoid2 or humanoid2.Health <= 0 then
					pcall(function()
						v20:RemoveTag("OnionBringTag")
					end)
				end
			end

			local _vm_a_0
			_vm_a_1 = _vm_a_0
			local _vm_U_0
			local _vm_U_1 = _vm_U_0
			local _vm___0
			local _vm___1 = _vm___0
			if #tagged >= 8 then
				return
			end
			local tbl9 = {}
			local character2 = v18 and v18.Character

			if v2:FindFirstChild("Characters") then
				local v20 = next
				local children, v21 = v2.Characters:GetChildren()
				_vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v20, children, v21)

				for _, v22 in v20, children, v21 do
					if v22 ~= character2 and v22:IsA("Model") then
						local humanoidRootPart4 = v22:FindFirstChild("HumanoidRootPart") or v22.PrimaryPart

						if humanoidRootPart4 then
							table.insert(tbl9, humanoidRootPart4.Position)
						end
					end
				end

				_vm_a_1 = _vm_a_0
				_vm_U_1 = _vm_U_0
				_vm___1 = _vm___0
			end

			local enemies2 = enemies or v2:FindFirstChild("Enemies")
			if not enemies2 then
				return
			end
			local v20 = next
			local children, v21 = enemies2:GetChildren()
			local n5 = 0
			_vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v20, children, v21)

			for _, v22 in v20, children, v21 do
				if v22 ~= arg2 and v22.Name == arg2.Name and tbl6:IsReady(v22) and not v22:HasTag("OnionBringTag") and not v3:GetPlayerFromCharacter(v22) then
					local humanoidRootPart4 = v22:FindFirstChild("HumanoidRootPart") or v22.PrimaryPart
					local humanoid2 = v22:FindFirstChildOfClass("Humanoid")

					if humanoidRootPart4 and humanoid2 and humanoid2.Health > 0 then
						local position = humanoidRootPart4.Position

						if (position - humanoidRootPart3.Position).Magnitude <= n3 and (position - humanoidRootPart2.Position).Magnitude <= n3 then
							local flag4 = false
							local exitTo = nil

							for _, v23 in next, tbl9, nil do
								if (position - v23).Magnitude <= 55 then
									exitTo = 1
									break
								end
							end

							if exitTo == 1 then
								flag4 = true
							end

							if not flag4 then
								v22:AddTag("OnionBringTag")
								n5 += 1
								if n5 >= 4 then
									return
								end
								continue
							end

							continue
						end
					end
				end
			end

			_vm_a_1 = _vm_a_0
			_vm_U_1 = _vm_U_0
			_vm___1 = _vm___0
		end

		v5:GetInstanceAddedSignal("OnionBringTag"):Connect(function(arg)
			task.spawn(function()
				local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart") or arg.PrimaryPart
				local humanoid2 = arg:FindFirstChildOfClass("Humanoid")

				if not humanoidRootPart2 or not humanoid2 then
					pcall(function()
						arg:RemoveTag("OnionBringTag")
					end)

					return
				end

				local name = arg.Name
				local bringBodyPos = humanoidRootPart2:FindFirstChild("BringBodyPos")

				if not bringBodyPos then
					bringBodyPos = Instance.new("BodyPosition")
					bringBodyPos.Name = "BringBodyPos"
					local vector = Vector3.new
					bringBodyPos.MaxForce = Vector3.new(1000000, 1000000, 1000000)
					bringBodyPos.P = 8000
					bringBodyPos.D = 600
					bringBodyPos.Position = humanoidRootPart2.Position
					bringBodyPos.Parent = humanoidRootPart2
				end

				local n3 = tick() + 25
				local n4 = 0

				while true do
					if tbl.BringMonster and arg.Parent and humanoidRootPart2.Parent and humanoid2.Health > 0 and arg:HasTag("OnionBringTag") and tick() < n3 then
						local character2 = v18.Character
						character2 = character2 and character2:FindFirstChild("HumanoidRootPart")
						local bringCache = tbl8.BringCache and tbl8.BringCache[name]
						local n5 = tonumber(tbl.BringMonsterRadius) or 350

						if character2 and bringCache then
							if (character2.Position - humanoidRootPart2.Position).Magnitude <= n5 + 50 then
								local v19 = next
								local children, v20 = arg:GetChildren()

								for _, v21 in v19, children, v20 do
									if v21:IsA("BasePart") then
										v21.CanCollide = false
									end
								end

								humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
								humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero
								bringBodyPos.Position = bringCache.Position
								n4 = 0
							else
								n4 += 1
							end
						else
							n4 += 1
						end

						if not (n4 > 15) then
							task.wait(0.04)
							continue
						end
					end

					break
				end

				pcall(function()
					if bringBodyPos and bringBodyPos.Parent then
						bringBodyPos:Destroy()
					end

					if arg:HasTag("OnionBringTag") then
						arg:RemoveTag("OnionBringTag")
					end

					local v19 = next
					local children, v20 = arg:GetChildren()

					for _, v21 in v19, children, v20 do
						if v21:IsA("BasePart") then
							v21.CanCollide = true
						end
					end
				end)
			end)
		end)

		tbl8.MobsNextSpawn = function(arg, arg2)
			if tbl8.NextSpawnCooldown[arg2] then
				return task.wait()
			end
			tbl8.NextSpawnCooldown[arg2] = true
			task.wait(1)

			if not tbl8.SpawnCache[arg2] then
				local fortBuilderReplicatedSpawnPositi = v4:FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")
				local v19 = next
				local children, v20 = fortBuilderReplicatedSpawnPositi:GetChildren()

				for _, v21 in v19, children, v20 do
					if v21:IsA("BasePart") then
						local spawnCache = tbl8.SpawnCache
						local name = v21.Name
						local v22 = tbl8.SpawnCache[v21.Name]
						spawnCache[name] = v22 or {}
						table.insert(tbl8.SpawnCache[v21.Name], v21.CFrame)
					end
				end
			end

			local v19 = tbl8.SpawnCache[arg2]
			if not v19 or #v19 == 0 then
				tbl8.NextSpawnCooldown[arg2] = nil
				return
			end
			tbl8.MobCycle[arg2] = (tbl8.MobCycle[arg2] or 0) % #v19 + 1
			local position = v19[tbl8.MobCycle[arg2]].Position
			local v20 = tweenManager
			local topos = v20.topos
			local v21 = v20
			local cframe = CFrame.new
			local vector = Vector3.new
			topos(v21, cframe(position + vector(0, math.max(tonumber(tbl.PosY) or 15, 1), 0)))

			local function fn15()
				tbl8.NextSpawnCooldown[arg2] = nil
			end

			task.delay(1, fn15)
			return arg:GetEnemies({ arg2 })
		end

		local function startQuest(arg, arg2, arg3, arg4)
			if tbl.BypassGetQuest then
				tbl6:FireInvoke("StartQuest", arg2, arg3)
				task.wait(0.3)
				return
			end

			local character2 = v18.Character

			if character2 and character2:FindFirstChild("HumanoidRootPart") and arg:GetDistance(arg4) <= 25 then
				tbl6:FireInvoke("StartQuest", arg2, arg3)
				task.wait(0.5)
			else
				tweenManager:topos(arg4)
			end
		end

		tbl8.StartQuest = startQuest

		tbl8.ServerHop = function(arg, arg2)
			tbl2.Scheduler.ServerHop(arg2)
		end

		tbl8.Rejoin = function()
			tbl2.Scheduler.Rejoin()
		end

		local tbl9 = {
			["Rocket-Rocket"] = 1,
			["Spin-Spin"] = 2,
			["Blade-Blade"] = 3,
			["Chop-Chop"] = 3,
			["Spring-Spring"] = 4,
			["Bomb-Bomb"] = 5,
			["Smoke-Smoke"] = 6,
			["Spike-Spike"] = 7,
			["Flame-Flame"] = 8,
			["Falcon-Falcon"] = 9,
			["Ice-Ice"] = 10,
			["Sand-Sand"] = 11,
			["Dark-Dark"] = 12,
			["Diamond-Diamond"] = 13,
			["Light-Light"] = 14,
			["Ghost-Ghost"] = 15,
			["Rubber-Rubber"] = 16,
			["Barrier-Barrier"] = 17,
			["Magma-Magma"] = 18,
		}

		tbl8.GetLowestFruit = function()
			local Net2 = require(v4.Modules.Net)

			local ok, result = pcall(function()
				return Net2:RemoteFunction("GetAllItemValues"):InvokeServer()
			end)

			local v19 = result
			if not ok or not v19 or type(v19) ~= "table" then
				return nil
			end
			local tbl10 = {}

			for _, v20 in ipairs(v19) do
				if v20.Key == "IsOwned" and v20.Value == true then
					tbl10[v20.ItemId] = true
				end
			end

			local huge = math.huge
			local tbl11 = nil

			for k in pairs(tbl10) do
				local ok2, result2 = pcall(function()
					return ItemConfig.match(k)
				end)

				if ok2 and result2 and result2.isOk and result2:isOk() then
					local v20 = result2:unwrap()

					if v20 and v20.Index and v20.Index.IdType == "PhysicalMoveset" then
						local str4 = tostring(v20.Index.DebugLabel or v20.Index.Name or "")
						local match = str4:match("^(.-)%s*%[") or str4
						local str5 = tostring(v20.Index.StorageKey or match)
						local v21 = tbl9[match] or tbl9[str5]

						if v21 and v21 < huge then
							tbl11 = { Name = match, RawName = match, StorageKey = str5, ItemId = k, Rank = v21 }
							huge = v21
						end
					end
				end
			end

			return tbl11
		end

		tbl8.GetDistance = function(arg, arg2)
			local humanoidRootPart2 = v18.Character and (v18.Character:FindFirstChild("HumanoidRootPart") or v18.Character.PrimaryPart)
			if not humanoidRootPart2 or not arg2 then
				return math.huge
			end

			if typeof(arg2) ~= "Vector3" then
				if typeof(arg2) == "CFrame" then
					arg2 = arg2.Position
				elseif typeof(arg2) == "Instance" then
					local isBasePart = arg2:IsA("BasePart") and arg2

					if isBasePart then
						arg2 = isBasePart
					else
						arg2 = arg2:FindFirstChild("HumanoidRootPart") or arg2:FindFirstChild("Head") or arg2.PrimaryPart
					end

					arg2 = arg2 and arg2.Position
				else
					local v19 = nil

					if typeof(arg2) ~= "table" then
						arg2 = v19
					else
						local position = arg2.Position

						if position then
							arg2 = position
						else
							arg2 = arg2.CFrame and arg2.CFrame.Position
						end
					end
				end
			end

			return arg2 and (humanoidRootPart2.Position - arg2).Magnitude or math.huge
		end

		local function getRootPart(arg, arg2)
			if not arg2 then
				return nil
			end

			if arg2:IsA("BasePart") then
				return arg2
			end
			return arg2:FindFirstChild("HumanoidRootPart") or arg2:FindFirstChild("Head") or arg2.PrimaryPart or arg2:FindFirstChildWhichIsA("BasePart")
		end

		tbl8.GetRootPart = getRootPart

		tbl8.AttackMob = function(arg)
			arg:AutoHaki()
			arg:EquipWeapon(tbl.AutoFarmWeapon)
		end

		tbl8.SafeTween = function(arg, arg2, arg3)
			if not arg2 then
				return
			end
			local flag4 = typeof(arg2) == "CFrame" and arg2
			local cframe

			if flag4 then
				cframe = flag4
			else
				cframe = typeof(arg2) == "Vector3" and CFrame.new(arg2) or nil
			end

			if not cframe and typeof(arg2) == "Instance" then
				cframe = arg:GetRootPart(arg2)
				cframe = cframe and cframe.CFrame
			end

			if not cframe then
				return
			end
			tweenManager:topos(cframe * CFrame.new(0, arg3 or tonumber(tbl.PosY) or 15, 0))
		end

		return tbl8
	end

	tbl6.Utilities = fn13()
	local utilities = tbl6.Utilities

	HasActiveQuest = function()
		local quest = v18 and v18:FindFirstChild("PlayerGui") and v18.PlayerGui:FindFirstChild("Main") and v18.PlayerGui.Main:FindFirstChild("Quest")
		return quest ~= nil and quest.Visible == true
	end

	GetActiveQuestMob = function()
		if GuideModule and GuideModule.Data and GuideModule.Data.QuestData then
			local questData = GuideModule.Data.QuestData

			if questData.Task then
				local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(next, questData.Task, nil)
				local v19 = table.pack(_vm_a_1())
				if v19[1] then
					return tostring(v19[2])
				end
				local _vm_a_0
				_vm_a_1 = _vm_a_0
			end

			if questData.Name then
				return tostring(questData.Name)
			end
		end

		local quest = v18 and v18:FindFirstChild("PlayerGui") and v18.PlayerGui:FindFirstChild("Main") and v18.PlayerGui.Main:FindFirstChild("Quest")

		if quest and quest.Visible then
			local container = quest:FindFirstChild("Container")
			local questTitle = container and container:FindFirstChild("QuestTitle")
			questTitle = questTitle and questTitle:FindFirstChild("Title")

			if questTitle and questTitle.Text and questTitle.Text ~= "" then
				local match = questTitle.Text:match("Defeat%s+%d+%s+(.-)%s+%(")
				match = match or questTitle.Text:match("Defeat%s+(.-)%s+%(")
				if match then
					return match
				end
			end
		end

		return nil
	end

	VerifyQuest = function(arg)
		if not arg then
			return false
		end

		if not HasActiveQuest() then
			return false
		end
		local v19 = GetActiveQuestMob()

		if v19 then
			if type(arg) == "table" then
				for _, v20 in next, arg, nil do
					local flag4 = type(v20) == "string"

					if flag4 then
						flag4 = v20:lower() == v19:lower() or v19:lower():find(v20:lower(), 1, true) or v20:lower():find(v19:lower(), 1, true)
					end

					if flag4 then
						return true
					end
				end
			else
				local str4 = tostring(arg):lower()
				local str5 = v19:lower()
				if str4 == str5 or str5:find(str4, 1, true) or str4:find(str5, 1, true) then
					return true
				end
			end
		end

		local quest = v18 and v18:FindFirstChild("PlayerGui") and v18.PlayerGui:FindFirstChild("Main") and v18.PlayerGui.Main:FindFirstChild("Quest")
		if not quest or not quest.Visible then
			return false
		end
		local container = quest:FindFirstChild("Container")
		local questTitle = container and container:FindFirstChild("QuestTitle")
		questTitle = questTitle and questTitle:FindFirstChild("Title")
		if not questTitle or not questTitle.Text or questTitle.Text == "" then
			return false
		end
		local str4 = questTitle.Text:gsub("-", ""):lower()

		if type(arg) == "table" then
			for _, v20 in next, arg, nil do
				if type(v20) ~= "string" then
					continue
				end
				local str5 = v20:gsub("-", ""):lower()
				if str4:find(str5, 1, true) then
					return true
				end
				local str6 = str5:gsub("man$", "m"):gsub("ies$", "y"):gsub("s$", "")
				if #str6 >= 4 and str4:find(str6, 1, true) then
					return true
				end
			end

			return false
		end

		local str5 = tostring(arg):gsub("-", ""):lower()
		if str4:find(str5, 1, true) then
			return true
		end
		local str6 = str5:gsub("man$", "m"):gsub("ies$", "y"):gsub("s$", "")
		if #str6 >= 4 and str4:find(str6, 1, true) then
			return true
		end
		return false
	end

	CheckQuest = function()
		local n = level and level.Value or 1
		local sea1 = flag and quests.Sea_1 or flag2 and quests.Sea_2 or flag3 and quests.Sea_3
		local _vm_a_1, _vm___2, _vm___1, _vm_a_0, _vm_U_0, _vm_U_1, _vm___0

		if HasActiveQuest() then
			local v19 = GetActiveQuestMob()

			if v19 and v19 ~= "" then
				if sea1 then
					local v20 = next
					_vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v20, sea1, nil)

					for _, v21 in v20, sea1, nil do
						if v21[3] and v21[3]:lower() == v19:lower() then
							local tbl8 = {}
							local v22 = v21[3]
							local v23 = v21[4]
							local v24 = v21[5]
							tbl8[1] = v22
							tbl8[2] = v23
							tbl8[3] = v24
							tbl8[4] = n
							return tbl8
						end

						if type(v21[6]) == "table" then
							_vm___2 = -1

							for i = #v21, 6, -1 do
								local v22 = v21[i]

								if type(v22) == "table" and v22[1] and v22[1]:lower() == v19:lower() then
									local tbl8 = {}
									local v23 = v22[1]
									local v24 = v22[3]
									local v25 = v22[4]
									tbl8[1] = v23
									tbl8[2] = v24
									tbl8[3] = v25
									tbl8[4] = n
									return tbl8
								end
							end

							_vm___2 = _vm___1
							continue
						end

						if v21[6] and type(v21[6]) == "string" and v21[6]:lower() == v19:lower() then
							local tbl8 = {}
							local v22 = v21[6]
							local v23 = v21[4]
							local n2 = v21[5] or 1
							tbl8[1] = v22
							tbl8[2] = v23
							tbl8[3] = n2 + 1
							tbl8[4] = n
							return tbl8
						end
					end

					_vm_a_1 = _vm_a_0
					_vm_U_1 = _vm_U_0
					_vm___1 = _vm___0
				end

				return { v19, "", 0, n }
			end
		end

		if not sea1 then
			return { "", "", 0, n }
		end

		if flag and n >= 1 and n <= 9 then
			if tostring(v18.Team) == "Marines" then
				return { "Trainee", "MarineQuest", 1, n }
			end
			return { "Bandit", "BanditQuest1", 1, n }
		end

		local questFarmMode = tbl.QuestFarmMode or "Double Quest"
		local v19 = next
		_vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v19, sea1, nil)
		local v20

		for k, v21 in v19, sea1, nil do
			if n >= v21[1] and n <= v21[2] then
				if questFarmMode == "Single Quest" or questFarmMode == "1 Quest (Normal Only)" or questFarmMode == "1 Quest" then
					local tbl8 = {}
					local v22 = v21[3]
					local v23 = v21[4]
					local v24 = v21[5]
					tbl8[1] = v22
					tbl8[2] = v23
					tbl8[3] = v24
					tbl8[4] = n
					return tbl8
				end

				local tbl8

				if type(v21[6]) == "table" then
					_vm___2 = -1
					tbl8 = nil
					local exitTo = nil

					for i = #v21, 6, -1 do
						v20 = v21[i]

						if type(v20) == "table" and v20[1] and v20[2] and v20[3] and v20[4] then
							if n >= v20[2] and utilities:CheckMon(v20[1]) then
								exitTo = 1
								break
							else
								tbl8 = nil
							end
						else
							tbl8 = nil
						end
					end

					if exitTo == 1 then
						tbl8 = {}
						local v22 = v20[1]
						local v23 = v20[3]
						local v24 = v20[4]
						tbl8[1] = v22
						tbl8[2] = v23
						tbl8[3] = v24
						tbl8[4] = n
					end

					_vm___2 = _vm___1
				else
					local flag4 = v21[6] and type(v21[6]) == "string"
					tbl8 = nil

					if flag4 then
						local v22 = v21[6]
						local flag5 = n >= (v21[7] or v21[1]) and utilities:CheckMon(v22)
						tbl8 = nil

						if flag5 then
							tbl8 = {}
							local v23 = v21[4]
							local n2 = v21[5] or 1
							tbl8[1] = v22
							tbl8[2] = v23
							tbl8[3] = n2 + 1
							tbl8[4] = n
						end
					end
				end

				if tbl8 then
					return tbl8
				end

				if questFarmMode == "Triple Quest" or questFarmMode == "Triple Quest (Normal + Boss + Nearby)" then
					if not utilities:CheckMon(v21[3]) and k > 1 then
						local v22 = sea1[k - 1]

						if v22 and n >= v22[1] and utilities:CheckMon(v22[3]) then
							local humanoidRootPart2 = v18.Character and v18.Character:FindFirstChild("HumanoidRootPart")
							local enemies2 = utilities:GetEnemies(v22[3])
							local humanoidRootPart3 = enemies2 and (enemies2:FindFirstChild("HumanoidRootPart") or enemies2.PrimaryPart)
							local magnitude = humanoidRootPart2 and humanoidRootPart3 and (humanoidRootPart2.Position - humanoidRootPart3.Position).Magnitude or 0

							if magnitude <= 3000 or magnitude == 0 then
								local tbl9 = {}
								local v23 = v22[3]
								local v24 = v22[4]
								local v25 = v22[5]
								tbl9[1] = v23
								tbl9[2] = v24
								tbl9[3] = v25
								tbl9[4] = n
								return tbl9
							end
						end
					end
				end

				local tbl9 = {}
				local v22 = v21[3]
				local v23 = v21[4]
				local v24 = v21[5]
				tbl9[1] = v22
				tbl9[2] = v23
				tbl9[3] = v24
				tbl9[4] = n
				return tbl9
			end
		end

		_vm_a_1 = _vm_a_0
		_vm_U_1 = _vm_U_0
		_vm___1 = _vm___0
		local v21 = sea1[#sea1]

		if v21 then
			if questFarmMode ~= "Single Quest" and questFarmMode ~= "1 Quest (Normal Only)" and questFarmMode ~= "1 Quest" then
				if type(v21[6]) == "table" then
					local n2 = #v21
					_vm___1 = -1
					_vm_U_1 = 6
					_vm_a_1 = n2 - _vm___1

					for i = n2, 6, -1 do
						local v22 = v21[i]

						if type(v22) == "table" and v22[1] and v22[2] and v22[3] and v22[4] then
							if n >= v22[2] and utilities:CheckMon(v22[1]) then
								local tbl8 = {}
								local v23 = v22[1]
								local v24 = v22[3]
								local v25 = v22[4]
								tbl8[1] = v23
								tbl8[2] = v24
								tbl8[3] = v25
								tbl8[4] = n
								return tbl8
							end
						end
					end

					_vm_a_1 = _vm_a_0
					_vm_U_1 = _vm_U_0
					_vm___1 = _vm___0
				else
					if v21[6] and type(v21[6]) == "string" then
						local v22 = v21[6]

						if n >= (v21[7] or v21[1]) and utilities:CheckMon(v22) then
							local tbl8 = {}
							local v23 = v21[4]
							local n2 = v21[5] or 1
							tbl8[1] = v22
							tbl8[2] = v23
							tbl8[3] = n2 + 1
							tbl8[4] = n
							return tbl8
						end
					end
				end
			end

			local tbl8 = {}
			local v22 = v21[3]
			local v23 = v21[4]
			local v24 = v21[5]
			tbl8[1] = v22
			tbl8[2] = v23
			tbl8[3] = v24
			tbl8[4] = n
			return tbl8
		end

		return { "", "", 0, n }
	end

	CheckBoss = function(arg)
		local sea3 = flag3 and bossList.Sea_3 or flag2 and bossList.Sea_2 or flag and bossList.Sea_1
		if not sea3 then
			return nil
		end

		for _, v19 in next, sea3, nil do
			if v19[2] == arg then
				return v19
			end
		end

		return nil
	end

	local lua4 = lua3 or fn6("dev/testers.lua")

	tbl6.SendNotify = function(arg, arg2, arg3, time, arg4, arg5)
		pcall(function()
			if lua4 and lua4.Notification and lua4.Notification.Notify then
				local notification = lua4.Notification
				local notify = notification.Notify
				local tbl8 = { Title = arg2, Description = arg3, Buttons = arg4, Id = arg5 }
				local tbl9 = {}
				tbl9.Time = time or 5
				notify(notification, tbl8, tbl9)
			end
		end)
	end

	local name = nil
	local v19 = nil
	local fn14 = nil
	local position = nil
	local humanoidRootPart2 = nil

	local function fn15()
		if humanoidRootPart2 then
			if typeof(humanoidRootPart2) == "Instance" then
				if humanoidRootPart2.Parent and humanoidRootPart2:IsDescendantOf(workspace) then
					local isModel = humanoidRootPart2:IsA("Model") and humanoidRootPart2 or humanoidRootPart2.Parent
					isModel = isModel and isModel:FindFirstChildOfClass("Humanoid")

					if not isModel or isModel.Health > 0 then
						if humanoidRootPart2:IsA("BasePart") then
							return humanoidRootPart2.Position
						end

						if humanoidRootPart2:IsA("Model") then
							local humanoidRootPart3 = humanoidRootPart2:FindFirstChild("HumanoidRootPart") or humanoidRootPart2:FindFirstChild("Head") or humanoidRootPart2.PrimaryPart
							if humanoidRootPart3 then
								return humanoidRootPart3.Position
							end
						end
					else
						humanoidRootPart2 = nil
					end
				else
					humanoidRootPart2 = nil
				end
			elseif typeof(humanoidRootPart2) == "Vector3" then
				return humanoidRootPart2
			end
		end

		if position then
			if typeof(position) == "Instance" then
				if position.Parent and position:IsDescendantOf(workspace) then
					local isModel = position:IsA("Model") and position or position.Parent
					isModel = isModel and isModel:FindFirstChildOfClass("Humanoid")

					if not isModel or isModel.Health > 0 then
						if position:IsA("BasePart") then
							return position.Position
						end

						if position:IsA("Model") then
							local humanoidRootPart3 = position:FindFirstChild("HumanoidRootPart") or position:FindFirstChild("Head") or position.PrimaryPart
							if humanoidRootPart3 then
								return humanoidRootPart3.Position
							end
						end
					else
						position = nil
					end
				else
					position = nil
				end
			else
				if typeof(position) == "Vector3" then
					return position
				end

				if typeof(position) == "CFrame" then
					return position.Position
				end
			end
		end

		local enableAimbot = tbl

		if tbl then
			enableAimbot = tbl.EnableAimbot or tbl.Aimbot
		end

		if enableAimbot and fn14 then
			local v20 = fn14()

			if v20 and v20.Character and v20.Character:IsDescendantOf(workspace) then
				local character2 = v20.Character
				local humanoid2 = character2:FindFirstChildOfClass("Humanoid")

				if not humanoid2 or humanoid2.Health > 0 then
					local humanoidRootPart3 = character2:FindFirstChild("HumanoidRootPart") or character2:FindFirstChild("Head") or character2.PrimaryPart
					if humanoidRootPart3 then
						return humanoidRootPart3.Position
					end
				end
			end
		end

		return nil
	end

	local v20 = getrawmetatable(game)
	local namecall = v20.__namecall
	setreadonly(v20, false)

	v20.__namecall = newcclosure(function(arg, ...)
		local v21 = table.pack(...)
		local v22 = getnamecallmethod()
		local tbl8 = { ... }

		if not checkcaller() and (v22 == "FireServer" or v22 == "InvokeServer") then
			local v23 = fn15()

			if v23 and typeof(tbl8[1]) ~= "boolean" then
				local _vm___1 = 1

				for i = 1, math.min(6, #tbl8) do
					local v24 = tbl8[i]
					if typeof(v24) == "Vector3" then
						tbl8[i] = v23
						return namecall(arg, unpack(tbl8))
					end

					if typeof(v24) == "CFrame" then
						tbl8[i] = CFrame.new(v24.Position, v23)
						return namecall(arg, unpack(tbl8))
					end
				end

				local _vm___0
				_vm___1 = _vm___0
			end
		end

		return namecall(arg, table.unpack(v21, 1, v21.n))
	end)

	NPCPos = function(arg, arg2)
		local n = level and level.Value or 1

		local function fn16(arg3, arg4)
			if typeof(arg3) == "Instance" then
				if arg3:IsA("BasePart") then
					return arg3.CFrame
				end

				if arg3:IsA("Model") then
					return arg3:GetPivot()
				end
			else
				if typeof(arg3) == "CFrame" then
					return arg3
				end

				if typeof(arg3) == "Vector3" then
					return CFrame.new(arg3)
				end
			end

			if arg4 and type(arg4) == "table" then
				if arg4.CFrame and typeof(arg4.CFrame) == "CFrame" then
					return arg4.CFrame
				end

				if arg4.Position and typeof(arg4.Position) == "Vector3" then
					return CFrame.new(arg4.Position)
				end

				if arg4.Position and typeof(arg4.Position) == "CFrame" then
					return arg4.Position
				end
			end

			return nil
		end

		if GuideModule and GuideModule.Data and GuideModule.Data.NPCList then
			pcall(function()
				if GuideModule.ChangeQuest and arg2 then
					GuideModule.ChangeQuest(arg2)
				end
			end)

			if arg2 then
				for k, v21 in next, GuideModule.Data.NPCList, nil do
					if v21 and v21.InternalQuestName and string.lower(v21.InternalQuestName) == string.lower(arg2) then
						local v22 = fn16(k, v21)
						if v22 then
							return v22
						end
					end
				end
			end

			for k, v21 in next, GuideModule.Data.NPCList, nil do
				if v21 and v21.Levels and table.find(v21.Levels, n) then
					local v22 = fn16(k, v21)
					if v22 then
						return v22
					end
				end
			end

			local str4

			if arg2 then
				str4 = arg2:gsub("Quest.*", ""):gsub("%d+", ""):lower()
			else
				str4 = arg2
			end

			str4 = str4 or ""
			local match = arg and arg:match("^(%a+)")
			local str5

			if match then
				str5 = arg:match("^(%a+)"):lower()
			else
				str5 = match
			end

			str5 = str5 or ""

			for k, v21 in next, GuideModule.Data.NPCList, nil do
				if v21 and type(v21) == "table" then
					local str6 = tostring(v21.NPCName or ""):lower()
					local v22 = tostring
					local internalQuestName = v21.InternalQuestName
					local str7 = v22(internalQuestName or ""):lower()

					if str4 ~= "" and (str6:find(str4, 1, true) or str7:find(str4, 1, true)) or str5 ~= "" and #str5 >= 4 and str6:find(str5, 1, true) then
						local v23 = fn16(k, v21)
						if v23 then
							return v23
						end
					end
				end
			end

			local lastClosestNPC = GuideModule.Data.LastClosestNPC

			if lastClosestNPC then
				for k, v21 in next, GuideModule.Data.NPCList, nil do
					if v21 and v21.NPCName == lastClosestNPC then
						local v22 = fn16(k, v21)
						if v22 then
							return v22
						end
					end
				end
			end
		end

		local function fn17(arg3)
			if not arg3 then
				return nil
			end
			local str4 = arg2

			if arg2 then
				str4 = arg2:gsub("Quest.*", ""):gsub("%d+", ""):lower()
			end

			str4 = str4 or ""
			local match = arg and arg:match("^(%a+)")

			if match then
				match = arg:match("^(%a+)"):lower()
			end

			match = match or ""
			local v21 = next
			local children, v22 = arg3:GetChildren()

			for _, v23 in v21, children, v22 do
				local str5 = v23.Name:lower()
				local flag4

				if str4 ~= "" and str5:find(str4, 1, true) and (str5:find("quest") or str5:find("giver")) then
					flag4 = true
				elseif match ~= "" and #match >= 4 and str5:find(match, 1, true) then
					flag4 = true
				else
					local pos = str5:find("quest") and arg2 and str5:find(arg2:lower():gsub("quest.*", ""))
					flag4 = false

					if pos then
						flag4 = true
					end
				end

				if flag4 then
					local humanoidRootPart3 = v23:FindFirstChild("HumanoidRootPart") or v23.PrimaryPart
					if humanoidRootPart3 then
						return humanoidRootPart3.CFrame
					end
					return v23:GetPivot()
				end
			end

			return nil
		end

		local v21 = fn17(v2:FindFirstChild("NPCs")) or fn17(v4:FindFirstChild("NPCs"))
		if v21 then
			return v21
		end

		if arg then
			if not utilities.SpawnCache or not utilities.SpawnCache[arg] then
				local fortBuilderReplicatedSpawnPositi = v4:FindFirstChild("FortBuilderReplicatedSpawnPositionsFolder")

				if fortBuilderReplicatedSpawnPositi then
					local v22 = next
					local children, v23 = fortBuilderReplicatedSpawnPositi:GetChildren()

					for _, v24 in v22, children, v23 do
						if v24:IsA("BasePart") then
							utilities.SpawnCache = utilities.SpawnCache or {}
							local spawnCache = utilities.SpawnCache
							local name2 = v24.Name
							local v25 = utilities.SpawnCache[v24.Name]
							spawnCache[name2] = v25 or {}
							table.insert(utilities.SpawnCache[v24.Name], v24.CFrame)
						end
					end
				end
			end

			local spawnCache = utilities.SpawnCache and utilities.SpawnCache[arg]
			if spawnCache and #spawnCache > 0 then
				return spawnCache[1]
			end
		end

		if arg then
			local enemies2 = utilities:GetEnemies(arg)
			local humanoidRootPart3

			if enemies2 then
				humanoidRootPart3 = enemies2:FindFirstChild("HumanoidRootPart") or enemies2.PrimaryPart
			else
				humanoidRootPart3 = enemies2
			end

			if humanoidRootPart3 then
				return humanoidRootPart3.CFrame
			end
		end

		return nil
	end

	local n = 0
	local v21 = nil

	GetQuest = function()
		local v22 = CheckQuest()
		if not v22 or not v22[2] or v22[2] == "" then
			return
		end
		local v23 = v22[1]
		local v24 = v22[2]
		local v25 = v22[3]
		if HasActiveQuest() then
			return
		end

		if tbl.BypassGetQuest then
			tbl6:FireInvoke("StartQuest", v24, v25)

			if tbl.QuestDebounce then
				n = tick()
				v21 = v24
			end

			task.wait(0.3)

			if tbl.AutoSetSpawnPoint then
				tbl6:FireInvoke("SetSpawnPoint")
			end

			return
		end

		local v26 = NPCPos(v23, v24)
		if not v26 then
			return
		end

		if utilities:GetDistance(v26) <= 25 then
			tbl6:FireInvoke("StartQuest", v24, v25)

			if tbl.QuestDebounce then
				n = tick()
				v21 = v24
			end

			task.wait(0.3)
		elseif v18.Character and v18.Character:FindFirstChild("HumanoidRootPart") then
			local position2 = v18.Character.HumanoidRootPart.Position
			local position3 = typeof(v26) == "CFrame" and v26.Position or typeof(v26) == "Vector3" and v26 or v26.Position
			tweenManager:topos(CFrame.new(position3 - ((position3 - position2).Magnitude > 5 and (position3 - position2).Unit * 5 or Vector3.zero)))
		else
			tweenManager:topos(v26)
		end

		if tbl.AutoSetSpawnPoint then
			tbl6:FireInvoke("SetSpawnPoint")
		end
	end

	local tbl8 = {
		["Blox Fruit"] = { tooltip = "Blox Fruit", keys = "BloxFruitKeys", delay = "BloxFruitDelay" },
		Melee = { tooltip = "Melee", keys = "MeleeKeys", delay = "MeleeDelay" },
		Sword = { tooltip = "Sword", keys = "SwordKeys", delay = "SwordDelay" },
		Gun = { tooltip = "Gun", keys = "GunKeys", delay = "GunDelay" },
	}

	local function fn16()
		if not tbl.AutoSkills then
			return
		end

		if not humanoid then
			return
		end
		local selectSkills = tbl.SelectSkills
		local tbl9 = type(selectSkills) == "table" and selectSkills or { selectSkills }
		local v22 = next
		local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v22, tbl9, nil)

		for _, v23 in v22, tbl9, nil do
			local v24 = tbl8[v23]

			if v24 then
				local character2 = v18.Character
				character2 = character2 and character2:FindFirstChildWhichIsA("Tool")

				if not character2 or character2.ToolTip ~= v24.tooltip then
					local v25 = next
					local children, v26 = v18.Backpack:GetChildren()
					local exitTo = nil

					for _, v27 in v25, children, v26 do
						if v27:IsA("Tool") and v27.ToolTip == v24.tooltip then
							exitTo = 1
							break
						end
					end

					if exitTo == 1 then
						humanoid:EquipTool(s9_1)
						task.wait(0.5)
					end
				end

				local n2 = (tbl[v24.delay] or 300) / 1000
				local v25 = tbl[v24.keys]
				local tbl10 = type(v25) == "table" and v25 or { v25 }

				for _, v26 in next, tbl10, nil do
					local flag4 = typeof(v26) == "EnumItem" and v26 or Enum.KeyCode[v26]

					if flag4 then
						local n3 = (tbl["HoldTime_" .. (typeof(v26) == "EnumItem" and v26.Name or tostring(v26))] or 0) / 1000
						v8:SendKeyEvent(true, flag4, false, game)

						if n3 > 0 then
							task.wait(n3)
						else
							task.wait()
						end

						v8:SendKeyEvent(false, flag4, false, game)
						task.wait(n2)
					end
				end
			end
		end

		local _vm_a_0
		_vm_a_1 = _vm_a_0
		local _vm_U_0
		local _vm_U_1 = _vm_U_0
		local _vm___0
		local _vm___1 = _vm___0
	end

	checkv3boss = function()
		return utilities:CheckMon("Diamond") or utilities:CheckMon("Orbitus") or utilities:CheckMon("Jeremy")
	end

	EquipSword = function(arg)
		if not v18.Character:FindFirstChild(arg) then
			tbl6:FireInvoke("LoadItem", arg)
		end
	end

	PostWebhook = function(arg, arg2)
		if not arg or arg == "" or typeof(arg) ~= "string" or not arg:find("http") then
			return
		end

		task.spawn(function()
			pcall(function()
				fn2({
					Url = arg,
					Method = "POST",
					Headers = { ["Content-Type"] = "application/json" },
					Body = typeof(arg2) == "table" and v9:JSONEncode(arg2) or tostring(arg2),
				})
			end)
		end)
	end

	WeeboLogs = function(arg, arg2)
		local tbl9 = arg2 or {}
		local str4 = ">>> **User:** " .. v18.Name .. "\n**Event:** " .. arg

		if tbl9.Position then
			str4 ..= "\n**Distance:** " .. math.floor(v18:DistanceFromCharacter(tbl9.Position)) .. "m"
		end

		if tbl9.Extra then
			str4 ..= "\n" .. tbl9.Extra
		end

		local tbl10 = { { name = "Event Details", value = str4, inline = true } }

		if tbl9.Field2 then
			local insert = table.insert
			local tbl11 = { name = tbl9.Field2.name or "Info" }
			tbl11.value = "```\n" .. tostring(tbl9.Field2.value) .. "\n```"
			tbl11.inline = false
			insert(tbl10, tbl11)
		end

		local flag4 = tbl and tbl.WebhookPingId and tbl.WebhookPingId ~= ""
		local str5 = nil

		if flag4 then
			local webhookPingOnEvents = tbl.WebhookPingOnEvents

			if webhookPingOnEvents then
				webhookPingOnEvents = arg:find("Mirage")
				webhookPingOnEvents = webhookPingOnEvents or arg:find("Kitsune") or arg:find("Prehistoric")
			end

			if webhookPingOnEvents then
				str5 = "<@" .. tbl.WebhookPingId .. ">"
			else
				local webhookPingOnMythical = tbl.WebhookPingOnMythical

				if webhookPingOnMythical then
					webhookPingOnMythical = tostring(tbl9.Extra):find("Dragon") or tostring(tbl9.Extra):find("Kitsune") or tostring(tbl9.Extra):find("Leopard") or tostring(tbl9.Extra):find("T-Rex") or tostring(tbl9.Extra):find("Mammoth") or tostring(tbl9.Extra):find("Dough")
				end

				str5 = nil

				if webhookPingOnMythical then
					str5 = "<@" .. tbl.WebhookPingId .. ">"
				end
			end
		end

		local tbl11 = { content = str5 }
		local embeds = {}

		embeds[1] = {
			type = "rich",
			color = 8202738,
			fields = tbl10,
			thumbnail = {
				url = "https://cdn.discordapp.com/attachments/1262751352791236620/1505931000948068513/Screenshot_2026-04-18_235959.png?ex=6a0c6b09&is=6a0b1989&hm=f43a97cbb0b52c83e79ef0247dac0e986d46d7455506a50e106993d36c1dea4b&",
			},
			timestamp = DateTime.now():ToIsoDate(),
		}

		tbl11.embeds = embeds
		return tbl11
	end

	local function fn17(arg)
		local v22, v23, v24 = string.match(tostring(arg), "^([^%d]*%d)(%d*)(.-)$")
		if not v22 then
			return tostring(arg)
		end
		return v22 .. v23:reverse():gsub("(%d%d%d)", "%1,"):reverse() .. v24
	end

	local function fn18(arg)
		local n2 = math.floor(arg % 60)
		local n3 = math.floor(arg / 60 % 60)
		return string.format("%02d:%02d:%02d", math.floor(arg / 3600), n3, n2)
	end

	local function fn19()
		if not v18.Character then
			return "None"
		end
		local tool = v18.Character:FindFirstChildOfClass("Tool")
		if tool then
			return tool.Name .. " (" .. (tool.ToolTip ~= "" and tool.ToolTip or "Weapon") .. ")"
		end
		return "None"
	end

	local function fn20()
		local tbl9 = {}

		for k in next, {
			{ "AutoFarmLevel", "Level Farm" },
			{ "AutoBone", "Bone Farm" },
			{ "AutoCakePrince", "Cake Prince" },
			{ "AutoDoughKing", "Dough King" },
			{ "AutoTaskEliteHunter", "Elite Hunter" },
			{ "AutoChest", "Chest Farm" },
			{ "AutoMaterial", "Material Farm" },
			{ "AutoRaid", "Raid / Dungeon" },
			{ "AutoTrialDracoTP", "Draco Trial" },
			{ "AutoSeaEvents", "Sea Events" },
			{ "AutoFish", "Fish Farm" },
			{ "AutoTTK", "True Triple Katana" },
			{ "AutoSoulReaper", "Soul Reaper" },
			{ "AutoFactoryRaid", "Factory Raid" },
			{ "AutoFarmPirateRaid", "Pirate Raid" },
			{ "AutoKaitun", "Onion Kaitun" },
			{ "AutoFindLeviatan", "Leviathan Hunt" },
		}, nil do
			if tbl[f[1]] then
				table.insert(tbl9, "[ON] " .. f[2])
			end
		end

		if #tbl9 == 0 then
			return "None (Idle)"
		end
		return table.concat(tbl9, "\n")
	end

	local function sendDataLog(arg, arg2, arg3)
		local dataLogWebhookUrl = tbl.DataLogWebhookUrl and tbl.DataLogWebhookUrl ~= "" and tbl.DataLogWebhookUrl or tbl.Webhook
		if not dataLogWebhookUrl or dataLogWebhookUrl == "" or typeof(dataLogWebhookUrl) ~= "string" or not dataLogWebhookUrl:find("http") then
			return
		end
		local n2 = level and level.Value or 0
		local n3 = beli and beli.Value or 0
		local n4 = fragments and fragments.Value or 0
		local n5 = math.max(0, n2 - tbl2.Runtime.StartLevel)
		local n6 = math.max(0, n3 - tbl2.Runtime.StartBeli)
		local n7 = math.max(0, n4 - tbl2.Runtime.StartFragments)
		local str4 = flag and "Sea 1 (Old World)" or flag2 and "Sea 2 (Dressrosa)"
		local str5

		if str4 then
			str5 = str4
		else
			local v22 = flag3

			if flag3 then
				str5 = "Sea 3 (Zou)"
			else
				str5 = v22
			end
		end

		str5 = str5 or "Unknown Sea"
		local str6 = v18:FindFirstChild("leaderstats") and v18.leaderstats:FindFirstChild("Bounty/Honor") and v18.leaderstats["Bounty/Honor"].Value or "N/A"
		local activeFunction = tbl6.ActiveFunction or "Idle"
		local v22 = fn18(tick() - tbl2.Runtime.StartTime)
		local n8 = math.floor(v2:GetRealPhysicsFPS())
		local n9 = 0

		pcall(function()
			local floor = math.floor
			n9 = floor(tonumber(v14.Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+")) or 0)
		end)

		local tbl9 = {}

		local tbl10 = {
			name = "Player Profile",
			value = "**User:** " .. v18.Name .. " (`" .. v18.UserId .. "`)\n**Sea:** " .. str5 .. "\n**Bounty/Honor:** " .. fn17(str6),
			inline = true,
		}

		local tbl11 = {
			name = "Statistics",
			value = "**Level:** " .. fn17(n2) .. " *(+" .. fn17(n5) .. ")*\n**Beli:** $" .. fn17(n3) .. " *(+$" .. fn17(n6) .. ")*\n**Fragments:** Frags: " .. fn17(n4) .. " *(+" .. fn17(n7) .. ")*",
			inline = true,
		}

		local tbl12 = {
			name = "Equipment & Status",
			value = "**Active Farm:** `" .. activeFunction .. "`\n**Equipped:** " .. fn19() .. "\n**Elapsed Time:** " .. v22 .. "\n**Performance:** " .. n8 .. " FPS | " .. n9 .. " ms",
			inline = false,
		}

		tbl9[1] = tbl10
		tbl9[2] = tbl11
		tbl9[3] = tbl12

		if tbl.SendWebhookInventory ~= false then
			local tbl13 = {}
			local tbl14 = {}
			local tbl15 = {}
			local tbl16 = {}
			local tbl17 = {}

			pcall(function()
				local response = Net:RemoteFunction("GetAllItemValues"):InvokeServer()

				if response and typeof(response) == "table" then
					local tbl18 = {}

					for _, v23 in next, response, nil do
						local v24 = tostring
						local str7 = tostring(v23.ItemId) .. "_" .. v24(v23.NetworkedUID)
						tbl18[str7] = tbl18[str7] or { ItemId = v23.ItemId, UID = v23.NetworkedUID, Attributes = {} }

						if v23.Value ~= nil then
							tbl18[str7].Attributes[v23.Key] = v23.Value
						end
					end

					for _, v23 in next, tbl18, nil do
						local attributes = v23.Attributes

						if attributes.IsOwned == true or attributes.Quantity and attributes.Quantity > 0 then
							local ok, result = pcall(function()
								return ItemConfig.match(v23.ItemId)
							end)

							local isOk = ok and result and result.isOk and result:isOk()
							local str7 = ""

							if isOk then
								local v24 = result:unwrap()

								if v24 and v24.Index and v24.Index.DebugLabel then
									str7 = tostring(v24.Index.DebugLabel)
								end
							end

							local str8 = (str7:match("^(.-)%s*%[") or str7):gsub("^%-%-%s*", "")
							local match = str7:match("%[(.-)%]") or ""
							local quantity = attributes.Quantity or 1

							if match:find("PhysicalMoveset") or match:find("Fruit") then
								table.insert(tbl13, (str8:match("^(.-)%-") or str8) .. (quantity > 1 and " (x" .. quantity .. ")" or ""))
							elseif match:find("Accessory") then
								table.insert(tbl16, str8)
							elseif match:find("Material") then
								table.insert(tbl17, str8 .. " (" .. quantity .. ")")
							end
						end
					end
				end
			end)

			pcall(function()
				local response = commF:InvokeServer("getInventoryWeapons")

				if response and typeof(response) == "table" then
					for k in next, response, nil do
						if w.Type == "Sword" or not w.Type then
							table.insert(tbl14, w.Name)
						elseif w.Type == "Gun" then
							table.insert(tbl15, w.Name)
						end
					end
				end
			end)

			table.sort(tbl13)
			table.sort(tbl14)
			table.sort(tbl17)
			local str7 = #tbl13 > 0 and table.concat(tbl13, ", ") or "None"

			if #str7 > 900 then
				str7 = str7:sub(1, 897) .. "..."
			end

			table.insert(tbl9, {
				name = "Fruit Storage (" .. #tbl13 .. " Fruits)",
				value = "```\n" .. str7 .. "\n```",
				inline = false,
			})

			local str8 = #tbl14 > 0 and table.concat(tbl14, ", ") or "None"

			if #str8 > 900 then
				str8 = str8:sub(1, 897) .. "..."
			end

			table.insert(tbl9, { name = "Owned Swords (" .. #tbl14 .. ")", value = "```\n" .. str8 .. "\n```", inline = false })

			if #tbl17 > 0 then
				local str9 = table.concat(tbl17, ", ")

				if #str9 > 900 then
					str9 = str9:sub(1, 897) .. "..."
				end

				table.insert(tbl9, { name = "Materials (" .. #tbl17 .. ")", value = "```\n" .. str9 .. "\n```", inline = false })
			end
		end

		if tbl.SendWebhookFarmsAll then
			table.insert(tbl9, { name = "Farms All Status", value = "```\n" .. fn20() .. "\n```", inline = false })
		end

		if arg3 then
			table.insert(tbl9, { name = "Log Details", value = arg3, inline = false })
		end

		local tbl13 = {}
		local embeds = {}

		local tbl14 = {
			title = arg2 or "OnionHub - Blox Fruit Data Log",
			type = "rich",
			color = 3066993,
			fields = tbl9,
		}

		tbl14.thumbnail = {
			url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. v18.UserId .. "&width=420&height=420&format=png",
		}

		tbl14.footer = { text = "OnionHub | " .. os.date("%X") }
		tbl14.timestamp = DateTime.now():ToIsoDate()
		embeds[1] = tbl14
		tbl13.embeds = embeds
		PostWebhook(dataLogWebhookUrl, tbl13)
		tbl2.Runtime.LastDataLogTick = tick()
	end

	tbl2.Webhook.SendDataLog = sendDataLog

	tbl2.Webhook.LogError = function()
	end

	local tbl9 = {}

	tbl6.GetPedestal = function()
		if not map:FindFirstChild("Turtle") or not map.Turtle:FindFirstChild("Cursed") then
			return nil
		end
		local cursed = map.Turtle.Cursed
		if tbl9.Evil == 3 and cursed:FindFirstChild("Pedestal2") then
			return cursed.Pedestal2
		end

		if tbl9.Good == 3 and cursed:FindFirstChild("Pedestal1") then
			return cursed.Pedestal1
		end

		if tbl9.Evil == 4 and tbl9.Good == 4 and cursed:FindFirstChild("Pedestal3") then
			return cursed.Pedestal3
		end
		return nil
	end

	tbl6.CDKProgress = function()
		local CDKQuest = tbl6:FireInvoke("CDKQuest", "Progress")
		if type(CDKQuest) ~= "table" then
			return "None"
		end
		local evil = CDKQuest.Evil or -2
		local good = CDKQuest.Good or -2
		tbl9.Evil = evil
		tbl9.Good = good
		tbl9.Finished = CDKQuest.Finished or false
		local flag4 = CDKQuest.Finished == true
		local flag5

		if flag4 then
			flag5 = flag4
		else
			flag5 = evil == 4 and good == 4
		end

		if flag5 then
			return "Alucard Boss"
		end

		if good == 0 or good == -3 then
			return "Boat Quest"
		end

		if good == 1 or good == -4 then
			return "Raid Quest"
		end

		if good == 2 or good == -5 then
			return "Heavenly Quest"
		end

		if good == 3 then
			return "Burn Tushita Scroll"
		end

		if evil == 0 or evil == -3 then
			return "Pain Quest"
		end

		if evil == 1 or evil == -4 then
			return "Haze Quest"
		end

		if evil == 2 or evil == -5 then
			return "Hell Quest"
		end

		if evil == 3 then
			return "Burn Yama Scroll"
		end

		if good == -2 and evil == -2 then
			local Tushita = utilities:CheckToolName("Tushita")

			if not Tushita then
				Tushita = (utilities:CheckInventory("Moveset", "Tushita") or 0) >= 350
			end

			if Tushita then
				return "Start Tushita"
			end
			return "Start Yama"
		end

		if good == -2 then
			return "Start Tushita"
		end

		if evil == -2 then
			return "Start Yama"
		end
		return "None"
	end

	local function fn21(arg)
		for _, v22 in ipairs(arg) do
			sethiddenproperty(v18, "SimulationRadius", math.huge)

			if v22:FindFirstChild("Humanoid") then
				v22.Humanoid.Health = 0
			end

			if v22:FindFirstChild("HumanoidRootPart") then
				v22.HumanoidRootPart.CanCollide = false
			end
		end
	end

	RemoveEffects = function()
		return function()
			local container = v4.Effect.Container
			local CameraShaker = require(v4.Util.CameraShaker)
			local Death = require(container:FindFirstChild("Death"))
			local Respawn = require(container:FindFirstChild("Respawn"))
			local LevelUp = require(container:FindFirstChild("LevelUp"))

			local function fn22()
			end

			hookfunction(Death, fn22)

			hookfunction(LevelUp, function()
			end)

			hookfunction(Respawn, function()
			end)

			CameraShaker:Stop()
		end
	end

	round = function(arg)
		return math.floor(arg + 0.5)
	end

	GetHeadshotImage = function(arg)
		return string.format("https://www.roblox.com/headshot-thumbnail/image?userId=%d&width=420&height=420&format=png", arg)
	end

	tbl6._ActiveESPs = tbl6._ActiveESPs or {}

	ClearESP = function(arg)
		for k, v22 in next, tbl6._ActiveESPs, nil do
			if not arg or v22.Category == arg then
				if v22.Folder and v22.Folder.Parent then
					pcall(function()
						v22.Folder:Destroy()
					end)
				end

				tbl6._ActiveESPs[k] = nil
			end
		end
	end

	AddESP = function(adornee, color, arg, arg2, arg3, category)
		if not adornee or adornee:FindFirstChild("ESPquantumONYX") then
			return
		end
		local folder = Instance.new("Folder", adornee)
		folder.Name = "ESPquantumONYX"
		local activeESPs = tbl6._ActiveESPs
		local tbl10 = { Folder = folder }
		tbl10.Category = category or "General"
		activeESPs[adornee] = tbl10
		local n2 = math.clamp(adornee.Size.Y / 2 + 2.2, 2.6, 40)

		if category == "Player" then
			n2 = 2.4
		end

		local billboardGui = Instance.new("BillboardGui", folder)
		billboardGui.Name = "ESP_Billboard"
		billboardGui.Adornee = adornee
		billboardGui.Size = UDim2.new(0, 260, 0, arg3 and 42 or 26)
		billboardGui.StudsOffset = Vector3.new(0, n2, 0)
		billboardGui.AlwaysOnTop = true
		billboardGui.LightInfluence = 0
		billboardGui.MaxDistance = 100000
		billboardGui.ClipsDescendants = false
		local frame = Instance.new("Frame", billboardGui)
		frame.Name = "IconContainer"
		frame.Size = UDim2.new(0, 28, 0, 28)
		frame.Position = UDim2.new(0, 0, 0.5, -14)
		frame.BackgroundTransparency = 0.25
		frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
		Instance.new("UICorner", frame).CornerRadius = UDim.new(1, 0)
		local uiStroke = Instance.new("UIStroke", frame)
		uiStroke.Color = color or Color3.fromRGB(255, 255, 255)
		uiStroke.Thickness = 1.2
		local imageLabel = Instance.new("ImageLabel", frame)
		imageLabel.BackgroundTransparency = 1
		imageLabel.Size = UDim2.new(1, 0, 1, 0)
		imageLabel.Image = "rbxassetid://0"
		Instance.new("UICorner", imageLabel).CornerRadius = UDim.new(1, 0)
		local frame2 = Instance.new("Frame", billboardGui)
		frame2.Name = "InfoContainer"
		frame2.BackgroundTransparency = 1
		frame2.Position = UDim2.new(0, 0, 0, 0)
		frame2.Size = UDim2.new(1, 0, 1, 0)
		frame2.ClipsDescendants = false
		local textLabel = Instance.new("TextLabel", frame2)
		textLabel.Name = "NameLabel"
		textLabel.BackgroundTransparency = 1
		textLabel.TextSize = 12
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextStrokeTransparency = 0.2
		textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
		textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		textLabel.RichText = true
		local frame3 = nil
		local frame4 = nil
		local uiStroke2 = nil
		local textLabel2 = nil
		local frame5 = nil
		local frame6 = nil
		local uiStroke3 = nil
		local textLabel3 = nil

		if arg3 then
			textLabel.Size = UDim2.new(1, 0, 0, 16)
			textLabel.Position = UDim2.new(0, 0, 0, 1)
			textLabel.TextYAlignment = Enum.TextYAlignment.Center
			textLabel.TextXAlignment = Enum.TextXAlignment.Left
			local frame7 = Instance.new("Frame", frame2)
			frame7.Name = "BarsContainer"
			frame7.BackgroundTransparency = 1
			frame7.Size = UDim2.new(0, 160, 0, 13)
			frame7.Position = UDim2.new(0, 0, 0, 19)
			frame7.ClipsDescendants = false
			frame3 = Instance.new("Frame", frame7)
			frame3.Name = "HealthBar"
			frame3.Size = UDim2.new(0, 76, 0, 13)
			frame3.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
			frame3.BackgroundTransparency = 0.3
			frame3.BorderSizePixel = 0
			frame3.ClipsDescendants = true
			Instance.new("UICorner", frame3).CornerRadius = UDim.new(0, 3)
			uiStroke2 = Instance.new("UIStroke", frame3)
			uiStroke2.Color = Color3.fromRGB(50, 255, 100)
			uiStroke2.Thickness = 0.8
			uiStroke2.Transparency = 0.4
			frame4 = Instance.new("Frame", frame3)
			frame4.Name = "Fill"
			frame4.Size = UDim2.new(1, 0, 1, 0)
			frame4.BackgroundColor3 = Color3.fromRGB(50, 255, 100)
			frame4.BackgroundTransparency = 0.35
			frame4.BorderSizePixel = 0
			Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 3)
			textLabel2 = Instance.new("TextLabel", frame3)
			textLabel2.Name = "HealthText"
			textLabel2.BackgroundTransparency = 1
			textLabel2.Size = UDim2.new(1, 0, 1, 0)
			textLabel2.TextSize = 9
			textLabel2.Font = Enum.Font.GothamBold
			textLabel2.TextStrokeTransparency = 0.15
			textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel2.RichText = true
			frame5 = Instance.new("Frame", frame7)
			frame5.Name = "EnergyBar"
			frame5.Size = UDim2.new(0, 76, 0, 13)
			frame5.Position = UDim2.new(0, 80, 0, 0)
			frame5.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
			frame5.BackgroundTransparency = 0.3
			frame5.BorderSizePixel = 0
			frame5.ClipsDescendants = true
			Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 3)
			uiStroke3 = Instance.new("UIStroke", frame5)
			uiStroke3.Color = Color3.fromRGB(70, 180, 255)
			uiStroke3.Thickness = 0.8
			uiStroke3.Transparency = 0.4
			frame6 = Instance.new("Frame", frame5)
			frame6.Name = "Fill"
			frame6.Size = UDim2.new(1, 0, 1, 0)
			frame6.BackgroundColor3 = Color3.fromRGB(70, 180, 255)
			frame6.BackgroundTransparency = 0.35
			frame6.BorderSizePixel = 0
			Instance.new("UICorner", frame6).CornerRadius = UDim.new(0, 3)
			textLabel3 = Instance.new("TextLabel", frame5)
			textLabel3.Name = "EnergyText"
			textLabel3.BackgroundTransparency = 1
			textLabel3.Size = UDim2.new(1, 0, 1, 0)
			textLabel3.TextSize = 9
			textLabel3.Font = Enum.Font.GothamBold
			textLabel3.TextStrokeTransparency = 0.15
			textLabel3.TextColor3 = Color3.fromRGB(255, 255, 255)
			textLabel3.RichText = true
		else
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.Position = UDim2.new(0, 0, 0, 0)
			textLabel.TextYAlignment = Enum.TextYAlignment.Center
			textLabel.TextXAlignment = Enum.TextXAlignment.Center
		end

		local str4 = ""
		local str5 = ""

		task.spawn(function()
			while task.wait(0.1) do
				if not billboardGui or not billboardGui.Parent or not adornee or not adornee.Parent then
					tbl6._ActiveESPs[adornee] = nil
					break
				else
					pcall(function()
						local text = arg and arg() or ""

						if text ~= str4 then
							str4 = text
							textLabel.Text = text
						end

						if arg2 then
							local image = arg2() or ""

							if image ~= str5 then
								str5 = image

								if image ~= "" and image ~= "rbxassetid://0" then
									imageLabel.Image = image
									frame.Visible = true
									frame2.Position = UDim2.new(0, 34, 0, 0)
									frame2.Size = UDim2.new(1, -34, 1, 0)
									textLabel.TextXAlignment = Enum.TextXAlignment.Left
								else
									frame.Visible = false
									frame2.Position = UDim2.new(0, 0, 0, 0)
									frame2.Size = UDim2.new(1, 0, 1, 0)

									if not arg3 then
										textLabel.TextXAlignment = Enum.TextXAlignment.Center
									end
								end
							end
						elseif frame.Visible then
							frame.Visible = false
							frame2.Position = UDim2.new(0, 0, 0, 0)
							frame2.Size = UDim2.new(1, 0, 1, 0)

							if not arg3 then
								textLabel.TextXAlignment = Enum.TextXAlignment.Center
							end
						end

						if arg3 and frame3 then
							local v22, v23, v24, v25, v26, v27 = arg3()

							if v22 then
								frame3.Visible = true
								frame4.Size = UDim2.new(math.clamp(v22, 0, 1), 0, 1, 0)

								if v23 then
									frame4.BackgroundColor3 = v23
									uiStroke2.Color = v23
								end

								textLabel2.Text = v24 or ""
							else
								frame3.Visible = false
							end

							if v25 and frame5 then
								frame5.Visible = true
								frame6.Size = UDim2.new(math.clamp(v25, 0, 1), 0, 1, 0)

								if v26 then
									frame6.BackgroundColor3 = v26
									uiStroke3.Color = v26
								end

								textLabel3.Text = v27 or ""
							elseif frame5 then
								frame5.Visible = false
							end
						end
					end)
				end
			end
		end)
	end

	local function fn22()
		if not tbl.ESPPlayer then
			return
		end
		local character2 = v18.Character

		if character2 then
			if not character2:FindFirstChild("Head") then
				character2:FindFirstChild("HumanoidRootPart")
			end
		end

		local v22 = next
		local players, v23 = v3:GetPlayers()

		for _, v24 in v22, players, v23 do
			if v24 ~= v18 and v24.Character then
				local head = v24.Character:FindFirstChild("Head") or v24.Character:FindFirstChild("HumanoidRootPart")
				local humanoid2 = v24.Character:FindFirstChildOfClass("Humanoid") or v24.Character:FindFirstChild("Humanoid")

				if head and humanoid2 and humanoid2.Health > 0 and not head:FindFirstChild("ESPquantumONYX") then
					local flag4 = v18.Team ~= nil and v24.Team ~= nil and v24.Team == v18.Team

					AddESP(head, flag4 and Color3.fromRGB(0, 255, 140) or Color3.fromRGB(255, 60, 60), function()
						local character3 = v18.Character

						if character3 then
							character3 = character3:FindFirstChild("Head") or character3:FindFirstChild("HumanoidRootPart")
						end

						local n2 = character3 and head and head.Parent and math.floor((character3.Position - head.Position).Magnitude) or 0
						local data2 = v24:FindFirstChild("Data")
						return string.format("<b>%s</b> <font color='rgb(255,215,0)'>[Lv. %s]</font> • <font color='rgb(210,210,210)'>%dm</font>", v24.DisplayName or v24.Name, data2 and data2:FindFirstChild("Level") and tostring(data2.Level.Value) or "?", n2)
					end, function()
						return GetHeadshotImage(v24.UserId)
					end, function()
						local character3 = v24.Character
						if not (character3 and character3:FindFirstChildOfClass("Humanoid")) then
							return 0, Color3.fromRGB(50, 255, 100), "", nil, nil, nil
						end
						local humanoid3 = character3:FindFirstChildOfClass("Humanoid")
						local n2 = math.floor(humanoid3.Health)
						local n3 = math.max(math.floor(humanoid3.MaxHealth), 1)
						local n4 = math.clamp(n2 / n3, 0, 1)
						local color = flag4 and Color3.fromRGB(0, 255, 140) or Color3.fromRGB(50, 255, 100)
						local str4 = string.format("%d/%d HP", n2, n3)
						local energy = character3:FindFirstChild("Energy")
						local n5, n6

						if energy and energy.Value ~= nil then
							n5 = math.floor(tonumber(energy.Value) or 0)
							n6 = math.max(tonumber(energy.MaxValue) or 100, 1)
						else
							local data2 = v24:FindFirstChild("Data")
							local level2 = data2 and data2:FindFirstChild("Stats") and data2.Stats:FindFirstChild("Melee") and data2.Stats.Melee:FindFirstChild("Level")
							n6 = 100
							n5 = 100

							if level2 then
								n6 = 100 + (tonumber(data2.Stats.Melee.Level.Value) or 1) * 5
								n5 = n6
							end
						end

						return n4, color, str4, math.clamp(n5 / n6, 0, 1), Color3.fromRGB(70, 180, 255), (string.format("%d/%d EN", n5, n6))
					end, "Player")
				end
			end
		end
	end

	PlayerESP = fn22

	local function fn23(player)
		if player == v18 then
			return
		end

		player.CharacterAdded:Connect(function()
			task.wait(0.4)

			if tbl.ESPPlayer then
				pcall(PlayerESP)
			end
		end)
	end

	for _, player in ipairs(v3:GetPlayers()) do
		fn23(player)
	end

	v3.PlayerAdded:Connect(fn23)

	IslandESP = function()
		if not tbl.ESPIsland then
			return
		end
		local head = v18.Character and v18.Character:FindFirstChild("Head")
		local v22 = next
		local children, v23 = worldOrigin.Locations:GetChildren()

		for _, v24 in v22, children, v23 do
			if v24:IsA("BasePart") and v24.Name ~= "Sea" and not v24:FindFirstChild("ESPquantumONYX") then
				AddESP(v24, Color3.fromRGB(100, 200, 255), function()
					return string.format("<b><font color='rgb(100,200,255)'>%s</font></b>\n<font color='rgb(200,200,200)'>%d studs</font>", v24.Name, head and math.floor((head.Position - v24.Position).Magnitude) or 0)
				end, nil, nil, "Island")
			end
		end
	end

	FruitESP = function()
		if not tbl.DevilFruitESP then
			return
		end
		local v22 = next
		local children, v23 = v2:GetChildren()

		for _, v24 in v22, children, v23 do
			if v24:IsA("Model") and string.find(v24.Name, "Fruit") then
				local handle = v24:FindFirstChild("Handle") or v24.PrimaryPart

				if handle and not handle:FindFirstChild("ESPquantumONYX") then
					local name2 = v24.Name == "Fruit" and "Spawned Fruit" or v24.Name

					AddESP(handle, Color3.fromRGB(255, 170, 0), function()
						local character2 = v18.Character

						if character2 then
							character2 = character2:FindFirstChild("Head") or character2:FindFirstChild("HumanoidRootPart")
						end

						return string.format("Fruit: <b><font color='rgb(255,170,0)'>%s</font></b>\n<font color='rgb(220,220,220)'>%d studs away</font>", name2, character2 and math.floor((character2.Position - handle.Position).Magnitude) or 0)
					end, nil, nil, "Fruit")
				end
			end
		end
	end

	ChestESP = function()
		if not tbl.ESPChest then
			return
		end
		local chestModels = v2:FindFirstChild("ChestModels")
		if not chestModels then
			return
		end
		local v22 = next
		local children, v23 = chestModels:GetChildren()

		for _, v24 in v22, children, v23 do
			local rootPart = v24:FindFirstChild("RootPart")

			if rootPart and not rootPart:FindFirstChild("ESPquantumONYX") then
				local str4 = v24.Name:lower()
				local color = Color3.fromRGB(255, 255, 255)
				local str5 = "rbxassetid://0"
				local str6 = "Chest"

				if str4:find("silver") then
					color = Color3.fromRGB(210, 210, 220)
					str5 = "rbxassetid://97335861533611"
					str6 = "Silver Chest"
				elseif str4:find("gold") then
					color = Color3.fromRGB(255, 215, 0)
					str5 = "rbxassetid://103232045481498"
					str6 = "Gold Chest"
				elseif str4:find("diamond") then
					color = Color3.fromRGB(0, 230, 255)
					str5 = "rbxassetid://103232045481498"
					str6 = "Diamond Chest"
				end

				AddESP(rootPart, color, function()
					local character2 = v18.Character

					if character2 then
						character2 = character2:FindFirstChild("Head") or character2:FindFirstChild("HumanoidRootPart")
					end

					return string.format("<b><font color='rgb(%d,%d,%d)'>%s</font></b>\n<font color='rgb(200,200,200)'>%d studs</font>", color.R * 255, color.G * 255, color.B * 255, str6, character2 and math.floor((character2.Position - rootPart.Position).Magnitude) or 0)
				end, function()
					return str5
				end, nil, "Chest")
			end
		end
	end

	local tbl10 = {
		["Yellow Star Berry"] = Color3.fromRGB(255, 220, 50),
		["Red Cherry Berry"] = Color3.fromRGB(255, 65, 65),
		["Purple Jelly Berry"] = Color3.fromRGB(190, 80, 255),
		["Pink Pig Berry"] = Color3.fromRGB(255, 130, 180),
		["Blue Icicle Berry"] = Color3.fromRGB(80, 210, 255),
		["Green Toad Berry"] = Color3.fromRGB(65, 235, 95),
		["Orange Berry"] = Color3.fromRGB(255, 145, 35),
		["White Cloud Berry"] = Color3.fromRGB(240, 240, 255),
	}

	local color = Color3.fromRGB(255, 105, 180)
	local quantumBerryAnchors = v2:FindFirstChild("Onion_Berry_Anchors")

	if not quantumBerryAnchors then
		quantumBerryAnchors = Instance.new("Folder")
		quantumBerryAnchors.Name = "Onion_Berry_Anchors"
		quantumBerryAnchors.Parent = v2
	end

	local tbl11 = {}

	BerryESP = function()
		local _vm_a_1, _vm_a_0, _vm_U_0, _vm_U_1, _vm___0, _vm___1

		if not tbl.ESP_Berries then
			ClearESP("Berry")
			local v22, v23, v24 = pairs(tbl11)
			_vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v22, v23, v24)

			for _, v25 in v22, v23, v24 do
				if v25 and v25.Parent then
					pcall(function()
						v25:Destroy()
					end)
				end
			end

			_vm_a_1 = _vm_a_0
			_vm_U_1 = _vm_U_0
			_vm___1 = _vm___0
			table.clear(tbl11)
			return
		end

		local tbl12 = {}
		local v22, v23, v24 = ipairs(v5:GetTagged("BerryBush"))
		_vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v22, v23, v24)

		for _, v25 in v22, v23, v24 do
			if v25 and v25.Parent then
				local parent = v25.Parent
				local attribute2 = parent:GetAttribute("CFrame") or parent:IsA("Model") and parent:GetPivot()
				local flag4 = false

				for _, child in ipairs(v25:GetChildren()) do
					if child:IsA("Model") or child:IsA("BasePart") then
						local proximityPrompt = child:FindFirstChildOfClass("ProximityPrompt") or child:FindFirstChildWhichIsA("ProximityPrompt", true)
						local actionText = proximityPrompt and proximityPrompt.ActionText ~= "" and proximityPrompt.ActionText or child.Name

						if actionText == "ProximityPrompt" or #actionText <= 1 then
							actionText = "Berry"
						end

						local isBasePart = child:IsA("BasePart") and child
						local meshPart

						if isBasePart then
							meshPart = isBasePart
						else
							meshPart = child:FindFirstChildOfClass("MeshPart") or child:FindFirstChildWhichIsA("BasePart") or child.PrimaryPart
						end

						if meshPart and not meshPart:FindFirstChild("ESPquantumONYX") then
							local v26 = tbl10[actionText] or color

							local function fn24()
								local character2 = v18.Character
								local head = character2 and (character2:FindFirstChild("Head") or character2:FindFirstChild("HumanoidRootPart"))
								return string.format("Berry: <b><font color='rgb(%d,%d,%d)'>%s</font></b>\n<font color='rgb(220,220,220)'>%d studs</font>", v26.R * 255, v26.G * 255, v26.B * 255, actionText, head and math.floor((head.Position - meshPart.Position).Magnitude) or 0)
							end

							AddESP(meshPart, v26, fn24, nil, nil, "Berry")
						end

						flag4 = true
					end
				end

				if flag4 then
					for k in pairs(v25:GetAttributes()) do
						local str4 = parent.Name .. "_" .. k

						if tbl11[str4] then
							pcall(function()
								tbl11[str4]:Destroy()
							end)

							tbl11[str4] = nil
						end
					end
				else
					for k, v26 in pairs(v25:GetAttributes()) do
						if typeof(v26) == "string" and v26 ~= "" then
							local v27 = v26
							local str4 = parent.Name .. "_" .. k
							tbl12[str4] = true
							local attribute3 = parent:GetAttribute(k)
							local v28

							if attribute2 and attribute3 then
								v28 = attribute2:ToWorldSpace(attribute3)
							else
								local isModel = attribute3 and parent:IsA("Model")
								v28 = nil

								if isModel then
									v28 = parent:GetPivot():ToWorldSpace(attribute3)
								end
							end

							if v28 then
								local part = tbl11[str4]

								if not part or not part.Parent then
									part = Instance.new("Part")
									part.Name = "BerryAnchor_" .. v27
									local vector = Vector3.new
									part.Size = Vector3.new(1.2, 1.2, 1.2)
									part.Transparency = 1
									part.CanCollide = false
									part.Anchored = true
									part.CFrame = v28
									part.Parent = quantumBerryAnchors
									tbl11[str4] = part
								else
									part.CFrame = v28
								end

								if part and not part:FindFirstChild("ESPquantumONYX") then
									local v29 = tbl10[v27] or color

									AddESP(part, v29, function()
										local character2 = v18.Character

										if character2 then
											character2 = character2:FindFirstChild("Head") or character2:FindFirstChild("HumanoidRootPart")
										end

										return string.format("Berry: <b><font color='rgb(%d,%d,%d)'>%s</font></b>\n<font color='rgb(220,220,220)'>%d studs</font>", v29.R * 255, v29.G * 255, v29.B * 255, v27, character2 and math.floor((character2.Position - part.Position).Magnitude) or 0)
									end, nil, nil, "Berry")
								end
							end
						end
					end
				end
			end
		end

		_vm_a_1 = _vm_a_0
		_vm_U_1 = _vm_U_0
		_vm___1 = _vm___0
		local v25, v26, v27 = pairs(tbl11)
		_vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v25, v26, v27)

		for k, v28 in v25, v26, v27 do
			if not tbl12[k] then
				if v28 and v28.Parent then
					pcall(function()
						v28:Destroy()
					end)
				end

				tbl11[k] = nil
			end
		end

		_vm_a_1 = _vm_a_0
		_vm_U_1 = _vm_U_0
		_vm___1 = _vm___0
		local v28 = next
		local children, v29 = v2:GetChildren()
		_vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v28, children, v29)

		for _, v30 in v28, children, v29 do
			local isTool = v30:IsA("Tool")

			if isTool and (tbl10[v30.Name] or v30.Name:find("Berry")) then
				local handle = v30:FindFirstChild("Handle") or v30:FindFirstChildWhichIsA("BasePart")

				if handle and not handle:FindFirstChild("ESPquantumONYX") then
					local v31 = tbl10[v30.Name] or color

					AddESP(handle, v31, function()
						local character2 = v18.Character

						if character2 then
							character2 = character2:FindFirstChild("Head") or character2:FindFirstChild("HumanoidRootPart")
						end

						return string.format("Dropped Berry: <b><font color='rgb(%d,%d,%d)'>%s</font></b>\n<font color='rgb(220,220,220)'>%d studs</font>", v31.R * 255, v31.G * 255, v31.B * 255, v30.Name, character2 and math.floor((character2.Position - handle.Position).Magnitude) or 0)
					end, nil, nil, "Berry")
				end
			end
		end

		_vm_a_1 = _vm_a_0
		_vm_U_1 = _vm_U_0
		_vm___1 = _vm___0
	end

	RealFruitESP = function()
		if not tbl.ESP_RealFruits then
			return
		end

		for _, v22 in next, { "PineappleSpawner", "AppleSpawner", "BananaSpawner" }, nil do
			local v23 = v2:FindFirstChild(v22)

			if v23 and not v23:FindFirstChild("ESPquantumONYX") then
				local str4 = v22:gsub("Spawner", "")

				local function fn24()
					local character2 = v18.Character

					if character2 then
						character2 = character2:FindFirstChild("Head") or character2:FindFirstChild("HumanoidRootPart")
					end

					return string.format("Natural Fruit: <b><font color='rgb(50,205,50)'>%s</font></b>\n<font color='rgb(220,220,220)'>%d studs</font>", str4, character2 and math.floor((character2.Position - v23.Position).Magnitude) or 0)
				end

				AddESP(v23, Color3.fromRGB(50, 205, 50), fn24, nil, nil, "RealFruit")
			end
		end

		local v22 = next
		local children, v23 = v2:GetChildren()

		for _, v24 in v22, children, v23 do
			if v24:IsA("Tool") and (v24.Name == "Pineapple" or v24.Name == "Apple" or v24.Name == "Banana") then
				local handle = v24:FindFirstChild("Handle") or v24

				if handle and handle:IsA("BasePart") and not handle:FindFirstChild("ESPquantumONYX") then
					local function fn24()
						local character2 = v18.Character

						if character2 then
							character2 = character2:FindFirstChild("Head") or character2:FindFirstChild("HumanoidRootPart")
						end

						return string.format("Natural Fruit: <b><font color='rgb(50,205,50)'>%s</font></b>\n<font color='rgb(220,220,220)'>%d studs</font>", v24.Name, character2 and math.floor((character2.Position - handle.Position).Magnitude) or 0)
					end

					AddESP(handle, Color3.fromRGB(50, 205, 50), fn24, nil, nil, "RealFruit")
				end
			end
		end
	end

	MyBoatESP = function()
		if not tbl.ESPMyBoat then
			ClearESP("MyBoat")
			return
		end
		local boats2 = v2:FindFirstChild("Boats")
		if not boats2 then
			return
		end

		for _, child in ipairs(boats2:GetChildren()) do
			local owner = child:FindFirstChild("Owner")
			local str4 = ""

			if owner then
				if typeof(owner.Value) == "Instance" then
					str4 = owner.Value.Name
				else
					str4 = tostring(owner.Value or "")
				end
			end

			if str4 == v18.Name or owner and owner.Value == v18 then
				local primaryPart = child.PrimaryPart or child:FindFirstChildWhichIsA("VehicleSeat") or child:FindFirstChildWhichIsA("BasePart")

				if primaryPart and not primaryPart:FindFirstChild("ESPquantumONYX") then
					local function fn24()
						local character2 = v18.Character

						if character2 then
							character2 = character2:FindFirstChild("Head") or character2:FindFirstChild("HumanoidRootPart")
						end

						local n2 = character2 and math.floor((character2.Position - primaryPart.Position).Magnitude) or 0
						local health = child:FindFirstChild("Health")
						return string.format("My Boat (%s)%s\n%d studs away", child.Name, health and string.format(" [%d HP]", health.Value) or "", n2)
					end

					AddESP(primaryPart, Color3.fromRGB(0, 255, 180), fn24, nil, nil, "MyBoat")
				end
			end
		end
	end

	local function fn24(arg, arg2)
		if not arg then
			return
		end
		local n2 = arg2 or 450
		local pivot = arg:GetPivot()

		if pivot.Position.Y < n2 - 10 then
			pcall(function()
				arg:PivotTo(CFrame.new(pivot.Position.X, n2, pivot.Position.Z))
			end)
		end

		local vehicleSeat = arg:FindFirstChildWhichIsA("VehicleSeat", true) or arg:FindFirstChild("VehicleSeat", true) or arg:FindFirstChildWhichIsA("Seat", true) or arg.PrimaryPart

		if vehicleSeat and vehicleSeat:IsA("BasePart") then
			local boatProtectBP = vehicleSeat:FindFirstChild("BoatProtectBP")

			if not boatProtectBP then
				local bodyPosition = Instance.new("BodyPosition")
				bodyPosition.Name = "BoatProtectBP"
				local vector = Vector3.new
				bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bodyPosition.P = 100000
				bodyPosition.D = 1000
				bodyPosition.Position = Vector3.new(pivot.Position.X, n2, pivot.Position.Z)
				bodyPosition.Parent = vehicleSeat
			else
				boatProtectBP.Position = Vector3.new(pivot.Position.X, n2, pivot.Position.Z)
			end

			local boatProtectBV = vehicleSeat:FindFirstChild("BoatProtectBV")

			if not boatProtectBV then
				local bodyVelocity = Instance.new("BodyVelocity")
				bodyVelocity.Name = "BoatProtectBV"
				local vector = Vector3.new
				bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
				bodyVelocity.Velocity = Vector3.zero
				bodyVelocity.P = 100000
				bodyVelocity.Parent = vehicleSeat
			else
				boatProtectBV.Velocity = Vector3.zero
			end
		end
	end

	local function fn25(arg)
		if not arg then
			return
		end

		pcall(function()
			for _, descendant in ipairs(arg:GetDescendants()) do
				if descendant.Name == "BoatProtectBP" or descendant.Name == "BoatProtectBV" then
					descendant:Destroy()
				end
			end
		end)
	end

	local function fn26(arg)
		if not (arg and arg.Character and arg.Character:FindFirstChild("HumanoidRootPart") and arg.Character:FindFirstChild("Humanoid")) then
			return false
		end
		local humanoidRootPart3 = arg.Character.HumanoidRootPart
		if arg.Character:FindFirstChild("ForceField") ~= nil then
			return true
		end

		for _, child in ipairs(v2:GetChildren()) do
			if child:IsA("BasePart") and (child.Name:find("SafeZone") or child.Name:find("PeaceZone")) then
				if (humanoidRootPart3.Position - child.Position).Magnitude < child.Size.Magnitude / 2 + 10 then
					return true
				end
			end
		end

		return false
	end

	fn14 = function()
		if not tbl.EnableAimbot and not tbl.Aimbot then
			name = nil
			v19 = nil
			return nil
		end

		if v19 then
			local character2 = v19.Character
			local humanoid2 = character2 and character2:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart3 = character2 and (character2:FindFirstChild("HumanoidRootPart") or character2.PrimaryPart)
			if character2 and character2.Parent and humanoid2 and humanoid2.Health > 0 and humanoidRootPart3 and not fn26(v19) then
				return v19
			end
			v19 = nil
			name = nil
		end

		local character2 = v18.Character

		if character2 then
			character2 = character2:FindFirstChild("HumanoidRootPart") or character2.PrimaryPart
		end

		if not character2 then
			return nil
		end
		local huge = math.huge
		local v22 = nil

		for _, player in ipairs(v3:GetPlayers()) do
			if player ~= v18 and player.Character and player.Character.Parent then
				local humanoid2 = player.Character:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart3 = player.Character:FindFirstChild("HumanoidRootPart")
				humanoidRootPart3 = humanoidRootPart3 or player.Character.PrimaryPart

				if humanoid2 and humanoid2.Health > 0 and humanoidRootPart3 and not fn26(player) then
					local magnitude = (humanoidRootPart3.Position - character2.Position).Magnitude

					if magnitude < huge then
						huge = magnitude
						v22 = player
					end
				end
			end
		end

		v19 = v22
		name = v22 and v22.Name or nil
		return v22
	end

	local function fn27(arg)
		if not arg then
			return false
		end

		if arg == v18 then
			return false
		end

		if not (arg.Character and arg.Character:FindFirstChild("HumanoidRootPart") and arg.Character:FindFirstChild("Humanoid") and arg.Character.Humanoid.Health > 0) then
			return false
		end

		if arg.Team and v18.Team and arg.Team == v18.Team then
			return false
		end
		return true
	end

	local tbl12 = {
		Fishman = CFrame.new(28224.057, 14889.427, -210.587),
		Human = CFrame.new(29237.295, 14889.427, -206.95),
		Cyborg = CFrame.new(28492, 14901, -426),
		Skypiea = CFrame.new(28967.408, 14918.075, 234.312),
		Ghoul = CFrame.new(28672.721, 14889.128, 454.596),
		Mink = CFrame.new(29020.66, 14889.427, -379.268),
	}

	local function fn28()
		local function fn29(arg, arg2)
			local huge = arg2 or math.huge
			local character2 = v18.Character
			local humanoidRootPart3 = character2 and (character2:FindFirstChild("HumanoidRootPart") or character2.PrimaryPart)
			if not humanoidRootPart3 then
				return nil
			end
			local position2 = humanoidRootPart3.Position
			local v22 = nil

			for _, child in ipairs(enemies:GetChildren()) do
				local humanoidRootPart4 = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart
				local humanoid2 = child:FindFirstChildOfClass("Humanoid")

				if humanoidRootPart4 and humanoid2 and humanoid2.Health > 0 then
					local magnitude = (position2 - humanoidRootPart4.Position).Magnitude

					if magnitude <= (tbl.checknearestdist or 500) and magnitude < huge then
						huge = magnitude
						v22 = child
					end
				end
			end

			return v22
		end

		local function fn30()
			local v22 = next
			local children, v23 = map["Boat Castle"].Summoner:FindFirstChild("Circle"):GetChildren()

			for _, v24 in v22, children, v23 do
				if v24 and v24.Name == "Part" and v24:FindFirstChild("Part") and v24.Part.BrickColor ~= BrickColor.new("Lime green") then
					return v24.Part
				end
			end
		end

		local tbl13 = { "roar", "slam", "spin", "bite", "charge", "breath", "beam", "laser", "smash" }
		local tbl14

		tbl14 = {
			CurrentQuest = nil,
			GetPvPTarget = fn14,
			GetNearest = tbl13,
			GetNearestPlayer = function()
				local character2 = v18.Character

				if character2 then
					character2 = character2:FindFirstChild("HumanoidRootPart") or character2.PrimaryPart
				end

				if not character2 then
					return nil
				end
				local position2 = character2.Position
				local huge = math.huge
				local v22 = nil

				for _, player in ipairs(v3:GetPlayers()) do
					if player ~= v18 and fn27(player) and player.Character and player.Character.Parent then
						local humanoid2 = player.Character:FindFirstChildOfClass("Humanoid")
						local humanoidRootPart3 = player.Character:FindFirstChild("HumanoidRootPart") or player.Character.PrimaryPart

						if humanoid2 and humanoid2.Health > 0 and humanoidRootPart3 and not fn26(player) then
							local magnitude = (humanoidRootPart3.Position - position2).Magnitude

							if magnitude < huge then
								huge = magnitude
								v22 = player
							end
						end
					end
				end

				return v22
			end,
			PlatesBartilo = function()
				local bartiloPlates = map.Dressrosa.BartiloPlates
				local brickColor = BrickColor.new("Sand yellow")
				local _vm___1 = 1

				for i = 1, 8 do
					if bartiloPlates["Plate" .. i].BrickColor == brickColor then
						return "Plate" .. i
					end
				end

				local _vm___0
				_vm___1 = _vm___0
			end,
			DetectChest = function()
				local huge = math.huge
				local v22 = nil

				for _, v23 in ipairs(v5:GetTagged("_ChestTagged")) do
					if v23:IsA("BasePart") and v23.Parent and v23:GetAttribute("IsDisabled") ~= true then
						local v24 = v18:DistanceFromCharacter(v23.Position)

						if v24 < huge then
							huge = v24
							v22 = v23
						end
					end
				end

				return v22
			end,
			GetRaidIslands = function()
				local locations = worldOrigin:WaitForChild("Locations")
				local _vm___1 = -1
				local _vm_U_1 = 1
				local _vm_a_1 = 5 - _vm___1

				for i = 5, 1, -1 do
					local str4 = "Island " .. i

					for _, child in ipairs(locations:GetChildren()) do
						if child.Name == str4 and child:IsA("Part") and (v18.Character.PrimaryPart.Position - child.Position).Magnitude < 3500 then
							return child
						end
					end
				end

				local _vm_a_0
				_vm_a_1 = _vm_a_0
				local _vm_U_0
				_vm_U_1 = _vm_U_0
				local _vm___0
				_vm___1 = _vm___0
			end,
			GetCurrentRaidIslandIndex = function(arg)
				local raidIslands = arg:GetRaidIslands()
				if raidIslands and raidIslands.Name:match("Island (%d+)") then
					return tonumber(raidIslands.Name:match("Island (%d+)"))
				end
				return nil
			end,
			GetDungeonProps = function(arg, arg2)
				if not arg2 then
					return nil
				end

				if not arg2:FindFirstChild("Props") then
					return nil
				end
				local v22 = next
				local children, v23 = arg2.Props:GetChildren()

				for _, v24 in v22, children, v23 do
					local flag4 = v24:GetAttribute("KitsuneMarkActive") == true
					if flag4 or v24:GetAttribute("Speed") == 5 then
						return v24
					end
				end

				return nil
			end,
			Checkelites = function()
				for _, v22 in pairs({ "Urban", "Deandre", "Diablo" }) do
					if utilities:CheckMon(v22) then
						return v22
					end
				end

				for _, v22 in pairs({ "Urban", "Deandre", "Diablo" }) do
					if VerifyQuest(v22) then
						return v22
					end
				end

				return nil
			end,
			DetectPirateRaid = function()
				local vector = Vector3.new

				for _, child in ipairs(v2.Enemies:GetChildren()) do
					local humanoidRootPart3 = child:FindFirstChild("HumanoidRootPart") or child.PrimaryPart
					local humanoid2 = child:FindFirstChildOfClass("Humanoid")
					if humanoidRootPart3 and humanoid2 and humanoid2.Health > 0 and (humanoidRootPart3.Position - Vector3.new(-5542, 314, -2971)).Magnitude <= 1200 and not string.find(child.Name:lower(), "indra") and not string.find(child.Name, "Boss") and child.Name ~= "Blank Buddy" then
						return child
					end
				end

				return nil
			end,
			PreventHappen = function()
				if utilities:Checkfruit() or utilities:CheckToolName("Microchip") or utilities:CheckToolName("Special Microchip") or utilities:CheckToolName("Fist of Darkness") or utilities:CheckToolName("God's Chalice") or v18.PlayerGui.Main.TopHUDList.RaidTimer.Visible or v18:GetAttribute("IslandRaiding") then
					return true
				end
				return false
			end,
			GetDungeonIslands = function()
				local dungeon = map:FindFirstChild("Dungeon")
				if not dungeon then
					return nil
				end
				local huge = math.huge
				local v22 = nil
				local n2 = 0
				local _vm___1 = 1

				for i = 1, 100 do
					local v23 = dungeon:FindFirstChild(tostring(i))

					if v23 then
						local magnitude = (humanoidRootPart.Position - v23:GetPivot().Position).Magnitude
						local extentsSize = v23:GetExtentsSize()

						if magnitude < math.max(extentsSize.X, extentsSize.Y, extentsSize.Z) / 2 + 100 and magnitude < huge then
							huge = magnitude
							v22 = v23
							n2 = i
						end
					end
				end

				local _vm___0
				_vm___1 = _vm___0
				if not v22 then
					return nil
				end

				if not dungeon:FindFirstChild(tostring(n2 + 1)) then
					return nil
				end

				if v22:FindFirstChild("ExitTeleporter") and v22.ExitTeleporter:FindFirstChild("Root") then
					return v22.ExitTeleporter.Root
				end
				return nil
			end,
			HazePosition = function()
				local questHaze = v18:FindFirstChild("QuestHaze")
				if not questHaze then
					return nil
				end
				local v22, v23, v24 = ipairs(questHaze:GetChildren())
				local huge = math.huge
				local position2 = nil
				local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v22, v23, v24)

				for _, v25 in v22, v23, v24 do
					if v25.Value > 0 then
						for _, child in pairs(enemies:GetChildren()) do
							if child:IsA("Model") and string.find(child.Name, v25.Name) and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("HazeESP") then
								local v26 = v18:DistanceFromCharacter(child.HumanoidRootPart.Position)

								if v26 < huge then
									position2 = child.HumanoidRootPart.Position
									huge = v26
								end
							end
						end

						if not position2 then
							for _, child in pairs(worldOrigin.EnemySpawns:GetChildren()) do
								if string.find(child.Name, v25.Name) then
									local v26 = v18:DistanceFromCharacter(child.Position)

									if v26 < huge then
										position2 = child.Position
										huge = v26
									end
								end
							end
						end
					end
				end

				local _vm_a_0
				_vm_a_1 = _vm_a_0
				local _vm_U_0
				local _vm_U_1 = _vm_U_0
				local _vm___0
				local _vm___1 = _vm___0
				return position2
			end,
			HazeMobs = function()
				local questHaze = v18:FindFirstChild("QuestHaze")
				if not questHaze then
					return nil
				end
				local v22, v23, v24 = ipairs(questHaze:GetChildren())
				local huge = math.huge
				local v25 = nil
				local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v22, v23, v24)

				for _, v26 in v22, v23, v24 do
					if v26.Value > 0 then
						for _, child in pairs(enemies:GetChildren()) do
							if child:IsA("Model") and string.find(child.Name, v26.Name) and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and child:FindFirstChild("HazeESP") and tbl6:IsReady(child) then
								local v27 = v18:DistanceFromCharacter(child.HumanoidRootPart.Position)

								if v27 < huge then
									huge = v27
									v25 = child
								end
							end
						end
					end
				end

				local _vm_a_0
				_vm_a_1 = _vm_a_0
				local _vm_U_0
				local _vm_U_1 = _vm_U_0
				local _vm___0
				local _vm___1 = _vm___0
				return v25
			end,
			GetPathButton = tbl13,
			GetPathFruit = function()
				local v22 = next
				local children, v23 = v2:GetChildren()

				for _, v24 in v22, children, v23 do
					if v24:IsA("Tool") or v24:IsA("Model") and string.find(v24.Name, "Fruit") then
						return v24
					end
				end
			end,
			CheckQuestStatus = function()
				local response = nil

				pcall(function()
					net:WaitForChild("RF/DragonHunter"):InvokeServer({ Context = "RequestQuest" })
				end)

				pcall(function()
					response = net:WaitForChild("RF/DragonHunter"):InvokeServer({ Context = "Check" })
				end)

				local str4 = nil
				local n2 = nil
				local flag4 = false
				local n3

				if response then
					str4 = nil
					n2 = nil
					n3 = nil

					if response.Text then
						local str5 = tostring(response.Text)

						if str5:find("Destroy") or str5:find("Tree") then
							n2 = tonumber(str5:match("%d+")) or 10
							str4 = "Tree"
							flag4 = true
							n3 = 2
						else
							local pos = str5:find("Defeat") or str5:find("Enforcer") or str5:find("Assailant") or str5:find("Venomous")
							str4 = nil
							n2 = nil
							n3 = nil

							if pos then
								n2 = tonumber(str5:match("%d+")) or 0
								str4 = nil
								local exitTo = nil

								for _, v22 in ipairs({ "Hydra Enforcer", "Venomous Assailant" }) do
									local pos2 = str5:find(v22)

									if pos2 or str5:find(v22:gsub(" ", "")) then
										exitTo = 1
										break
									else
										str4 = nil
									end
								end

								if exitTo == 1 then
									str4 = t4_1
								end

								flag4 = true
								n3 = 1

								if not str4 then
									if str5:find("Venomous") or str5:find("Assailant") then
										str4 = "Venomous Assailant"
									else
										str4 = "Hydra Enforcer"
									end
								end
							end
						end
					end
				end

				return flag4, str4, n2, n3
			end,
			TaskDone = function()
				local notifications = v18.PlayerGui:FindFirstChild("Notifications")

				if notifications then
					local v22 = next
					local children, v23 = notifications:GetChildren()
					local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v22, children, v23)

					for _, v24 in v22, children, v23 do
						local v25 = next
						local children2, v26 = v24:GetChildren()

						for _, v27 in v25, children2, v26 do
							if v27:IsA("TextLabel") and (string.find(v27.Text, "Task completed!") or string.find(v27.Text, "Head back to the Dojo")) then
								return true
							end
						end
					end

					local _vm_a_0
					_vm_a_1 = _vm_a_0
					local _vm_U_0
					local _vm_U_1 = _vm_U_0
					local _vm___0
					local _vm___1 = _vm___0
				end

				return false
			end,
			IsEntityAttacking = function(arg, arg2)
				if not arg2 or not arg2.Parent then
					return false
				end
				local humanoid2 = arg2:FindFirstChildOfClass("Humanoid") or arg2:FindFirstChildOfClass("AnimationController")
				humanoid2 = humanoid2 and humanoid2:FindFirstChildOfClass("Animator")
				if not humanoid2 then
					return false
				end
				local playingAnimationTracks = humanoid2:GetPlayingAnimationTracks()
				local v22, v23, v24 = ipairs(playingAnimationTracks)
				local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v22, v23, v24)

				for _, v25 in v22, v23, v24 do
					local isPlaying = v25.IsPlaying

					if isPlaying then
						isPlaying = (v25.WeightCurrent or 1) > 0.3
					end

					if isPlaying then
						local str4 = v25.Name:lower()
						local animation = v25.Animation
						animation = animation and animation.Name:lower() or ""

						for _, v26 in ipairs(tbl13) do
							if str4:find(v26) or animation:find(v26) then
								return true
							end
						end
					end
				end

				local _vm_a_0
				_vm_a_1 = _vm_a_0
				local _vm_U_0
				local _vm_U_1 = _vm_U_0
				local _vm___0
				local _vm___1 = _vm___0
				return false
			end,
			DodgeSeabeast = function()
				for _, child in ipairs(seaBeasts:GetChildren()) do
					if child:FindFirstChild("HumanoidRootPart") and tbl14:IsEntityAttacking(child) then
						return true
					end
				end

				for _, child in ipairs(worldOrigin:GetChildren()) do
					if child:IsA("BasePart") then
						local str4 = child.Name:lower()
						local pos = str4:find("lightbullet")
						local pos2 = pos or str4:find("waterbeam") or str4:find("beastroar")
						local flag4

						if pos2 then
							flag4 = pos2
						else
							flag4 = child.BrickColor == BrickColor.new("Toothpaste") and child.Size.Magnitude > 15
						end

						if flag4 then
							return true
						end
					end
				end

				for _, child in ipairs(v2:GetChildren()) do
					if child:IsA("BasePart") then
						local str4 = child.Name:lower()
						if str4:find("waterbeam") or str4:find("lightbullet") then
							return true
						end
					end
				end

				return false
			end,
			TerrorDodge = function()
				for _, child in ipairs(worldOrigin:GetChildren()) do
					local str4 = child.Name:lower()
					if str4:find("sharkslam") or str4:find("spin") or str4:find("chargemodel") then
						return true
					end
				end

				return false
			end,
		}

		local tbl15 = {
			["Sea Beast"] = "SeaBeast",
			["Terror Shark"] = "Terrorshark",
			Shark = "Shark",
			Piranha = "Piranha",
			["Fish Crew Member"] = "Fish Crew Member",
			["Pirate Brigade"] = "PirateBrigade",
			["Pirate Grand Brigade"] = "PirateGrandBrigade",
			["Ghost Ship"] = "FishBoat",
		}

		local tbl16 = {}

		tbl14.GetSeaEventTargets = function()
			local seaEventTargets = tbl.SeaEventTargets
			local v22 = clearNew(tbl16)
			if not seaEventTargets then
				return v22
			end

			if type(seaEventTargets) == "table" then
				for k, seaEventTarget in pairs(seaEventTargets) do
					if seaEventTarget == true then
						table.insert(v22, tbl15[k] or k)
					else
						if type(k) == "number" and type(seaEventTarget) == "string" then
							table.insert(v22, tbl15[seaEventTarget] or seaEventTarget)
						end
					end
				end
			elseif type(seaEventTargets) == "string" then
				table.insert(v22, tbl15[seaEventTargets] or seaEventTargets)
			end

			return v22
		end

		tbl14.TyrantEyes = function()
			local islandModel = map:FindFirstChild("TikiOutpost") and map.TikiOutpost:FindFirstChild("IslandModel")
			if not islandModel then
				return 0
			end
			local e = islandModel:FindFirstChild("IslandChunks") and islandModel.IslandChunks:FindFirstChild("E")
			local tbl17 = {}
			local eye1 = islandModel:FindFirstChild("Eye1")
			local eye2 = islandModel:FindFirstChild("Eye2")
			local eye3 = e:FindFirstChild("Eye3")
			local findFirstChild = e.FindFirstChild
			tbl17[1] = eye1
			tbl17[2] = eye2
			tbl17[3] = eye3

			do
				local values = table.pack(findFirstChild(e, "Eye4"))
				table.move(values, 1, values.n, 4, tbl17)
			end

			local n2 = 0

			for _, v22 in ipairs(tbl17) do
				v22 = v22 and v22.Transparency == 0

				if v22 then
					n2 += 1
				end
			end

			return n2
		end

		tbl14.CheckSeaLevel = function()
			local tbl17 = { "Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Infinite" }

			local tbl18 = {
				["Level 1"] = CFrame.new(-21998.375, 30.0006, -682.309),
				["Level 2"] = CFrame.new(-26779.5215, 30.0005, -822.858),
				["Level 3"] = CFrame.new(-31171.957, 30.0001, -2256.9377),
				["Level 4"] = CFrame.new(-34054.6875, 30.2187, -2560.1201),
				["Level 5"] = CFrame.new(-38887.5547, 30.0004, -2162.9902),
				["Level 6"] = CFrame.new(-44541.7617, 30.0003, -1244.8584),
				Infinite = CFrame.new(-10000000, 31, 37016.25),
			}

			local seaLevelSelected = tbl.SeaLevelSelected

			if typeof(seaLevelSelected) == "number" then
				seaLevelSelected = tbl17[seaLevelSelected] or "Level 6"
			end

			return tbl18[seaLevelSelected] or tbl18["Level 6"] or tbl18["Level 1"]
		end

		tbl14.CheckBerries = function()
			local v22 = next
			local tagged, v23 = v5:GetTagged("BerryBush")
			local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v22, tagged, v23)

			for _, v24 in v22, tagged, v23 do
				for k, v25 in pairs(v24:GetAttributes()) do
					if k:sub(1, 12) == "_BerryCFrame" and type(v25) == "string" and #v25 > 0 then
						return true
					end
				end

				for _, child in ipairs(v24:GetChildren()) do
					if child:IsA("Model") or child:IsA("BasePart") then
						return true
					end
				end
			end

			local _vm_a_0
			_vm_a_1 = _vm_a_0
			local _vm_U_0
			local _vm_U_1 = _vm_U_0
			local _vm___0
			local _vm___1 = _vm___0
			return false
		end

		return tbl14
	end

	tbl6.GameData = fn28()
	local gameData = tbl6.GameData

	local function fn29()
		local tbl13 = { Attack = function(arg, arg2, arg3)
			if not arg2 then
				return
			end

			if not character then
				return
			end
			local humanoid2 = arg2:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart3 = arg2:FindFirstChild("HumanoidRootPart") or arg2.PrimaryPart
			if not humanoidRootPart3 then
				return
			end

			if arg2:IsDescendantOf(v2) and humanoid2 and humanoid2.Health <= 0 then
				return
			end
			tweenManager:topos(utilities:GetFarmCFrame(humanoidRootPart3), true)

			if arg2:IsDescendantOf(v2) then
				if tbl.MasteryFarm then
					if humanoid2 and humanoid2.Health / humanoid2.MaxHealth > tbl.HealthMob / 100 then
						humanoidRootPart2 = nil
						utilities:EquipWeapon()
					else
						humanoidRootPart2 = humanoidRootPart3
						fn16()
						humanoidRootPart2 = nil
					end
				else
					humanoidRootPart2 = nil

					if tbl.AutoMasterySwords then
						utilities:EquipWeapon("Sword")
					else
						utilities:EquipWeapon()
					end
				end

				utilities:AutoHaki()

				if arg3 ~= false and tbl.BringMonster then
					utilities:BringEnemies(arg2)
				end
			end
		end }

		local n2 = 0

		BuyBoatSafe = function(arg, arg2)
			local flag4 = not arg2
			if flag4 and tick() - n2 < 3 then
				return
			end
			local boats2 = v2:FindFirstChild("Boats")

			if flag4 and boats2 then
				for _, child in ipairs(boats2:GetChildren()) do
					local owner = child:FindFirstChild("Owner")

					if owner then
						if owner.Value == v18 or typeof(owner.Value) == "Instance" and owner.Value.Name == v18.Name or tostring(owner.Value) == v18.Name then
							local humanoid2 = child:FindFirstChild("Humanoid") or child:FindFirstChildOfClass("Humanoid")

							if not (humanoid2 and (humanoid2.Value == 0 or humanoid2:IsA("Humanoid") and humanoid2.Health <= 0) or child:GetAttribute("Dead") == true or child:GetAttribute("Sunk") == true) and child:IsDescendantOf(v2) then
								local vehicleSeat = child:FindFirstChildWhichIsA("VehicleSeat", true) or child:FindFirstChild("VehicleSeat", true) or child:FindFirstChildWhichIsA("BasePart")
								if vehicleSeat and vehicleSeat.Position.Y > -15 then
									return
								end
								continue
							end
						end
					end
				end
			end

			local flag5 = string.find(v18 and v18.Team and tostring(v18.Team) or "Pirates", "Marine") ~= nil
			local str4 = arg

			if typeof(str4) == "number" and Data and Data.BoatsList then
				str4 = Data.BoatsList[str4]
			elseif not str4 or str4 == "" then
				str4 = flag3 and "Beast Hunter" or "PirateBrigade"
			end

			if flag5 then
				if str4 == "PirateSloop" or str4 == "Sloop" then
					str4 = "MarineSloop"
				elseif str4 == "PirateBrigade" or str4 == "Brigade" then
					str4 = "MarineBrigade"
				elseif str4 == "PirateGrandBrigade" or str4 == "Grand Brigade" then
					str4 = "MarineGrandBrigade"
				end
			elseif str4 == "MarineSloop" or str4 == "Sloop" then
				str4 = "PirateSloop"
			elseif str4 == "MarineBrigade" or str4 == "Brigade" then
				str4 = "PirateBrigade"
			elseif str4 == "MarineGrandBrigade" or str4 == "Grand Brigade" then
				str4 = "PirateGrandBrigade"
			end

			local v22 = GetSelectedBoat()

			if v22 then
				pcall(function()
					v22:Destroy()
				end)
			end

			n2 = tick()

			local function fn30()
				tbl6:FireInvoke("BuyBoat", str4)
			end

			pcall(fn30)
		end

		tbl13.AutoBoatSail = function(arg, arg2)
			local v22 = GetSelectedBoat()

			if not v22 or tbl.AutoBuyNewBoatWhendies and humanoid.Health <= 0 then
				if fn7() > 1 and tbl.AutoBuyNewBoatWhendies and humanoid.Health <= 0 then
					if utilities:GetDistance(CFrame.new(-16927.451, 9.086, 433.864)) <= 12 then
						tbl6:FireInvoke("BuyBoat", tbl.BoatSelected)
					else
						tweenManager:topos(CFrame.new(-16927.451, 9.086, 433.864))
					end
				end

				tweenManager:StopBoatTween()

				if flag2 then
					if utilities:GetDistance(CFrame.new(-5330, 5, -714)) <= 12 then
						tbl6:FireInvoke("BuyBoat", tbl.BoatSelected)
					else
						tweenManager:topos(CFrame.new(-5330, 5, -714))
					end
				elseif flag3 then
					if fn7() > 1 and tbl.ResetPlayerdestroyboat then
						v18.Character.Head:Destroy()
					elseif utilities:GetDistance(CFrame.new(-16927.451, 9.086, 433.864)) <= 12 then
						tbl6:FireInvoke("BuyBoat", tbl.BoatSelected)
					else
						tweenManager:topos(CFrame.new(-16927.451, 9.086, 433.864))
					end
				end

				return
			end

			if not humanoid.Sit then
				tweenManager:StopBoatTween()
				local vehicleSeat = v22:FindFirstChild("VehicleSeat")

				if vehicleSeat and v22.Humanoid.Value ~= 0 then
					tweenManager:topos(vehicleSeat.CFrame * CFrame.new(0, 3, 0))
					task.wait(0.5)
				end

				return
			end

			tweenManager:toposboat(arg2 or gameData:CheckSeaLevel())
		end

		tbl13.AttackTree = function()
			local eagleBossArena = map:FindFirstChild("TikiOutpost") and map.TikiOutpost:FindFirstChild("IslandModel") and map.TikiOutpost.IslandModel:FindFirstChild("IslandChunks") and map.TikiOutpost.IslandModel.IslandChunks:FindFirstChild("D") and map.TikiOutpost.IslandModel.IslandChunks.D:FindFirstChild("EagleBossArena")
			if not eagleBossArena then
				return
			end
			local exitTo = nil
			local position2

			for _, child in ipairs(eagleBossArena:GetChildren()) do
				if child.Name == "Tree" and child:IsA("Model") and child:FindFirstChild("Group") then
					local v22 = child.Group:GetChildren()[1]

					if v22 then
						position2 = v22.CFrame.Position
						tweenManager:topos(v22.CFrame * CFrame.new(0, 15, 0))
						if v18:DistanceFromCharacter(position2) <= 75 then
							exitTo = 1
							break
						end
					end
				end
			end

			if exitTo == 1 then
				if tbl.ShootGunTyrant then
					local selectGunTyrant = tbl.SelectGunTyrant or "Skull Guitar"

					if not v18.Character:FindFirstChild(selectGunTyrant) then
						local skullGuitar = v18.Backpack:FindFirstChild(selectGunTyrant) or v18.Backpack:FindFirstChild("Skull Guitar")

						if skullGuitar and v18.Character:FindFirstChild("Humanoid") then
							v18.Character.Humanoid:EquipTool(skullGuitar)
						else
							tbl6:FireInvoke("LoadItem", selectGunTyrant)
						end

						task.wait(0.2)
					end

					utilities:EquipWeapon("Gun")
					task.wait(0.15)
					customShoot(position2)
					local tool = v18.Character:FindFirstChildOfClass("Tool")

					if tool and tool:FindFirstChild("RemoteEvent") then
						pcall(function()
							tool.RemoteEvent:FireServer("TAP", position2)
						end)
					end
				else
					position = position2
					fn16()
					position = nil
				end
			end
		end

		return tbl13
	end

	tbl6.SubFunction = fn29()
	local subFunction = tbl6.SubFunction
	tbl6.Functions = tbl6.Functions or {}
	tbl6.Loops = tbl6.Loops or {}
	tbl6.FunctionList = tbl6.FunctionList or {}
	tbl6.ActiveFunction = tbl6.ActiveFunction or nil
	tbl6.FunctionDisplayNames = tbl6.FunctionDisplayNames or {}

	local tbl13 = {
		"AutoFactoryRaid",
		"AutoFarmPirateRaid",
		"AutoSoulReaper",
		"AutoTaskEliteHunter",
		"Tweenfruit",
		"AutoBerrySafe",
	}

	tbl6.IsMultiFunction = function(arg)
		for _, v22 in ipairs(tbl13) do
			if v22 == arg then
				return true
			end
		end

		return false
	end

	tbl6.GetEnabledFunctionNames = function()
		local tbl14 = {}

		if tbl6.FunctionList then
			for _, v22 in ipairs(tbl6.FunctionList) do
				if tbl and tbl[v22.Name] then
					table.insert(tbl14, v22.Name)
				end
			end
		end

		return tbl14
	end

	local tbl14 = {
		Greybeard = "Greybeard",
		Darkbeard = "Darkbeard",
		["Cursed Captain"] = "CursedCaptain",
		["rip_indra True Form"] = "Ripindra",
		["Soul Reaper"] = "SoulReaper",
		["Cake Prince"] = "CakePrince",
		["Dough King"] = "DoughKing",
		["Tyrant of the Skies"] = "Tyrant",
	}

	local bossHopNames = {
		"Greybeard",
		"Darkbeard",
		"Cursed Captain",
		"rip_indra True Form",
		"Soul Reaper",
		"Cake Prince",
		"Dough King",
		"Tyrant of the Skies",
	}

	tbl6.LoadLibrary = function()
		if not lua4 or not lua4.CreateWindow then
			lua4 = fn6("dev/testers.lua")
		end

		if not lua4 or not lua4.CreateWindow then
			warn("[OnionHub ERROR] Critical: UI Library failed to load!")
			return
		end

		OnionCreatingInterface = true
		local v22 = lua4:CreateWindow({
			Title = "Onion",
			Subtitle = "Blox Fruit",
			Version = "v1.1 Integrated",
			Key = false,
			Theme = "Aqua",
			Credits = {
				{ Name = "Vin ", Role = "ServerOwner" },
				{ Name = "Flazhy ", Role = "MainDeveloper" },
				{ Name = "Kiel ", Role = "WebDesigner" },
				{ Name = "CudalPH ", Role = "Tester" },
				{ Name = "Pierce ", Role = "Support" },
			},
			SaveFile = "OnionHub_BloxFruits",
		})

		OnionCreatingInterface = false
		local tbl15 = {
			Home = v22:AddTab("Home", "home-quantum"),
			Sub = v22:AddTab("Sub Farm", "swords-quantum"),
			Sevent = v22:AddTab("Sea Event", "ship-quantum"),
			Player = v22:AddTab("Player", "user-quantum"),
			Dragon = v22:AddTab("Dragon Update", "visual-quantum"),
			Raid = v22:AddTab("Dungeon", "raid-quantum"),
			Trial = v22:AddTab("Trials", "rabbit-quantum"),
			Travel = v22:AddTab("Travel", "map-quantum"),
			Shop = v22:AddTab("Tiktok Shop", "cart-quantum"),
			Misc = v22:AddTab("Misc", "misc-quantum"),
			Web = v22:AddTab("Webhook", "cat-quantum"),
		}

		local function fn30(arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
			arg7 = arg7 or {}

			if arg7.global then
				tbl[arg4] = arg5
			end

			local flag4 = arg7.save ~= false and arg4 or nil

			local function fn31(arg9)
				if arg7.global then
					tbl[arg4] = arg9
				end

				tbl[arg4] = arg9

				if type(arg7.callback) == "function" then
					arg7.callback(arg9)
				end
			end

			return arg2:addDropdown(arg3, arg5, arg6, fn31, arg7.locked, arg8, flag4)
		end

		local tbl16 = {
			CreateToggle = function(arg, arg2, arg3, arg4, arg5, arg6)
				local tbl16 = arg6 or {}

				if tbl16.global then
					tbl[arg4] = arg5
				end

				tbl6.FunctionDisplayNames = tbl6.FunctionDisplayNames or {}
				tbl6.FunctionDisplayNames[arg4] = arg3
				tbl6.Toggles = tbl6.Toggles or {}
				local flag4 = tbl16.save ~= false and arg4 or nil

				local v23 = arg2:addToggle(arg3, arg5, function(arg7)
					if tbl16.global then
						tbl[arg4] = arg7
					end

					tbl[arg4] = arg7

					if arg7 then
						if tbl6.Functions and tbl6.Functions[arg4] and tbl6.Functions[arg4].Start then
							tbl6.Functions[arg4].Start()
						end

						if tbl6.Loops and tbl6.Loops[arg4] and tbl6.Loops[arg4].Start then
							tbl6.Loops[arg4].Start()
						end
					else
						if tbl6.Functions and tbl6.Functions[arg4] and tbl6.Functions[arg4].Stop then
							tbl6.Functions[arg4].Stop()
						elseif tbl6.Functions and tbl6.Functions[arg4] then
							tbl6.Functions[arg4].Running = false
						end

						if tbl6.Loops and tbl6.Loops[arg4] and tbl6.Loops[arg4].Stop then
							tbl6.Loops[arg4].Stop()
						elseif tbl6.Loops and tbl6.Loops[arg4] then
							tbl6.Loops[arg4].Running = false
						end

						if tbl6.ActiveFunction == arg4 then
							tbl6.ActiveFunction = nil
						end

						if tbl16.stop ~= false then
							if tweenManager and tweenManager.StopTween then
								tweenManager:StopTween()
							end

							if not (tbl.AutoSharkAnchor or tbl.AutoFindLeviatan or tbl.AutoSailbacktoTiki or tbl.AutoSail) then
								if tweenManager and tweenManager.StopBoatTween then
									tweenManager:StopBoatTween()
								end
							end
						end
					end

					if type(tbl16.callback) == "function" then
						tbl16.callback(arg7)
					end
				end, tbl16.locked, tbl16.description, flag4)

				if arg4 then
					tbl6.Toggles[arg4] = v23
				end

				return v23
			end,
			CreateDropdown = fn30,
			CreateSlider = function(arg, arg2, arg3, arg4, arg5, arg6, arg7, arg8)
				local tbl16 = arg8 or {}

				if tbl16.global then
					tbl[arg4] = arg7
				end

				local flag4 = tbl16.save ~= false and arg4 or nil

				local function fn31(arg9)
					if tbl16.global then
						tbl[arg4] = arg9
					end

					tbl[arg4] = arg9

					if type(tbl16.callback) == "function" then
						tbl16.callback(arg9)
					end
				end

				return arg2:addSlider(arg3, arg5, arg6, arg7, fn31, tbl16.locked, tbl16.step, flag4)
			end,
			CreateTextbox = function(arg, arg2, arg3, arg4, arg5)
				local tbl16 = arg5 or {}

				if tbl16.global then
					tbl[arg4] = tbl16.default or ""
				end

				local flag4 = tbl16.save ~= false and arg4 or nil

				local function fn31(arg6)
					if tbl16.global then
						tbl[arg4] = arg6
					end

					tbl[arg4] = arg6

					if type(tbl16.callback) == "function" then
						tbl16.callback(arg6)
					end
				end

				return arg2:addTextbox(arg3, fn31, tbl16.confirmText, flag4)
			end,
		}

		local tbl17 = {}

		if flag then
			tbl17.Materials = { "Leather + Scrap Metal", "Angel Wings", "Magma Ore", "Fish Tail" }

			tbl17.BossNames = {
				"The Gorilla King",
				"Chief",
				"Yeti",
				"Vice Admiral",
				"Warden",
				"Chief Warden",
				"Swan",
				"Magma Admiral",
				"Fishman Lord",
				"Wysper",
				"Thunder God",
				"Cyborg",
				"Saw",
			}
		elseif flag2 then
			tbl17.Materials = {
				"Leather + Scrap Metal",
				"Radioactive Material",
				"Ectoplasm",
				"Mystic Droplet",
				"Magma Ore",
				"Vampire Fang",
			}

			tbl17.BossNames = {
				"Diamond",
				"Jeremy",
				"Orbitus",
				"Smoke Admiral",
				"Awakened Ice Admiral",
				"Tide Keeper",
				"Don Swan",
			}
		elseif flag3 then
			tbl17.Materials = {
				"Leather + Scrap Metal",
				"Demonic Wisp",
				"Conjured Cocoa",
				"Dragon Scale",
				"Gunpowder",
				"Fish Tail",
				"Mini Tusk",
				"Nightmare Catcher",
			}

			tbl17.BossNames = { "Stone", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate", "Cake Queen" }
		else
			tbl17.Materials = { "walang kayo" }
			tbl17.BossNames = {}
		end

		tbl17.BoatsList = {
			"Dinghy",
			"PirateSloop",
			"PirateBrigade",
			"PirateGrandBrigade",
			"MarineSloop",
			"MarineBrigade",
			"MarineGrandBrigade",
			"Beast Hunter",
			"Lantern",
			"Guardian",
			"Grand Brigade",
			"Sloop",
			"The Sentinel",
		}

		tbl17.ZoneList = { "Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Infinite" }

		tbl17.SeaEventTargets = {
			"Terror Shark",
			"Sea Beast",
			"Shark",
			"Piranha",
			"Fish Crew Member",
			"Pirate Brigade",
			"Pirate Grand Brigade",
			"Ghost Ship",
		}

		tbl17.RodsList = {
			"Fishing Rod",
			"Gold Rod",
			"Shark Rod",
			"Shell Rod",
			"Treasure Rod",
			"Shark (Corrupted)",
			"Shell (Celestial)",
		}

		tbl17.BaitsList = {
			"Basic Bait",
			"Kelp Bait",
			"Good Bait",
			"Abyssal Bait",
			"Frozen Bait",
			"Epic Bait",
			"Carnivore Bait",
		}

		local raidsChip = {}

		pcall(function()
			local Raids = require(v4.Raids)

			for _, raid in pairs(Raids.raids) do
				table.insert(raidsChip, raid)
			end

			for _, advancedRaid in pairs(Raids.advancedRaids) do
				table.insert(raidsChip, advancedRaid)
			end
		end)

		tbl17.Raids_Chip = raidsChip

		tbl17.DungeonCards = {
			"Hyper",
			"Overflow",
			"Fortress",
			"Shadow",
			"Sniper",
			"Lifesteal",
			"Unbreakable",
			"Health",
			"Defense",
			"Armor",
			"Melee",
			"Sword",
			"Fruit",
			"Gun",
		}

		tbl17.TrainMethods = { "Bones", "Cakes" }
		local str4 = flag and "Sea 1" or flag2 and "Sea 2" or flag3 and "Sea 3" or nil
		tbl17.ActiveIslands = str4 and islands[str4] or {}
		local islandsList = {}
		local v23 = next
		local activeIslands = tbl17.ActiveIslands
		local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v23, activeIslands, nil)

		for k in v23, activeIslands, nil do
			table.insert(islandsList, k)
		end

		local _vm_a_0
		_vm_a_1 = _vm_a_0
		local _vm_U_0
		local _vm_U_1 = _vm_U_0
		local _vm___0
		local _vm___1 = _vm___0
		tbl17.IslandsList = islandsList
		local npcList = {}
		local tbl18 = { "Quest", "Boat", "Home" }
		local v24 = next
		local children, v25 = v4.NPCs:GetChildren()
		_vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v24, children, v25)

		for _, v26 in v24, children, v25 do
			local str5 = v26.Name:lower()
			local flag4 = false
			local exitTo = nil

			for _, v27 in next, tbl18, nil do
				if str5:find(v27:lower(), 1, true) then
					exitTo = 1
					break
				end
			end

			if exitTo == 1 then
				flag4 = true
			end

			if not flag4 then
				table.insert(npcList, v26.Name)
			end
		end

		_vm_a_1 = _vm_a_0
		_vm_U_1 = _vm_U_0
		_vm___1 = _vm___0
		tbl17.NPCList = npcList
		tbl17.LegendarySwordNames = { "Shizu", "Oroshi", "Saishi" }
		tbl17.BossHopNames = bossHopNames

		local function fn31(arg)
			local tbl19 = {}
			local v26 = pairs
			local tbl20 = arg or {}

			for k in v26(tbl20) do
				table.insert(tbl19, k)
			end

			return tbl19
		end

		tbl17.MeleeNames = fn31(melees)
		tbl17.AbilityNames = fn31(itemsToBuy and itemsToBuy.Ability)
		tbl17.GunNames = fn31(itemsToBuy and itemsToBuy.Gun)
		tbl17.AccessoryNames = fn31(itemsToBuy and itemsToBuy.Accessory)

		tbl17.DealerFruitList = {
			"Rocket-Rocket",
			"Spin-Spin",
			"Blade-Blade",
			"Spring-Spring",
			"Bomb-Bomb",
			"Smoke-Smoke",
			"Spike-Spike",
			"Flame-Flame",
			"Ice-Ice",
			"Sand-Sand",
			"Dark-Dark",
			"Eagle-Eagle",
			"Diamond-Diamond",
			"Light-Light",
			"Rubber-Rubber",
			"Ghost-Ghost",
			"Magma-Magma",
			"Quake-Quake",
			"Buddha-Buddha",
			"Love-Love",
			"Creation-Creation",
			"Spider-Spider",
			"Sound-Sound",
			"Phoenix-Phoenix",
			"Portal-Portal",
			"Lightning-Lightning",
			"Pain-Pain",
			"Blizzard-Blizzard",
			"Gravity-Gravity",
			"Mammoth-Mammoth",
			"T-Rex-T-Rex",
			"Dough-Dough",
			"Shadow-Shadow",
			"Venom-Venom",
			"Gas-Gas",
			"Spirit-Spirit",
			"Tiger-Tiger",
			"Yeti-Yeti",
			"Kitsune-Kitsune",
			"Control-Control",
			"Dragon-Dragon",
		}

		local function fn32()
			if lua2 and lua2.GiveDivineArt then
				lua2:GiveDivineArt()
			end
		end

		local tbl19 = { Label = "Give Divine Art", Callback = fn32 }

		local function fn33()
			if lua2 and lua2.GiveBlackBlast then
				lua2:GiveBlackBlast()
			end
		end

		tbl17.AdminPanelGrid = {
			{
				Label = "Teleport Tool",
				Callback = function()
					local mouse = v18:GetMouse()
					local teleportTool = v18.Backpack:FindFirstChild("Teleport Tool") or v18.Character and v18.Character:FindFirstChild("Teleport Tool")

					if teleportTool then
						teleportTool:Destroy()
					end

					local tool = Instance.new("Tool")
					tool.RequiresHandle = false
					tool.CanBeDropped = false
					tool.Name = "Teleport Tool"
					tool:SetAttribute("ItemId", 1173)
					tool.ToolTip = "Tool"

					tool.Activated:Connect(function()
						local character2 = v18.Character
						character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

						if character2 and mouse and mouse.Hit then
							local position2 = mouse.Hit.Position
							local vector = Vector3.new
							local n2 = position2 + Vector3.new(0, 3.5, 0)
							character2.CFrame = CFrame.new(n2, n2 + character2.CFrame.LookVector)
						end
					end)

					tool.Parent = v18.Backpack
				end,
			},
			{
				Label = "Summon Heaven Dimension",
				Callback = function()
					if lua2 and lua2.SummonIsland then
						lua2:SummonIsland("Heaven Dimension")
					end
				end,
			},
			{
				Label = "Summon Pakistan Dimension",
				Callback = function()
					if lua2 and lua2.SummonIsland then
						lua2:SummonIsland("Pakistan Dimension")
					end
				end,
			},
			{
				Label = "Summon Red Legion Hideout",
				Callback = function()
					if lua2 and lua2.SummonIsland then
						lua2:SummonIsland("Red Legion Hideout")
					end
				end,
			},
			{
				Label = "Summon Rip Family Arena",
				Callback = function()
					if lua2 and lua2.SummonIsland then
						lua2:SummonIsland("Rip Family Arena")
					end
				end,
			},
			{
				Label = "Summon Pocket Dimension",
				Callback = function()
					if lua2 and lua2.SummonIsland then
						lua2:SummonIsland("Pocket Dimension")
					end
				end,
			},
			{
				Label = "Summon Rip Family Hideout",
				Callback = function()
					if lua2 and lua2.SummonIsland then
						lua2:SummonIsland("Rip Family Hideout")
					end
				end,
			},
			{
				Label = "Give Triple DarkBlade",
				Callback = function()
					if lua2 and lua2.GiveDarkBlade then
						lua2:GiveDarkBlade()
					end
				end,
			},
			{
				Label = "Give Celestial Art",
				Callback = function()
					if lua2 and lua2.GiveCelestialArt then
						lua2:GiveCelestialArt()
					end
				end,
			},
			tbl19,
			{
				Label = "Give Tensei",
				Callback = function()
					if lua2 and lua2.GiveTensei then
						lua2:GiveTensei()
					end
				end,
			},
			{
				Label = "Give All Kamui Tools",
				Callback = function()
					if lua2 and lua2.GiveAllKamuis then
						lua2:GiveAllKamuis()
					end
				end,
			},
			{
				Label = "Rain Fruit New",
				Callback = function()
					if lua2 and lua2.GiveFruitRain then
						lua2:GiveFruitRain()
					end
				end,
			},
			{ Label = "Give Black Blast", Callback = fn33 },
			{
				Label = "Give Black Nuke",
				Callback = function()
					if lua2 and lua2.GiveBlackNuke then
						lua2:GiveBlackNuke()
					end
				end,
			},
			{
				Label = "Give Rogue Fruit",
				Callback = function()
					if lua2 and lua2.GiveRougeFruit then
						lua2:GiveRougeFruit()
					end
				end,
			},
		}

		local thread = nil

		local tbl20 = {
			OnAutoLoadScript = function()
				if tbl.AutoLoadScriptonLoad then
                    if not OnionConfig.ReloadURL or OnionConfig.ReloadURL == "" then
                        tbl6:SendNotify("OnionHub", "Set OnionHubConfig.ReloadURL to your hosted main.lua before enabling auto reload.", 6)
                        return
                    end
                    local str5 = string.format("getgenv().Team = %q; loadstring(game:HttpGet(%q))()", tbl.TeamSelectLoad or "Pirates", OnionConfig.ReloadURL)

					if not pcall(function()
						syn.queue_on_teleport(str5)
					end) then
						pcall(function()
							queue_on_teleport(str5)
						end)
					end
				end
			end,
			ToggleDamageCounter = function(arg)
				pcall(function()
					v4.Assets.GUI.DamageCounter.Enabled = not arg
				end)
			end,
			ToggleNotifications = function(arg)
				pcall(function()
					v18.PlayerGui.Notifications.Enabled = not arg
				end)
			end,
			ToggleWalkInWater = function(water)
				tbl.Water = water

				if water then
					if thread then
						task.cancel(thread)
						thread = nil
					end

					thread = task.spawn(function()
						local map2 = v2:FindFirstChild("Map") or v2:WaitForChild("Map", 5)

						if map2 then
							map2 = map2:FindFirstChild("WaterBase-Plane") or map2:WaitForChild("WaterBase-Plane", 5)
						end

						while tbl.Water do
							if map2 then
								local vector = Vector3.new
								map2.Size = Vector3.new(1000, 113, 1000)
							end

							task.wait(0.5)
						end

						if map2 then
							local vector = Vector3.new
							map2.Size = Vector3.new(1000, 80, 1000)
						end
					end)
				end
			end,
		}

		local now = os.time()

		tbl20.OnAutoHop30Mins = function(arg)
			if not arg then
				return
			end

			if os.time() - now >= 1800 then
				if tbl6 and tbl6.SendNotify then
					tbl6:SendNotify("Server Hop", "30 minutes elapsed. Hopping to a new server...", 4)
				end

				utilities:ServerHop()
			else
				local n2 = 1800 - os.time() - now
				warn(("[AutoHop] Wait %dm %ds"):format(math.floor(n2 / 60), n2 % 60))
			end
		end

		local thread2 = nil

		local tbl21 = {
			"red_game43",
			"rip_indra",
			"Axiore",
			"Polkster",
			"wenlocktoad",
			"Daigrock",
			"toilamvidamme",
			"oofficialnoobie",
			"Uzoth",
			"Azarth",
			"arlthmetic",
			"Death_King",
			"Lunoven",
			"TheGreateAced",
			"rip_fud",
			"drip_mama",
			"layandikit12",
			"Hingoi",
		}

		local function toggleHopAdmin(hopWhenAdmin)
			tbl.HopWhenAdmin = hopWhenAdmin

			if hopWhenAdmin then
				if thread2 then
					task.cancel(thread2)
					thread2 = nil
				end

				thread2 = task.spawn(function()
					while tbl.HopWhenAdmin do
						task.wait(1.5)
						local exitTo = nil

						for _, player in ipairs(v3:GetPlayers()) do
							if table.find(tbl21, player.Name) then
								exitTo = 1
								break
							end
						end

						if exitTo == 1 then
							if tbl6 and tbl6.SendNotify then
								tbl6:SendNotify("Server Hop", "Admin detected (" .. u4.Name .. ")! Hopping...", 5)
							end

							utilities:ServerHop(0)
						end
					end
				end)
			end
		end

		tbl20.ToggleHopAdmin = toggleHopAdmin
		local thread3 = nil

		tbl20.ToggleAntiAFK = function(antiAFK)
			tbl.AntiAFK = antiAFK

			if antiAFK then
				if thread3 then
					task.cancel(thread3)
					thread3 = nil
				end

				thread3 = task.spawn(function()
					while tbl.AntiAFK do
						if v17 then
							pcall(function()
								v17:CaptureController()
								local v26 = v17
								local clickButton1 = v26.ClickButton1
								local vector2 = Vector2.new
								clickButton1(v26, Vector2.new(0, 0))
							end)
						end

						task.wait(300)
					end
				end)
			end
		end

		tbl20.RemoveEffects = function()
			if RemoveEffects then
				RemoveEffects()()
			end
		end

		local function bribeLeviathan()
			tbl6:FireInvoke("InfoLeviathan", "2")
		end

		tbl20.BribeLeviathan = bribeLeviathan

		tbl20.GetAllBoats = function()
			local tbl22 = { "My Boat" }

			if v2:FindFirstChild("Boats") then
				for _, child in ipairs(v2.Boats:GetChildren()) do
					if child.Name ~= "Boat" and not table.find(tbl22, child.Name) then
						table.insert(tbl22, child.Name)
					end
				end
			end

			return tbl22
		end

		tbl20.BuyNewBoat = function()
			local boatSelected = tbl.BoatSelected
			local str5 = typeof(boatSelected) == "number" and tbl17.BoatsList[boatSelected] or typeof(boatSelected) == "string" and boatSelected ~= "" and boatSelected or flag3 and "Beast Hunter" or "PirateBrigade"
			local cframe = GetNearestBoatDealerCF and GetNearestBoatDealerCF()

			if not cframe then
				cframe = flag3 and CFrame.new(-16927.451, 9.086, 433.864) or flag2 and CFrame.new(-5330, 5, -714) or CFrame.new(94, 5, 1374)
			end

			if v18.Character and v18.Character:FindFirstChild("HumanoidRootPart") and (v18.Character.HumanoidRootPart.Position - cframe.Position).Magnitude > 35 then
				if tweenManager and tweenManager.topos then
					tweenManager:topos(cframe)
				end

				task.wait(0.5)
			end

			BuyBoatSafe(str5, true)

			if tbl6 and tbl6.SendNotify then
				tbl6:SendNotify("Boat Dealer", "Requested " .. tostring(str5) .. "!", 4)
			end
		end

		tbl20.OpenFishIndex = function()
			pcall(function()
				v18:WaitForChild("PlayerGui"):SetAttribute("FishIndexVisible", true)
			end)
		end

		tbl20.GetStatsInfo = function()
			if not v18:FindFirstChild("Data") or not data then
				return "Loading..."
			end
			local stats = data.Stats
			local points = data.Points
			if not stats or not points then
				return "No Stats"
			end
			local tbl22 = { "Points Available: " .. tostring(points.Value) }

			for _, v26 in ipairs({ "Melee", "Defense", "Sword", "Gun", "Demon Fruit" }) do
				table.insert(tbl22, v26 .. ": " .. (stats:FindFirstChild(v26) and stats[v26]:FindFirstChild("Level") and stats[v26].Level.Value or 0))
			end

			return table.concat(tbl22, "\n")
		end

		local thread4 = nil

		tbl20.AutoStats = function()
			local function fn34(arg)
				if not data or not data.Points then
					return
				end
				local value = data.Points.Value

				if value >= 1 and tbl.PointsSlider and tbl.PointsSlider > 0 then
					local n2 = math.clamp(tbl.PointsSlider, 1, value)
					tbl6:FireInvoke("AddPoint", arg, n2)
				end
			end

			if thread4 then
				task.cancel(thread4)
				thread4 = nil
			end

			thread4 = task.spawn(function()
				while tbl.AutoStats do
					task.wait(0.3)

					if tbl.Melee then
						fn34("Melee")
					end

					if tbl.Defense then
						fn34("Defense")
					end

					if tbl.Sword then
						fn34("Sword")
					end

					if tbl.Gun then
						fn34("Gun")
					end

					if tbl.DemonFruit then
						fn34("Demon Fruit")
					end
				end
			end)
		end

		tbl20.GetPlayerList = function()
			local tbl22 = { "Nearest" }

			for _, child in ipairs(v3:GetChildren()) do
				if child.Name ~= v18.Name then
					table.insert(tbl22, child.Name)
				end
			end

			return tbl22
		end

		local connection = nil

		tbl20.OnCamLockToggle = function(camLock)
			tbl.CamLock = camLock

			if connection then
				connection:Disconnect()
				connection = nil
			end

			if camLock then
				connection = v6.RenderStepped:Connect(function()
					if not tbl.CamLock then
						if connection then
							connection:Disconnect()
							connection = nil
						end

						return
					end

					pcall(function()
						local nearestPlayer = (tbl.SelectPlayer == "Nearest" or not tbl.SelectPlayer) and gameData:GetNearestPlayer() or v3:FindFirstChild(tbl.SelectPlayer)
						nearestPlayer = nearestPlayer and nearestPlayer.Character
						local humanoid2 = nearestPlayer and nearestPlayer:FindFirstChildOfClass("Humanoid")

						if nearestPlayer then
							nearestPlayer = nearestPlayer:FindFirstChild("Head") or nearestPlayer:FindFirstChild("HumanoidRootPart") or nearestPlayer.PrimaryPart
						end

						if nearestPlayer and humanoid2 and humanoid2.Health > 0 then
							local currentCamera = v2.CurrentCamera or v2.Camera

							if currentCamera then
								currentCamera.CFrame = CFrame.new(currentCamera.CFrame.Position, nearestPlayer.Position)
							end
						end
					end)
				end)
			end
		end

		local function fn34()
			pcall(function()
				local currentCamera = v2.CurrentCamera or v2.Camera
				local humanoid2 = v18.Character and v18.Character:FindFirstChildOfClass("Humanoid")

				if currentCamera and humanoid2 then
					currentCamera.CameraSubject = humanoid2
				end
			end)
		end

		local function fn35()
			if not tbl.SpectatePlayer then
				fn34()
				return
			end

			pcall(function()
				local nearestPlayer = (tbl.SelectPlayer == "Nearest" or not tbl.SelectPlayer) and gameData:GetNearestPlayer() or v3:FindFirstChild(tbl.SelectPlayer)
				local humanoid2 = nearestPlayer and nearestPlayer.Character and nearestPlayer.Character:FindFirstChildOfClass("Humanoid")
				local currentCamera = v2.CurrentCamera or v2.Camera

				if currentCamera then
					if humanoid2 and humanoid2.Health > 0 then
						currentCamera.CameraSubject = humanoid2
					else
						local humanoid3 = v18.Character and v18.Character:FindFirstChildOfClass("Humanoid")

						if humanoid3 then
							currentCamera.CameraSubject = humanoid3
						end
					end
				end
			end)
		end

		tbl20.OnSpectateToggle = function(spectatePlayer)
			tbl.SpectatePlayer = spectatePlayer

			if not spectatePlayer then
				fn34()
			else
				fn35()
			end
		end

		tbl20.OnTPPlayerToggle = function(teleporttoPlayer)
			tbl.TeleporttoPlayer = teleporttoPlayer

			if not teleporttoPlayer then
				tweenManager:StopTween()
			end
		end

		tbl20.GetPlayerHunterQuest = function()
			if flag3 then
				pcall(function()
					tbl6:FireInvoke("PlayerHunter")
				end)
			end
		end

		local function fn36()
			local fantasySky = v7:FindFirstChild("FantasySky") or v7:FindFirstChild("Sky") or v7:FindFirstChildWhichIsA("Sky")
			return fantasySky and fantasySky.MoonTextureId or ""
		end

		local function fn37()
			local attribute2 = v7:GetAttribute("MoonPhase")
			local str5 = tostring(fn36())
			local clockTime = v7.ClockTime
			local flag4 = clockTime >= 18 or clockTime <= 5.5
			if v7:GetAttribute("IsBlueMoon") == true then
				return "Blue Moon (Active)"
			end

			if attribute2 == 5 or str5:find("9709149431") then
				return flag4 and "Full Moon (Active)" or "Full Moon (Tonight)"
			end

			if attribute2 == 4 then
				return "Phase 4 (Next Night Full Moon)"
			end

			if attribute2 then
				return string.format("Phase %d (%d nights left)", attribute2, (5 - attribute2) % 8)
			end
			return "Phase 1"
		end

		local function fn38(arg, arg2)
			local attribute2 = v7:GetAttribute("MoonPhase") or 1
			local flag4 = arg2 >= 18 or arg2 <= 5.5
			if v7:GetAttribute("IsBlueMoon") == true then
				return "Kitsune Shrine Active"
			end

			if flag4 then
				local n2 = math.max(0, math.floor((arg2 <= 5.5 and 5.5 - arg2 or 24 - arg2 + 5.5) * 60))
				return string.format("Night Ends in %dm %02ds", math.floor(n2 / 60), n2 % 60)
			end
			local n2 = math.max(0, math.floor((18 - arg2) * 60))
			if attribute2 == 5 or arg and arg:find("Full Moon") then
				return string.format("Rises in %dm %02ds", math.floor(n2 / 60), n2 % 60)
			end
			return string.format("Next Night in %dm %02ds", math.floor(n2 / 60), n2 % 60)
		end

		local function fn39()
			if not v18.Character:FindFirstChild("RaceTransformed") then
				return "Not Ready"
			end
			local UpgradeRace, v26, v27 = tbl6:FireInvoke("UpgradeRace", "Check")
			local tbl22 = { [0] = "Ready For Trial", "Need More Training" }
			tbl22[2] = "Can Buy Gear With " .. (v27 or "?") .. " Fragments"
			tbl22[3] = "Need More Training"
			tbl22[4] = "Can Buy Gear With " .. (v27 or "?") .. " Fragments"
			tbl22[5] = "Race Complete"
			tbl22[6] = (v26 or 2) - 2 .. "/3 Upgrades Done"
			tbl22[7] = "Can Buy Gear With " .. (v27 or "?") .. " Fragments"
			tbl22[8] = 10 - (v26 or 10) .. " Training Sessions Left"
			return tbl22[UpgradeRace] or "Unknown"
		end

		local function fn40()
			local num = tonumber(string.match(tbl6:FireInvoke("CakePrinceSpawner", true), "%d+"))
			if num then
				return num
			end

			if utilities:CheckMon("Cake Prince") then
				return "Cake Prince"
			end

			if utilities:CheckMon("Dough King") then
				return "Dough King"
			end
			return "None"
		end

		local function fn41()
			local ok, result = pcall(function()
				return tbl6:FireInvoke("LegendarySwordDealer", "1")
			end)

			return ok and result or "Unknown"
		end

		local function fn42()
			local InfoLeviathan = tbl6:FireInvoke("InfoLeviathan", "1")
			if not InfoLeviathan or InfoLeviathan == -1 then
				return "I don't know anything yet."
			end

			return ({
				"I haven't heard a thing, mate. It's quiet as a ghost ship out there.",
				"Some citizens claim they heard something strange, I doubt it though..",
				"I heard it's been a bit chilly outside. That's a bit strange..",
				"It's just downright freezing out! What's with these ominous clouds? Something's happening..",
				"The Leviathan is out there! Go find it before it causes more destruction.",
			})[InfoLeviathan] or "No Bribe Data"
		end

		local function fn43()
			return worldOrigin.Locations:FindFirstChild("Mirage Island") and "[Spawned]" or "[None]"
		end

		local function fn44()
			return worldOrigin.Locations:FindFirstChild("Kitsune Island") and "[Spawned]" or "[None]"
		end

		local function fn45()
			return worldOrigin.Locations:FindFirstChild("Frozen Dimension") and "[Spawned]" or "[None]"
		end

		local function fn46()
			return worldOrigin.Locations:FindFirstChild("Prehistoric Island") and "[Spawned]" or "[None]"
		end

		local function fn47(arg)
			local n2 = math.floor(arg / 3600)
			local n3 = math.floor(arg % 3600 / 60)
			local n4 = math.floor(arg % 60)
			return n2 > 0 and string.format("%dh %02dm %02ds", n2, n3, n4) or string.format("%dm %02ds", n3, n4)
		end

		local function fn48()
			local v26 = nil

			for _, child in ipairs(worldOrigin.Locations:GetChildren()) do
				local attribute2 = child:GetAttribute("TimeIn")

				if attribute2 and attribute2 > 1.7e9 then
					if v26 == nil or attribute2 < v26 then
						v26 = attribute2
					end
				end
			end

			if v26 then
				local n2 = os.time() - v26
				local n3 = math.floor(n2 / 3600)
				local n4 = math.floor(n2 % 3600 / 60)
				local n5 = math.floor(n2 % 60)
				return string.format("%dh %dm %ds", n3, n4, n5)
			end

			return "Unknown"
		end

		local function fn49()
			if enemies then
				local v26 = next
				local children2, v27 = enemies:GetChildren()

				for _, v28 in v26, children2, v27 do
					local humanoid2 = v28:FindFirstChildOfClass("Humanoid")

					if humanoid2 and humanoid2.Health > 0 then
						if v28.Name:find("indra") then
							return "[Used - rip_indra Active!]"
						end

						if v28.Name:find("Dough King") then
							return "[Used - Dough King Active!]"
						end

						if v28.Name:find("Darkbeard") then
							return "[Used - Darkbeard Active!]"
						end
					end
				end
			end

			local v26 = next
			local players, v27 = v3:GetPlayers()

			for _, v28 in v26, players, v27 do
				local character2 = v28.Character
				local backpack = v28:FindFirstChild("Backpack")
				if character2 and character2:FindFirstChild("God's Chalice") or backpack and backpack:FindFirstChild("God's Chalice") then
					return "[Spawned - Held by " .. (v28.DisplayName or v28.Name) .. "]"
				end

				if character2 and character2:FindFirstChild("Sweet Chalice") or backpack and backpack:FindFirstChild("Sweet Chalice") then
					return "[Sweet Chalice - Held by " .. (v28.DisplayName or v28.Name) .. "]"
				end

				if character2 and character2:FindFirstChild("Fist of Darkness") or backpack and backpack:FindFirstChild("Fist of Darkness") then
					return "[Fist of Darkness - Held by " .. (v28.DisplayName or v28.Name) .. "]"
				end
			end

			local v28 = nil

			for _, child in ipairs(worldOrigin.Locations:GetChildren()) do
				local attribute2 = child:GetAttribute("TimeIn")

				if attribute2 and attribute2 > 1.7e9 then
					if v28 == nil or attribute2 < v28 then
						v28 = attribute2
					end
				end
			end

			if v28 then
				local n2 = os.time() - v28

				if n2 < 14400 then
					local n3 = 14400 - n2
					local n4 = math.floor(n3 / 3600)
					local n5 = math.floor(n3 % 3600 / 60)
					local n6 = math.floor(n3 % 60)
					return string.format("Not Spawned (Wait %dh %02dm %02ds)", n4, n5, n6)
				end

				local n3 = 14400 - n2 % 14400
				local n4 = math.floor(n3 / 3600)
				local n5 = math.floor(n3 % 3600 / 60)
				return string.format("Available in Chests (Next: %dh %02dm)", n4, n5)
			end

			return "Unknown"
		end

		local function fn50()
			if not flag3 then
				return "None | 0"
			end

			local ok, result = pcall(function()
				return tbl6:FireInvoke("EliteHunter", "Progress")
			end)

			ok = ok and tonumber(result)
			local n2 = 0

			if ok then
				n2 = tonumber(result)
			end

			local checkelites = gameData.Checkelites and gameData:Checkelites()
			return string.format("%s | %s", checkelites and tostring(checkelites) or "None", tostring(n2))
		end

		local function statusServer()
			local v26 = fn37()
			local str5 = fn38(v26, v7.ClockTime)
			local n2 = tick() - now
			local str6 = flag3 and "God's Chalice: " .. fn49() .. "\n" or flag2 and "Fist of Darkness: " .. fn49() .. "\n" or ""
			local str7 = flag3 and "Elite Hunter: " .. fn50() .. "\n" or ""

			local function fn51()
				local distributedGameTime = v2.DistributedGameTime
				local flag4 = os.date("!*t").wday == 1 or os.date("!*t").wday == 7
				local n3 = flag4 and 2700 or 3600
				local n4 = n3 - distributedGameTime % n3
				local n5 = math.floor(n4 / 60)
				local n6 = math.floor(n4 % 60)
				local tbl22 = {}
				local v27 = next
				local children2, v28 = v2:GetChildren()

				for _, v29 in v27, children2, v28 do
					if v29:IsA("Model") and v29.Name:find("Fruit") and v29:FindFirstChild("Handle") then
						table.insert(tbl22, v29.Name == "Fruit" and "Spawned Fruit" or v29.Name)
					end
				end

				if #tbl22 > 0 then
					return string.format("Spawned Now! (%s)", table.concat(tbl22, ", "))
				end
				return string.format("%02dm %02ds (%s)", n5, n6, flag4 and "Weekend Boost" or "Weekday")
			end

			local tbl22 = {}
			local str8 = "Server Uptime: " .. fn48() .. "\n"
			local str9 = "Time in Server: " .. fn47(n2) .. "\n"
			local str10 = "Next Fruit Spawn: " .. fn51() .. "\n"
			str5 = str5 and " | " .. str5 or ""
			local str11 = "Sword: " .. fn41() .. "\n"
			local str12 = "Cake Stats: " .. fn40() .. "\n"
			local str13 = "Ancient One: " .. fn39() .. "\n"
			local str14 = "Bribe: " .. fn42() .. "\n"
			local str15 = "Mirage: " .. fn43() .. "\n"
			local str16 = "Kitsune: " .. fn44() .. "\n"
			local str17 = "Frozen Dimension: " .. fn45() .. "\n"
			local str18 = "Prehistoric: " .. fn46() .. ""
			tbl22[1] = str8
			tbl22[2] = str9
			tbl22[3] = str10
			tbl22[4] = str6
			tbl22[5] = str7
			tbl22[6] = "Moon: " .. v26 .. str5 .. "\n"
			tbl22[7] = str11
			tbl22[8] = str12
			tbl22[9] = str13
			tbl22[10] = str14
			tbl22[11] = str15
			tbl22[12] = str16
			tbl22[13] = str17
			tbl22[14] = str18
			return table.concat(tbl22, "\n")
		end

		tbl20.StatusServer = statusServer
		tbl6._StatusServer = statusServer

		local function fn51()
			local ok, result, result2, result3 = pcall(function()
				return tbl6:FireInvoke("Cousin", "Check", "DLCBoxData")
			end)

			if not ok then
				return "Error"
			end

			if tonumber(result2) < 50 then
				return "Need level 50"
			end

			local ok2, result4 = pcall(function()
				return tbl6:FireInvoke("Cousin", "CheckTime", "DLCBoxData")
			end)

			if ok2 and result4 == true then
				return "Ready ($" .. math.floor(tonumber(result3)) .. ")"
			end
			return ok2 and type(result4) == "string" and result4 or "Unknown"
		end

		local function fn52()
			local ok, result, result2, result3, result4 = pcall(function()
				return tbl6:FireInvoke("Bones", "Check")
			end)

			local num = nil
			local num2 = nil

			if ok then
				if type(result) == "table" then
					num2 = tonumber(result[3] or result.PurchasesLeft or result.left)
					num = tonumber(result[4] or result.WaitMinutes or result.wait)
				else
					num2 = tonumber(result3)
					num = tonumber(result4)
				end
			end

			if not ok or not num2 then
				return "Error"
			end

			if num2 <= 0 then
				return "No purchases left — wait " .. tostring(num or "?") .. " min"
			end
			return num2 .. " purchase(s) left"
		end

		local function fn53()
			local KenTalk = tbl6:FireInvoke("KenTalk", "Status")
			local num = tonumber(KenTalk and string.match(tostring(KenTalk), "%d+"))

			if not num then
				num = v18:FindFirstChild("VisionRadius") and v18.VisionRadius.Value or 0
			end

			local attribute2 = v18:GetAttribute("KenMaxDodges") or 0
			local attribute3 = v18:GetAttribute("KenDodgesLeft") or 0
			local str5 = num >= 5000 and "Max" or num >= 4500 and "7" or num >= 3000 and "6" or num >= 1800 and "5"
			local str6

			if str5 then
				str6 = str5
			else
				str6 = num >= 900 and "4"
			end

			local str7

			if str6 then
				str7 = str6
			else
				str7 = num >= 300 and "3"
			end

			local str8

			if str7 then
				str8 = str7
			else
				str8 = num >= 50 and "2"
			end

			str8 = str8 or "1"
			attribute2 = attribute2 > 0 and attribute2

			if not attribute2 then
				local n2 = num >= 4500 and 8
				local n3

				if n2 then
					n3 = n2
				else
					n3 = num >= 3000 and 7
				end

				n3 = n3 or num >= 1800 and 6

				if n3 then
					attribute2 = n3
				else
					attribute2 = num >= 900 and 5
				end

				attribute2 = attribute2 or num >= 300 and 4 or num >= 50 and 3 or 2
			end

			return string.format("%d/5000 (Lvl %s • %d/%d Dodges)", math.floor(num), tostring(str8), attribute3, attribute2)
		end

		local function playerStatus()
			local tbl22 = {}
			local str5 = "Next Roll: " .. fn51() .. "\n"
			local str6 = "Bone Roll: " .. fn52() .. "\n"
			local str7 = "Observation: " .. fn53() .. "\n"
			local str8 = "Simulation Data: " .. tostring(v18:GetAttribute("SimulationData") or "N/A")
			tbl22[1] = str5
			tbl22[2] = str6
			tbl22[3] = str7
			tbl22[4] = str8
			return table.concat(tbl22, "\n")
		end

		tbl20.PlayerStatus = playerStatus

		tbl20.GetFruitStock = function()
			return serverStatus and serverStatus:GetFruitStock() or "No fruit stock data"
		end

		tbl20.TPDojoTrainer = function()
			tweenManager:topos(CFrame.new(5867, 1208, 870))
		end

		tbl20.TPDragonHunter = function()
			tweenManager:topos(CFrame.new(5864, 1209, 808))
		end

		tbl20.TPDragonWizard = function()
			tweenManager:topos(CFrame.new(5775, 1209, 806))
		end

		tbl20.ToggleUpgradeDragonTalon = function(autoUpgradeDragonTalon)
			tbl.AutoUpgradeDragonTalon = autoUpgradeDragonTalon
			if not autoUpgradeDragonTalon then
				return tweenManager:StopTween()
			end

			task.spawn(function()
				while tbl.AutoUpgradeDragonTalon and task.wait(0.5) do
					local cframe = CFrame.new(5661.89014, 1211.31909, 864.836731, 0.811413169, -1.36805838e-08, -0.584473014, 4.75227395e-08, 1, 4.25682458e-08, 0.584473014, -6.23161966e-08, 0.811413169)
					tweenManager:topos(cframe)

					if v18.Character and v18.Character:FindFirstChild("HumanoidRootPart") and (cframe.Position - v18.Character.HumanoidRootPart.Position).Magnitude <= 5 then
						v4.Modules.Net["RF/InteractDragonQuest"]:InvokeServer({ NPC = "Uzoth", Command = "Upgrade" })
					end
				end
			end)
		end

		tbl20.CraftPrehistoricItem = function(arg)
			net:WaitForChild("RF/Craft"):InvokeServer("Craft", arg, 1, {})
		end

		tbl20.ChangeDracoRace = function()
			local v26 = v18
			local distanceFromCharacter = v26.DistanceFromCharacter
			local vector = Vector3.new

			if distanceFromCharacter(v26, Vector3.new(5773, 1210, 807)) <= 5 then
				net("RF/InteractDragonQuest"):InvokeServer({ NPC = "Dragon Wizard", Command = "DragonRace" })
			else
				tweenManager:topos(CFrame.new(5773, 1210, 807))
			end
		end

		tbl20.UnlockDungeonDifficulty = function()
			pcall(function()
				v4.DungeonShared.DataRemote:InvokeServer("TryUnlockDifficulty", "Simulation", "Hard")
			end)

			pcall(function()
				v4.DungeonShared.DataRemote:InvokeServer("TryUnlockDifficulty", "Simulation", "Challenge")
			end)

			pcall(function()
				net["RF/DungeonNPCNetworkFunction"]:InvokeServer("UnlockDifficulty")
			end)

			pcall(function()
				net["RF/DungeonNPCNetworkFunction"]:InvokeServer("UnlockNext")
			end)

			tbl6:SendNotify("Dungeon", "Attempted to unlock difficulty", 4)
		end

		local function tpDungeonHub()
			net["RF/DungeonNPCNetworkFunction"]:InvokeServer("TeleportToDungeonHub", false)
		end

		tbl20.TPDungeonHub = tpDungeonHub

		tbl20.TPDungeonBack = function()
			net["RF/DungeonNPCNetworkFunction"]:InvokeServer("TeleportBack")
		end

		tbl20.OpenNormalFruitShop = function()
			require(v4.Controllers.UI.FruitShop):Open()
		end

		local function openAdvFruitShop()
			require(v4.Controllers.UI.FruitShop):Open("AdvancedFruitDealer")
		end

		tbl20.OpenAdvFruitShop = openAdvFruitShop

		tbl20.GetFruitSpawnStatus = function()
			if v18.Character and v18.Character:FindFirstChild("HumanoidRootPart") and v18.Character.HumanoidRootPart.Position then
				local v26 = next
				local children2, v27 = v2:GetChildren()
				local n2 = 0
				local huge = math.huge

				for _, v28 in v26, children2, v27 do
					if v28:IsA("Model") and string.find(v28.Name, "Fruit") then
						local handle = v28:FindFirstChild("Handle")

						if handle and handle:IsA("BasePart") then
							n2 += 1
							local v29 = v18:DistanceFromCharacter(handle.Position)

							if v29 < huge then
								huge = v29
							end
						end
					end
				end

				return n2 > 0 and string.format("Fruits Found: %d\nPosition: %.2f Studs Away", n2, huge) or "No fruits detected nearby."
			end

			return "Scanning for fruit..."
		end

		tbl20.TPAdvFruitDealer = function()
			if map:FindFirstChild("MysticIsland") then
				local v26 = getnilinstances()
				local v27 = next
				local children2, v28 = v4.NPCs:GetChildren()

				for _, v29 in v27, children2, v28 do
					table.insert(v26, v29)
				end

				for _, v29 in pairs(v26) do
					if v29.Name == "Advanced Fruit Dealer" then
						tweenManager:topos(v29.PrimaryPart.CFrame)
					end
				end
			end
		end

		local function fn54()
			local tbl22 = {}

			local ok, result = pcall(function()
				return Net:RemoteFunction("GetAllItemValues"):InvokeServer()
			end)

			if ok and result then
				for _, v26 in next, result, nil do
					if v26.Key == "AccessoryType" and v26.Value == "Trinket" or v26.Key == "Type" and v26.Value == "Trinket" then
						if v26.NetworkedUID then
							table.insert(tbl22, v26.NetworkedUID)
						end
					end
				end
			end

			return tbl22
		end

		tbl20.BuyTrinket = function()
			tbl6:SendNotify("Trinkets", pcall(function()
				return v4.Remotes.AccessoryInteract:InvokeServer("d")
			end) and "Purchased Trinket!" or "Failed to purchase trinket.", 4)
		end

		local function fuseTrinkets()
			local v26 = fn54()

			if #v26 >= 3 then
				tbl6:SendNotify("Trinkets", pcall(function()
					return v4.Remotes.AccessoryInteract:InvokeServer("a", v26[1], v26[2], v26[3])
				end) and "Fused 3 Trinkets successfully!" or "Failed to fuse trinkets.", 4)
			else
				tbl6:SendNotify("Trinkets", "Need at least 3 trinkets (Found: " .. tostring(#v26) .. ")", 4)
			end
		end

		tbl20.FuseTrinkets = fuseTrinkets

		tbl20.RefineTrinket = function()
			local v26 = fn54()

			if #v26 >= 1 then
				tbl6:SendNotify("Trinket Refiner", pcall(function()
					return v4.Remotes.AccessoryInteract:InvokeServer("c", v26[1])
				end) and "Refined trinket!" or "Failed to refine trinket.", 4)
			else
				tbl6:SendNotify("Trinket Refiner", "No trinket available to refine.", 4)
			end
		end

		tbl20.OpenTrinketMergeGUI = function()
			pcall(function()
				v18:WaitForChild("PlayerGui"):WaitForChild("AccessoryMerge").Open:Fire(false)
			end)
		end

		tbl20.OpenTrinketRefineGUI = function()
			pcall(function()
				v18:WaitForChild("PlayerGui"):WaitForChild("AccessoryMerge").Open:Fire(true)
			end)
		end

		tbl20.OpenTrinketScrapGUI = function()
			pcall(function()
				v18:WaitForChild("PlayerGui"):WaitForChild("AccessoryTrasher").Open:Fire()
			end)
		end

		tbl20.InitTempleOfTime = function()
			pcall(function()
				local v26 = v2
				v4:FindFirstChild("MapStash"):FindFirstChild("Temple of Time").Parent = v26:FindFirstChild("Map")
			end)
		end

		tbl20.TPRaceDoor = function()
			if data and data.Race and tbl12[data.Race.Value] then
				tweenManager:topos(tbl12[data.Race.Value])
			end
		end

		tbl20.ResetCharHead = function()
			if v18.Character and v18.Character:FindFirstChild("Head") then
				v18.Character.Head:Destroy()
			end
		end

		local tbl22 = {
			GreatTree = CFrame.new(2948, 2282, -7214),
			TempleOfTime = CFrame.new(28286, 14895, 103),
			AncientOne = CFrame.new(28982, 14888, -120),
			LeverPull = CFrame.new(28575, 14937, 72),
			SafeZone = CFrame.new(28273, 14897, 157),
			PvpZone = CFrame.new(28767, 14967, -164),
			Clock = CFrame.new(29552, 15069, -86),
		}

		tbl20.TPTrialArea = function(arg)
			if tbl22[arg] then
				tweenManager:topos(tbl22[arg])
			end
		end

		tbl20.TeleportJobID = function(arg)
			local str5 = tostring(arg):gsub("`", ""):gsub("lua", ""):gsub("%s+", "")
			v4.__ServerBrowser:InvokeServer("teleport", str5)
		end

		tbl20.TeleportQuantumPremium = function(arg)
			local str5 = tostring(arg):gsub("`", ""):gsub("lua", ""):gsub("QuantumOnyx%-", ""):gsub("%s+", "")

			if fn5 then
				str5 = fn5(str5)
			end

			v4.__ServerBrowser:InvokeServer("teleport", str5)
		end

		local function rejoinServer()
			v4.__ServerBrowser:InvokeServer("teleport", v4.__ServerBrowser:InvokeServer("getjob"))
		end

		tbl20.RejoinServer = rejoinServer

		tbl20.ServerHop = function()
			utilities:ServerHop()
		end

		tbl20.JoinAPI = joinAPI

		tbl20.JoinRaidBossServer = function()
			local selectBosstoHop = tbl.SelectBosstoHop

			if type(selectBosstoHop) == "number" or not selectBosstoHop or selectBosstoHop == "" then
				selectBosstoHop = bossHopNames[selectBosstoHop] or bossHopNames[1] or "rip_indra True Form"
			end

			selectBosstoHop = tbl14[selectBosstoHop] or selectBosstoHop or "Ripindra"

			if joinAPI then
				joinAPI(tostring(selectBosstoHop))
			end
		end

		tbl20.BuyItem = function(arg, arg2)
			local v26 = itemsToBuy and itemsToBuy[arg2] and itemsToBuy[arg2][arg]
			if not v26 then
				return
			end

			if arg2 == "Frags" or arg2 == "Ability" or arg2 == "Accessory" then
				tbl6:FireInvoke(unpack(v26))
			elseif arg2 == "Sword" then
				task.wait(0.1)
				tbl6:FireInvoke(arg == "Pole v.2" and v26 or "BuyItem", v26)
			elseif arg2 == "Gun" then
				task.wait(0.5)

				if arg == "Kabucha" then
					tbl6:FireInvoke(v26[1], v26[2], v26[3])
					tbl6:FireInvoke(v26[1], v26[2], "2")
				else
					tbl6:FireInvoke(unpack(v26))
				end
			end
		end

		tbl20.BuySelectedFruit = function()
			local selectFruitDealerFruit = tbl.SelectFruitDealerFruit
			if not selectFruitDealerFruit or selectFruitDealerFruit == "" then
				tbl6:SendNotify("Fruit Dealer", "Please select a fruit first.", 4)
				return
			end

			local ok, result = pcall(function()
				return tbl6:FireInvoke("GetFruits")
			end)

			if ok and typeof(result) == "table" then
				for _, v26 in next, result, nil do
					if v26 and (v26.Name == selectFruitDealerFruit or v26.Name:match("^(.-)%-") == selectFruitDealerFruit:match("^(.-)%-")) then
						if v26.OnSale then
							local ok2 = pcall(function()
								return tbl6:FireInvoke("PurchaseRawFruit", v26.Name, false)
							end)

							local v27 = tbl6
							local sendNotify = v27.SendNotify

							if ok2 then
								ok2 = "Purchased " .. v26.Name .. " for $" .. fn17(v26.Price or 0) .. "!"
							end

							sendNotify(v27, "Fruit Dealer", ok2 or "Failed to purchase " .. v26.Name, 5)
						else
							tbl6:SendNotify("Fruit Dealer", v26.Name .. " is currently out of stock!", 4)
						end

						return
					end
				end
			end

			tbl6:SendNotify("Fruit Dealer", "Could not check fruit stock.", 4)
		end

		tbl20.BuyCyborgRace = function()
			tbl6:FireInvoke("CyborgTrainer", "Buy")
		end

		local function buyGhoulRace()
			tbl6:FireInvoke("Ectoplasm", "BuyCheck", 4)
			tbl6:FireInvoke("Ectoplasm", "Change", 4)
		end

		tbl20.BuyGhoulRace = buyGhoulRace

		local tbl23 = {
			["Common Scroll"] = "CommonScroll",
			["Rare Scroll"] = "RareScroll",
			["Legendary Scroll"] = "LegendaryScroll",
			["Mythical Scroll"] = "MythicalScroll",
		}

		tbl20.CraftScroll = function()
			local selectScrollType = tbl.SelectScrollType or "Common Scroll"
			local str5 = tbl23[selectScrollType] or "CommonScroll"
			local n2 = tonumber(tbl.ScrollCraftAmount) or 1

			tbl6:SendNotify("Scroll Craft", pcall(function()
				return Net:RemoteFunction("Craft"):InvokeServer(str5, n2)
			end) and "Crafted " .. tostring(n2) .. "x " .. selectScrollType .. "!" or "Failed to craft scroll (check materials)", 5)
		end

		tbl20.OpenTitleNames = function()
			pcall(function()
				v18:WaitForChild("PlayerGui"):WaitForChild("TitlesMenu").Open:Fire()
			end)
		end

		tbl20.OpenAwakenings = function()
			pcall(function()
				v18.PlayerGui.Main.AwakeningToggler.Visible = true
			end)
		end

		tbl20.OpenHakiColors = function()
			pcall(function()
				v18.PlayerGui.Main.Colors.Visible = true
			end)
		end

		tbl20.SetWalkSpeed = function(walkSpeed)
			tbl.WalkSpeed = walkSpeed

			if tbl.WalkSpeed and v18.Character and v18.Character:FindFirstChild("Humanoid") then
				v18.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
					v18.Character.Humanoid.WalkSpeed = tbl.WalkSpeed
				end)

				v18.Character.Humanoid.WalkSpeed = tbl.WalkSpeed
			end
		end

		tbl20.SetJumpPower = function(jumpPower)
			tbl.JumpPower = jumpPower

			if tbl.JumpPower and v18.Character and v18.Character:FindFirstChild("Humanoid") then
				v18.Character.Humanoid.JumpPower = tbl.JumpPower
			end
		end

		local function fn55(arg)
			for _, descendant in pairs(v2:GetDescendants()) do
				if descendant:IsA("BasePart") and not descendant.Parent:FindFirstChild("Humanoid") and not descendant.Parent.Parent:FindFirstChild("Humanoid") then
					descendant.LocalTransparencyModifier = arg and 0.7 or 0
				end
			end
		end

		tbl20.ToggleXray = function(arg)
			fn55(arg)
		end

		local cameraMaxZoomDistance = v18.CameraMaxZoomDistance

		tbl20.ToggleInfiniteZoom = function(arg)
			v18.CameraMaxZoomDistance = arg and math.huge or cameraMaxZoomDistance
		end

		tbl20.ToggleWhiteScreen = function(whiteScreen)
			tbl.White_Screen = whiteScreen
			v6:Set3dRenderingEnabled(not whiteScreen)
		end

		tbl20.ToggleBlackScreen = function(blackScreen)
			tbl.BlackScreen = blackScreen

			pcall(function()
				if v18.PlayerGui.Main:FindFirstChild("Blackscreen") then
					local blackscreen = v18.PlayerGui.Main.Blackscreen
					local udim2 = blackScreen

					if blackScreen then
						udim2 = UDim2.new(1000, 0, 1000, 1000)
					end

					blackscreen.Size = udim2 or UDim2.new(1, 0, 1000, 1000)
				end
			end)
		end

		tbl20.RedeemAllCodes = function()
			task.spawn(function()
				if tbl6 and tbl6.SendNotify then
					tbl6:SendNotify("Codes", "Fetching working codes from Blox Fruits Wiki...", 3)
				end

				local tbl24 = {}
				local tbl25 = {}

				local function fn56(arg)
					if type(arg) == "string" then
						local str5 = arg:gsub("%s+", ""):gsub("\"", ""):gsub("'", "")

						if str5 ~= "" and not tbl25[str5] then
							tbl25[str5] = true
							table.insert(tbl24, str5)
						end
					end
				end

				if fn2 then
					pcall(function()
						local v26 = fn2({ Url = "https://blox-fruits.fandom.com/wiki/Codes", Method = "GET" })

						if v26 and v26.StatusCode == 200 and v26.Body then
							local body = v26.Body
							local pos = body:find("id=\"Working_Codes\"") or body:find("Working_Codes")
							local pos2 = body:find("id=\"Expired_Codes\"") or body:find("Expired_Codes")

							if pos then
								local str5 = pos2 and body:sub(pos, pos2) or body:sub(pos, pos + 35000)

								for match in str5:gmatch("<td><code>([^<]+)</code>") do
									fn56(match)
								end

								for match in str5:gmatch("data%-tpt%-row%-id=\"([^\"]+)\"") do
									fn56(match)
								end
							end
						end
					end)
				end

				local n2 = #tbl24
				local redeem = v4:FindFirstChild("Remotes") and v4.Remotes:FindFirstChild("Redeem")
				local n3 = 0

				if redeem then
					for _, v26 in ipairs(tbl24) do
						local ok, result = pcall(function()
							return redeem:InvokeServer(v26)
						end)

						if ok and result and (result == "SUCCESS" or result == true or tostring(result):find("Success")) then
							n3 += 1
						end

						task.wait(0.06)
					end
				end

				if tbl6 and tbl6.SendNotify then
					tbl6:SendNotify("Codes", string.format("Checked %d working codes! (%d successfully redeemed)", n2, n3), 4)
				end
			end)
		end

		tbl20.ForceFPSBoost = function()
			local terrain = v2:FindFirstChildOfClass("Terrain")

			if terrain then
				terrain.WaterWaveSize = 0
				terrain.WaterWaveSpeed = 0
				terrain.WaterReflectance = 0
				terrain.WaterTransparency = 0
			end

			v7.GlobalShadows = false
			v7.FogEnd = 9e9
			settings().Rendering.QualityLevel = 1

			for _, descendant in pairs(game:GetDescendants()) do
				if descendant:IsA("Part") or descendant:IsA("UnionOperation") or descendant:IsA("MeshPart") or descendant:IsA("CornerWedgePart") or descendant:IsA("TrussPart") then
					descendant.Material = "Plastic"
					descendant.Reflectance = 0
				elseif descendant:IsA("Decal") then
					descendant.Transparency = 1
				elseif descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") then
					descendant.Lifetime = NumberRange.new(0)
				elseif descendant:IsA("Explosion") then
					descendant.BlastPressure = 1
					descendant.BlastRadius = 1
				end
			end

			for _, descendant in pairs(v7:GetDescendants()) do
				if descendant:IsA("BlurEffect") or descendant:IsA("SunRaysEffect") or descendant:IsA("ColorCorrectionEffect") or descendant:IsA("BloomEffect") or descendant:IsA("DepthOfFieldEffect") then
					descendant.Enabled = false
				end
			end

			local v26 = next
			local children2, v27 = v2:GetChildren()

			for _, v28 in v26, children2, v27 do
				if v28:IsA("ForceField") or v28:IsA("Sparkles") or v28:IsA("Smoke") or v28:IsA("Fire") then
					pcall(function()
						v28:Destroy()
					end)
				end
			end
		end

		local function openDevConsole()
			pcall(function()
				game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
			end)
		end

		tbl20.OpenDevConsole = openDevConsole

		tbl20.CleanMemory = function()
			if tbl2 and tbl2.Performance and tbl2.Performance.CleanMemory then
				tbl2.Performance.CleanMemory()
			end

			tbl6:SendNotify("Memory Cleaner", "Garbage collection completed & memory trimmed!", 4)
		end

		tbl20.OnFastModeToggle = function(arg)
			task.spawn(function()
				if tbl2 and tbl2.Performance and tbl2.Performance.SetFastMode then
					tbl2.Performance.SetFastMode(arg)
				end
			end)
		end

		tbl20.SendTestWebhook = function()
			if tbl.Webhook and tbl.Webhook ~= "" then
				if PostWebhook and WeeboLogs then
					PostWebhook(tbl.Webhook, WeeboLogs("Test Notification", {
						Extra = "**Status:** Webhook connection is active & working properly!",
						Field2 = { name = "User", value = v18.Name },
					}))
				end

				tbl6:SendNotify("Webhook", "Test webhook dispatched!", 4)
			else
				tbl6:SendNotify("Webhook", "Please enter a valid Webhook URL first.", 4)
			end
		end

		tbl20.SendDataLogNow = function()
			if tbl2 and tbl2.Webhook and tbl2.Webhook.SendDataLog then
				tbl2.Webhook:SendDataLog("OnionHub - Manual Data Log Request", "Triggered manually via UI button.")
			end

			tbl6:SendNotify("Data Log", "Data Log webhook sent successfully!", 5)
		end

		local function fn56()
			while task.wait(3) do
				if tbl.AutoFastMode and tbl2 and tbl2.Performance and not tbl2.Performance.FastMode then
					tbl2.Performance.SetFastMode(true)
				end
			end
		end

		task.spawn(fn56)

		local function fn57(arg, arg2)
			local function fn58(arg3)
				return tostring(arg3) .. "\n" .. debug.traceback()
			end

			local ok, result = xpcall(arg2, fn58)

			if not ok then
				warn(string.format("[OnionHub ERROR] Error while building UI Tab '%s':\n%s", arg, tostring(result)))
			end

			return ok
		end

		fn57("Home", function()
			local v26 = tbl15.Home:addSection()
			local v27 = v26:addMenu("Main Farm")
			local v28 = v27:addLabel("Debug Functions", "None")

			local function fn58()
				local flag4 = false

				while true do
					task.wait(1)
					local v29 = tbl6.GetEnabledFunctionNames()
					local flag5 = false
					local exitTo = nil

					for _, v30 in ipairs(v29) do
						if tbl6.IsMultiFunction(v30) then
							exitTo = 1
							break
						end
					end

					if exitTo == 1 then
						flag5 = true
					end

					if flag5 and not flag4 and tbl6.ActiveFunction == nil then
						v28:RefreshDesc("<font color=\"#FFAA00\"><b>Initializing Multifunctions, wait...</b></font>")
						continue
					end

					if flag5 then
						flag4 = true
					end

					local n2 = 0

					for _, v30 in ipairs(v29) do
						local v31 = tbl6.Functions[v30]

						if v31 and not v31.NoLock and not tbl6.IsMultiFunction(v30) then
							n2 += 1
						end
					end

					local tbl24 = {}

					for _, v30 in ipairs(v29) do
						local v31 = tbl6.Functions[v30]

						if v31 and not v31.NoLock then
							local functionDisplayNames = tbl6.FunctionDisplayNames and tbl6.FunctionDisplayNames[v30] or v30
							table.insert(tbl24, "<font color=\"" .. ((tbl6.IsMultiFunction(v30) or n2 < 2) and "#00FF00" or "#FF0000") .. "\"><b>" .. functionDisplayNames .. "</b></font>")
						end
					end

					v28:RefreshDesc(#tbl24 > 0 and table.concat(tbl24, "\n") or "None")
				end
			end

			task.spawn(fn58)
			tbl16:CreateDropdown(v27, "Weapon", "SelectWeapon", "Melee", { "Melee", "Sword", "Blox Fruit", "Gun" }, { global = true })
			tbl16:CreateDropdown(v27, "Farm Method", "FarmMode", "Quest", { "Quest", "No Quest", "Nearest" }, { global = true })
			tbl16:CreateDropdown(v27, "Quest Farm Mode", "QuestFarmMode", "Double Quest", { "Single Quest", "Double Quest", "Triple Quest" }, { global = true, save = true })
			tbl16:CreateSlider(v27, "Nearest (Distance)", "checknearestdist", 1000, 5000, 1500, { global = true })
			tbl16:CreateToggle(v27, "Auto Farm", "AutoFarm", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v27, "Take Quest", "AcceptQuests", false, { global = true, save = true, description = "Accept Quest for Bones/Cakes" })
			tbl16:CreateToggle(v27, "Auto Bones", "AutoFarmBones", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v27, "Enable Mastery", "MasteryFarm", false, { global = true, save = true })
			tbl16:CreateSlider(v27, "Health Mob%", "HealthMob", 15, 100, 25, { global = true })
			tbl16:CreateToggle(v27, "Auto Random Surprise", "Auto_Random_Surprise", false, { global = true, save = true })
			tbl16:CreateToggle(v27, "Auto Pray", "AutoPray", false, { global = true })
			tbl16:CreateToggle(v27, "Auto Try Luck", "AutoTryLuck", false, { global = true })
			tbl16:CreateToggle(v27, "Auto Katakuri", "AutoFarmPrince", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v27, "Ignore Katakuri", "IgnoreCakePrince", false, { global = true })
			tbl16:CreateToggle(v27, "Auto Dough King", "AutoDoughKing", false, { global = true, save = true, stop = true })

			tbl16:CreateToggle(v27, "Ignore Farm Dough King Item", "IgnoreDoughChaliceFarm", false, {
				global = true,
				save = true,
				description = "this function will make the Auto Dough King only focus on boss and will not try to get chalice",
			})

			local v29 = tbl16
			local createDropdown = v29.CreateDropdown
			createDropdown(v29, v27, "Select Material", "SelectMaterial", tbl17.Materials and tbl17.Materials[1] or "Leather + Scrap Metal", tbl17.Materials or {}, { global = true })
			tbl16:CreateToggle(v27, "Auto Farm Material", "AutoMaterial", false, { global = true, stop = true })
			local v30 = v26:addMenu("Boss Farm")
			local v31 = tbl16
			local createDropdown2 = v31.CreateDropdown
			createDropdown2(v31, v30, "Select Boss", "SelectBoss", 1, tbl17.BossNames or {}, { global = true })
			tbl16:CreateToggle(v30, "Auto Farm Boss", "AutoFarmBoss", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v30, "Auto Kill All Bosses", "AutoKillAllBosses", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v30, "Get Boss Quest", "GetBossQuest", false, { global = true, save = true, description = "Automatically takes the boss quest before attacking" })
			local v32 = v26:addMenu("Tyrant Farm")

			tbl16:CreateToggle(v32, "Auto Summon Kill Tyrant Of The Skies", "AutoTyrantOfTheSkies", false, {
				global = true,
				save = true,
				stop = true,
				description = "turn on auto skill or gun shooting for destroying vases",
			})

			tbl16:CreateToggle(v32, "Use Skull Guitar for Vases", "ShootGunTyrant", true, {
				global = true,
				save = true,
				description = "Uses Skull Guitar custom shoot to destroy Tyrant vases",
			})

			local v33 = v26:addMenu("Chest Farm")
			tbl16:CreateToggle(v33, "Start Farming Chest", "AutoChest", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v33, "Stop If Items", "StopChest", false, { global = true, save = true })
			tbl16:CreateToggle(v33, "Auto Hop Server On Chests", "AutoHopChest", false, { global = true, save = true })
			tbl16:CreateSlider(v33, "Chest Hop Target Count", "ChestHopCount", 1, 50, 10, { global = true, save = true })
			tbl16:CreateToggle(v33, "Stop Hop If Chalice / Fist", "StopHopChestIfChalice", true, { global = true, save = true })
			local v34 = tbl15.Home:addSection()
			local v35 = v34:addMenu("Farm Settings")
			tbl16:CreateSlider(v35, "Tweening Speed", "TweenSpeed", 10, 250, 250, { global = true })
			tbl16:CreateToggle(v35, "Bypass TP ", "BypassTP", false, { locked = true, save = true, global = true })
			tbl16:CreateSlider(v35, "Farm Distance", "PosY", 0, 30, 18, { global = true })
			tbl16:CreateSlider(v35, "Bring Radius", "BringMonsterRadius", 150, 400, 350, { global = true })
			tbl16:CreateDropdown(v35, "Pos Method", "PosMethod", "Above", { "Above", "Orbit" }, { global = true })
			tbl16:CreateToggle(v35, "Start Bring", "BringMonster", true, { global = true, save = true })
			tbl16:CreateDropdown(v35, "Attack Method", "FastSettings", "Fast Attack", { "Fast Attack", "Legit Attack" }, { global = true })
			tbl16:CreateSlider(v35, "Fast Attack Delay", "FastAttackDelay", 0, 1, 0, { global = true, step = 0.01 })
			tbl16:CreateToggle(v35, "Fast Attack", "AutoAttack", true, { global = true, save = true })
			tbl16:CreateToggle(v35, "Onion Attack", "QuantumAttack", false, { global = true })
			tbl16:CreateToggle(v35, "Auto Attack Gun", "AutoAttackGun", true, { global = true, save = true })

			tbl16:CreateDropdown(v35, "Dragonstorm Mode", "DragonstormMode", "Spread Damage", { "Spread Damage", "Single Damage" }, {
				global = true,
				save = true,
				description = "Choose between Spread Damage or Single Damage for Dragonstorm gun",
			})

			tbl16:CreateSlider(v35, "Gun Shoot Amount", "ShootAmount", 1, 10, 1, { global = true, save = true, description = "Number of shots to fire per attack cycle" })
			tbl16:CreateToggle(v35, "Remove Fast Attack Animation", "RemoveAnimationFast", true, { global = true, save = true })
			tbl16:CreateToggle(v35, "attack mobs", "attackmobs", true, { global = true, save = true })
			tbl16:CreateToggle(v35, "attack players", "attackplayers", true, { global = true, save = true })
			tbl16:CreateToggle(v35, "Auto Activate Observation Haki", "AutoActivateObservationHaki", false, { global = true, save = true })
			tbl16:CreateToggle(v35, "Auto Set Spawn Point", "AutoSetSpawnPoint", false, { global = true, save = true })
			tbl16:CreateToggle(v35, "Debounce Quests", "QuestDebounce", false, { global = true })
			tbl16:CreateToggle(v35, "Bypass Get Quest", "BypassGetQuest", false, { global = true, save = true, description = "Gets the quest without teleporting to the quest NPC" })
			tbl16:CreateDropdown(v35, "Select Team", "TeamSelectLoad", 1, { "Pirates", "Marines" }, { global = true })

			tbl16:CreateToggle(v35, "Auto Load Script on Load", "AutoLoadScriptonLoad", false, {
				global = true,
				save = true,
				description = "Works on higher unc executors",
				callback = tbl20.OnAutoLoadScript,
			})

			tbl16:CreateToggle(v35, "Disable Damage Counter", "DisableDamageCounter", false, { callback = tbl20.ToggleDamageCounter })
			tbl16:CreateToggle(v35, "Disable Notifications", "DisableNotifications", false, { callback = tbl20.ToggleNotifications })
			tbl16:CreateToggle(v35, "Walk in Water", "Water", true, { callback = tbl20.ToggleWalkInWater })
			tbl16:CreateToggle(v35, "Auto Hop when 30mins", "AutoHopwhen30mins", false, { locked = true, global = true, save = true, callback = tbl20.OnAutoHop30Mins })
			tbl16:CreateToggle(v35, "Auto Hop When Admin Joined", "HopWhenAdmin", true, { callback = tbl20.ToggleHopAdmin })
			tbl16:CreateToggle(v35, "Anti Afk", "AntiAFK", true, { callback = tbl20.ToggleAntiAFK })

			if tbl20.RemoveEffects then
				v35:addButton("Remove Effects", tbl20.RemoveEffects)
			end

			local v36 = v34:addMenu("Farm Settings")
			tbl16:CreateDropdown(v36, "Select Skills", "SelectSkills", "Blox Fruit", { "Blox Fruit", "Melee", "Sword", "Gun" }, { global = true }, true)
			tbl16:CreateDropdown(v36, "Blox Fruit Skills", "BloxFruitKeys", "Z", { "Z", "X", "C", "V", "F" }, { global = true }, true)
			tbl16:CreateDropdown(v36, "Melee Skills", "MeleeKeys", "Z", { "Z", "X", "C" }, { global = true }, true)
			tbl16:CreateDropdown(v36, "Sword Skills", "SwordKeys", "Z", { "Z", "X" }, { global = true }, true)
			tbl16:CreateDropdown(v36, "Gun Skills", "GunKeys", "Z", { "Z", "X" }, { global = true }, true)
			tbl16:CreateToggle(v36, "Auto Use Skills", "AutoSkills", false, { global = true, save = true })
			local v37 = v34:addMenu("Skills Settings")
			tbl16:CreateSlider(v37, "Z Hold Time (ms)", "HoldTime_Z", 0, 5, 0, { global = true, save = true, step = 0.1 })
			tbl16:CreateSlider(v37, "X Hold Time (ms)", "HoldTime_X", 0, 5, 0, { global = true, save = true, step = 0.1 })
			tbl16:CreateSlider(v37, "C Hold Time (ms)", "HoldTime_C", 0, 5, 0, { global = true, save = true, step = 0.1 })
			tbl16:CreateSlider(v37, "V Hold Time (ms)", "HoldTime_V", 0, 5, 0, { global = true, save = true, step = 0.1 })
			tbl16:CreateSlider(v37, "F Hold Time (ms)", "HoldTime_F", 0, 5, 0, { global = true, save = true, step = 0.1 })
			tbl16:CreateSlider(v37, "Blox Fruit Skill Delay (ms)", "BloxFruitDelay", 0, 5, 0, { global = true, save = true, step = 0.1 })
			tbl16:CreateSlider(v37, "Melee Skill Delay (ms)", "MeleeDelay", 0, 5, 0, { global = true, save = true, step = 0.1 })
			tbl16:CreateSlider(v37, "Sword Skill Delay (ms)", "SwordDelay", 0, 5, 0, { global = true, save = true, step = 0.1 })
			tbl16:CreateSlider(v37, "Gun Skill Delay (ms)", "GunDelay", 0, 5, 0, { global = true, save = true, step = 0.1 })
		end)

		fn57("Sub Farm", function()
			task.wait()
			local v26 = tbl15.Sub:addSection()
			local v27 = v26:addMenu("World Farm")
			tbl16:CreateToggle(v27, "Auto Second Sea Quest", "AutoSecondSea", false, { global = true, stop = true })
			tbl16:CreateToggle(v27, "Auto Third Sea Quest", "AutoThirdSea", false, { global = true, stop = true })
			local v28 = v26:addMenu("Quest Farm")
			tbl16:CreateToggle(v28, "Complete Saber Quest", "AutoUnlockSaber", false, { global = true, stop = true })
			tbl16:CreateToggle(v28, "Complete Bartilo Quest", "AutoBartiloQuest", false, { global = true, stop = true })
			tbl16:CreateToggle(v28, "Complete Citizen Quest", "CompleteCitizenQuest", false, { global = true, stop = true })
			tbl16:CreateToggle(v28, "Complete Rainbow Haki Quest", "GetRainbowHaki", false, { global = true, stop = true })
			local v29 = v26:addMenu("Items Farm")
			tbl16:CreateToggle(v29, "Auto Get Yama (Fully)", "AutoYama", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v29, "Auto Get Tushita (Fully)", "AutoTushita", false, { global = true, save = true, stop = true })

			tbl16:CreateToggle(v29, "Auto Get CDK (Fully)", "AutoCDKQuest", false, {
				global = true,
				locked = true,
				stop = true,
				save = true,
				description = "don't turn on remove fog while using this function",
			})

			tbl16:CreateToggle(v29, "Auto Get Rengoku (Fully)", "AutoRengoku", false, { global = true, stop = true })
			tbl16:CreateToggle(v29, "Auto Get TTK (Fully)", "AutoTTK", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v29, "Auto Evolve DarkBlade (V2)", "AutoGetDBV2", false, { locked = true, global = true, stop = true })
			tbl16:CreateToggle(v29, "Auto Shark Anchor (Fully)", "AutoSharkAnchor", false, { locked = true, global = true, stop = true })
			tbl16:CreateToggle(v29, "Auto Get Skull Guitar (Fully)", "AutoGetSkullGuitar", false, { global = true, locked = true, save = true, stop = true })
			tbl16:CreateToggle(v29, "Ignore Material Farm for Skull Guitar", "IgnoreMaterialFarmGuitar", false, { global = true, locked = true, stop = true })
			local v30 = v26:addMenu("Sword Mastery")
			tbl16:CreateSlider(v30, "Select Sword Mastery", "SelectSwordMastery", 100, 600, 600, { locked = true, global = true })
			tbl16:CreateToggle(v30, "Auto Mastery Swords (Fully)", "AutoMasterySwords", false, { global = true, save = true })
			local v31 = v26:addMenu("Fight Style Obtainment")
			tbl16:CreateToggle(v31, "Auto Death Step", "AutoDeathStep", false, { global = true, stop = true })
			tbl16:CreateToggle(v31, "Auto Sharkman Karate", "AutoSharkmanKarate", false, { global = true, stop = true })
			tbl16:CreateToggle(v31, "Auto Electric Claw", "AutoElectricClaw", false, { global = true, stop = true })
			tbl16:CreateToggle(v31, "Auto Dragon Talon", "AutoDragonTalon", false, { global = true, stop = true })
			local v32 = tbl15.Sub:addSection()
			local v33 = v32:addMenu("Timely Farm")
			tbl16:CreateToggle(v33, "Auto Elite Hunter", "AutoTaskEliteHunter", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v33, "Auto Factory Raid", "AutoFactoryRaid", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v33, "Auto Pirate Raid", "AutoFarmPirateRaid", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v33, "Auto Soul Reaper", "AutoSoulReaper", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v33, "Auto Darkbeard", "AutoDarkbeard", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v33, "Auto Greybeard", "AutoGreybeard", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v33, "Auto Cursed Captain", "AutoCursedCaptain", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v33, "Auto Open Colors Plate", "AutoOpenColorsTask", false, { global = true, save = false, stop = true })
			tbl16:CreateToggle(v33, "Auto True Form Rip Indra", "AutoRipIndra", false, { global = true, save = true, stop = true })
			local v34 = v32:addMenu("Other Farm")
			tbl16:CreateToggle(v34, "Start Farm Observation", "AutoFarmObservation", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v34, "Auto Get Observation V2", "AutoKenV2", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v34, "Farm Observation Hopping", "StartObsHop", false, { global = true, save = true })
			tbl16:CreateToggle(v34, "Auto Dummy Training", "DummyTraining", false, { global = true, save = true, stop = true })
		end)

		fn57("Sea Event", function()
			task.wait()
			local v26 = tbl15.Sevent:addSection()
			local v27 = v26:addMenu("Mirage Event")
			tbl16:CreateToggle(v27, "Auto Find Mirage Island", "AutoFindMirageIsland", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v27, "Teleport to Mirage", "AutoTeleportMirage", false, { global = true, save = true, stop = true })
			local v28 = v26:addMenu("Kitsune Event")
			tbl16:CreateToggle(v28, "Auto Find Kitsune Island", "AutoFindKitsuneIsland", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v28, "Teleport to Shrine", "AutoTeleportKitsune", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v28, "Auto Collect Azure Embers", "CollectAzure", false, { global = true, save = true, stop = true })
			tbl6._BlueMoonState = "FIND_ISLAND"
			tbl16:CreateToggle(v28, "Auto Kitsune Farm", "AutoBlueMoonFarm", false, { global = true, lock = true, save = true, stop = true })
			tbl16:CreateSlider(v28, "Set Azure Ember", "SetAzureEmber", 1, 25, 1, { global = true })
			tbl16:CreateToggle(v28, "Auto Trade Azure Ember", "TradeAzureEmber", false, { global = true, save = true })
			local v29 = v26:addMenu("Leviathan Hunt")
			local v30 = v29
			local addButton = v30.addButton

			addButton(v30, "Bribe", tbl20.BribeLeviathan or function()
			end)

			tbl6._FindLeviathan = tbl16:CreateToggle(v29, "Auto Find Leviathan", "AutoFindLeviatan", false, { locked = true, global = true, stop = true })

			tbl16:CreateToggle(v29, "Ignore Sea Events While Finding", "AutoIgnoreSeaEventsLeviathan", false, {
				global = true,
				save = true,
				description = "Ignores sea beasts, sharks, and ships so boat sails uninterrupted to Leviathan",
			})

			tbl16:CreateToggle(v29, "Auto Kill Leviathan", "AutoKillLeviathan", false, { locked = true, global = true, stop = true })
			tbl16:CreateToggle(v29, "Auto Sail back to Tiki", "AutoSailbacktoTiki", false, { locked = true, global = true, stop = true })
			local v31 = tbl15.Sevent:addSection()
			local v32 = v31:addMenu("Sea Farm")
			tbl16:CreateDropdown(v32, "Select Boat", "BoatSelected", "PirateBrigade", tbl17.BoatsList or {}, { global = true, save = true })
			tbl16:CreateDropdown(v32, "Select Zone", "SeaLevelSelected", 6, tbl17.ZoneList or {}, { global = true })
			tbl16:CreateSlider(v32, "Boat Height", "BoatPosY", 0, 150, 31, { locked = true, global = true })
			tbl16:CreateSlider(v32, "Boat Speed", "SpeedBoat", 10, 250, 230, { global = true })
			local v33 = tbl16
			local createDropdown = v33.CreateDropdown
			local seaEventTargets = tbl17.SeaEventTargets
			createDropdown(v33, v32, "Sea Event Targets", "SeaEventTargets", 1, seaEventTargets or {}, { global = true }, true)
			local getAllBoats = tbl20.GetAllBoats and tbl20.GetAllBoats() or { "My Boat" }
			local v34 = tbl16:CreateDropdown(v32, "Select Owned Boat", "SailTargetBoat", "My Boat", getAllBoats, { global = true })

			local function fn58()
				if tbl20.GetAllBoats then
					getAllBoats = tbl20.GetAllBoats()
					v34:Refresh(getAllBoats)
				end
			end

			v32:addButton("Refresh Boats", fn58)

			tbl16:CreateToggle(v32, "ESP My Boat", "ESPMyBoat", false, {
				global = true,
				callback = function(espMyBoat)
					tbl.ESPMyBoat = espMyBoat

					if not espMyBoat then
						if ClearESP then
							ClearESP("MyBoat")
						end
					elseif MyBoatESP then
						MyBoatESP()
					end
				end,
			})

			tbl16:CreateToggle(v32, "Auto Drive", "AutoSail", false, { global = true, stop = true })
			local v35 = v32
			local addButton2 = v35.addButton

			addButton2(v35, "Buy New Boat", tbl20.BuyNewBoat or function()
			end)

			tbl16:CreateToggle(v32, "Auto Farm Sea Events", "AutoFarmSeaEvents", false, { global = true, description = "don't turn off Auto Drive when farming sea events, it's connected" })

			tbl16:CreateToggle(v32, "Protect Boat (Float in Combat)", "ProtectBoat", true, {
				global = true,
				save = true,
				description = "Floats your boat high in the air when fighting sea events to prevent damage",
			})

			tbl16:CreateToggle(v32, "Auto Buy New Boat When dies", "AutoBuyNewBoatWhendies", false, { global = true })
			tbl16:CreateToggle(v32, "Auto Reset Charater if boat destroyed", "ResetPlayerdestroyboat", false, { global = true })
			tbl16:CreateToggle(v32, "Auto Dodge Terror Shark", "DodgeTerror", true, { global = true, save = true })
			tbl16:CreateToggle(v32, "Auto Dodge Seabeast", "DodgefSeabeast", true, { global = true, save = true })
			tbl16:CreateToggle(v32, "Use M1 DragonStorm for Seabeast/ships", "UseDragonSforSeabeasts", false, { global = true })
			tbl16:CreateSlider(v32, "Manual Speed", "ManualBoatSpeed", 20, 250, 150, { global = true, save = true })
			tbl16:CreateToggle(v32, "Manual Increase Boat Speed", "ManualIncreaseBoatSpeed", false, { global = true, save = true })
			local Fishing = v31:addMenu("Fishing")
			tbl16:CreateDropdown(Fishing, "Fishing Rods", "SelectedRod", 1, tbl17.RodsList or {}, { global = true })
			tbl16:CreateDropdown(Fishing, "Baits", "SelectedBait", 1, tbl17.BaitsList or {}, { global = true })

			Fishing:addButton("Open Fish Index", tbl20.OpenFishIndex or function()
			end)

			tbl16:CreateToggle(Fishing, "Auto Fishing", "Auto_Fishing", false, { global = true })
			tbl16:CreateToggle(Fishing, "Auto Catch Chest", "AutoGetChest", false, { global = true })
			tbl16:CreateToggle(Fishing, "Auto Craft Bait", "AutoCraftBait", false, { global = true })
			tbl16:CreateToggle(Fishing, "Auto Get / Complete Angler Quest", "AutoGetAnglerQuest", false, { global = true, save = true })
			tbl16:CreateToggle(Fishing, "Auto Sell Fish", "AutoSellFish", false, { global = true })
			tbl16:CreateToggle(Fishing, "Auto Use Rod Skill", "AutoUseRodSkill", false, { global = true })
			tbl16:CreateToggle(v31:addMenu("FishSlap Minigame"), "Auto Fish Slap", "AutoSlap", false, { global = true })
		end)

		fn57("Player", function()
			task.wait()
			local v26 = tbl15.Player:addSection():addMenu("Player Stats")
			local v27 = v26:addLabel("Player Status", "Scanning for Information...")

			task.spawn(function()
				while task.wait(0.5) do
					if tbl20.GetStatsInfo then
						v27:RefreshDesc(tbl20.GetStatsInfo())
					end
				end
			end)

			tbl16:CreateSlider(v26, "Select Points", "PointsSlider", 0, 1000, 10, { global = true })
			tbl16:CreateToggle(v26, "Melee", "Melee", false, { global = true })
			tbl16:CreateToggle(v26, "Defense", "Defense", false, { global = true })
			tbl16:CreateToggle(v26, "Sword", "Sword", false, { global = true })
			tbl16:CreateToggle(v26, "Gun", "Gun", false, { global = true })
			tbl16:CreateToggle(v26, "Devil Fruit", "DemonFruit", false, { global = true })

			tbl16:CreateToggle(v26, "Start Adding Stats", "AutoStats", false, {
				global = true,
				callback = function(arg)
					if arg and tbl20.AutoStats then
						tbl20.AutoStats()
					end
				end,
			})

			local v28 = tbl15.Player:addSection()
			local v29 = v28:addMenu("ESP Menu")

			for _, v30 in next, {
				{ "Players ESP", "ESPPlayer", "Player", PlayerESP },
				{ "Islands ESP", "ESPIsland", "Island", IslandESP },
				{ "Fruits ESP", "DevilFruitESP", "Fruit", FruitESP },
				{ "Chests ESP", "ESPChest", "Chest", ChestESP },
				{ "Berries ESP", "ESP_Berries", "Berry", BerryESP },
				{ "Natural Fruits ESP (Pineapple, etc.)", "ESP_RealFruits", "RealFruit", RealFruitESP },
			}, nil do
				local function fn58(arg)
					tbl[v30[2]] = arg

					if not arg then
						if ClearESP then
							ClearESP(v30[3])
						end
					elseif v30[4] then
						v30[4]()
					end
				end

				tbl16:CreateToggle(v29, v30[1], v30[2], false, { callback = fn58 })
			end

			local v30 = v28:addMenu("PVP Menu")

			local function fn58()
				return tbl20.GetPlayerList and tbl20.GetPlayerList() or { "Nearest" }
			end

			local v31 = tbl16:CreateDropdown(v30, "Select Player", "SelectPlayer", 1, fn58(), { global = true })

			local function fn59()
				if v31 and v31.Refresh then
					v31:Refresh(fn58())
				end
			end

			v30:addButton("Refresh Player List", fn59)
			tbl16:CreateToggle(v30, "Cam Lock", "CamLock", false, { global = true, callback = tbl20.OnCamLockToggle })
			tbl16:CreateToggle(v30, "Spectate Player", "SpectatePlayer", false, { global = true, callback = tbl20.OnSpectateToggle })
			tbl16:CreateToggle(v30, "Teleport to Player", "TeleporttoPlayer", false, { global = true, stop = true, callback = tbl20.OnTPPlayerToggle })
			tbl16:CreateToggle(v30, "Enable Aimbot ", "EnableAimbot", false, { global = true })

			v30:addButton("Get Player Quest", tbl20.GetPlayerHunterQuest or function()
			end)

			local v32 = v28:addMenu("Server Menu")
			local v33 = v32:addLabel("Server Status", "Loading...")
			tbl6._ServerInfo = v33

			local function fn60()
				pcall(function()
					if tbl20.StatusServer then
						v33:RefreshDesc(tbl20.StatusServer())
					end
				end)
			end

			v32:addButton("Refresh Server Info", fn60)
			local v34 = v32:addLabel("Player Status", "Loading...")

			local function fn61()
				if tbl20.PlayerStatus then
					v34:RefreshDesc(tbl20.PlayerStatus())
				end
			end

			v32:addButton("Refresh Player Info", fn61)
			local v35 = v32:addLabel("Fruit Stock", "Loading fruit stock...")

			local function fn62()
				if tbl20.GetFruitStock then
					v35:RefreshDesc(tbl20.GetFruitStock())
				end
			end

			v32:addButton("Refresh Fruit Stock", fn62)

			task.spawn(function()
				task.wait(0.5)

				pcall(function()
					if tbl20.StatusServer and v33 then
						v33:RefreshDesc(tbl20.StatusServer())
					end
				end)
			end)
		end)

		fn57("Dragon Update", function()
			task.wait()
			local v26 = tbl15.Dragon:addSection()
			local v27 = v26:addMenu("Berry Farm")
			tbl16:CreateToggle(v27, "Auto Collect Berries", "AutoBerrySafe", false, { global = true, stop = true })
			tbl16:CreateToggle(v27, "Hop If No Berries", "HopIfNoBerries", false, { global = true, save = true })
			local v28 = v26:addMenu("Belt Obtainment")

			v28:addButton("Teleport to Dojo Trainer", tbl20.TPDojoTrainer or function()
			end)

			tbl16:CreateToggle(v28, "Auto White Belt", "AutoWhiteBelt", false, { global = true, stop = true })
			tbl16:CreateToggle(v28, "Auto Purple Belt", "AutoPurpleBelt", false, { global = true, stop = true })
			local v29 = tbl15.Dragon:addSection()
			local v30 = v29:addMenu("Prehistoric Event")
			tbl6._FindPrehistoricIsland = tbl16:CreateToggle(v30, "Auto Find Prehistoric Island", "AutoFindPrehistoricIsland", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v30, "Teleport to Prehistoric Island", "AutoTeleportPrehistoric", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v30, "Auto Complete Volcanic Event", "AutoVolcanicEvent", false, { global = true, stop = true })
			tbl16:CreateToggle(v30, "Use Skull Guitar for Volcano", "ShootGunVolcano", true, { global = true, save = true, description = "Uses Skull Guitar custom shoot to patch the volcano" })
			tbl16:CreateToggle(v30, "Auto Collect Bones", "AutoCollectBones", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v30, "Auto Collect Dragon Eggs", "AutoCollectEgg", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v30, "Auto Farm Blaze Ember", "AutoQuestBlaze", false, { global = true, save = true, stop = true })
			tbl16:CreateDropdown(v30, "Select Gun", "SelectGunBlaze", 1, { "Skull Guitar", "Bazooka" }, { global = true })
			tbl16:CreateToggle(v30, "Use Shoot Gun for tree quest", "ShootGunBlaze", false, { global = true, save = true })
			local v31 = v30
			local addButton = v31.addButton
			local tpDragonHunter = tbl20.TPDragonHunter

			addButton(v31, "Teleport to Dragon Hunter", tpDragonHunter or function()
			end)

			v30:addButton("Teleport to Dragon Wizard", tbl20.TPDragonWizard or function()
			end)

			tbl16:CreateToggle(v30, "Auto Upgrade Dragon Talon", "AutoUpgradeDragonTalon", false, { callback = tbl20.ToggleUpgradeDragonTalon })

			v30:addButton("Craft Volcanic Magnet", function()
				tbl20.CraftPrehistoricItem("Volcanic Magnet")
			end)

			local function fn58()
				tbl20.CraftPrehistoricItem("Dragonheart")
			end

			v30:addButton("Craft Dragonheart", fn58)

			local function fn59()
				tbl20.CraftPrehistoricItem("Dragonstorm")
			end

			v30:addButton("Craft Dragonstorm", fn59)

			local function fn60()
				tbl20.CraftPrehistoricItem("DinoHood")
			end

			v30:addButton("Craft Dino Hood", fn60)

			v30:addButton("Craft T-Rex Skull", function()
				tbl20.CraftPrehistoricItem("TRexSkull")
			end)

			local v32 = v29:addMenu("Draco Race")
			tbl6._AutoTrialDracoToggle = tbl16:CreateToggle(v32, "Teleport to Draco Trial", "AutoTrialDracoTP", false, { global = true, stop = true })

			v32:addButton("Change to Draco Race", tbl20.ChangeDracoRace or function()
			end)

			tbl16:CreateToggle(v32, "Auto Draco Race V2 ", "AutoCollectFireFlowers", false, { global = true, stop = true })
			tbl16:CreateToggle(v32, "Auto Complete Draco Trial", "AutoCompleteDracoTrial", false, { locked = true, global = true, stop = true })
		end)

		fn57("Dungeon", function()
			task.wait()
			local v26 = tbl15.Raid:addSection()
			local v27 = v26:addMenu("Raid Menu")
			local v28 = tbl16
			local createDropdown = v28.CreateDropdown
			createDropdown(v28, v27, "Raid Chip", "SelectRaid", 1, tbl17.Raids_Chip or {}, { global = true })
			tbl16:CreateToggle(v27, "Auto Buy Chip", "AutoBuyChip", false, { global = true, save = true })
			tbl6._AutoRaidToggle = tbl16:CreateToggle(v27, "Auto Complete Raid", "AutoRaidFull", false, { global = true, stop = true })
			tbl16:CreateToggle(v27, "Instant Kill Islands 4-5 ", "InstantKillLateIslands", false, { locked = true, global = true })
			tbl16:CreateToggle(v27, "Auto Unstore Below 1m Fruit", "AutoUnstoreBelowFruit", false, { global = true, save = true, description = "this will ignore fruit skins" })
			tbl16:CreateToggle(v27, "Auto Awaken", "AutoAwaken", false, { global = true, save = true })
			tbl16:CreateSlider(v27, "Frags Cap", "FragsCap", 1000, 1000000, 1000, { global = true })
			tbl16:CreateToggle(v27, "Auto stop raid when fragments reach cap", "Autostopraid", false, { global = true, save = true })
			local v29 = v26:addMenu("Dungeon Menu")

			tbl16:CreateToggle(v29, "Auto Unlock Difficulties", "AutoUnlockDifficulties", false, {
				global = true,
				save = true,
				description = "Automatically unlocks Hard and Challenge difficulties using Simulation Data",
			})

			tbl16:CreateToggle(v29, "Auto Complete Dungeon", "AutoDungeonFull", false, { global = true, stop = true })
			tbl16:CreateToggle(v29, "Auto Destroy Shrines and Vents", "AutoDungeonShrine", false, { global = true, stop = true })
			tbl16:CreateDropdown(v29, "Select Cards", "CardsSelection", 1, tbl17.DungeonCards or {}, { global = true }, true)
			tbl16:CreateToggle(v29, "Auto Select Cards", "AutoCardsDungeon", false, { global = true })

			v29:addButton("Unlock Next Difficulty", tbl20.UnlockDungeonDifficulty or function()
			end)

			local v30 = v29
			local addButton = v30.addButton

			addButton(v30, "Teleport to Dungeon Map", tbl20.TPDungeonHub or function()
			end)

			v29:addButton("Return to Previous Sea", tbl20.TPDungeonBack or function()
			end)

			tbl16:CreateToggle(v26:addMenu("Law Menu"), "Start Law Raid Farm", "AutoLawRaid", false, { global = true, stop = true, save = true })
			local v31 = tbl15.Raid:addSection()
			local v32 = v31:addMenu("Fruit Menu")

			v32:addButton("Open Normal Shop", tbl20.OpenNormalFruitShop or function()
			end)

			v32:addButton("Open Advanced Shop", tbl20.OpenAdvFruitShop or function()
			end)

			tbl16:CreateToggle(v32, "Auto Roll Fruit", "Random_Auto", false, { global = true, save = true })
			tbl16:CreateToggle(v32, "Auto Store Fruit", "AutoStoreFruit", false, { global = true, save = true })
			local v33 = v32:addLabel("Fruit Spawn Status", "Scanning for fruit...")

			task.spawn(function()
				while task.wait(1.5) do
					if tbl20.GetFruitSpawnStatus then
						v33:RefreshDesc(tbl20.GetFruitSpawnStatus())
					end
				end
			end)

			tbl16:CreateToggle(v32, "Teleport to Fruit", "Tweenfruit", false, { global = true, save = true, stop = true })
			tbl16:CreateToggle(v32, "Hop If No Fruit In Server", "HopIfNoFruit", false, { global = true, save = true })
			tbl16:CreateToggle(v32, "Fruit Notification", "FruitCheck", false, { global = true, save = true })

			v32:addButton("Teleport To Advanced Fruit Dealer", tbl20.TPAdvFruitDealer or function()
			end)

			local v34 = v31:addMenu("Trinkets & Refiner")

			v34:addButton("Buy Trinket", tbl20.BuyTrinket or function()
			end)

			tbl16:CreateToggle(v34, "Auto Buy Trinkets", "AutoBuyTrinkets", false, {
				global = true,
				save = true,
				description = "Automatically buys trinkets when fragments/currency available",
			})

			v34:addButton("Fuse / Merge 3 Trinkets", tbl20.FuseTrinkets or function()
			end)

			tbl16:CreateToggle(v34, "Auto Fuse / Merge Trinkets", "AutoFuseTrinkets", false, {
				global = true,
				save = true,
				description = "Automatically merges 3 matching trinkets to upgrade grade",
			})

			v34:addButton("Reforge / Refine Trinket", tbl20.RefineTrinket or function()
			end)

			tbl16:CreateToggle(v34, "Auto Refine Trinket", "AutoRefineTrinkets", false, { global = true, save = true, description = "Automatically rerolls/refines trinket stats" })

			v34:addButton("Open Trinket Merge GUI", tbl20.OpenTrinketMergeGUI or function()
			end)

			v34:addButton("Open Trinket Refiner GUI", tbl20.OpenTrinketRefineGUI or function()
			end)

			v34:addButton("Open Trinket Scrap / Trash GUI", tbl20.OpenTrinketScrapGUI or function()
			end)

			tbl16:CreateToggle(v34, "Auto Scrap Junk Trinkets", "AutoScrapTrinkets", false, {
				global = true,
				save = true,
				description = "Automatically scraps surplus trinkets for simulation data",
			})
		end)

		fn57("Trials", function()
			task.wait()
			local v26 = tbl15.Trial:addSection()
			local Trials = v26:addMenu("Trials")

			if tbl20.InitTempleOfTime then
				tbl20.InitTempleOfTime()
			end

			Trials:addButton("Go to Race Door", tbl20.TPRaceDoor or function()
			end)

			tbl16:CreateToggle(Trials, "Auto (Activate) Race", "AutoActiveRacenear", false, {
				global = true,
				description = "instantly activates the race the moment 2+ accounts are ready there",
			})

			tbl16:CreateToggle(Trials, "Auto Complete Trials", "AutoFinishTrial", false, { global = true, stop = true })
			tbl16:CreateToggle(Trials, "Kill Players after Trial", "AutoKillPlayerinTrial", false, { global = true, stop = true })

			Trials:addButton("Reset Character", tbl20.ResetCharHead or function()
			end)

			tbl16:CreateToggle(Trials, "Auto Choose Gear", "AutoChooseGear", false, {
				global = true,
				stop = true,
				description = "Automatically selects and places your gear in the Ancient Clock upon winning the trial",
			})

			tbl16:CreateDropdown(Trials, "Train Method", "TrainMethod", "Bones", tbl17.TrainMethods or { "Bones", "Cakes" }, { global = true })
			tbl16:CreateToggle(Trials, "Start Auto Train", "AutoTrainGear", false, { global = true, stop = true })
			tbl16:CreateToggle(Trials, "Auto Pull Lever (Fully)", "AutoFullyPullLever", false, { locked = true, global = true, save = true, stop = true })
			tbl16:CreateToggle(Trials, "Teleport To Blue Gear", "TweenMGear", false, { global = true })
			local Area = v26:addMenu("Area")

			local function fn58()
				tbl20.TPTrialArea("GreatTree")
			end

			Area:addButton("Teleport to Top of Great Tree", fn58)

			Area:addButton("Teleport to Temple of Time", function()
				tbl20.TPTrialArea("TempleOfTime")
			end)

			Area:addButton("Teleport to Ancient One", function()
				tbl20.TPTrialArea("AncientOne")
			end)

			local function fn59()
				tbl20.TPTrialArea("LeverPull")
			end

			Area:addButton("Teleport to Lever Pull", fn59)

			local function fn60()
				tbl20.TPTrialArea("SafeZone")
			end

			Area:addButton("Teleport to Safe Zone", fn60)

			Area:addButton("Teleport back to Pvp Zone", function()
				tbl20.TPTrialArea("PvpZone")
			end)

			Area:addButton("Teleport to Clock", function()
				tbl20.TPTrialArea("Clock")
			end)

			local v27 = tbl15.Trial:addSection()
			local v28 = v27:addMenu("Misc Trial")
			tbl16:CreateToggle(v28, "Auto Upgrade Gear", "BuyGear", false, { global = true })
			tbl16:CreateToggle(v28, "Auto Activate V3", "AutoAgility", false, { global = true, save = true })
			tbl16:CreateToggle(v28, "Auto Activate V4", "AutoActiveRaceV4", false, { global = true, save = true })
			tbl16:CreateToggle(v28, "Auto Look Moon", "AutoLookMoon", false, { global = true })
			local Upgrades = v27:addMenu("Upgrades")
			tbl16:CreateToggle(Upgrades, "Auto Race Evolve V2", "AutoStartRaceV2", false, { global = true, stop = true })
			tbl16:CreateToggle(Upgrades, "Auto Race Evolve V3", "AutoStartRaceV3", false, { global = true, stop = true })
			local v29 = v27:addMenu("Race Obtainment")
			tbl16:CreateToggle(v29, "Auto Get Ghoul Race [Fully]", "AutoGetGhoulRace", false, { global = true, stop = true })
			tbl16:CreateToggle(v29, "Auto Get Cyborg Race [Fully]", "AutoGetCyborgRace", false, { global = true, stop = true })
		end)

		local function fn58()
			task.wait()
			local v26 = tbl15.Travel:addSection()
			local v27 = v26:addMenu("World Travel")

			local function fn59()
				tbl6:FireInvoke("TravelMain")
			end

			v27:addButton("Teleport to World 1", fn59)

			local function fn60()
				tbl6:FireInvoke("TravelDressrosa")
			end

			v27:addButton("Teleport to World 2", fn60)

			local function fn61()
				tbl6:FireInvoke("TravelZou")
			end

			v27:addButton("Teleport to World 3", fn61)
			local v28 = v26:addMenu("Island Travel")
			tbl6._ActiveIslands = tbl17.ActiveIslands or {}
			tbl16:CreateDropdown(v28, "Select Island", "TeleportIslandSelect", "walang kayo sorry", tbl17.IslandsList or {}, { global = true })
			tbl6._TravelToggle = tbl16:CreateToggle(v28, "Start Traveling", "TeleportToIsland", false, { global = true, stop = true })
			local v29 = v26:addMenu("NPC Travel")
			tbl16:CreateDropdown(v29, "Select Npc", "NpcTween", 1, tbl17.NPCList or {}, { global = true })
			tbl16:CreateToggle(v29, "Start Traveling", "TPtoNPC", false, { global = true, stop = true })
			local v30 = tbl15.Travel:addSection()
			local v31 = v30:addMenu("Server Travel")
			tbl16:CreateTextbox(v31, "JobID [" .. game.PlaceId .. "]", "JobID", { save = false, callback = tbl20.TeleportJobID })
			tbl16:CreateTextbox(v31, "Onion Server [" .. game.PlaceId .. "]", "QuantumPremium", { save = false, callback = tbl20.TeleportQuantumPremium })

			v31:addButton("Copy Current Job ID", function()
				setclipboard(tostring(game.JobId))
			end)

			local v32 = v30:addMenu("Misc Travel")

			v32:addButton("Rejoin Server", tbl20.RejoinServer or function()
			end)

			local addButton = v32.addButton

			addButton(v32, "Server Hop, Random Server", tbl20.ServerHop or function()
			end)

			local v33 = v30:addMenu("Onion Joiner")

			v33:addButton("Join Full Moon Server", function()
				tbl20.JoinAPI("FullMoon")
			end)

			v33:addButton("Join Near Full Moon Server", function()
				tbl20.JoinAPI("NearFullMoon")
			end)

			v33:addButton("Join Mirage Island Server", function()
				tbl20.JoinAPI("mirage")
			end)

			local function fn62()
				tbl20.JoinAPI("elites")
			end

			v33:addButton("Join Elite Hunter Server", fn62)

			v33:addButton("Join Kitsune Island Server", function()
				tbl20.JoinAPI("kitsune")
			end)

			local function fn63()
				tbl20.JoinAPI("prehistoric")
			end

			v33:addButton("Join Prehistoric Island Server", fn63)

			v33:addButton("Join Factory Raid Server", function()
				tbl20.JoinAPI("factory")
			end)

			v33:addButton("Join 4 Hours Server", function()
				tbl20.JoinAPI("fourhours")
			end)

			v33:addButton("Join Castle Raid Server", function()
				tbl20.JoinAPI("pirate")
			end)

			tbl16:CreateDropdown(v33, "Select Legendary Sword", "SelectLegendarySword", 1, tbl17.LegendarySwordNames or { "Shizu", "Oroshi", "Saishi" }, { global = true })

			local function fn64()
				tbl20.JoinAPI("legendarysword")
			end

			v33:addButton("Join Legendary Sword Server", fn64)

			v33:addButton("Join Fruit Server", function()
				tbl20.JoinAPI("fruit")
			end)

			local v34 = tbl16
			local createDropdown = v34.CreateDropdown
			createDropdown(v34, v33, "Select Boss", "SelectBosstoHop", 1, tbl17.BossHopNames or {}, { global = true })

			v33:addButton("Join Raid Boss Server", tbl20.JoinRaidBossServer or function()
			end)

			local v35 = v30:addMenu("AFK Onion Joiner")
			tbl16:CreateSlider(v35, "Hop Delay (s)", "HopDelay", 1, 60, 10, { global = true, save = true })
			tbl16:CreateToggle(v35, "Auto Afk Join Castle Raid", "AutoAfkJoinCastleRaid", false, { locked = true, save = true, global = true })
			tbl16:CreateToggle(v35, "Auto Afk Join Factory Raid", "AutoAfkJoinFactoryRaid", false, { locked = true, global = true, save = true })
			tbl16:CreateToggle(v35, "Auto Afk Join Boss Raid", "AutoAfkJoinBossRaid", false, { locked = true, global = true, save = true })
			tbl16:CreateToggle(v35, "Auto Afk Join Elite Hunter", "AutoAfkJoinEliteHunter", false, { locked = true, global = true, save = true })
			tbl16:CreateToggle(v35, "Auto Afk Join Fruit", "AutoAfkJoinFruit", false, { locked = true, global = true, save = true })
			tbl16:CreateToggle(v35, "Stop Hop If Chalice / Fist", "StopHopEliteIfChalice", true, { global = true, save = true })
		end

		fn57("Travel", fn58)

		fn57("Shop", function()
			task.wait()
			local v26 = tbl15.Shop:addSection()
			local v27 = v26:addMenu("Selection Shop")
			tbl16:CreateDropdown(v27, "Select Melee", "SelectMelee", 1, tbl17.MeleeNames or {}, { global = true })
			tbl16:CreateToggle(v27, "Auto Buy Melee", "AutoBuyMelee", false, { global = true, stop = true })
			tbl16:CreateDropdown(v27, "Abilities", "BuyAbility", "Geppo", tbl17.AbilityNames or {}, { global = true })

			v27:addButton("Buy Ability", function()
				if tbl.BuyAbility and tbl20.BuyItem then
					tbl20.BuyItem(tbl.BuyAbility, "Ability")
				end
			end)

			tbl16:CreateDropdown(v27, "Gun list", "GunSelect", "Slingshot", tbl17.GunNames or {}, { global = true })

			v27:addButton("Buy Gun", function()
				if tbl.GunSelect and tbl20.BuyItem then
					tbl20.BuyItem(tbl.GunSelect, "Gun")
				end
			end)

			tbl16:CreateDropdown(v27, "Accessories", "BuyAccessories", 1, tbl17.AccessoryNames or {}, { global = true })

			local function fn59()
				if tbl.BuyAccessories and tbl20.BuyItem then
					tbl20.BuyItem(tbl.BuyAccessories, "Accessory")
				end
			end

			v27:addButton("Buy Accessory", fn59)
			local v28 = v26:addMenu("Item Shop")
			tbl16:CreateToggle(v28, "Buy Haki Color", "AutoBuyEnchancementColor", false, { global = true, save = true })
			tbl16:CreateToggle(v28, "Buy Legendary Sword", "BuyLegendSword", false, { global = true, save = true })
			tbl16:CreateToggle(v28, "Buy True Triple Katana", "BuyTTK", false, { global = true, save = true })
			local v29 = tbl15.Shop:addSection()
			local v30 = v29:addMenu("Normal Fruit Dealer")
			tbl16:CreateDropdown(v30, "Select Fruit to Buy", "SelectFruitDealerFruit", "Buddha-Buddha", tbl17.DealerFruitList or {}, { global = true, save = true })
			tbl16:CreateToggle(v30, "Auto Buy Fruit (Normal Dealer)", "AutoBuyFruitDealer", false, { global = true, save = true })
			local addButton = v30.addButton

			addButton(v30, "Buy Selected Fruit", tbl20.BuySelectedFruit or function()
			end)

			local v31 = v29:addMenu("Race Shop")

			v31:addButton("Cyborg Race", tbl20.BuyCyborgRace or function()
			end)

			v31:addButton("Ghoul Race", tbl20.BuyGhoulRace or function()
			end)

			local v32 = v29:addMenu("Fragment Shop")

			local function fn60()
				if tbl20.BuyItem then
					tbl20.BuyItem("Race Rerol", "Frags")
				end
			end

			v32:addButton("Reroll Race", fn60)

			local function fn61()
				if tbl20.BuyItem then
					tbl20.BuyItem("Reset Stats", "Frags")
				end
			end

			v32:addButton("Reset Player Stats", fn61)
			local v33 = v29:addMenu("Scroll Crafting & Trade")
			tbl16:CreateDropdown(v33, "Select Scroll", "SelectScrollType", "Common Scroll", { "Common Scroll", "Rare Scroll", "Legendary Scroll", "Mythical Scroll" }, { global = true, save = true })
			tbl16:CreateSlider(v33, "Craft Amount", "ScrollCraftAmount", 1, 10, 1, { global = true })

			v33:addButton("Craft Selected Scroll", tbl20.CraftScroll or function()
			end)

			tbl16:CreateToggle(v33, "Auto Craft Selected Scroll", "AutoCraftScrolls", false, {
				global = true,
				save = true,
				description = "Automatically crafts scrolls when you have sufficient materials",
			})
		end)

		fn57("Misc", function()
			task.wait()
			local v26 = tbl15.Misc:addSection()
			local v27 = v26:addMenu("Team Selection")

			v27:addButton("Join Marines Team", function()
				tbl6:FireInvoke("SetTeam", "Marines")
			end)

			v27:addButton("Join Pirates Team", function()
				tbl6:FireInvoke("SetTeam", "Pirates")
			end)

			local v28 = v26:addMenu("Menu Openings")

			v28:addButton("Open Title Names", tbl20.OpenTitleNames or function()
			end)

			v28:addButton("Open Awakenings", tbl20.OpenAwakenings or function()
			end)

			local v29 = v26:addMenu("Fake Admin")
			v29:addButtonGrid("Admin Panel", tbl17.AdminPanelGrid or {})
			local v30 = tbl15.Misc:addSection():addMenu("Players Clients")
			tbl16:CreateToggle(v30, "Remove Observation Effect", "RemoveObservationEffect", false, { global = true, save = true })
			tbl16:CreateSlider(v30, "Walk Speed", "WalkSpeed", 50, 500, 50, { callback = tbl20.SetWalkSpeed })
			tbl16:CreateSlider(v30, "Jump Power", "JumpPower", 50, 500, 50, { callback = tbl20.SetJumpPower })
			tbl16:CreateToggle(v30, "X-ray Vision", "XrayVision", false, { callback = tbl20.ToggleXray })
			tbl16:CreateToggle(v30, "Infinite Zoom", "InfiniteZoom", false, { callback = tbl20.ToggleInfiniteZoom })
			tbl16:CreateToggle(v30, "White Screen", "White_Screen", false, { callback = tbl20.ToggleWhiteScreen })
			tbl16:CreateToggle(v30, "Black Screen", "BlackScreen", false, { callback = tbl20.ToggleBlackScreen })
			local v31 = v30
			local addButton = v31.addButton

			addButton(v31, "Redeem all Codes", tbl20.RedeemAllCodes or function()
			end)

			tbl16:CreateToggle(v30, "Remove Fog", "NoFog", false, { global = true, save = true })

			v30:addButton("Force FPS BOOST", tbl20.ForceFPSBoost or function()
			end)

			v30:addButton("Developer Console", tbl20.OpenDevConsole or function()
			end)

			v30:addButton("Clean Memory / Free RAM (GC)", tbl20.CleanMemory or function()
			end)

			tbl16:CreateToggle(v30, "Auto Memory Cleaner (60s)", "AutoCleanMemory", true, { global = true, save = true })

			tbl16:CreateToggle(v30, "Auto Turn On Fast Mode", "AutoFastMode", false, {
				global = true,
				save = true,
				description = "Automatically enables the game's built-in Fast Mode setting to maximize FPS",
				callback = tbl20.OnFastModeToggle,
			})
		end)

		fn57("Webhook", function()
			task.wait()
			local v26 = tbl15.Web:addSection()
			local v27 = v26:addMenu("General Webhook")
			tbl16:CreateTextbox(v27, "Main Webhook Url", "Webhook", { save = true, global = true })
			tbl16:CreateToggle(v27, "Enable Send Webhook", "AutoWebhook", false, { global = true, save = true })

			v27:addButton("Send Test Webhook", tbl20.SendTestWebhook or function()
			end)

			local v28 = v26:addMenu("World & Fruit Events")
			tbl16:CreateToggle(v28, "Send Webhook Prehistoric", "SendWebhookPrehistoric", false, { global = true, save = true })
			tbl16:CreateToggle(v28, "Send Webhook Kitsune", "SendWebhookKitsune", false, { global = true, save = true })
			tbl16:CreateToggle(v28, "Send Webhook Mirage", "SendWebhookMirage", false, { global = true, save = true })
			tbl16:CreateToggle(v28, "Send Webhook Rolled Fruit", "SendWebhookRolledFruit", false, { global = true, save = true })
			tbl16:CreateToggle(v28, "Send Webhook Store Fruit", "SendWebhookStoreFruit", false, { global = true, save = true })
			local v29 = tbl15.Web:addSection()
			local v30 = v29:addMenu("Data Log & Farm Tracker")
			tbl16:CreateToggle(v30, "Enable Data Log Webhook", "SendWebhookDataLog", false, { global = true, save = true })
			tbl16:CreateTextbox(v30, "DataLog Webhook URL (Optional)", "DataLogWebhookUrl", { save = true, global = true })
			tbl16:CreateSlider(v30, "Data Log Interval (Minutes)", "DataLogInterval", 1, 60, 5, { global = true, save = true })
			tbl16:CreateToggle(v30, "Send on Level Up", "SendWebhookLevelUp", false, { global = true, save = true })
			tbl16:CreateToggle(v30, "Include Inventory in Data Log", "SendWebhookInventory", true, { global = true, save = true })
			tbl16:CreateToggle(v30, "Include Farms All Summary", "SendWebhookFarmsAll", true, { global = true, save = true })
			local addButton = v30.addButton
			local sendDataLogNow = tbl20.SendDataLogNow

			addButton(v30, "Send Data Log Now", sendDataLogNow or function()
			end)

			local v31 = v29:addMenu("Webhook Ping & Settings")
			tbl16:CreateTextbox(v31, "Discord User ID (For Ping)", "WebhookPingId", { save = true, global = true })
			tbl16:CreateToggle(v31, "Ping on Mirage / Kitsune", "WebhookPingOnEvents", false, { global = true, save = true })
			tbl16:CreateToggle(v31, "Ping on Mythical Fruit", "WebhookPingOnMythical", false, { global = true, save = true })
		end)
	end

	tbl6.LoadLoops = function()
		tbl6.Loops = tbl6.Loops or {}
		local tbl15 = {}

		local function fn30(arg, arg2, arg3, arg4)
			if not arg or type(arg3) ~= "function" then
				return
			end

			if tbl15[arg] then
				tbl15[arg].Active = false

				if tbl15[arg].Thread then
					task.cancel(tbl15[arg].Thread)
					tbl15[arg].Thread = nil
				end
			end

			local tbl16 = {
				Name = arg,
				Interval = arg2 or 0,
				Func = arg3,
				NoCheck = arg4 or false,
				Running = false,
				Active = true,
				Stop = function()
					if tbl then
						tbl[arg] = false
					end

					if tbl6.Loops[arg] then
						tbl6.Loops[arg].Running = false
					end
				end,
			}

			tbl6.Loops[arg] = tbl16
			tbl15[arg] = tbl16

			local function fn31()
				local n2 = arg2 and arg2 > 0 and arg2 or 0.03

				while tbl16.Active do
					if tbl16.NoCheck or tbl and tbl[arg] then
						tbl16.Running = true
						pcall(arg3)
						tbl16.Running = false
						task.wait(n2)
					else
						task.wait(0.5)
					end
				end
			end

			tbl16.Thread = task.spawn(fn31)
		end

		fn30("ESPPlayer", 0.5, PlayerESP)
		fn30("ESPIsland", 2, IslandESP)
		fn30("DevilFruitESP", 1, FruitESP)
		fn30("ESPChest", 1.5, ChestESP)
		fn30("ESP_Berries", 1.5, BerryESP)
		fn30("ESP_RealFruits", 1.5, RealFruitESP)
		fn30("ESPMyBoat", 1.5, MyBoatESP)

		fn30("AutoFastMode", 3, function()
			if not tbl2.Performance.FastMode then
				tbl2.Performance.SetFastMode(true)
			end
		end)

		local v22 = nil

		fn30("QuantumAttack", 0.5, function()
			if tbl.QuantumAttack then
				if not v22 then
					v22 = hookfunction(task.delay, function(arg, arg2, ...)
						if arg > 0.1 then
							return v22(0, arg2, ...)
						end
						return v22(arg, arg2, ...)
					end)

					require(v4.Util.CameraShaker):Stop()
				end
			elseif v22 then
				hookfunction(task.delay, v22)
				v22 = nil
			end
		end, true)

		local now = tick()
		local now2 = tick()
		local now3 = tick()
		local now4 = tick()
		local now5 = tick()
		local n2 = 0

		local function fn31(arg)
			local notifications = v18.PlayerGui:FindFirstChild("Notifications")
			if not notifications then
				return false
			end
			local v23, v24, v25 = ipairs(notifications:GetChildren())
			local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v23, v24, v25)

			for _, v26 in v23, v24, v25 do
				for _, child in ipairs(v26:GetChildren()) do
					if child:IsA("TextLabel") and string.find(child.Text, arg) then
						return true
					end
				end
			end

			local _vm_a_0
			_vm_a_1 = _vm_a_0
			local _vm_U_0
			local _vm_U_1 = _vm_U_0
			local _vm___0
			local _vm___1 = _vm___0
			return false
		end

		local function fn32()
			if tick() - now < 2.5 then
				now4 = tick()
			else
				local selectBosstoHop = tbl.SelectBosstoHop

				if type(selectBosstoHop) == "number" or not selectBosstoHop or selectBosstoHop == "" then
					selectBosstoHop = bossHopNames[selectBosstoHop] or bossHopNames[1] or "rip_indra True Form"
				end

				local str4 = tbl14[selectBosstoHop] or selectBosstoHop or "Ripindra"

				if selectBosstoHop and str4 then
					local connectMon = utilities:GetConnectMon(selectBosstoHop)
					local flag4 = not connectMon
					local flag5

					if flag4 then
						flag5 = selectBosstoHop == "rip_indra True Form" or selectBosstoHop == "Ripindra"
					else
						flag5 = flag4
					end

					if flag5 then
						connectMon = utilities:GetConnectMon("rip_indra") or utilities:GetConnectMon("rip_indra True Form")
					end

					if not connectMon then
						if tick() - now4 >= 3 then
							now4 = tick()
							joinAPI(str4, 0)
						end
					else
						now4 = tick()
					end
				end
			end
		end

		fn30("AutoAfkJoinBossRaid", 0.4, fn32)

		fn30("AutoAfkJoinEliteHunter", 0.4, function()
			if not flag3 then
				return
			end

			if tick() - now < 2.5 then
				now5 = tick()
			else
				local stopHopEliteIfChalice = tbl.StopHopEliteIfChalice
				local v23

				if stopHopEliteIfChalice then
					v23 = utilities:CheckToolName("God's Chalice") or utilities:CheckToolName("Sweet Chalice") or utilities:CheckToolName("Fist of Darkness")
				else
					v23 = stopHopEliteIfChalice
				end

				if v23 then
					tbl.AutoAfkJoinEliteHunter = false

					if tbl6 and tbl6.Toggles and tbl6.Toggles.AutoAfkJoinEliteHunter and tbl6.Toggles.AutoAfkJoinEliteHunter.Update then
						pcall(function()
							tbl6.Toggles.AutoAfkJoinEliteHunter.Update(false)
						end)
					end

					if tbl6 and tbl6.SendNotify then
						tbl6:SendNotify("Elite Hunter", "Chalice / Fist detected! Stopped auto elite hop.", 5)
					end
				else
					local v24 = gameData:Checkelites()

					if not v24 and tick() - n2 >= 1.5 then
						n2 = tick()

						pcall(function()
							tbl6:FireInvoke("EliteHunter")
						end)

						task.wait(0.2)
						v24 = gameData:Checkelites()
					end

					if v24 then
						now5 = tick()

						if not VerifyQuest(v24) then
							pcall(function()
								tbl6:FireInvoke("AbandonQuest")
							end)

							task.wait(0.1)

							pcall(function()
								tbl6:FireInvoke("EliteHunter")
							end)
						else
							local enemies2 = utilities:GetEnemies(v24)

							if enemies2 then
								subFunction:Attack(enemies2)
							end
						end
					elseif tick() - now5 >= 3 then
						now5 = tick()
						joinAPI("elites", 0)
					end
				end
			end
		end)

		local function fn33()
			if not flag3 then
				return
			end

			if tick() - now < 2.5 then
				now2 = tick()
			elseif gameData:DetectPirateRaid() then
				now2 = tick()
			elseif fn31("Good job!") or tick() - now2 >= 10 then
				joinAPI("pirate", 0)
				now2 = tick()
			end
		end

		fn30("AutoAfkJoinCastleRaid", 0.4, fn33)

		fn30("AutoAfkJoinFactoryRaid", 0.4, function()
			if not flag2 then
				return
			end

			if tick() - now < 2.5 then
				now3 = tick()
			elseif utilities:CheckMon("Core") then
				now3 = tick()
			elseif fn31("MALffffUNCtion. END") or tick() - now3 >= 3 then
				joinAPI("factory", 0)
				now3 = tick()
			end
		end)

		local now6 = tick()

		local function fn34()
			for _, child in ipairs(v2:GetChildren()) do
				local isTool = child:IsA("Tool")
				local pos

				if isTool then
					pos = child.ToolTip == "Blox Fruit" or child.Name:find("Fruit") or child:FindFirstChild("Handle")
				else
					pos = isTool
				end

				if pos then
					local handle = child:FindFirstChild("Handle") or child:FindFirstChildWhichIsA("BasePart")
					if handle then
						return child, handle
					end
				end
			end

			return nil, nil
		end

		fn30("AutoAfkJoinFruit", 0.4, function()
			if tick() - now < 2.5 then
				now6 = tick()
				return
			end
			local v23, v24 = fn34()

			if v23 and v24 then
				now6 = tick()

				if humanoidRootPart then
					tweenManager:topos(v24.CFrame)

					if (humanoidRootPart.Position - v24.Position).Magnitude <= 30 then
						firetouchinterest(humanoidRootPart, v24, 0)
						task.wait(0.1)
						firetouchinterest(humanoidRootPart, v24, 1)
					end
				end

				local v25 = v18.Backpack:FindFirstChild(v23.Name)
				local character2

				if v25 then
					character2 = v25
				else
					character2 = v18.Character and v18.Character:FindFirstChild(v23.Name)
				end

				if character2 then
					local attribute2 = character2:GetAttribute("OriginalName") or character2.Name

					pcall(function()
						tbl6:FireInvoke("StoreFruit", attribute2, character2)
					end)
				end
			elseif tick() - now6 >= 3 then
				now6 = tick()
				joinAPI("fruit", 0)
			end
		end)

		local tbl16 = {}
		local flag4 = false
		local n3 = level and level.Value or 0

		fn30("AutoDataLogWebhook", 5, function()
			if level and level.Value then
				if level.Value > n3 then
					local n4 = level.Value - n3
					n3 = level.Value
					local sendWebhookLevelUp = tbl.SendWebhookLevelUp

					if sendWebhookLevelUp and (tbl.AutoWebhook or tbl.SendWebhookDataLog) then
						tbl2.Webhook:SendDataLog("Level Up Detected!", "**New Level Reached:** " .. fn17(level.Value) .. " *(+" .. n4 .. ")*")
					end
				elseif level.Value < n3 then
					n3 = level.Value
				end
			end

			local sendWebhookDataLog = tbl.SendWebhookDataLog
			local flag5

			if sendWebhookDataLog then
				local autoWebhook = tbl.AutoWebhook

				if autoWebhook then
					flag5 = autoWebhook
				else
					flag5 = tbl.DataLogWebhookUrl and tbl.DataLogWebhookUrl ~= ""
				end
			else
				flag5 = sendWebhookDataLog
			end

			if flag5 then
				if math.max(60, (tonumber(tbl.DataLogInterval) or 5) * 60) <= tick() - tbl2.Runtime.LastDataLogTick then
					tbl2.Webhook:SendDataLog("OnionHub - Periodic Farm Data Log")
				end
			end
		end, true)

		local function fn35()
			if tbl.AutoCleanMemory ~= false then
				tbl2.Performance.CleanMemory()
			end
		end

		fn30("AutoMemoryCleaner", 60, fn35, true)

		fn30("AutoDebrisLagCleaner", 15, function()
			if tbl.AutoClearDebris ~= false then
				tbl2.Performance.ClearDebris()
			end

			if tbl.AutoAggressiveGC ~= false then
				tbl2.Performance.CleanMemory()
			end
		end, true)

		local function fn36()
			if not tbl.RemoveObservationEffect then
				return
			end

			pcall(function()
				if v18:GetAttribute("KenActive") then
					local v23 = next
					local children, v24 = v7:GetChildren()

					for _, v25 in v23, children, v24 do
						if v25:IsA("BlurEffect") and v25.Name == "Blur" then
							v25.Enabled = false
						elseif v25:IsA("ColorCorrectionEffect") and v25.Name == "ColorCorrection" then
							v25.Enabled = false
						end
					end

					local currentCamera = workspace.CurrentCamera

					if currentCamera then
						local v25 = next
						local children2, v26 = currentCamera:GetChildren()

						for _, v27 in v25, children2, v26 do
							local isBasePart = v27:IsA("BasePart")

							if isBasePart and v27.Name:lower():find("ken") then
								v27.Transparency = 1
							end
						end
					end
				end
			end)
		end

		fn30("RemoveObservationEffect", 0.2, fn36, true)

		local function fn37()
			if tbl.SendWebhookPrehistoric or tbl.SendWebhookKitsune or tbl.SendWebhookMirage then
				for k, v23 in next, {
					["Prehistoric Island"] = tbl.SendWebhookPrehistoric,
					["Kitsune Island"] = tbl.SendWebhookKitsune,
					["Mirage Island"] = tbl.SendWebhookMirage,
				}, nil do
					if v23 then
						local v24 = worldOrigin.Locations:FindFirstChild(k)

						if v24 and not tbl16[k] then
							tbl16[k] = true
							PostWebhook(tbl.Webhook, WeeboLogs(k, { Position = v24:GetPivot().Position }))
						elseif not v24 then
							tbl16[k] = false
						end
					end
				end
			end

			if not flag4 then
				flag4 = true

				commE.OnClientEvent:Connect(function(arg, arg2, arg3)
					if arg == "ItemChanged" and arg3 == "stored" and arg2 and arg2.Name then
						if tbl.SendWebhookStoreFruit then
							local getInventory = tbl6:FireInvoke("getInventory")
							local tbl17 = {}

							for _, v23 in pairs(getInventory) do
								if v23.Type == "Blox Fruit" then
									table.insert(tbl17, v23.Name)
								end
							end

							local v23 = PostWebhook
							local webhook = tbl.Webhook
							local v24 = WeeboLogs
							local tbl18 = { Extra = "**Fruit:** " .. arg2.Name }
							tbl18.Field2 = { name = "Inventory", value = #tbl17 > 0 and table.concat(tbl17, ", ") or "Empty" }
							v23(webhook, v24("Stored Fruit", tbl18))
						end
					end
				end)

				game:GetService("ReplicatedStorage").Modules.Net["RE/SpinGacha"].OnClientEvent:Connect(function(arg)
					if arg and arg.Winners and arg.Winners[1] then
						if tbl.SendWebhookRolledFruit then
							local v23 = arg.Winners[1]

							if v23.ItemType == "Fruit" and v23.DisplayName then
								PostWebhook(tbl.Webhook, WeeboLogs("Rolled Fruit", { Extra = "**Fruit:** " .. v23.DisplayName }))
							end
						end
					end
				end)
			end
		end

		fn30("AutoWebhook", 1, fn37)
		local n4 = 0

		local function fn38()
			if tick() - n4 < 3 then
				return
			end
			n4 = tick()

			if tbl6._ServerInfo and type(tbl6._ServerInfo.RefreshDesc) == "function" and type(tbl6._StatusServer) == "function" then
				pcall(function()
					local v23 = tbl6._StatusServer()

					if v23 then
						tbl6._ServerInfo:RefreshDesc(v23)
					end
				end)
			end
		end

		fn30("AutoServerRefresh", 3, fn38, true)

		fn30("TradeAzureEmber", 0.5, function()
			if utilities:CheckInventory("Material", "Azure Ember") >= tbl.SetAzureEmber then
				net:FindFirstChild("RF/KitsuneStatuePray"):InvokeServer()
				tbl6:FireInvoke("KitsuneStatuePray")
			end
		end)

		fn30("AutoGetAnglerQuest", 2, function()
			local rfJobsRemoteFunction = net:FindFirstChild("RF/JobsRemoteFunction")

			if rfJobsRemoteFunction then
				pcall(function()
					rfJobsRemoteFunction:InvokeServer("FishingNPC", "Angler", "CheckQuest")
					local response = rfJobsRemoteFunction:InvokeServer("FishingNPC", "Angler", "Speak")

					if response then
						response = response.canAccept or not response.IsInQuest
					end

					if response then
						rfJobsRemoteFunction:InvokeServer("FishingNPC", "Angler", "AskQuest")
					end
				end)
			end
		end)

		local function fn39()
			net:WaitForChild("RF/JobToolAbilities"):InvokeServer("Z", true)
		end

		fn30("AutoUseRodSkill", 0.5, fn39)

		fn30("FruitCheck", 1, function()
			local v23 = next
			local children, v24 = v2:GetChildren()

			for _, v25 in v23, children, v24 do
				local isModel = v25:IsA("Model")

				if isModel and string.find(v25.Name, "Fruit") then
					local name2 = v25.Name

					if name2 == "Fruit" then
						name2 = "Spawned Unknown Fruit"
					end

					tbl6:SendNotify("Blox Fruit Spawned", "" .. name2 .. " has spawned in the map!", 15)
				end
			end
		end)

		fn30("AutoAwaken", 0.5, function()
			tbl6:FireInvoke("Awakener", "Check")
			tbl6:FireInvoke("Awakener", "Awaken")
		end)

		local n5 = 0

		fn30("AutoBuyFruitDealer", 5, function()
			if not tbl.AutoBuyFruitDealer or not tbl.SelectFruitDealerFruit then
				return
			end

			if tick() - n5 < 10 then
				return
			end
			local selectFruitDealerFruit = tbl.SelectFruitDealerFruit
			if not selectFruitDealerFruit or selectFruitDealerFruit == "" then
				return
			end

			local ok, result = pcall(function()
				return tbl6:FireInvoke("GetFruits")
			end)

			if ok and typeof(result) == "table" then
				local exitTo = nil

				for k in next, result, nil do
					if f and (f.Name == selectFruitDealerFruit or f.Name:match("^(.-)%-") == selectFruitDealerFruit:match("^(.-)%-")) then
						exitTo = 1
						break
					end
				end

				if exitTo == 1 then
					if f.OnSale == true then
						local n6 = beli and beli.Value or 0
						local n7 = tonumber(f.Price) or 0

						if n6 >= n7 then
							n5 = tick()

							if pcall(function()
								return tbl6:FireInvoke("PurchaseRawFruit", f.Name, false)
							end) then
								tbl6:SendNotify("Fruit Dealer", "Auto-bought " .. f.Name .. " for $" .. fn17(n7) .. "!", 6)

								if tbl.SendWebhookStoreFruit or tbl.AutoWebhook then
									local dataLogWebhookUrl = tbl.DataLogWebhookUrl and tbl.DataLogWebhookUrl ~= "" and tbl.DataLogWebhookUrl or tbl.Webhook

									if dataLogWebhookUrl and dataLogWebhookUrl ~= "" then
										local v23 = PostWebhook
										local v24 = WeeboLogs

										local tbl17 = {
											Extra = "**Auto Purchased Fruit:** " .. f.Name .. " ($" .. fn17(n7) .. ")",
										}

										tbl17.Field2 = {
											name = "Beli Remaining",
											value = "$" .. fn17((beli and beli.Value or 0) - n7),
										}

										v23(dataLogWebhookUrl, v24("Fruit Dealer Purchase", tbl17))
									end
								end
							end
						end
					end
				end
			end
		end, true)

		local n6 = 0

		fn30("AutoBuyMirageFruitDealer", 5, function()
			if not tbl.AutoBuyMirageFruitDealer or not tbl.SelectMirageDealerFruit then
				return
			end

			if tick() - n6 < 10 then
				return
			end
			local selectMirageDealerFruit = tbl.SelectMirageDealerFruit
			if not selectMirageDealerFruit or selectMirageDealerFruit == "" then
				return
			end

			local ok, result = pcall(function()
				return tbl6:FireInvoke("GetFruits", true)
			end)

			if ok and typeof(result) == "table" then
				local exitTo = nil

				for k in next, result, nil do
					if f and (f.Name == selectMirageDealerFruit or f.Name:match("^(.-)%-") == selectMirageDealerFruit:match("^(.-)%-")) then
						exitTo = 1
						break
					end
				end

				if exitTo == 1 then
					if f.OnSale == true then
						local n7 = beli and beli.Value or 0
						local n8 = tonumber(f.Price) or 0

						if n7 >= n8 then
							n6 = tick()

							if pcall(function()
								return tbl6:FireInvoke("PurchaseRawFruit", f.Name, true)
							end) then
								tbl6:SendNotify("Mirage Dealer", "Auto-bought " .. f.Name .. " for $" .. fn17(n8) .. "!", 6)

								if tbl.SendWebhookStoreFruit or tbl.AutoWebhook then
									local dataLogWebhookUrl = tbl.DataLogWebhookUrl and tbl.DataLogWebhookUrl ~= "" and tbl.DataLogWebhookUrl or tbl.Webhook

									if dataLogWebhookUrl and dataLogWebhookUrl ~= "" then
										local v23 = PostWebhook
										local v24 = WeeboLogs

										local tbl17 = {
											Extra = "**Auto Purchased Mirage Fruit:** " .. f.Name .. " ($" .. fn17(n8) .. ")",
										}

										tbl17.Field2 = {
											name = "Beli Remaining",
											value = "$" .. fn17((beli and beli.Value or 0) - n8),
										}

										v23(dataLogWebhookUrl, v24("Mirage Fruit Dealer Purchase", tbl17))
									end
								end
							end
						end
					end
				end
			end
		end, true)

		local n7 = 0

		fn30("AutoCraftScrolls", 5, function()
			if not tbl.AutoCraftScrolls then
				return
			end

			if tick() - n7 < 5 then
				return
			end
			n7 = tick()

			local str4 = ({
				["Common Scroll"] = "CommonScroll",
				["Rare Scroll"] = "RareScroll",
				["Legendary Scroll"] = "LegendaryScroll",
				["Mythical Scroll"] = "MythicalScroll",
			})[tbl.SelectScrollType or "Common Scroll"] or "CommonScroll"

			local n8 = tonumber(tbl.ScrollCraftAmount) or 1

			pcall(function()
				Net:RemoteFunction("Craft"):InvokeServer(str4, n8)
			end)
		end, true)

		fn30("AutoActivateObservationHaki", 0.5, function()
			remotes.CommE:FireServer("Ken", true)
		end)

		fn30("AutoSellFish", 0.5, function()
			net:WaitForChild("RF/JobsRemoteFunction"):InvokeServer("FishingNPC", "SellFish")
		end)

		local function fn40()
			v4.Remotes.CommE:FireServer("ActivateAbility")
		end

		fn30("AutoAgility", 0.5, fn40)

		fn30("AutoActiveRaceV4", 0.5, function()
			if v18.Character and v18.Character:FindFirstChild("RaceEnergy") and v18.Character:FindFirstChild("RaceTransformed") then
				if v18.Character.RaceEnergy.Value >= 1 and not v18.Character.RaceTransformed.Value then
					v18.Backpack.Awakening.RemoteFunction:InvokeServer({ true })
				end
			end
		end)

		local function fn41()
			v2.CurrentCamera.CFrame = CFrame.lookAt(v2.CurrentCamera.CFrame.p, v2.CurrentCamera.CFrame.p + v7:GetMoonDirection() * 100)
		end

		fn30("AutoLookMoon", 0.2, fn41)

		fn30("ManualIncreaseBoatSpeed", 0.2, function()
			if v18.Character and v18.Character:FindFirstChild("Humanoid") and v18.Character.Humanoid.Sit then
				local seatPart = v18.Character.Humanoid.SeatPart

				if seatPart and seatPart:IsA("VehicleSeat") then
					seatPart.MaxSpeed = tonumber(tbl.ManualBoatSpeed) or 150
					seatPart.Torque = 0.2
					seatPart.TurnSpeed = 5
				else
					local v23 = next
					local children, v24 = boats:GetChildren()

					for _, v25 in v23, children, v24 do
						local vehicleSeat = v25:FindFirstChildWhichIsA("VehicleSeat") or v25:FindFirstChild("VehicleSeat")

						if vehicleSeat then
							vehicleSeat.MaxSpeed = tonumber(tbl.ManualBoatSpeed) or 150
							vehicleSeat.Torque = 0.2
							vehicleSeat.TurnSpeed = 5
						end
					end
				end
			end
		end)

		fn30("BuyGear", 0.5, function()
			tbl6:FireInvoke("UpgradeRace", "Buy")
		end)

		fn30("AutoBuyEnchancementColor", 0.5, function()
			tbl6:FireInvoke("ColorsDealer", "1")
			tbl6:FireInvoke("ColorsDealer", "2")
		end)

		fn30("BuyTTK", 0.5, function()
			tbl6:FireInvoke("MysteriousMan", "2")
		end)

		local function fn42()
			tbl6:FireInvoke("LegendarySwordDealer", "1")
			tbl6:FireInvoke("LegendarySwordDealer", "2")
		end

		fn30("BuyLegendSword", 0.5, fn42)

		fn30("Random_Auto", 0.5, function()
			if tbl6:FireInvoke("Cousin", "CheckTime", "DLCBoxData") == true then
				local Cousin = tbl6:FireInvoke("Cousin", "DLCBoxData")

				if Cousin == 1 then
					tbl6:SendNotify("Random Fruit", "Successfully purchased!", 5)

					if tbl.SendWebhookRolledFruit then
						task.spawn(function()
							task.wait(0.6)
							local tbl17 = {}
							local backpack = v18.Backpack
							local character2 = v18.Character
							tbl17[1] = backpack
							tbl17[2] = character2
							local v23, v24, v25 = ipairs(tbl17)
							local name2 = nil
							local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v23, v24, v25)
							local exitTo2 = nil

							for _, v26 in v23, v24, v25 do
								if v26 then
									local exitTo = nil

									for _, child in ipairs(v26:GetChildren()) do
										if child:IsA("Tool") and child.Name:find("Fruit") then
											exitTo = 1
											break
										end
									end

									if exitTo == 1 then
										name2 = u7.Name
									end
								end

								if name2 then
									exitTo2 = 1
									break
								end
							end

							if exitTo2 ~= 1 then
							end

							local _vm_a_0
							_vm_a_1 = _vm_a_0
							local _vm_U_0
							local _vm_U_1 = _vm_U_0
							local _vm___0
							local _vm___1 = _vm___0
							name2 = name2 or "Unknown Fruit"
							local match = name2:match("^(.-)%-")
							match = match or name2
							local webhook = tbl.Webhook

							if webhook and webhook ~= "" then
								local v26 = PostWebhook
								local v27 = WeeboLogs
								local tbl18 = { Extra = "**Fruit:** " .. match .. " (" .. name2 .. ")" }
								local field2 = { name = "Beli Remaining" }
								local v28 = fn17
								field2.value = "$" .. v28(beli and beli.Value or 0)
								tbl18.Field2 = field2
								v26(webhook, v27("Rolled Fruit", tbl18))
							end
						end)
					end
				elseif Cousin == 2 then
					tbl6:SendNotify("Random Fruit", "Not enough money!", 5)
				elseif Cousin == 3 then
					tbl6:SendNotify("Random Fruit", "Level 50 required!", 5)
				elseif Cousin then
					tbl6:SendNotify("Random Fruit", tostring(Cousin), 5)
				end
			end

			local spinnerWindow = v18.PlayerGui:FindFirstChild("SpinnerWindow")

			if spinnerWindow then
				local closeButton = spinnerWindow:FindFirstChild("AboveSpinner") and spinnerWindow.AboveSpinner:FindFirstChild("Navigation") and spinnerWindow.AboveSpinner.Navigation:FindFirstChild("CloseButton")

				if closeButton and closeButton.Visible then
					pcall(function()
						firesignal(closeButton.Activated)
					end)
				end
			end
		end)

		local tbl17 = {}

		fn30("AutoStoreFruit", 1, function()
			local tbl18 = {}
			local backpack = v18.Backpack
			local character2 = v18.Character
			local characters = v2.Characters
			local findFirstChild = characters.FindFirstChild
			local name2 = v18.Name
			tbl18[1] = backpack
			tbl18[2] = character2

			do
				local values = table.pack(findFirstChild(characters, name2))
				table.move(values, 1, values.n, 3, tbl18)
			end

			local v23, v24, v25 = ipairs(tbl18)
			local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v23, v24, v25)

			for _, v26 in v23, v24, v25 do
				if v26 then
					for _, child in ipairs(v26:GetChildren()) do
						if child:IsA("Tool") and string.find(child.Name, "Fruit") then
							local attribute2 = child:GetAttribute("OriginalName") or child.Name:match("^(.-)%-") or child.Name
							local n8 = tbl17[attribute2] or 0

							if tick() - n8 > 45 then
								local StoreFruit = tbl6:FireInvoke("StoreFruit", attribute2, child)
								task.wait(0.3)

								if not child:IsDescendantOf(game) or child.Parent == nil or StoreFruit == true then
									tbl17[attribute2] = nil

									if tbl.SendWebhookStoreFruit then
										local webhook = tbl.Webhook

										if webhook and webhook ~= "" then
											local tbl19 = {}

											pcall(function()
												local response = Net:RemoteFunction("GetAllItemValues"):InvokeServer()

												if response and typeof(response) == "table" then
													for _, v27 in next, response, nil do
														if v27.Key == "IsOwned" and v27.Value == true then
															local ok, result = pcall(function()
																return ItemConfig.match(v27.ItemId)
															end)

															if ok and result and result.isOk and result:isOk() then
																local v28 = result:unwrap()

																if v28 and v28.Index and v28.Index.DebugLabel then
																	local str4 = tostring(v28.Index.DebugLabel)

																	if str4:find("PhysicalMoveset") or str4:find("Fruit") then
																		local match = str4:match("^(.-)%s*%[")
																		match = match or str4
																		table.insert(tbl19, match:match("^(.-)%-") or match)
																	end
																end
															end
														end
													end
												end
											end)

											PostWebhook(webhook, WeeboLogs("Stored Fruit", {
												Extra = "**Stored Fruit:** " .. attribute2,
												Field2 = {
													name = "Storage Count",
													value = tostring(#tbl19) .. " Fruits Stored",
												},
											}))
										end
									end
								else
									tbl17[attribute2] = tick()
								end
							end
						end
					end
				end
			end

			local _vm_a_0
			_vm_a_1 = _vm_a_0
			local _vm_U_0
			local _vm_U_1 = _vm_U_0
			local _vm___0
			local _vm___1 = _vm___0
		end)

		local function fn43()
			if utilities:CheckInventory("Material", "Bones") >= 50 then
				tbl6:FireInvoke("Bones", "Buy", 1, 1)
				task.wait(1.5)
			end
		end

		fn30("Auto_Random_Surprise", 2, fn43)

		local function fn44()
			tbl6:FireInvoke("gravestoneEvent", 1)
		end

		fn30("AutoPray", 1, fn44)

		local function fn45()
			tbl6:FireInvoke("gravestoneEvent", 2)
		end

		fn30("AutoTryLuck", 1, fn45)

		fn30("AutoAttack", 0, function()
			if tbl.AutoAttack ~= false then
				fastAttack()
			end
		end, true)

		fn30("NoFog", 2.5, function()
			if tbl.NoFog then
				v7.FogEnd = math.huge

				if v7:FindFirstChild("FantasySky") then
					v7.FantasySky:Destroy()
				elseif v7:FindFirstChild("LightingLayers") then
					v7.LightingLayers:Destroy()
				elseif v7:FindFirstChild("Sky") then
					v7.Sky:Destroy()
				elseif v7:FindFirstChild("SeaTerrorCC") then
					v7.SeaTerrorCC:Destroy()
				end
			end
		end)

		fn30("AutoCardsDungeon", 0.3, function()
			local cardsSelection = tbl.CardsSelection
			if not cardsSelection then
				return
			end
			local tbl18

			if type(cardsSelection) == "string" then
				tbl18 = { cardsSelection }
			else
				tbl18 = cardsSelection
			end

			if #tbl18 == 0 then
				return
			end
			local v23, v24, v25 = ipairs(v18.PlayerGui:GetDescendants())
			local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v23, v24, v25)

			for _, v26 in v23, v24, v25 do
				if v26:IsA("TextLabel") and v26.Name == "DisplayName" and v26.Text then
					local v27 = string.lower(v26.Text:gsub("<[^>]+>", ""))

					for _, v28 in ipairs(tbl18) do
						if string.find(v27, string.lower(v28)) then
							local parent = v26.Parent
							if parent and parent.Activated then
								firesignal(parent.Activated)
								return true
							end
						end
					end
				end
			end

			local _vm_a_0
			_vm_a_1 = _vm_a_0
			local _vm_U_0
			local _vm_U_1 = _vm_U_0
			local _vm___0
			local _vm___1 = _vm___0
		end)
	end

	tbl6.LoadFunctions = function()
		tbl6.Functions = tbl6.Functions or {}
		tbl6.FunctionList = tbl6.FunctionList or {}
		tbl6.ActiveFunction = tbl6.ActiveFunction or nil
		local functions = tbl6.Functions
		local functionList = tbl6.FunctionList
		local tbl15 = {}

		local tbl16 = {
			"AutoFactoryRaid",
			"AutoFarmPirateRaid",
			"AutoSoulReaper",
			"AutoTaskEliteHunter",
			"Tweenfruit",
			"AutoBerrySafe",
		}

		tbl6.IsMultiFunction = function(arg)
			for _, v22 in ipairs(tbl16) do
				if v22 == arg then
					return true
				end
			end

			return false
		end

		local now = nil

		local function fn30()
			if tbl.AutoFarmPirateRaid and flag3 then
				if gameData:DetectPirateRaid() then
					now = tick()
					tbl6.ActiveFunction = "AutoFarmPirateRaid"
					return true
				end

				if now and tick() - now < 8 then
					tbl6.ActiveFunction = "AutoFarmPirateRaid"
					return true
				end
			end

			if tbl.AutoFactoryRaid and utilities:CheckMon("Core") and flag2 then
				tbl6.ActiveFunction = "AutoFactoryRaid"
				return true
			end

			if tbl.AutoSoulReaper and flag3 then
				if utilities:CheckMon("Soul Reaper") or utilities:CheckToolName("Hallow Essence") then
					tbl6.ActiveFunction = "AutoSoulReaper"
					return true
				end
			end

			if tbl.AutoTaskEliteHunter and flag3 then
				if gameData:Checkelites() then
					tbl6.ActiveFunction = "AutoTaskEliteHunter"
					return true
				end
			end

			if tbl.Tweenfruit then
				if gameData:GetPathFruit() or tbl.HopIfNoFruit then
					tbl6.ActiveFunction = "Tweenfruit"
					return true
				end
			end

			if tbl.AutoBerrySafe then
				if gameData:CheckBerries() or tbl.HopIfNoBerries then
					tbl6.ActiveFunction = "AutoBerrySafe"
					return true
				end
			end

			tbl6.ActiveFunction = nil
			return false
		end

		local function fn31(activeFunction, func, arg, arg2)
			if not activeFunction or type(func) ~= "function" or not arg then
				return
			end

			if tbl15[activeFunction] then
				if functions[activeFunction] then
					functions[activeFunction]._StopFlag = true
				end

				task.cancel(tbl15[activeFunction])
				tbl15[activeFunction] = nil
			end

			functions[activeFunction] = {
				Enable = arg,
				Running = false,
				Func = func,
				NoLock = arg2 or false,
				_StopFlag = false,
				Stop = function()
					if tbl then
						tbl[activeFunction] = false
					end

					functions[activeFunction].Running = false

					if tbl6.ActiveFunction == activeFunction then
						tbl6.ActiveFunction = nil
					end

					tweenManager:StopTween()
				end,
				Call = function()
					local activeFunction2 = tbl6.ActiveFunction
					tbl6.ActiveFunction = nil
					pcall(func)
					tbl6.ActiveFunction = activeFunction2
				end,
			}

			local flag4 = false
			local exitTo = nil

			for _, v22 in ipairs(functionList) do
				if v22.Name == activeFunction then
					exitTo = 1
					break
				end
			end

			if exitTo == 1 then
				t4.Func = func
				flag4 = true
			end

			if not flag4 then
				table.insert(functionList, { Name = activeFunction, Func = func })
			end

			tbl15[activeFunction] = task.spawn(function()
				local v22 = functions[activeFunction]

				while v22 and not v22._StopFlag do
					if tbl and tbl[activeFunction] then
						if v22.NoLock then
							v22.Running = true
							pcall(func)
							task.wait(0.25)
						elseif tbl6.IsMultiFunction(activeFunction) then
							if fn30() and tbl6.ActiveFunction == activeFunction then
								v22.Running = true
								pcall(func)
								task.wait(0.25)
							else
								if v22.Running then
									v22.Running = false
								end

								task.wait(0.25)
							end
						elseif fn30() then
							if v22.Running then
								v22.Running = false
							end

							task.wait(0.25)
						elseif tbl6.ActiveFunction == nil or tbl6.ActiveFunction == activeFunction then
							tbl6.ActiveFunction = activeFunction
							v22.Running = true
							pcall(func)
							task.wait(0.25)
							tbl6.ActiveFunction = nil
						else
							if v22.Running then
								v22.Running = false
							end

							task.wait(0.25)
						end
					else
						if tbl6.ActiveFunction == activeFunction then
							tbl6.ActiveFunction = nil
						end

						if v22.Running then
							v22.Running = false
						end

						task.wait(0.5)
					end
				end

				if tbl6.ActiveFunction == activeFunction then
					tbl6.ActiveFunction = nil
				end
			end)

			local v22 = tbl

			if tbl then
				v22 = tbl[activeFunction]
			end

			if v22 then
				functions[activeFunction].Running = true
			end
		end

		tbl6.GetEnabledFunctionNames = function()
			local tbl17 = {}

			for _, v22 in ipairs(functionList) do
				if tbl and tbl[v22.Name] then
					table.insert(tbl17, v22.Name)
				end
			end

			return tbl17
		end

		tbl6.IsFunctionBlockedByMulti = function(arg)
			local v22 = functions[arg]
			if v22 and v22.NoLock then
				return false
			end

			if tbl6.IsMultiFunction(arg) then
				return tbl6.ActiveFunction ~= arg
			end
			return tbl6.ActiveFunction ~= nil and tbl6.ActiveFunction ~= arg
		end

		fn31("AutoTaskEliteHunter", function()
			local v22 = gameData:Checkelites()

			if v22 then
				if not VerifyQuest(v22) then
					tbl6:FireInvoke("AbandonQuest")
					task.wait(0.1)
					tbl6:FireInvoke("EliteHunter")
				else
					local enemies2 = utilities:GetEnemies(v22)
					if enemies2 then
						return subFunction:Attack(enemies2)
					end
				end
			end
		end, flag3)

		local function fn32()
			if tbl.AcceptQuests and not VerifyQuest("Demonic Soul") then
				return utilities:StartQuest("HauntedQuest2", 1, CFrame.new(-9517, 172, 6078))
			end
			local enemies2 = utilities:GetEnemies(tbl6.DataList.BonesList)
			if enemies2 then
				return subFunction:Attack(enemies2, true)
			end
			utilities:MobsNextSpawn("Reborn Skeleton")
		end

		fn31("AutoFarmBones", fn32, flag3)

		fn31("AutoFarmBoss", function()
			local v22 = CheckBoss(tbl.SelectBoss)
			if not v22 then
				return task.wait(1)
			end
			tbl.SelectBoss = v22[2]
			local flag4 = tbl.GetBossQuest and not VerifyQuest(v22[2]) and utilities:CheckMon(v22[2])

			if flag4 then
				flag4 = level.Value >= (v22[1] or 0)
			end

			if flag4 then
				return utilities:StartQuest(v22[3], v22[4], v22[5])
			end
			local enemies2 = utilities:GetEnemies(v22[2])

			if enemies2 then
				subFunction:Attack(enemies2)
			else
				utilities:MobsNextSpawn(v22[2])
			end
		end, true)

		fn31("AutoKillAllBosses", function()
			local sea3 = flag3 and bossList.Sea_3 or flag2 and bossList.Sea_2 or flag and bossList.Sea_1
			if not sea3 or #sea3 == 0 then
				return task.wait(1)
			end

			for _, v22 in next, sea3, nil do
				local n2 = v22[1] or 0
				local v23 = v22[2]

				if level.Value >= n2 and utilities:CheckMon(v23) then
					local enemies2 = utilities:GetEnemies(v23)

					if enemies2 and tbl6:IsReady(enemies2) then
						if tbl.GetBossQuest and not VerifyQuest(v23) then
							if v18.PlayerGui.Main:FindFirstChild("Quest") and v18.PlayerGui.Main.Quest.Visible then
								pcall(function()
									tbl6:FireInvoke("AbandonQuest")
								end)

								task.wait(0.2)
							end

							return utilities:StartQuest(v22[3], v22[4], v22[5])
						end

						return subFunction:Attack(enemies2)
					end
				end
			end

			for _, v22 in next, sea3, nil do
				local n2 = v22[1] or 0
				local v23 = v22[2]
				if not (n2 <= level.Value) then
					continue
				end

				if v22[5] then
					return utilities:MobsNextSpawn(v23)
				end
			end
		end, true)

		fn31("TeleportToIsland", function()
			for k, v22 in next, tbl6._ActiveIslands, nil do
				if k == tbl.TeleportIslandSelect then
					if (character.HumanoidRootPart.Position - Vector3.new(v22.X, v22.Y, v22.Z)).Magnitude <= 10 then
						tbl6._TravelToggle.Update(false)
					else
						tweenManager:topos(v22)
					end
				end
			end
		end, true)

		local function fn33()
			local v22 = next
			local children, v23 = v4.NPCs:GetChildren()

			for _, v24 in v22, children, v23 do
				if v24.Name == tbl.NpcTween then
					tweenManager:topos(v24:GetPivot())
				end
			end
		end

		fn31("TPtoNPC", fn33, true)

		local function fn34()
			local nearestPlayer = (tbl.SelectPlayer == "Nearest" or not tbl.SelectPlayer) and gameData:GetNearestPlayer() or v3:FindFirstChild(tbl.SelectPlayer)

			if nearestPlayer and nearestPlayer ~= v18 and nearestPlayer.Character then
				local humanoidRootPart3 = nearestPlayer.Character:FindFirstChild("HumanoidRootPart") or nearestPlayer.Character.PrimaryPart
				local humanoid2 = nearestPlayer.Character:FindFirstChildOfClass("Humanoid")

				if humanoidRootPart3 and humanoid2 and humanoid2.Health > 0 then
					tweenManager:topos(humanoidRootPart3.CFrame)
				end
			end
		end

		fn31("TeleporttoPlayer", fn34, true)

		local function fn35()
			local v22 = CheckQuest()
			if not v22 or not v22[1] or v22[1] == "" then
				return
			end
			local v23 = v22[1]
			local pos = v22[2]
			local enemies2 = utilities:GetEnemies(v23)
			local nearest = gameData:GetNearest()
			local farmMode = tbl.FarmMode
			farmMode = farmMode or "Quest"
			pos = pos and pos:lower():find("submerged")

			if not pos then
				if v23 then
					pos = v23 == "Reef Bandit" or v23 == "Coral Pirate" or v23 == "Sea Chanter" or v23 == "High Disciple" or v23 == "Grand Devotee"
				else
					pos = v23
				end
			end

			local v24 = flag3

			if not flag3 then
				pos = v24
			end

			if pos and farmMode ~= "Nearest" then
				if (v18.Character and v18.Character:FindFirstChild("HumanoidRootPart") and v18.Character.HumanoidRootPart.Position.Y or 0) > -500 then
					local v25 = v18
					local distanceFromCharacter = v25.DistanceFromCharacter
					local vector = Vector3.new

					if distanceFromCharacter(v25, Vector3.new(-16269.102, 29.517754, 1372.3204)) > 15 then
						tweenManager:topos(CFrame.new(-16269.1016, 29.5177539, 1372.3204))
						task.wait(0.5)
						local _vm___1 = 1

						for i = 1, 2 do
							net:WaitForChild("RF/SubmarineWorkerSpeak"):InvokeServer("TravelToSubmergedIsland")
						end

						local _vm___0
						_vm___1 = _vm___0
						return
					end
				end
			end

			if farmMode == "Quest" then
				if not VerifyQuest(v23) then
					return GetQuest()
				end

				if enemies2 then
					return subFunction:Attack(enemies2, true)
				end
				return utilities:MobsNextSpawn(v23)
			end

			if farmMode == "No Quest" then
				if enemies2 then
					return subFunction:Attack(enemies2, true)
				end
				return utilities:MobsNextSpawn(v23)
			end

			if farmMode == "Nearest" then
				if nearest then
					return subFunction:Attack(nearest, true)
				end
			end
		end

		fn31("AutoFarm", fn35, true)
		local n2 = 0
		local str4 = ""

		local function fn36()
			if not tbl.IgnoreCakePrince and utilities:CheckMon("Cake Prince") then
				local enemies2 = utilities:GetEnemies("Cake Prince")

				if enemies2 then
					if v18:GetAttribute("CurrentLocation") ~= "Dimensional Shift" then
						tweenManager:topos(CFrame.new(-2168, 84, -12397))
						task.wait(1)
						return
					end

					return subFunction:Attack(enemies2)
				end
			end

			local now2 = tick()

			if now2 - n2 > 4 then
				n2 = now2

				local ok, result = pcall(function()
					return tbl6:FireInvoke("CakePrinceSpawner")
				end)

				if ok and type(result) == "string" then
					str4 = result
				end
			end

			if string.find(str4, "open the portal now") then
				tbl6:FireInvoke("CakePrinceSpawner")
				task.wait(1)
				return
			end

			if tbl.AcceptQuests and not VerifyQuest("Cookie Crafter") then
				return utilities:StartQuest("CakeQuest1", 1, CFrame.new(-2021, 38, -12029))
			end
			local enemies2 = utilities:GetEnemies(tbl6.DataList.CakesList)
			if enemies2 then
				return subFunction:Attack(enemies2, true)
			end
			tweenManager:topos(CFrame.new(-2304, 228, -12240))
		end

		fn31("AutoFarmPrince", fn36, flag3)

		fn31("AutoTeleportMirage", function()
			if tbl.AutoTeleportMirage then
				for _, child in pairs(v2._WorldOrigin.Locations:GetChildren()) do
					if child.Name == "Mirage Island" then
						tweenManager:topos(child.CFrame * CFrame.new(0, 333, 0), true)
					end
				end
			end
		end, flag3)

		fn31("AutoTeleportPrehistoric", function()
			if tbl.AutoTeleportPrehistoric then
				for _, child in pairs(v2._WorldOrigin.Locations:GetChildren()) do
					if child.Name == "Prehistoric Island" then
						tweenManager:topos(child.CFrame * CFrame.new(0, 333, 0), true)
					end
				end
			end
		end, flag3)

		local function fn37()
			if tbl.AutoTeleportKitsune then
				for _, child in pairs(v2._WorldOrigin.Locations:GetChildren()) do
					if child.Name == "Kitsune Island" then
						tweenManager:topos(child.CFrame * CFrame.new(0, 300, 0), true)
					end
				end
			end
		end

		fn31("AutoTeleportKitsune", fn37, flag3)

		local function fn38()
			if not tbl.AutoBlueMoonFarm then
				tbl6._BlueMoonState = "FIND_ISLAND"
				tweenManager:StopBoatTween()
				return
			end

			IsBlueMoonActive = function()
				return v7:GetAttribute("IsBlueMoon") == true
			end

			HasBlueMoonEnded = function()
				return v7:GetAttribute("BlueMoonEnded") == true
			end

			local function fn39()
				return map:FindFirstChild("KitsuneIsland") or worldOrigin and worldOrigin:FindFirstChild("Locations") and worldOrigin.Locations:FindFirstChild("Kitsune Island") or v2:FindFirstChild("KitsuneIsland")
			end

			local function fn40(arg)
				if not arg then
					return nil
				end
				return arg:FindFirstChild("optimizedcylinder", true) or arg:FindFirstChild("Shrine", true) or arg:FindFirstChild("Statue", true) or arg.PrimaryPart
			end

			local function fn41()
				pcall(function()
					tbl6:FireInvoke("TouchKitsuneStatue")
				end)
			end

			local function fn42()
				local position2 = v18.Character and v18.Character:GetPivot().Position
				if not position2 then
					return nil
				end
				local huge = math.huge
				local v22 = nil

				for _, child in ipairs(v2:GetChildren()) do
					if child:IsA("Model") and child.Name == "EmberTemplate" then
						local basePart = child:FindFirstChildWhichIsA("BasePart") or child.PrimaryPart

						if basePart and basePart:GetAttribute("IsPlayerEmber") ~= true then
							local magnitude = (basePart.Position - position2).Magnitude

							if magnitude < huge then
								huge = magnitude
								v22 = basePart
							end
						end
					end
				end

				return v22
			end

			if IsBlueMoonActive() then
				tbl6._BlueMoonState = "COLLECT_EMBERS"
			end

			local v22 = fn39()
			local v23 = fn40(v22)

			if (v22 or v23) and tbl6._BlueMoonState == "FIND_ISLAND" and not IsBlueMoonActive() then
				tweenManager:StopBoatTween()

				if humanoid and humanoid.Sit then
					humanoid.Sit = false
				end

				tbl6._BlueMoonState = "GO_TO_SHRINE"
			end

			if tbl6._BlueMoonState == "FIND_ISLAND" then
				if IsBlueMoonActive() then
					tbl6._BlueMoonState = "COLLECT_EMBERS"
					return
				end

				if v22 then
					tweenManager:StopBoatTween()

					if humanoid and humanoid.Sit then
						humanoid.Sit = false
					end

					tbl6._BlueMoonState = "GO_TO_SHRINE"
				else
					subFunction:AutoBoatSail(CFrame.new(-10000000, 31, 37016.25))
				end
			elseif tbl6._BlueMoonState == "GO_TO_SHRINE" then
				if v23 and humanoidRootPart then
					if (v23.Position - humanoidRootPart.Position).Magnitude > 30 then
						tweenManager:topos(v23.CFrame * CFrame.new(0, 5, 0), true)
					else
						fn41()
						task.wait(0.3)

						if IsBlueMoonActive() then
							tbl6._BlueMoonState = "COLLECT_EMBERS"
						end
					end
				else
					tbl6._BlueMoonState = "FIND_ISLAND"
				end
			elseif tbl6._BlueMoonState == "COLLECT_EMBERS" then
				if HasBlueMoonEnded() or not IsBlueMoonActive() then
					tbl6._BlueMoonState = "FIND_ISLAND"
					return
				end
				local v24 = fn42()

				if v24 then
					tweenManager:topos(v24.CFrame)
				end
			end
		end

		fn31("AutoBlueMoonFarm", fn38, flag3)

		local function fn39()
			if utilities:CheckMon("Dough King") then
				local enemies2 = utilities:GetEnemies("Dough King")

				if enemies2 then
					if v18:GetAttribute("CurrentLocation") ~= "Dimensional Shift" then
						tweenManager:topos(CFrame.new(-2168, 84, -12397))
						task.wait(1)
						return
					end

					return subFunction:Attack(enemies2)
				end
			elseif not tbl.IgnoreDoughChaliceFarm then
				if not utilities:CheckToolName("Sweet Chalice") then
					if tbl6:FireInvoke("SweetChaliceNpc") == "Where are the items?" then
						if utilities:CheckInventory("Material", "Conjured Cocoa") < 10 then
							local enemies2 = utilities:GetEnemies({ "Chocolate Bar Battler", "Cocoa Warrior" })

							if enemies2 then
								subFunction:Attack(enemies2, true)
							else
								utilities:MobsNextSpawn("Chocolate Bar Battler")
							end
						elseif not utilities:CheckToolName("God's Chalice") then
							local v22 = gameData:Checkelites()

							if v22 then
								if not VerifyQuest(v22) then
									tbl6:FireInvoke("AbandonQuest")
									task.wait(0.1)
									tbl6:FireInvoke("EliteHunter")
								else
									local enemies2 = utilities:GetEnemies(v22)

									if enemies2 then
										subFunction:Attack(enemies2)
									end
								end
							else
								functions.AutoChest.Call()
							end
						end
					end
				else
					local now2 = tick()

					if now2 - n2 > 4 then
						n2 = now2

						local ok, result = pcall(function()
							return tbl6:FireInvoke("CakePrinceSpawner")
						end)

						if ok and type(result) == "string" then
							str4 = result
						end
					end

					if string.find(str4, "open the portal now") then
						tbl6:FireInvoke("CakePrinceSpawner")
						task.wait(1)
					else
						local enemies2 = utilities:GetEnemies(tbl6.DataList.CakesList)
						if enemies2 then
							return subFunction:Attack(enemies2, true)
						end
						utilities:MobsNextSpawn("Head Baker")
					end
				end
			end
		end

		fn31("AutoDoughKing", fn39, flag3)

		fn31("AutoTyrantOfTheSkies", function()
			local enemies2 = utilities:GetEnemies("Tyrant of the Skies")
			local enemies3 = utilities:GetEnemies(tbl6.DataList.TyrantList)
			if utilities:CheckMon("Tyrant of the Skies") then
				return subFunction:Attack(enemies2)
			end

			if gameData:TyrantEyes() >= 4 then
				subFunction:AttackTree()
			else
				if enemies3 then
					return subFunction:Attack(enemies3, true)
				end
				tweenManager:topos(CFrame.new(-16257, 22, 1062))
			end
		end, flag3)

		local function fn40()
			local selectMaterial = tbl.SelectMaterial
			local v22

			if flag then
				v22 = materialEnemies.Sea_1[selectMaterial]
			elseif flag2 then
				v22 = materialEnemies.Sea_2[selectMaterial]
			else
				v22 = nil

				if flag3 then
					v22 = materialEnemies.Sea_3[selectMaterial]
				end
			end

			if v22 and #v22 > 0 then
				local enemies2 = utilities:GetEnemies(v22)
				if enemies2 then
					return subFunction:Attack(enemies2, true)
				end
				return utilities:MobsNextSpawn(v22[1])
			end
		end

		fn31("AutoMaterial", fn40, true)

		fn31("AutoSecondSea", function()
			if not (flag and level.Value >= 700) then
				return nil
			end

			if tbl6:FireInvoke("DressrosaQuestProgress").KilledIceBoss then
				tbl6:FireInvoke("TravelDressrosa")
			elseif map.Ice.Door.CanCollide then
				if not utilities:CheckToolName("Key") then
					local v22 = v18
					local distanceFromCharacter = v22.DistanceFromCharacter
					local vector = Vector3.new

					if distanceFromCharacter(v22, Vector3.new(4852, 6, 719)) < 5 then
						tbl6:FireInvoke("DressrosaQuestProgress", "Detective")
					else
						tweenManager:topos(CFrame.new(4852, 6, 719))
					end
				else
					utilities:EquipTool("Key")

					if utilities:CheckToolName("Key") then
						tweenManager:topos(map.Ice.Door.CFrame)
					end
				end
			else
				local enemies2 = utilities:GetEnemies("Ice Admiral")
				if enemies2 then
					return subFunction:Attack(enemies2)
				end
			end
		end, flag)

		fn31("AutoThirdSea", function()
			if level.Value >= 1500 then
				if tbl6:FireInvoke("BartiloQuestProgress", "Bartilo") == 3 then
					if tbl6:FireInvoke("TalkTrevor", "1") ~= 0 then
						if tbl6:FireInvoke("GetUnlockables").FlamingoAccess == nil then
							if not utilities:Checkfruit() and getfruitstore() then
								tbl6:FireInvoke("LoadFruit", getfruitstore())
								task.wait(0.1)
							else
								tbl6:FireInvoke("TalkTrevor", "1")
								tbl6:FireInvoke("TalkTrevor", "2")
								tbl6:FireInvoke("TalkTrevor", "3")
							end
						end
					elseif not tbl6:FireInvoke("ZQuestProgress", "Check") then
						if utilities:CheckMon("Don Swan") then
							local enemies2 = utilities:GetEnemies("Don Swan")
							if enemies2 then
								return subFunction:Attack(enemies2)
							end
							utilities:MobsNextSpawn("Don Swan")
						end
					elseif tbl6:FireInvoke("ZQuestProgress", "Check") == 0 then
						if (v18.Character.HumanoidRootPart.Position - v2.Map.IndraIsland.Part.Position).Magnitude > 1000 then
							tweenManager:topos(CFrame.new(-1926.78772, 12.1678171, 1739.80884, 0.956294656, 0, -0.292404652, 0, 1, 0, 0.292404652, 0, 0.956294656))

							if (v18.Character.HumanoidRootPart.Position - CFrame.new(-1926.78772, 12.1678171, 1739.80884, 0.956294656, 0, -0.292404652, 0, 1, 0, 0.292404652, 0, 0.956294656).Position).Magnitude <= 5 then
								tbl6:FireInvoke("ZQuestProgress", "Begin")
							end
						else
							local enemies2 = utilities:GetEnemies("rip_indra")
							if enemies2 then
								return subFunction:Attack(enemies2)
							end
						end
					else
						if tbl6:FireInvoke("TalkTrevor", "1") == 0 and tbl6:FireInvoke("ZQuestProgress", "Check") == 1 and tbl6:FireInvoke("ZQuestProgress", "Zou") == 0 then
							tbl6:FireInvoke("TravelZou")
						end
					end
				end
			end
		end, flag2)

		local function fn41()
			if utilities:CheckInventory("Moveset", "Tushita") then
				return
			end
			local TushitaProgress = tbl6:FireInvoke("TushitaProgress")

			if typeof(TushitaProgress) ~= "table" then
				TushitaProgress = { Torches = { false, false, false, false, false } }
			end

			if TushitaProgress.OpenedDoor then
				local enemies2 = utilities:GetEnemies("Longma")
				if enemies2 then
					return subFunction:Attack(enemies2)
				end
				tweenManager:topos(CFrame.new(-10237, 339, 8758))
				return
			end

			if utilities:CheckMon("rip_indra True Form") or utilities:CheckToolName("Holy Torch") then
				if not utilities:CheckToolName("Holy Torch") then
					return tweenManager:topos(CFrame.new(5713, 19, 255))
				end
				utilities:EquipTool("Holy Torch")
				local torches = TushitaProgress.Torches or {}
				local _vm___1 = 1

				for i = 1, #torches do
					if not torches[i] then
						tbl6:FireInvoke("TushitaProgress", "Torch", i)
					end
				end

				local _vm___0
				_vm___1 = _vm___0
				return true
			end

			if utilities:CheckToolName("God's Chalice") then
				utilities:EquipTool("God's Chalice")
				return tweenManager:topos(CFrame.new(-5561, 314, -2663))
			end
			local v22 = gameData:Checkelites()

			if v22 then
				if not VerifyQuest(v22) then
					tbl6:FireInvoke("AbandonQuest")
					task.wait(0.1)
					tbl6:FireInvoke("EliteHunter")
				else
					local enemies2 = utilities:GetEnemies(v22)
					if enemies2 then
						return subFunction:Attack(enemies2)
					end
				end
			else
				functions.AutoChest.Call()
			end
		end

		fn31("AutoTushita", fn41, flag3)

		local function fn42()
			if utilities:CheckInventory("Moveset", "Yama") then
				return nil
			end

			if (tonumber(tbl6:FireInvoke("EliteHunter", "Progress")) or 0) < 30 then
				local v22 = gameData:Checkelites()

				if v22 then
					if not VerifyQuest(v22) then
						tbl6:FireInvoke("AbandonQuest")
						task.wait(0.1)
						tbl6:FireInvoke("EliteHunter")
					else
						local enemies2 = utilities:GetEnemies(v22)
						if enemies2 then
							return subFunction:Attack(enemies2)
						end
					end
				else
					joinAPI("elites", 1)
				end
			else
				local waterfall = map:FindFirstChild("Waterfall")
				waterfall = waterfall and map.Waterfall:FindFirstChild("SealedKatana")
				waterfall = waterfall and waterfall:FindFirstChild("Hitbox")

				if waterfall then
					if v18:DistanceFromCharacter(waterfall.Position) > 10 then
						tweenManager:topos(waterfall.CFrame * CFrame.new(0, 3, 0))
					else
						local clickDetector = waterfall:FindFirstChildOfClass("ClickDetector") or waterfall:FindFirstChildWhichIsA("ClickDetector", true)

						if clickDetector then
							fireclickdetector(clickDetector)
						end
					end
				else
					tweenManager:topos(CFrame.new(5289, 1005, 393))
				end
			end
		end

		fn31("AutoYama", fn42, flag3)

		local function fn43()
			if utilities:CheckMon("Awakened Ice Admiral") then
				local enemies2 = utilities:GetEnemies({ "Awakened Ice Admiral" })
				if enemies2 then
					return subFunction:Attack(enemies2)
				end
			end

			if utilities:CheckToolName("Hidden Key") then
				if v18:DistanceFromCharacter(CFrame.new(6571, 299, -6968).Position) > 2 then
					tweenManager:topos(CFrame.new(6571, 299, -6968))
				else
					utilities:EquipTool("Hidden Key")
				end
			elseif utilities:CheckToolName("Library Key") then
				if v18:DistanceFromCharacter(CFrame.new(6373, 293, -6839).Position) > 2 then
					tweenManager:topos(CFrame.new(6571, 299, -6968))
				else
					utilities:EquipTool("Library Key")
				end
			else
				local enemies2 = utilities:GetEnemies({ "Arctic Warrior", "Snow Lurker" })
				if enemies2 then
					return subFunction:Attack(enemies2, true)
				end
				utilities:MobsNextSpawn("Arctic Warrior")
			end
		end

		fn31("AutoRengoku", fn43, flag2)

		fn31("AutoUnlockSaber", function()
			if data.Level.Value >= 200 then
				if v2.Map.Jungle.Final.Part.CanCollide then
					if v2.Map.Jungle.QuestPlates.Door.CanCollide then
						local v22 = next
						local children, v23 = v2.Map.Jungle.QuestPlates:GetChildren()

						for _, v24 in v22, children, v23 do
							local button = v24:FindFirstChild("Button")

							if button and v24.Button:FindFirstChild("TouchInterest") then
								tweenManager:topos(v24.Button.CFrame)
							end
						end
					elseif not v2.Map.Desert.Burn.Part.CanCollide then
						if tbl6:FireInvoke("ProQuestProgress", "RichSon") ~= 0 and tbl6:FireInvoke("ProQuestProgress", "RichSon") ~= 1 then
							if not utilities:CheckToolName("Cup") then
								if (v18.Character.HumanoidRootPart.Position - CFrame.new(1112, 5, 4365).Position).Magnitude < 5 then
									tweenManager:topos(CFrame.new(1114, 8, 4365))
									firetouchinterest(v2.Map.Desert.Cup, v18.Character.HumanoidRootPart, 0)
									firetouchinterest(v2.Map.Desert.Cup, v18.Character.HumanoidRootPart, 1)
									return
								end

								tweenManager:topos(CFrame.new(1112, 5, 4365))
							else
								utilities:EquipTool("Cup")

								if utilities:CheckToolName("Cup") and utilities:CheckToolName("Cup").Handle:FindFirstChild("TouchInterest") then
									tbl6:FireInvoke("ProQuestProgress", "FillCup", v18.Character:FindFirstChild("Cup"))
									tbl6:FireInvoke("ProQuestProgress", "SickMan")
								end
							end
						elseif tbl6:FireInvoke("ProQuestProgress", "RichSon") == 0 then
							local enemies2 = utilities:GetEnemies("Mob Leader")
							if enemies2 then
								return subFunction:Attack(enemies2)
							end
						elseif tbl6:FireInvoke("ProQuestProgress", "RichSon") == 1 then
							if not utilities:CheckToolName("Relic") then
								if (v18.Character.HumanoidRootPart.Position - CFrame.new(-1404, 30, 5)).Magnitude > 8 then
									tweenManager:topos(CFrame.new(-1404, 30, 5))
								else
									tbl6:FireInvoke("ProQuestProgress", "RichSon")
								end
							else
								utilities:EquipTool("Relic")
								tweenManager:topos(CFrame.new(-1405, 30, 5))
							end
						end
					elseif not utilities:CheckToolName("Torch") and v2.Map.Desert.Burn.Part.CanCollide then
						tweenManager:topos(v2.Map.Jungle.Torch.CFrame)
					else
						utilities:EquipTool("Torch")

						if (v18.Character.HumanoidRootPart.Position - CFrame.new(1115, 5, 4349).Position).Magnitude < 5 then
							tweenManager:topos(CFrame.new(1115, 5, 4351))
							firetouchinterest(v18.Character.Torch.Handle, v2.Map.Desert.Burn.Fire, 0)
							firetouchinterest(v18.Character.Torch.Handle, v2.Map.Desert.Burn.Fire, 1)
							return
						end

						tweenManager:topos(CFrame.new(1115, 5, 4349))
					end
				else
					local enemies2 = utilities:GetEnemies("Saber Expert")
					if enemies2 then
						return subFunction:Attack(enemies2)
					end
				end
			end
		end, flag)

		fn31("AutoBartiloQuest", function()
			if level.Value >= 850 then
				if tbl6:FireInvoke("BartiloQuestProgress", "Bartilo") == 0 then
					if VerifyQuest("Swan Pirates") and VerifyQuest("50") and v18.PlayerGui.Main.Quest.Visible then
						local enemies2 = utilities:GetEnemies("Swan Pirate")
						if enemies2 then
							return subFunction:Attack(enemies2, true)
						end
						utilities:MobsNextSpawn("Swan Pirate")
					elseif (v18.Character.HumanoidRootPart.Position - CFrame.new(-456.28952, 73.0200958, 299.895966).Position).Magnitude > 8 then
						tweenManager:topos(CFrame.new(-456.28952, 73.0200958, 299.895966))
					else
						tbl6:FireInvoke("StartQuest", "BartiloQuest", 1)
					end
				elseif tbl6:FireInvoke("BartiloQuestProgress", "Bartilo") == 1 then
					if utilities:CheckMon("Jeremy") then
						local enemies2 = utilities:GetEnemies("Jeremy")
						if enemies2 then
							return subFunction:Attack(enemies2)
						end
					else
						tbl6:SendNotify("Bartilo Quest", "boss jeremy, not spawned", 8)
					end
				elseif tbl6:FireInvoke("BartiloQuestProgress", "Bartilo") == 2 then
					local position2 = v18.Character.HumanoidRootPart.Position
					local vector = Vector3.new

					if (position2 - Vector3.new(-1835.65, 10.4325, 1679.75)).Magnitude > 100 then
						tweenManager:topos(CFrame.new(-1835.65, 10.4325, 1679.75))
					else
						v18.Character.HumanoidRootPart.CFrame = map.Dressrosa.BartiloPlates[gameData:PlatesBartilo()].CFrame
						task.wait()
						firetouchinterest(map.Dressrosa.BartiloPlates[gameData:PlatesBartilo()], v18.Character.HumanoidRootPart, 0)
						firetouchinterest(map.Dressrosa.BartiloPlates[gameData:PlatesBartilo()], v18.Character.HumanoidRootPart, 1)
					end
				elseif tbl6:FireInvoke("BartiloQuestProgress", "Bartilo") == 3 then
					tbl6:SendNotify("Bartilo Quest", "Quest Completed", 8)
				end
			end
		end, flag2)

		fn31("AutoGetDBV2", function()
			if data.Value < 350 and v18:GetAttribute("YoruEvolution") then
				return nil
			end
			local IndraTalk = tbl6:FireInvoke("IndraTalk")
			local RobotTalk = tbl6:FireInvoke("RobotTalk")

			if RobotTalk == 3 or RobotTalk == 4 then
				local v22 = v18
				local distanceFromCharacter = v22.DistanceFromCharacter
				local vector = Vector3.new

				if distanceFromCharacter(v22, Vector3.new(1421, 87, -1281)) > 5 then
					tweenManager:topos(CFrame.new(1421, 87, -1281))
				else
					tbl6:FireInvoke("IndraTalk")

					if IndraTalk == 0 then
						local tbl17 = {}
						local cframe = CFrame.new(1002, 6, -1354)
						local cframe2 = CFrame.new(-4941, 719, -2650)
						local cframe3 = CFrame.new
						tbl17[1] = cframe
						tbl17[2] = cframe2

						do
							local values = table.pack(cframe3(-5232, 26, 4395))
							table.move(values, 1, values.n, 3, tbl17)
						end

						local _vm___1 = 1

						for i = 1, 3 do
							tweenManager:topos(tbl17[i])
							tbl6:FireInvoke("LoveLetter", i)
							task.wait(0.5)
						end

						local _vm___0
						_vm___1 = _vm___0
					else
						tweenManager:topos(CFrame.new(-1037, 10, 1800))
						tbl6:FireInvoke("RobotTalk")
					end
				end
			end
		end, flag)

		local function fn44()
			local GuitarPuzzleProgress = tbl6:FireInvoke("GuitarPuzzleProgress", "Check")

			if GuitarPuzzleProgress and GuitarPuzzleProgress.Pipes then
				if not tbl.IgnoreMaterialFarmGuitar then
					if utilities:CheckInventory("Material", "Ectoplasm") < 250 then
						if not flag2 then
							tbl6:FireInvoke("TravelDressrosa")
							return
						end
						local enemies2 = utilities:GetEnemies({ "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer" })
						if enemies2 then
							return subFunction:Attack(enemies2, true)
						end
						return utilities:MobsNextSpawn("Ship Deckhand")
					end

					if utilities:CheckInventory("Material", "Dark Fragment") < 1 then
						if not flag2 then
							tbl6:FireInvoke("TravelDressrosa")
						else
							if utilities:CheckMon("Darkbeard") then
								local enemies2 = utilities:GetEnemies("Darkbeard")
								if enemies2 then
									return subFunction:Attack(enemies2)
								end
								return utilities:MobsNextSpawn("Darkbeard")
							end

							if utilities:CheckToolName("Fist of Darkness") then
								utilities:EquipTool("Fist of Darkness")
								return tweenManager:topos(CFrame.new(3777, 14, -3499))
							end
							joinAPI("Darkbeard", 5)
						end

						return
					end
				end
			end

			if level.Value < 2300 or v7:GetAttribute("MoonPhase") ~= 5 then
				return nil
			end

			if GuitarPuzzleProgress then
				local pipes = GuitarPuzzleProgress.Pipes
				local swamp = GuitarPuzzleProgress.Swamp
				local trophies = GuitarPuzzleProgress.Trophies
				local gravestones = GuitarPuzzleProgress.Gravestones
				local ghost = GuitarPuzzleProgress.Ghost

				if pipes then
					local v22 = v18
					local distanceFromCharacter = v22.DistanceFromCharacter
					local vector = Vector3.new

					if distanceFromCharacter(v22, Vector3.new(-9680, 6, 6346)) < 5 then
						tbl6:FireInvoke("soulGuitarBuy", true)
					else
						tweenManager:topos(CFrame.new(-9680, 6, 6346))
					end

					return true
				end

				if not swamp then
					local enemies2 = utilities:GetEnemies("Living Zombie")
					if enemies2 then
						return subFunction:Attack(enemies2, true)
					end
					return utilities:MobsNextSpawn("Living Zombie")
				end

				if not gravestones then
					local v22 = v18
					local distanceFromCharacter = v22.DistanceFromCharacter
					local vector = Vector3.new

					if distanceFromCharacter(v22, Vector3.new(-8800, 178, 6033)) > 10 then
						tweenManager:topos(CFrame.new(-8800, 178, 6033))
					else
						for k, v23 in pairs({
							Placard1 = "Right",
							Placard2 = "Right",
							Placard3 = "Left",
							Placard4 = "Right",
							Placard5 = "Left",
							Placard6 = "Left",
							Placard7 = "Left",
						}) do
							local clickDetector = map["Haunted Castle"][k][v23]:FindFirstChild("ClickDetector")

							if clickDetector then
								fireclickdetector(clickDetector)
							end
						end
					end
				elseif not ghost then
					local v22 = v18
					local distanceFromCharacter = v22.DistanceFromCharacter
					local vector = Vector3.new

					if distanceFromCharacter(v22, Vector3.new(-9758, 270, 6291)) > 10 then
						tweenManager:topos(CFrame.new(-9758, 270, 6291))
					else
						tbl6:FireInvoke("GuitarPuzzleProgress", "Ghost")
						tbl6:FireInvoke("GuitarPuzzleProgress", "Ghost", true)
						task.wait(0.1)
						tbl6:FireInvoke("GuitarPuzzleProgress", "Check")
					end
				elseif not trophies then
					local v22 = v18
					local distanceFromCharacter = v22.DistanceFromCharacter
					local vector = Vector3.new

					if distanceFromCharacter(v22, Vector3.new(-9529, 6, 6039)) > 10 then
						tweenManager:topos(CFrame.new(-9529, 6, 6039))
					else
						local tbl17 = {
							Segment1 = "Trophy1",
							Segment3 = "Trophy2",
							Segment4 = "Trophy3",
							Segment7 = "Trophy4",
							Segment10 = "Trophy5",
						}

						for _, v23 in pairs({ "Segment6", "Segment2", "Segment8", "Segment9", "Segment5" }) do
							local v24 = map["Haunted Castle"].Tablet[v23]

							if v24.Line.Rotation.Z ~= 0 then
								repeat
									task.wait()
									fireclickdetector(v24.ClickDetector)
								until v24.Line.Rotation.Z == 0
							end
						end

						for k, v23 in pairs(tbl17) do
							local v24 = tostring(map["Haunted Castle"].Trophies.Quest[v23].Handle.CFrame):split(", ")[4]
							local flag4 = v24 == "1" or v24 == "-1"
							local str5 = "180"

							if flag4 then
								str5 = "90"
							end

							if not string.find(tostring(map["Haunted Castle"].Tablet[k].Line.Rotation.Z), str5) then
								repeat
									task.wait()
									fireclickdetector(map["Haunted Castle"].Tablet[k].ClickDetector)
								until string.find(tostring(map["Haunted Castle"].Tablet[k].Line.Rotation.Z), str5)
							end
						end
					end
				else
					local v22 = v18
					local distanceFromCharacter = v22.DistanceFromCharacter
					local vector = Vector3.new

					if distanceFromCharacter(v22, Vector3.new(-9576, 6, 6230)) > 10 then
						tweenManager:topos(CFrame.new(-9576, 6, 6230))
					else
						for k, v23 in pairs({
							Part1 = "Really black",
							Part2 = "Really black",
							Part3 = "Dusty Rose",
							Part4 = "Storm blue",
							Part5 = "Really black",
							Part6 = "Parsley green",
							Part7 = "Really black",
							Part8 = "Dusty Rose",
							Part9 = "Really black",
							Part10 = "Storm blue",
						}) do
							pcall(function()
								local v24 = map["Haunted Castle"]["Lab Puzzle"].ColorFloor.Model[k]

								if v24.BrickColor.Name ~= v23 then
									repeat
										task.wait()
										fireclickdetector(v24.ClickDetector)
									until v24.BrickColor.Name == v23
								end
							end)
						end
					end
				end

				return true
			end

			local v22 = v18
			local distanceFromCharacter = v22.DistanceFromCharacter
			local vector = Vector3.new

			if distanceFromCharacter(v22, Vector3.new(-8654, 141, 6169)) < 10 then
				tbl6:FireInvoke("gravestoneEvent", 2, true)
			else
				tweenManager:topos(CFrame.new(-8654, 141, 6169))
			end

			return true
		end

		local v22 = flag3

		if not flag3 then
			v22 = flag2
		end

		fn31("AutoGetSkullGuitar", fn44, v22)
		local n3 = 0

		local function fn45()
			local v23 = gameData:DetectChest()

			if v23 then
				if v18.Character and v18.Character:FindFirstChild("Humanoid") and v18.Character.Humanoid.Sit == true then
					v18.Character.Humanoid.Sit = false
				end

				tweenManager:topos(v23.CFrame * CFrame.new(0, 3, 2))
				n3 += 1
				task.wait(0.1)
			elseif tbl.AutoHopChest or tbl.HopIfNoChest then
				if not (n3 >= (tonumber(tbl.ChestHopCount) or 10)) then
				end

				n3 = 0
				local n4 = tbl and tonumber(tbl.HopDelay) or 10

				if tbl6 and tbl6.SendNotify then
					tbl6:SendNotify("Chest Farm", "Target chests reached or no chests found. Hopping in " .. tostring(math.floor(n4)) .. "s...", math.min(math.floor(n4), 5))
				end

				utilities:ServerHop(n4)
				task.wait(n4 + 5)
			end

			if tbl.StopChest or tbl.StopHopChestIfChalice then
				if utilities:CheckToolName("God's Chalice") or utilities:CheckToolName("Fist of Darkness") or utilities:CheckToolName("Sweet Chalice") then
					tbl.AutoChest = false
					tbl.AutoHopChest = false
				end
			end
		end

		fn31("AutoChest", fn45, true)

		local function fn46()
			if utilities:CheckMon("Core") then
				local enemies2 = utilities:GetEnemies("Core")
				if enemies2 then
					return subFunction:Attack(enemies2)
				end
			end
		end

		fn31("AutoFactoryRaid", fn46, flag2)

		fn31("AutoFarmPirateRaid", function()
			local v23 = nil

			for _, child in pairs(v2.Enemies:GetChildren()) do
				if child.Name ~= "rip_indra True Form" then
					local humanoid2 = child:FindFirstChild("Humanoid")

					if humanoid2 and humanoid2.Health > 0 then
						local primaryPart = child and child.PrimaryPart

						if primaryPart then
							local position2 = child.PrimaryPart.Position
							local vector = Vector3.new
							primaryPart = (position2 - Vector3.new(-5556, 314, -2988)).Magnitude < 700
						end

						if primaryPart then
							v23 = child
						end
					end
				end
			end

			if v23 then
				return subFunction:Attack(v23, true)
			end
		end, flag3)

		fn31("AutoSoulReaper", function()
			local enemies2 = utilities:GetEnemies("Soul Reaper")
			if enemies2 then
				return subFunction:Attack(enemies2)
			end

			if utilities:CheckToolName("Hallow Essence") then
				utilities:EquipTool("Hallow Essence")
				return tweenManager:topos(CFrame.new(-8932.322265625, 146.83154296875, 6062.55078125))
			end
		end, flag3)

		local function fn47()
			if utilities:CheckMon("Greybeard") then
				local enemies2 = utilities:GetEnemies("Greybeard")
				if enemies2 then
					return subFunction:Attack(enemies2)
				end
			end
		end

		fn31("AutoGreybeard", fn47, flag)

		fn31("AutoDarkbeard", function()
			if utilities:CheckMon("Darkbeard") then
				local enemies2 = utilities:GetEnemies("Darkbeard")
				if enemies2 then
					return subFunction:Attack(enemies2)
				end
			end

			if utilities:CheckToolName("Fist of Darkness") then
				utilities:EquipTool("Fist of Darkness")
				return tweenManager:topos(CFrame.new(3777, 14, -3499))
			end
		end, flag2)

		local function fn48()
			if utilities:CheckMon("Cursed Captain") then
				local enemies2 = utilities:GetEnemies("Cursed Captain")
				if enemies2 then
					return subFunction:Attack(enemies2)
				end
			end
		end

		fn31("AutoCursedCaptain", fn48, flag2)

		fn31("AutoRipIndra", function()
			if utilities:CheckMon("rip_indra True Form") then
				local enemies2 = utilities:GetEnemies("rip_indra True Form")
				if enemies2 then
					return subFunction:Attack(enemies2)
				end

				if utilities:CheckToolName("God's Chalice") then
					utilities:EquipTool("God's Chalice")
					return tweenManager:topos(CFrame.new(-5561, 314, -2663))
				end
				return
			end

			return tweenManager:topos(CFrame.new(-5333, 424, -2673))
		end, flag3)

		fn31("AutoFarmObservation", function()
			if not v5:HasTag(v18.Character, "Ken") then
				return nil
			end

			if v18:GetAttribute("KenDodgesLeft") > 1 then
				remotes.CommE:FireServer("Ken", true)
			end

			local visionRadius = v18:FindFirstChild("VisionRadius")
			local attribute2 = v18:GetAttribute("KenMaxDodges") or 8
			local attribute3 = v18:GetAttribute("KenDodgesLeft") or 0

			if visionRadius and not (attribute3 <= 0) then
				local enemies2, cframe

				if flag then
					enemies2 = utilities:GetEnemies({ "Galley Captain" })
					cframe = CFrame.new(5533, 88, 4852)
				elseif flag2 then
					enemies2 = utilities:GetEnemies({ "Lava Pirate" })
					cframe = CFrame.new(-5478, 16, -5247)
				else
					enemies2 = nil
					cframe = nil

					if flag3 then
						enemies2 = utilities:GetEnemies({ "Venomous Assailant" })
						cframe = CFrame.new(4731.2719, 1090.178, 1078.1713)
					end
				end

				if enemies2 and enemies2:FindFirstChild("HumanoidRootPart") then
					if attribute3 >= 1 then
						tweenManager:topos(enemies2.HumanoidRootPart.CFrame * CFrame.new(3, 0, 0), true)
					else
						tweenManager:topos(enemies2.HumanoidRootPart.CFrame * CFrame.new(0, 50, 10), true)

						if attribute3 == 0.5 and tbl.StartObsHop then
							v4.__ServerBrowser:InvokeServer("teleport", v4.__ServerBrowser:InvokeServer("getjob"))
						end
					end

					if attribute3 <= 0.5 then
						remotes.CommE:FireServer("Ken", true)
						tbl6:SendNotify("Observation", "Dodges low! (" .. attribute3 .. "/" .. attribute2 .. ")", 10)
					end
				else
					tweenManager:topos(cframe, true)
				end
			else
				tbl6:SendNotify("Observation", "Max Vision reached!", 10)
			end
		end, true)

		local function fn49()
			if not VerifyQuest("Training Dummy") and not v18.PlayerGui.Main:FindFirstChild("Quest").Visible then
				return tbl6:FireInvoke("ArenaTrainer")
			end
			local enemies2 = utilities:GetEnemies("Training Dummy")
			if enemies2 then
				return subFunction:Attack(enemies2)
			end
			utilities:MobsNextSpawn("Training Dummy")
		end

		fn31("DummyTraining", fn49, flag3)

		fn31("AutoStartRaceV2", function()
			if not data.Race:FindFirstChild("Evolved") then
				local Alchemist = tbl6:FireInvoke("Alchemist", "1")

				if Alchemist == 0 or Alchemist == 2 then
					local v23 = v18
					local distanceFromCharacter = v23.DistanceFromCharacter
					local vector = Vector3.new

					if distanceFromCharacter(v23, Vector3.new(-2777, 73, -3570)) <= 4 then
						tbl6:FireInvoke("Alchemist", Alchemist == 0 and "2" or "3")
					else
						tweenManager:topos(CFrame.new(-2777, 73, -3570))
					end
				elseif Alchemist == 1 then
					local tbl17 = { "Flower 1", "Flower 2", "Flower 3" }
					local v23, v24, v25 = ipairs(tbl17)
					local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v23, v24, v25)
					local _vm___1

					for k, v26 in v23, v24, v25 do
						if not utilities:CheckToolName(v26) then
							if k == 3 then
								local flower1 = v2:FindFirstChild("Flower1")
								local flower2 = v2:FindFirstChild("Flower2")
								local flag4 = not flower1
								flag4 = (flag4 or flower1.Transparency == 1) and (not flower2 or flower2.Transparency == 1)

								if utilities:CheckToolName("Flower 1") and utilities:CheckToolName("Flower 2") or flag4 then
									local enemies2 = utilities:GetEnemies("Swan Pirate")

									if enemies2 then
										subFunction:Attack(enemies2, true)
									else
										utilities:MobsNextSpawn("Swan Pirate")
									end

									return
								end

								continue
							end

							local v27 = v2:FindFirstChild("Flower" .. k)

							if v27 and v27.Transparency ~= 1 then
								tweenManager:topos(v27.CFrame)
								task.wait(0.5)
								return
							end

							local _vm___2 = 1
							local flag4 = false
							local exitTo = nil

							for i = k + 1, 2 do
								if not utilities:CheckToolName(tbl17[i]) then
									local v28 = v2:FindFirstChild("Flower" .. i)
									if v28 and v28.Transparency ~= 1 then
										exitTo = 1
										break
									end
								end
							end

							if exitTo == 1 then
								flag4 = true
							end

							_vm___2 = _vm___1

							if not flag4 then
								tweenManager:topos(CFrame.new(-382, 73, 290))
								tbl6:SendNotify("Race V1-V2 Quest", "Waiting for night time", 8)
								return
							end
						end
					end

					local _vm_a_0
					_vm_a_1 = _vm_a_0
					local _vm_U_0
					local _vm_U_1 = _vm_U_0
					local _vm___0
					_vm___1 = _vm___0
				end
			end
		end, flag2)

		fn31("AutoStartRaceV3", function()
			if not data.Race:FindFirstChild("Evolved") then
				return nil
			end
			local Wenlocktoad = tbl6:FireInvoke("Wenlocktoad", "1")

			if Wenlocktoad == 0 or Wenlocktoad == 2 then
				local v23 = v18
				local distanceFromCharacter = v23.DistanceFromCharacter
				local vector = Vector3.new

				if distanceFromCharacter(v23, Vector3.new(-1992, 125, -73)) <= 4 then
					tbl6:FireInvoke("Wenlocktoad", Wenlocktoad == 0 and "2" or "3")
				else
					local v24 = tweenManager
					local topos = v24.topos
					local vector2 = Vector3.new
					topos(v24, Vector3.new(-1992, 125, -73))
				end
			elseif Wenlocktoad == 1 then
				if data.Race.Value == "Mink" then
					functions.AutoChest.Call()
				elseif data.Race.Value == "Human" then
					if checkv3boss() then
						local enemies2 = utilities:GetEnemies({ "Diamond", "Orbitus", "Jeremy" })
						if enemies2 then
							return subFunction:Attack(enemies2)
						end
					else
						tweenManager:topos(CFrame.new(-382, 73, 290))
						tbl6:SendNotify("Human V3 Quest", "Diamond, Orbitus, or Jeremy not currently spawned.", 8)
					end
				elseif data.Race.Value == "Ghoul" then
					local huge = math.huge
					local v23 = nil

					for _, child in pairs(v3:GetChildren()) do
						if child.Name ~= v18.Name and not child:GetAttribute("IslandRaiding") and not child:GetAttribute("PvpDisabled") then
							local v24 = v2.Characters:FindFirstChild(child.Name)

							if v24 then
								local humanoidRootPart3 = v24:FindFirstChild("HumanoidRootPart")
								local humanoid2 = v24:FindFirstChildOfClass("Humanoid")

								if humanoidRootPart3 and humanoid2 and humanoid2.Health > 0 then
									local n4 = child.Data.Level.Value - v18.Data.Level.Value

									if n4 < 500 and n4 > -500 then
										if not fn26(v24) then
											local magnitude = (humanoidRootPart3.Position - v18.Character.HumanoidRootPart.Position).Magnitude

											if magnitude < huge then
												huge = magnitude
												v23 = humanoidRootPart3
											end
										end
									end
								end
							end
						end
					end

					if v23 then
						local parent = v23.Parent
						local humanoid2 = parent:FindFirstChildOfClass("Humanoid")

						while true do
							task.wait()
							utilities:AutoHaki()
							utilities:EquipWeapon()
							local v24 = tweenManager
							local topos = v24.topos
							local n4 = v23.CFrame * CFrame.new(0, 8, 0)
							local cframe = CFrame.Angles
							local rad = math.rad
							topos(v24, n4 * cframe(-0.78539816339744828, 0, 0), true)
							local parent2 = v23.Parent

							if parent2 and humanoid2 and humanoid2.Health > 0 then
								AimbotTargetInstance = parent
								position = v23.Position
								fn16()
								if not (not tbl.AutoStartRaceV3 or not humanoid2 or humanoid2.Health <= 0 or not v23.Parent) then
									continue
								end
							else
								AimbotTargetInstance = nil
								position = nil
								break
							end

							break
						end

						AimbotTargetInstance = nil
						position = nil
					end
				elseif data.Race.Value == "Skypiea" then
					local huge = math.huge
					local v23 = nil

					for _, child in pairs(v3:GetChildren()) do
						if child.Name ~= v18.Name and not child:GetAttribute("IslandRaiding") and not child:GetAttribute("PvpDisabled") and tostring(child.Data.Race.Value) == "Skypiea" then
							local v24 = v2.Characters:FindFirstChild(child.Name)

							if v24 then
								local humanoidRootPart3 = v24:FindFirstChild("HumanoidRootPart")
								local humanoid2 = v24:FindFirstChildOfClass("Humanoid")

								if humanoidRootPart3 and humanoid2 and humanoid2.Health > 0 then
									local n4 = child.Data.Level.Value - v18.Data.Level.Value

									if n4 < 500 and n4 > -500 then
										if not fn26(v24) then
											local magnitude = (humanoidRootPart3.Position - v18.Character.HumanoidRootPart.Position).Magnitude

											if magnitude < huge then
												huge = magnitude
												v23 = humanoidRootPart3
											end
										end
									end
								end
							end
						end
					end

					if v23 then
						local parent = v23.Parent
						local humanoid2 = parent:FindFirstChildOfClass("Humanoid")

						while true do
							task.wait()
							utilities:AutoHaki()
							utilities:EquipWeapon()
							local v24 = tweenManager
							local topos = v24.topos
							local n4 = v23.CFrame * CFrame.new(0, 8, 0)
							local cframe = CFrame.Angles
							local rad = math.rad
							topos(v24, n4 * cframe(-0.78539816339744828, 0, 0), true)
							local parent2 = v23.Parent

							if parent2 and humanoid2 and humanoid2.Health > 0 then
								AimbotTargetInstance = parent
								position = v23.Position
								fn16()
								if not (not tbl.AutoStartRaceV3 or not humanoid2 or humanoid2.Health <= 0 or not v23.Parent) then
									continue
								end
							else
								AimbotTargetInstance = nil
								position = nil
								break
							end

							break
						end

						AimbotTargetInstance = nil
						position = nil
					end
				else
					tbl6:SendNotify("Supports Rabbit/Human/Sky V3", "wait for me to update all v3, love from flazhy...", 8)
				end
			end
		end, flag2)

		local function fn50()
			if tbl.Autostopraid then
				if fragments.Value >= (tonumber(tbl.FragsCap) or 10000) then
					tbl6._AutoRaidToggle.Update(false)
					return
				end
			end

			if v18.PlayerGui.Main.TopHUDList.RaidTimer.Visible and v18:GetAttribute("IslandRaiding") then
				local tbl17 = {}

				for _, child in ipairs(v2.Enemies:GetChildren()) do
					if child:FindFirstChild("Humanoid") and child:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 and v18:DistanceFromCharacter(child.HumanoidRootPart.Position) < 500 then
						table.insert(tbl17, child)
					end
				end

				if #tbl17 > 0 then
					local currentRaidIslandIndex = gameData:GetCurrentRaidIslandIndex()

					if tbl.InstantKillLateIslands and currentRaidIslandIndex and (currentRaidIslandIndex == 4 or currentRaidIslandIndex == 5) then
						fn21(tbl17)
						task.wait(0.2)
					else
						local v23 = tbl17[1]

						if v23 then
							subFunction:Attack(v23, true)
						end
					end
				else
					local raidIslands = gameData:GetRaidIslands()

					if raidIslands then
						local v23 = tweenManager
						local topos = v23.topos
						local cframe = CFrame.new
						local position2 = raidIslands.Position
						local vector = Vector3.new
						topos(v23, cframe(position2 + Vector3.new(0, 80, 0)), true)
					end
				end
			end

			if utilities:CheckToolName("Special Microchip") and not v18.PlayerGui.Main.TopHUDList.RaidTimer.Visible and not gameData:GetRaidIslands() and not v18:GetAttribute("IslandRaiding") then
				if flag2 then
					local vector = Vector3.new
					tweenManager:topos(CFrame.new(Vector3.new(-6522, 308, -4658)))

					if (humanoidRootPart.Position - Vector3.new(-6522, 308, -4658)).Magnitude <= 5 then
						fireclickdetector(map.CircleIsland.RaidSummon2.Button.Main.ClickDetector)
					end
				elseif flag3 then
					local vector = Vector3.new
					tweenManager:topos(CFrame.new(Vector3.new(-5073, 315, -3153)))

					if (humanoidRootPart.Position - Vector3.new(-5073, 315, -3153)).Magnitude <= 5 then
						fireclickdetector(map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector)
					end
				end
			elseif tbl.SelectRaid and tbl.AutoBuyChip and not utilities:CheckToolName("Special Microchip") then
				if tbl.AutoUnstoreBelowFruit and not utilities:Checkfruit() and not v18:GetAttribute("IslandRaiding") then
					local lowestFruit = utilities:GetLowestFruit()

					if lowestFruit then
						tbl6:FireInvoke("LoadFruit", lowestFruit.StorageKey or lowestFruit.Name)
						task.wait(0.5)
						local v23 = utilities:Checkfruit()

						if v23 and v18.Character and v18.Character:FindFirstChildOfClass("Humanoid") then
							local v24 = v18.Backpack:FindFirstChild(v23)

							if v24 then
								v18.Character.Humanoid:EquipTool(v24)
							end
						end
					end
				elseif not v18:GetAttribute("IslandRaiding") then
					local v23 = utilities:Checkfruit()

					if v23 and v18.Character and v18.Character:FindFirstChildOfClass("Humanoid") then
						local v24 = v18.Backpack:FindFirstChild(v23)

						if v24 then
							v18.Character.Humanoid:EquipTool(v24)
						end
					end

					tbl6:FireInvoke("RaidsNpc", "Select", tbl.SelectRaid)
					task.wait(1)
				else
					task.wait(1)
				end
			end
		end

		local v23 = flag2

		if not flag2 then
			v23 = flag3
		end

		fn31("AutoRaidFull", fn50, v23)
		local n4 = 0

		fn31("AutoDungeonFull", function()
			local dungeon = map:FindFirstChild("Dungeon")
			if not dungeon then
				return
			end

			local function fn51()
				local position2 = humanoidRootPart.Position
				local huge = math.huge
				local v24 = nil
				local n5 = 0
				local _vm___1 = 1

				for i = 1, 100 do
					local v25 = dungeon:FindFirstChild(tostring(i))

					if v25 then
						local position3 = v25:GetPivot().Position
						local v26 = math.sqrt((position2.X - position3.X) ^ 2 + (position2.Z - position3.Z) ^ 2)
						local extentsSize = v25:GetExtentsSize()

						if v26 < math.max(extentsSize.X, extentsSize.Z) / 2 + 300 and v26 < huge then
							huge = v26
							v24 = v25
							n5 = i
						end
					end
				end

				local _vm___0
				_vm___1 = _vm___0
				return v24, n5
			end

			local function fn52(arg)
				local tbl17 = {}
				if not arg then
					return tbl17
				end
				local extentsSize = arg:GetExtentsSize()
				local n5 = math.max(extentsSize.X, extentsSize.Z) / 2 + 300
				local position2 = arg:GetPivot().Position

				for _, child in ipairs(v2.Enemies:GetChildren()) do
					if child:IsDescendantOf(v2) and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 and child:FindFirstChild("HumanoidRootPart") and child.Name ~= "Blank Buddy" and not string.find(string.lower(child.Name), "shadow") then
						local position3 = child.HumanoidRootPart.Position

						if math.sqrt((position2.X - position3.X) ^ 2 + (position2.Z - position3.Z) ^ 2) < n5 then
							table.insert(tbl17, child)
						end
					end
				end

				return tbl17
			end

			local position2, v24 = fn51()
			local v25 = fn52(position2)

			if tbl.AutoDungeonShrine and v24 == n4 then
				local dungeonProps = gameData:GetDungeonProps(position2)

				if dungeonProps then
					local position3 = dungeonProps:GetPivot().Position

					if v18:DistanceFromCharacter(position3) > 10 then
						local v26 = tweenManager
						local topos = v26.topos
						local cframe = CFrame.new
						local vector = Vector3.new
						topos(v26, cframe(position3 + Vector3.new(0, 5, 0)), true)
					else
						fn16()
					end

					return
				end
			end

			if #v25 == 0 then
				local now2 = tick()

				while true do
					task.wait(0.5)
					position2, v24 = fn51()
					v25 = fn52(position2)
					if not (#v25 > 0 or tick() - now2 > 2) then
						continue
					end
					break
				end
			end

			if #v25 > 0 then
				n4 = v24
				local v26 = v25[1]
				local tool = v18.Character:FindFirstChildOfClass("Tool")
				local position3 = v26 and v26:FindFirstChild("HumanoidRootPart") and v26.HumanoidRootPart.Position
				position2 = position2 and position2:GetPivot().Position or position3 or Vector3.zero
				local n5 = v26 and position3 and position3.Y > position2.Y + 100 and 0 or tbl.DoubleAttack and 20 or tool and tool.ToolTip == "Blox Fruit" and tool.Name ~= "Ice-Ice" and tool.Name ~= "Light-Light" and 20 or 30

				if v26 and v26.Parent and v26:FindFirstChild("HumanoidRootPart") then
					tweenManager:topos(CFrame.new(v26.HumanoidRootPart.Position + Vector3.new(0, n5, 0)), true)
					utilities:EquipWeapon()
					utilities:AutoHaki()
					utilities:BringEnemies(v26)
					subFunction:Attack(v26, true)
				end
			elseif v24 <= n4 then
				local dungeonIslands = gameData:GetDungeonIslands()

				if dungeonIslands and v18:DistanceFromCharacter(dungeonIslands.Position) > 20 then
					local v26 = tweenManager
					local topos = v26.topos
					local cframe = CFrame.new
					local position3 = dungeonIslands.Position
					local vector = Vector3.new
					topos(v26, cframe(position3 + Vector3.new(0, 10, 0)), true)
					task.wait(1)
				end
			end
		end, true)

		local function fn51()
			if map:FindFirstChild("Dungeon") then
				return
			end

			pcall(function()
				game.ReplicatedStorage.DungeonShared.DataRemote:InvokeServer("TryUnlockDifficulty", "Simulation", "Hard")
			end)

			pcall(function()
				game.ReplicatedStorage.DungeonShared.DataRemote:InvokeServer("TryUnlockDifficulty", "Simulation", "Challenge")
			end)

			pcall(function()
				net["RF/DungeonNPCNetworkFunction"]:InvokeServer("UnlockDifficulty")
			end)

			pcall(function()
				net["RF/DungeonNPCNetworkFunction"]:InvokeServer("UnlockNext")
			end)

			pcall(function()
				net["RF/DungeonNPCNetworkFunction"]:InvokeServer("Unlock")
			end)

			task.wait(5)
		end

		fn31("AutoUnlockDifficulties", fn51, true, true)

		local function fn52()
			pcall(function()
				v4.Remotes.AccessoryInteract:InvokeServer("d")
			end)

			task.wait(1.5)
		end

		fn31("AutoBuyTrinkets", fn52, true, true)

		local function fn53()
			local tbl17 = {}

			local ok, result = pcall(function()
				return Net:RemoteFunction("GetAllItemValues"):InvokeServer()
			end)

			if ok and result then
				for _, v24 in next, result, nil do
					local flag4 = v24.Key == "AccessoryType" and v24.Value == "Trinket"
					local flag5

					if flag4 then
						flag5 = flag4
					else
						flag5 = v24.Key == "Type" and v24.Value == "Trinket"
					end

					if flag5 then
						if v24.NetworkedUID then
							table.insert(tbl17, v24.NetworkedUID)
						end
					end
				end
			end

			if #tbl17 >= 3 then
				pcall(function()
					v4.Remotes.AccessoryInteract:InvokeServer("a", tbl17[1], tbl17[2], tbl17[3])
				end)
			end

			task.wait(2)
		end

		fn31("AutoFuseTrinkets", fn53, true, true)

		fn31("AutoRefineTrinkets", function()
			local tbl17 = {}

			local ok, result = pcall(function()
				return Net:RemoteFunction("GetAllItemValues"):InvokeServer()
			end)

			if ok and result then
				for _, v24 in next, result, nil do
					local flag4 = v24.Key == "AccessoryType" and v24.Value == "Trinket"
					local flag5

					if flag4 then
						flag5 = flag4
					else
						flag5 = v24.Key == "Type" and v24.Value == "Trinket"
					end

					if flag5 then
						if v24.NetworkedUID then
							table.insert(tbl17, v24.NetworkedUID)
						end
					end
				end
			end

			if #tbl17 >= 1 then
				pcall(function()
					v4.Remotes.AccessoryInteract:InvokeServer("c", tbl17[1])
				end)
			end

			task.wait(2)
		end, true, true)

		fn31("AutoScrapTrinkets", function()
			local tbl17 = GetPlayerTrinketUIDs and GetPlayerTrinketUIDs() or {}

			if #tbl17 > 3 then
				local tbl18 = {}
				local _vm___1 = 1

				for i = 4, math.min(#tbl17, 10) do
					table.insert(tbl18, tbl17[i])
				end

				local _vm___0
				_vm___1 = _vm___0

				if #tbl18 > 0 then
					pcall(function()
						v4.Remotes.AccessoryInteract:InvokeServer("b", tbl18)
					end)
				end
			end

			task.wait(3)
		end, true, true)

		local function fn54()
			if v18.Character and v18.Character.PrimaryPart then
				local tbl17 = {}
				local tbl18 = {}
				local vector = Vector3.new
				tbl18.pos = Vector3.new(-5415, 314, -2212)
				tbl18.color = "Pure Red"
				local tbl19 = {}
				local vector2 = Vector3.new
				tbl19.pos = Vector3.new(-4972, 336, -3720)
				tbl19.color = "Snow White"
				local tbl20 = {}
				local vector3 = Vector3.new
				tbl20.pos = Vector3.new(-5420, 1089, -2667)
				tbl20.color = "Winter Sky"
				tbl17[1] = tbl18
				tbl17[2] = tbl19
				tbl17[3] = tbl20
				local exitTo = nil

				for _, v24 in next, tbl17, nil do
					if v18:DistanceFromCharacter(v24.pos) < 5 then
						exitTo = 1
						break
					end
				end

				if exitTo == 1 then
					v4.Modules.Net["RF/FruitCustomizerRF"]:InvokeServer({ StorageName = t7_1.color, Type = "AuraSkin", Context = "Equip" })
				end
			end

			if not tbl.AutoFarm and not tbl.AutoFarmBones and not tbl.AutoFarmPrince then
				local pathButton = gameData:GetPathButton()

				if pathButton then
					tweenManager:topos(pathButton.CFrame)
				elseif not tbl.AutoRipIndra then
					tweenManager:topos(CFrame.new(-5119, 315, -2964))
				end
			end
		end

		fn31("AutoOpenColorsTask", fn54, flag3)

		local function fn55()
			local prehistoricIsland = map:FindFirstChild("PrehistoricIsland")
			if not prehistoricIsland then
				return
			end
			local core = prehistoricIsland:FindFirstChild("Core")
			if not core then
				return
			end
			local interiorLava = core:FindFirstChild("InteriorLava")

			if interiorLava then
				local parent = interiorLava.Parent
				interiorLava:Destroy()

				if parent and parent ~= core then
					parent:Destroy()
				end
			end

			local volcanoRocks = core:FindFirstChild("VolcanoRocks")

			if volcanoRocks and prehistoricIsland then
				for _, descendant in ipairs(prehistoricIsland:GetDescendants()) do
					local v24 = string.lower(descendant.Name)

					if v24:find("lava") or v24:find("beam") then
						pcall(function()
							descendant:Destroy()
						end)
					end
				end
			end

			local activationPrompt = core:FindFirstChild("ActivationPrompt")
			local proximityPrompt = activationPrompt and activationPrompt:FindFirstChildOfClass("ProximityPrompt")

			if proximityPrompt and proximityPrompt.Enabled then
				if v18:DistanceFromCharacter(activationPrompt.CFrame.Position) <= 50 then
					fireproximityprompt(activationPrompt.ProximityPrompt, math.huge)
				else
					tweenManager:topos(activationPrompt.CFrame)
				end

				return
			end

			if utilities:CheckMon("Lava Golem") then
				local enemies2 = utilities:GetEnemies("Lava Golem")

				if enemies2 then
					local humanoidRootPart3 = enemies2:FindFirstChild("HumanoidRootPart")
					local humanoid2 = enemies2:FindFirstChildOfClass("Humanoid")

					if humanoidRootPart3 then
						humanoidRootPart3.Velocity = Vector3.zero
						humanoidRootPart3.AssemblyLinearVelocity = Vector3.zero
					end

					if humanoid2 then
						humanoid2.WalkSpeed = 0
						humanoid2.JumpPower = 0
					end

					return subFunction:Attack(enemies2, true)
				end
			end

			if volcanoRocks then
				for _, child in pairs(volcanoRocks:GetChildren()) do
					local vfxLayer = child:FindFirstChild("VFXLayer")

					if vfxLayer and child.VFXLayer.At0.Glow.Enabled == true then
						local position2 = child.VFXLayer.CFrame.Position
						local meshesVolcanoislandPlane005 = prehistoricIsland:FindFirstChild("Meshes/volcanoisland_Plane.005", true)
						local unit = meshesVolcanoislandPlane005 and (position2 - meshesVolcanoislandPlane005.Position).Unit
						local n5 = position2 + unit * 30

						if meshesVolcanoislandPlane005 and (n5 - meshesVolcanoislandPlane005.Position).Magnitude < 40 then
							local n6 = math.atan(unit.Z, unit.X) + tick() * 0.5
							n5 = position2 + Vector3.new(math.cos(n6) * 30, 5, math.sin(n6) * 30)
						end

						tweenManager:topos(CFrame.new(n5), true)

						if v18:DistanceFromCharacter(position2) <= 150 then
							if tbl.ShootGunVolcano then
								local selectGunVolcano = tbl.SelectGunVolcano or "Skull Guitar"

								if not v18.Character:FindFirstChild(selectGunVolcano) then
									local skullGuitar = v18.Backpack:FindFirstChild(selectGunVolcano) or v18.Backpack:FindFirstChild("Skull Guitar")

									if skullGuitar and v18.Character:FindFirstChild("Humanoid") then
										v18.Character.Humanoid:EquipTool(skullGuitar)
									else
										tbl6:FireInvoke("LoadItem", selectGunVolcano)
									end

									task.wait(0.2)
								end

								utilities:EquipWeapon("Gun")
								task.wait(0.15)
								customShoot(position2)
								local tool = v18.Character:FindFirstChildOfClass("Tool")

								if tool and tool:FindFirstChild("RemoteEvent") then
									pcall(function()
										tool.RemoteEvent:FireServer("TAP", position2)
									end)
								end
							else
								position = position2
								fn16()
								position = nil
							end
						end

						return
					end
				end
			end

			local prehistoricRelic = core:FindFirstChild("PrehistoricRelic")

			if prehistoricRelic and prehistoricRelic:FindFirstChild("Shield") then
				local v24 = tweenManager
				local topos = v24.topos
				local cFrame = prehistoricRelic.Shield.CFrame
				local vector = Vector3.new
				topos(v24, cFrame + Vector3.new(0, 3, 0), true)
				return
			end
		end

		fn31("AutoVolcanicEvent", fn55, flag3)

		fn31("AutoWhiteBelt", function()
			local v24 = v18
			local distanceFromCharacter = v24.DistanceFromCharacter
			local vector = Vector3.new

			if distanceFromCharacter(v24, Vector3.new(5867, 1208, 870)) <= 5 then
				net["RF/InteractDragonQuest"]:InvokeServer({ NPC = "Dojo Trainer", Command = "ClaimQuest" })
				task.wait(1)
				net["RF/InteractDragonQuest"]:InvokeServer({ NPC = "Dojo Trainer", Command = "RequestQuest" })
				task.wait(1)
			else
				tweenManager:topos(CFrame.new(5867, 1208, 870))
			end

			local enemies2 = utilities:GetEnemies(CheckQuest()[2])
			if enemies2 then
				return subFunction:Attack(enemies2)
			end
			utilities:MobsNextSpawn(CheckQuest()[2])
		end, flag3)

		local function fn56()
			local v24 = v18
			local distanceFromCharacter = v24.DistanceFromCharacter
			local vector = Vector3.new

			if distanceFromCharacter(v24, Vector3.new(5867, 1208, 870)) <= 5 then
				net["RF/InteractDragonQuest"]:InvokeServer({ NPC = "Dojo Trainer", Command = "ClaimQuest" })
				task.wait(1)
				net["RF/InteractDragonQuest"]:InvokeServer({ NPC = "Dojo Trainer", Command = "RequestQuest" })
				task.wait(1)
			else
				tweenManager:topos(CFrame.new(5867, 1208, 870))
			end

			functions.AutoTaskEliteHunter.Call()
		end

		fn31("AutoPurpleBelt", fn56, flag3)

		fn31("AutoCollectBones", function()
			if v18:GetAttribute("PrehistoricIslandParticipant") then
				if v2:FindFirstChild("DinoBone") then
					for _, child in pairs(v2:GetChildren()) do
						if child.Name == "DinoBone" then
							tweenManager:topos(child.CFrame)
						end
					end
				end
			end
		end, flag3)

		fn31("AutoCollectEgg", function()
			local prehistoricIsland = map:FindFirstChild("PrehistoricIsland")

			if prehistoricIsland then
				local core = prehistoricIsland:FindFirstChild("Core")
				core = core and core:FindFirstChild("SpawnedDragonEggs")

				if core and #core:GetChildren() > 0 then
					local v24 = next
					local children, v25 = core:GetChildren()

					for _, v26 in v24, children, v25 do
						if v26.Name == "DragonEgg" then
							local molten = v26:FindFirstChild("Molten")

							if molten and molten:FindFirstChild("ProximityPrompt") then
								local proximityPrompt = molten.ProximityPrompt

								if proximityPrompt.Enabled then
									tweenManager:topos(molten.CFrame)
									fireproximityprompt(proximityPrompt)
								end
							end
						end
					end
				end
			end
		end, flag3)

		local n5 = 1
		local now2 = tick()

		local function fn57()
			local emberTemplate = v2:FindFirstChild("EmberTemplate")
			if emberTemplate and emberTemplate:FindFirstChild("Part") and emberTemplate.Part.Position.Y > 10 then
				tweenManager:topos(emberTemplate.Part.CFrame * CFrame.new(0, 3, 0), true)
				return
			end

			if not gameData.CurrentQuest or gameData:TaskDone() then
				local v24, v25, v26, v27 = gameData:CheckQuestStatus()
				gameData.CurrentQuest = v24 and { HasQuest = v24, Mobs = v25, Progress = v26, QuestType = v27 } or nil
			end

			if not gameData.CurrentQuest then
				tweenManager:topos(CFrame.new(5864, 1209, 808))
				return
			end

			if gameData.CurrentQuest.QuestType == 1 and (gameData.CurrentQuest.Mobs == "Hydra Enforcer" or gameData.CurrentQuest.Mobs == "Venomous Assailant") then
				local enemies2 = utilities:GetEnemies(gameData.CurrentQuest.Mobs)
				if enemies2 then
					return subFunction:Attack(enemies2, true)
				end
				utilities:MobsNextSpawn(gameData.CurrentQuest.Mobs)
			elseif gameData.CurrentQuest.QuestType == 2 then
				local tbl17 = {}
				local vector = Vector3.new
				local vector2 = Vector3.new
				local vector3 = Vector3.new
				local vector4 = Vector3.new
				tbl17[1] = Vector3.new(5326, 1000.5, 441.52)
				tbl17[2] = Vector3.new(5344.88, 1000.5, 359.94)
				tbl17[3] = Vector3.new(5260.73, 1000.5, 345.5)
				tbl17[4] = Vector3.new(5237.99, 1000.5, 429.64)

				if tick() - now2 >= 2 then
					n5 = n5 % #tbl17 + 1
					now2 = tick()
				end

				local v24 = tbl17[n5]
				local humanoidRootPart3 = v18.Character and v18.Character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart3 then
					return
				end
				local magnitude = (humanoidRootPart3.Position - v24).Magnitude
				local v25 = tweenManager
				local topos = v25.topos
				local cframe = CFrame.new
				local vector5 = Vector3.new
				topos(v25, cframe(v24 + Vector3.new(0, 15, 0)), true)
				if magnitude > 150 then
					return
				end
				local selectGunBlaze = tbl.SelectGunBlaze or "Skull Guitar"
				local flag4 = not v18.Character:FindFirstChild(selectGunBlaze)

				if flag4 then
					flag4 = not (v18.Character:FindFirstChildOfClass("Tool") and v18.Character:FindFirstChildOfClass("Tool").ToolTip == "Gun")
				end

				if flag4 then
					local soulGuitar = v18.Backpack:FindFirstChild(selectGunBlaze) or v18.Backpack:FindFirstChild("Soul Guitar") or v18.Backpack:FindFirstChild("Skull Guitar")

					if soulGuitar and v18.Character:FindFirstChild("Humanoid") then
						v18.Character.Humanoid:EquipTool(soulGuitar)
					else
						tbl6:FireInvoke("LoadItem", selectGunBlaze)
					end

					task.wait(0.05)
				end

				utilities:EquipWeapon("Gun")
				customShoot(v24)

				if not tbl.ShootGunBlaze then
					position = v24
					fn16()
					position = nil
				end
			end
		end

		fn31("AutoQuestBlaze", fn57, flag3)

		fn31("AutoCollectFireFlowers", function()
			local fireFlowers = v2:FindFirstChild("FireFlowers")

			if fireFlowers then
				local children = fireFlowers:GetChildren()
				local _vm___1 = 1

				for i = 1, #children do
					local v24 = children[i]
					local primaryPart = v24:IsA("Model") and (v24.PrimaryPart or v24:FindFirstChildOfClass("MeshPart"))

					if primaryPart then
						if v18:DistanceFromCharacter(primaryPart.Position) > 3 then
							tweenManager:topos(primaryPart.CFrame)
						else
							fireproximityprompt(v24.ProximityPrompt, math.huge)
							task.wait(0.5)
						end

						return
					end
				end

				local _vm___0
				_vm___1 = _vm___0
			end

			local enemies2 = utilities:GetEnemies("Forest Pirate")
			if enemies2 then
				return subFunction:Attack(enemies2, true)
			end
			utilities:MobsNextSpawn("Forest Pirate")
		end, flag3)

		local function fn58()
			local raceEnergy = v18.Character:FindFirstChild("RaceEnergy")

			if raceEnergy and v18.Character:FindFirstChild("RaceTransformed") then
				if v18.Character.RaceEnergy.Value >= 1 and not v18.Character.RaceTransformed.Value then
					v18.Backpack.Awakening.RemoteFunction:InvokeServer({ true })
				end
			end

			if data.Race.Value == "Draco" then
				tbl6:FireInvoke("UpgradeRace", "Buy", 2)
			else
				tbl6:FireInvoke("UpgradeRace", "Buy")
			end

			if tbl.TrainMethod == "Bones" then
				local enemies2 = utilities:GetEnemies(tbl6.DataList.BonesList)
				if enemies2 then
					return subFunction:Attack(enemies2, true)
				end
				utilities:MobsNextSpawn("Reborn Skeleton")
			elseif tbl.TrainMethod == "Cakes" then
				local enemies2 = utilities:GetEnemies(tbl6.DataList.CakesList)
				if enemies2 then
					return subFunction:Attack(enemies2, true)
				end
				utilities:MobsNextSpawn("Baking Staff")
			end
		end

		fn31("AutoTrainGear", fn58, flag3)

		local function fn59()
			local mysticIsland = map:FindFirstChild("MysticIsland")

			if mysticIsland then
				local v24 = next
				local children, v25 = mysticIsland:GetChildren()

				for _, v26 in v24, children, v25 do
					if v26.Name == "Part" and v26:IsA("MeshPart") then
						tweenManager:topos(v26.CFrame)
					end
				end
			end
		end

		fn31("TweenMGear", fn59, flag3)

		local function fn60()
			if v18.Data.Race.Value == "Ghoul" then
				return nil
			end

			if utilities:CheckInventory("Material", "Ectoplasm") < 100 then
				local enemies2 = utilities:GetEnemies({ "Ship Deckhand", "Ship Engineer", "Ship Steward", "Ship Officer" })
				if enemies2 then
					return subFunction:Attack(enemies2, true)
				end
				return utilities:MobsNextSpawn("Ship Deckhand")
			end

			if utilities:CheckToolName("Hellfire Torch") then
				local v24 = v18
				local distanceFromCharacter = v24.DistanceFromCharacter
				local vector = Vector3.new

				if distanceFromCharacter(v24, Vector3.new(921, 125, 33453)) < 10 then
					tbl6:FireInvoke("Ectoplasm", "BuyCheck", 4)
					task.wait()
					tbl6:FireInvoke("Ectoplasm", "Buy", 4)
				else
					tweenManager:topos(CFrame.new(921, 125, 33453))
				end
			else
				if utilities:CheckMon("Cursed Captain") then
					local enemies2 = utilities:GetEnemies("Cursed Captain")
					if enemies2 then
						return subFunction:Attack(enemies2)
					end
					return utilities:MobsNextSpawn("Cursed Captain")
				end

				joinAPI("CursedCaptain", 5)
			end
		end

		fn31("AutoGetGhoulRace", fn60, flag2)

		fn31("AutoGetCyborgRace", function()
			if data.Race.Value == "Cyborg" and tbl6:FireInvoke("CyborgTrainer", "Check") == 2 then
				return nil
			end
			local flag4 = tbl6:FireInvoke("CyborgTrainer", "Check") == 1
			local flag5

			if flag4 then
				flag5 = flag4
			else
				flag5 = map.CircleIsland and map.CircleIsland:FindFirstChild("RaidSummon") and map.CircleIsland.RaidSummon:FindFirstChild("Button") and map.CircleIsland.RaidSummon.Button:FindFirstChild("Main") and not map.CircleIsland.RaidSummon.Button.Main.CanCollide
			end

			if flag5 then
				if fragments.Value >= 2500 then
					tbl6:FireInvoke("CyborgTrainer", "Buy")
				else
					tbl6:SendNotify("Auto Cyborg Race", "Not enough fragments to buy Cyborg", 10)
				end

				return
			end

			local str5 = "OnionHub Hub/" .. v18.Name .. "CyborgRace.json"

			if isfolder and makefolder and not isfolder("OnionHub Hub") then
				makefolder("OnionHub Hub")
			end

			local v24 = isfile and isfile(str5)
			local result = nil

			if v24 then
				local ok
				ok, result = pcall(readfile, str5)
				ok = ok and result and result ~= ""
				local v25 = nil

				if not ok then
					result = v25
				end
			end

			local function fn61(arg)
				if writefile then
					pcall(writefile, str5, tostring(arg))
				end
			end

			local vector = Vector3.new

			if utilities:CheckToolName("Core Brain") then
				fn61("Unlocked")
				local coreBrain = v18.Backpack:FindFirstChild("Core Brain") or v18.Character and v18.Character:FindFirstChild("Core Brain")

				if coreBrain and coreBrain.Parent == v18.Backpack and v18.Character:FindFirstChildOfClass("Humanoid") then
					v18.Character.Humanoid:EquipTool(coreBrain)
				end

				tweenManager:topos(CFrame.new(Vector3.new(-5544, 229, -5938)))

				if (humanoidRootPart.Position - Vector3.new(-5544, 229, -5938)).Magnitude <= 8 then
					fireclickdetector(map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
					task.wait(0.5)
				end

				return
			end

			if result == nil and not utilities:CheckToolName("Fist of Darkness") then
				tweenManager:topos(CFrame.new(Vector3.new(-5544, 229, -5938)))

				if (humanoidRootPart.Position - Vector3.new(-5544, 229, -5938)).Magnitude <= 8 then
					fireclickdetector(map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
					task.wait(0.5)

					if v18.PlayerGui:FindFirstChild("Notifications") then
						for _, child in ipairs(v18.PlayerGui.Notifications:GetChildren()) do
							if child:IsA("TextLabel") and child.Text and child.Text ~= "" then
								local v25 = string.lower(child.Text)
								if v25:find("core brain") or v25:find("supply a <core brain>") or v25:find("has been processed") then
									fn61("Unlocked")
									return
								end

								if v25:find("microchip not found") then
									fn61("Chest")
									return
								end
							end
						end
					end
				end

				return
			end

			if v18.PlayerGui:FindFirstChild("Notifications") then
				for _, child in ipairs(v18.PlayerGui.Notifications:GetChildren()) do
					local isTextLabel = child:IsA("TextLabel")

					if isTextLabel and child.Text and child.Text ~= "" then
						local v25 = string.lower(child.Text)

						if v25:find("core brain") or v25:find("supply a <core brain>") or v25:find("has been processed") then
							fn61("Unlocked")
							result = "Unlocked"
						end
					end
				end
			end

			local secretLabDoors = map.CircleIsland and map.CircleIsland:FindFirstChild("SecretLabDoors")

			if not (result == "Unlocked" or secretLabDoors and secretLabDoors:FindFirstChild("colormodel") and secretLabDoors.colormodel.Color.G > secretLabDoors.colormodel.Color.R) then
				if not utilities:CheckToolName("Fist of Darkness") then
					functions.AutoChest.Call()
				else
					local fistOfDarkness = v18.Backpack:FindFirstChild("Fist of Darkness") or v18.Character and v18.Character:FindFirstChild("Fist of Darkness")

					if fistOfDarkness and fistOfDarkness.Parent == v18.Backpack and v18.Character:FindFirstChildOfClass("Humanoid") then
						v18.Character.Humanoid:EquipTool(fistOfDarkness)
					end

					tweenManager:topos(CFrame.new(Vector3.new(-5544, 229, -5938)))

					if (humanoidRootPart.Position - Vector3.new(-5544, 229, -5938)).Magnitude <= 8 then
						fireclickdetector(map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
						fn61("Unlocked")
						task.wait(0.5)
					end
				end
			elseif utilities:CheckMon("Order") then
				local enemies2 = utilities:GetEnemies("Order")
				if enemies2 then
					return subFunction:Attack(enemies2)
				end
				tweenManager:topos(CFrame.new(-6300, 16, -4997))
			elseif utilities:CheckToolName("Microchip") then
				local microchip = v18.Backpack:FindFirstChild("Microchip") or v18.Character and v18.Character:FindFirstChild("Microchip")

				if microchip and microchip.Parent == v18.Backpack and v18.Character:FindFirstChildOfClass("Humanoid") then
					v18.Character.Humanoid:EquipTool(microchip)
				end

				tweenManager:topos(CFrame.new(Vector3.new(-5544, 229, -5938)))

				if (humanoidRootPart.Position - Vector3.new(-5544, 229, -5938)).Magnitude <= 8 then
					fireclickdetector(map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
					task.wait(1)
				end
			elseif fragments.Value >= 1000 then
				tbl6:FireInvoke("BlackbeardReward", "Microchip", "2")
				task.wait(1)
			else
				tbl6:SendNotify("Auto Cyborg Race", "Not enough fragments to buy Microchip", 10)
			end
		end, flag2)

		fn31("AutoLawRaid", function()
			if utilities:CheckMon("Order") then
				local enemies2 = utilities:GetEnemies("Order")

				if enemies2 then
					subFunction:Attack(enemies2)
				else
					tweenManager:topos(CFrame.new(-6300, 16, -4997))
				end

				return
			end

			local flag4 = not utilities:CheckMon("Order")

			if flag4 and not utilities:CheckToolName("Microchip") then
				tbl6:FireInvoke("BlackbeardReward", "Microchip", "2")
			else
				if not utilities:CheckMon("Order") and utilities:CheckToolName("Microchip") then
					local vector = Vector3.new
					tweenManager:topos(CFrame.new(Vector3.new(-5544, 229, -5938)))

					if (humanoidRootPart.Position - Vector3.new(-5544, 229, -5938)).Magnitude <= 5 then
						fireclickdetector(map.CircleIsland.RaidSummon.Button.Main.ClickDetector)
					end
				elseif not tbl6:FireInvoke("BlackbeardReward", "Microchip", "1") then
					tbl6:SendNotify("Auto Law Raid", "Not Enough Frags", 8)
				end
			end
		end, flag2)

		fn31("AutoBuyMelee", function()
			local v24 = melees[tbl.SelectMelee]

			if v24 then
				local v25 = workspace:FindFirstChild(v24.npc, true) or game:GetService("ReplicatedStorage").NPCs:FindFirstChild(v24.npc, true)
				local character2 = v18.Character
				character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

				if v25 and character2 then
					local humanoidRootPart3 = v25:FindFirstChild("HumanoidRootPart") or v25.PrimaryPart or v25:FindFirstChildWhichIsA("BasePart")

					if humanoidRootPart3 then
						if (character2.Position - humanoidRootPart3.Position).Magnitude > 10 then
							tweenManager:topos(humanoidRootPart3.CFrame * CFrame.new(0, 0, -5))
							task.wait(0.5)
						elseif typeof(v24.remote[1]) == "table" then
							for k in next, v24.remote, nil do
								tbl6:FireInvoke(unpack(args))
							end
						else
							tbl6:FireInvoke(unpack(v24.remote))
						end
					end
				end
			end
		end, true)

		fn31("Auto_Fishing", function()
			local selectedRod = tbl.SelectedRod
			if not selectedRod then
				return
			end

			if not utilities:CheckToolName(selectedRod) then
				pcall(function()
					net:FindFirstChild("RF/JobsRemoteFunction"):InvokeServer("FishingNPC", "FirstTimeFreeRod")
				end)

				tbl6:FireInvoke("LoadItem", selectedRod, { "Gear" })
			end

			if tbl.AutoCraftBait and tbl.SelectedBait then
				local ok, result = pcall(function()
					return Net:RemoteFunction("GetAllItemValues"):InvokeServer()
				end)

				ok = ok and result
				local flag4 = false

				if ok then
					local tbl17 = {}

					for _, v24 in next, result, nil do
						local v25 = tostring
						local str5 = tostring(v24.ItemId) .. "_" .. v25(v24.NetworkedUID)
						tbl17[str5] = tbl17[str5] or { ItemId = v24.ItemId, Attributes = {} }

						if v24.Value ~= nil then
							tbl17[str5].Attributes[v24.Key] = v24.Value
						end
					end

					local exitTo = nil
					local match

					for _, v24 in next, tbl17, nil do
						local ok2, result2 = pcall(function()
							return ItemConfig.match(v24.ItemId)
						end)

						ok2 = ok2 and result2 and result2:isOk()
						local str5 = nil

						if ok2 then
							local v25 = result2:unwrap()
							local debugLabel = v25 and v25.Index and v25.Index.DebugLabel
							str5 = nil

							if debugLabel then
								str5 = tostring(v25.Index.DebugLabel)
							end
						end

						match = str5 and (str5:match("^(.-)%s*%[") or str5)
						local attributes = v24.Attributes
						local flag5 = match == tbl.SelectedBait and attributes.IsOwned == true

						if flag5 then
							flag5 = (attributes.Quantity or 0) > 0
						end

						if flag5 then
							exitTo = 1
							break
						end
					end

					if exitTo == 1 then
						tbl6:FireInvoke("LoadItem", match, { "Usables" })
						task.wait(0.5)
						flag4 = true
					end
				end

				if not flag4 then
					if net["RF/Craft"] and net["RF/Craft"]:InvokeServer("Check", tbl.SelectedBait) then
						net["RF/Craft"]:InvokeServer("Craft", tbl.SelectedBait, 1, {})
						task.wait(1.5)
						tbl6:FireInvoke("LoadItem", tbl.SelectedBait, { "Usables" })
						task.wait(0.5)
					end
				end
			end

			utilities:EquipTool(selectedRod)
			local character2 = v18.Character or character
			local humanoidRootPart3 = character2 and character2:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart3 then
				return
			end
			local v24 = GetWaterHeightAtLocation(humanoidRootPart3.Position)
			local Config = require(v4.FishReplicated.FishingClient.Config)
			local maxLaunchDistance = Config and Config.Rod and Config.Rod.MaxLaunchDistance or 150
			local lookVector = humanoidRootPart3.CFrame.LookVector
			local position2 = character2:FindFirstChild("Head") and character2.Head.Position

			if not position2 then
				local position3 = humanoidRootPart3.Position
				local vector = Vector3.new
				position2 = position3 + Vector3.new(0, 2, 0)
			end

			local v25 = v2
			local findPartOnRayWithIgnoreList = v25.FindPartOnRayWithIgnoreList
			local ray = Ray.new(position2, lookVector * maxLaunchDistance * 0.99751243781094523)
			local tbl17 = {}
			local characters = v2.Characters
			local enemies2 = v2.Enemies
			tbl17[1] = character2
			tbl17[2] = characters
			tbl17[3] = enemies2
			local v26, v27 = findPartOnRayWithIgnoreList(v25, ray, tbl17)
			local v28 = v2
			local findPartOnRayWithIgnoreList2 = v28.FindPartOnRayWithIgnoreList
			local ray2 = Ray.new
			local n6 = v27 or humanoidRootPart3.Position + lookVector * 40
			local vector = Vector3.new
			local vector2 = Vector3.new
			local v29 = ray2(n6 + Vector3.new(0, 3, 0), Vector3.new(0, -500, 0))
			local tbl18 = {}
			local characters2 = v2.Characters
			local enemies3 = v2.Enemies
			tbl18[1] = character2
			tbl18[2] = characters2
			tbl18[3] = enemies3
			local v30, v31 = findPartOnRayWithIgnoreList2(v28, v29, tbl18)
			tbl.LastCastLocation = Vector3.new(v27 and v27.X or (humanoidRootPart3.Position + lookVector * 40).X, math.max(v31 and v31.Y or v24, v24), v27 and v27.Z or (humanoidRootPart3.Position + lookVector * 40).Z)
			local v32 = character2:FindFirstChild(selectedRod)
			if not v32 then
				return
			end
			local attribute2 = v32:GetAttribute("ServerState")
			local attribute3 = v32:GetAttribute("State")
			local fishingReeling = v18.PlayerGui:FindFirstChild("Fishing_Reeling")
			local flag4 = attribute2 == "Biting"
			flag4 = flag4 or attribute3 == "Biting"

			if fishingReeling and fishingReeling.Enabled then
				local minigame = fishingReeling:FindFirstChild("Minigame")
				minigame = minigame and minigame:FindFirstChild("Container")
				local reelZone = minigame and minigame:FindFirstChild("ReelZone")
				local fish = minigame and minigame:FindFirstChild("Fish")
				minigame = minigame and minigame:FindFirstChild("Treasure")
				fish = tbl.AutoGetChest and minigame and minigame.Visible and minigame or fish

				if reelZone and fish and fish.Visible then
					local n7 = fish.Position.X.Scale + fish.Size.X.Scale * 0.5 - reelZone.Position.X.Scale + reelZone.Size.X.Scale * 0.5

					if n7 > 0.03 then
						v8:SendMouseButtonEvent(0, 0, 0, true, game, 1)
					elseif n7 < -0.03 then
						v8:SendMouseButtonEvent(0, 0, 0, false, game, 1)
					else
						v8:SendMouseButtonEvent(0, 0, 0, true, game, 1)
						task.wait(0.02)
						v8:SendMouseButtonEvent(0, 0, 0, false, game, 1)
					end
				else
					v8:SendMouseButtonEvent(0, 0, 0, true, game, 1)
					task.wait(0.05)
					v8:SendMouseButtonEvent(0, 0, 0, false, game, 1)
				end

				local fishingRequest = v4:FindFirstChild("FishReplicated") and v4.FishReplicated:FindFirstChild("FishingRequest")

				if fishingRequest then
					if tbl.AutoGetChest then
						pcall(function()
							fishingRequest:InvokeServer("Catch", 1, 1)
						end)
					else
						pcall(function()
							fishingRequest:InvokeServer("Catch", 1)
						end)
					end
				end
			elseif flag4 then
				v8:SendMouseButtonEvent(0, 0, 0, true, game, 1)
				task.wait(0.08)
				v8:SendMouseButtonEvent(0, 0, 0, false, game, 1)
				task.wait(0.15)
			elseif attribute3 == "ReeledIn" or attribute2 == "ReeledIn" or not attribute2 or attribute2 == "Waiting" then
				v8:SendMouseButtonEvent(0, 0, 0, true, game, 1)
				local now3 = tick()

				while true do
					task.wait(0.015)
					local fishingCastMeter = v18.Character and v18.Character:FindFirstChild("Fishing_Cast Meter") or v2:FindFirstChild("Fishing_Cast Meter")
					local bar = fishingCastMeter and fishingCastMeter:FindFirstChild("CastMeter") and fishingCastMeter.CastMeter:FindFirstChild("Bar")
					local frame = bar and bar:FindFirstChild("Frame")

					if not (frame and frame.Size.Y.Scale >= 0.95) then
						if not (tick() - now3 >= 1.2) then
							continue
						else
							break
						end
					end

					break
				end

				v8:SendMouseButtonEvent(0, 0, 0, false, game, 1)
				task.wait(0.3)
			end
		end, true)

		local n6 = 0

		local function fn61()
			local fishSlapMinigame = v18.PlayerGui:FindFirstChild("FishSlapMinigame")

			if fishSlapMinigame and fishSlapMinigame.Enabled then
				local bar = fishSlapMinigame:FindFirstChild("Bar")
				local greenZone = bar and bar:FindFirstChild("GreenZone")
				bar = bar and bar:FindFirstChild("Tick")
				local slapButton = fishSlapMinigame:FindFirstChild("SlapButton")

				if greenZone and bar and slapButton and tick() - n6 >= 0.1 then
					local n7 = bar.AbsolutePosition.Y + bar.AbsoluteSize.Y * 0.5
					local n8 = greenZone.AbsolutePosition.Y + greenZone.AbsoluteSize.Y * 0.5
					local n9 = greenZone.AbsoluteSize.Y * 0.45

					if math.abs(n7 - n8) <= n9 then
						n6 = tick()

						if firesignal then
							firesignal(slapButton.Activated)
						end
					end
				end
			end
		end

		fn31("AutoSlap", fn61, true)

		local function fn62()
			local ok, result = pcall(function()
				return Net:RemoteFunction("GetAllItemValues"):InvokeServer()
			end)

			if not ok or not result then
				return
			end
			local tbl17 = {}

			for _, v24 in next, result, nil do
				local v25 = tostring
				local str5 = tostring(v24.ItemId) .. "_" .. v25(v24.NetworkedUID)
				tbl17[str5] = tbl17[str5] or { ItemId = v24.ItemId, Attributes = {} }

				if v24.Value ~= nil then
					tbl17[str5].Attributes[v24.Key] = v24.Value
				end
			end

			local tbl18 = {}

			for _, v24 in next, tbl17, nil do
				local attributes = v24.Attributes

				if attributes.IsOwned == true and attributes.Mastery ~= nil then
					local ok2, result2 = pcall(function()
						return ItemConfig.match(v24.ItemId)
					end)

					if ok2 and result2 and result2:isOk() then
						local str5 = tostring(result2:unwrap().Index.DebugLabel)
						local match = str5:match("^(.-)%s*%[") or str5
						local v25 = swordData[match]

						if v25 then
							table.insert(tbl18, { Name = match, Mastery = attributes.Mastery, Order = v25.Order })
						end
					end
				end
			end

			table.sort(tbl18, function(arg, arg2)
				if arg.Order == arg2.Order then
					return arg.Mastery < arg2.Mastery
				end
				return arg.Order < arg2.Order
			end)

			for _, v24 in next, tbl18, nil do
				if utilities:CheckToolName(v24.Name) then
					if v24.Mastery < tbl.SelectSwordMastery then
						return
					end
				end
			end

			for _, v24 in next, tbl18, nil do
				if v24.Mastery < tbl.SelectSwordMastery then
					if not utilities:CheckToolName(v24.Name) then
						tbl6:FireInvoke("LoadItem", v24.Name)
						task.wait(0.5)
					end

					return
				end
			end
		end

		fn31("AutoMasterySwords", fn62, true, true)
		local n7 = 0
		local n8 = 1
		local n9 = 0
		local tbl17 = {}
		local cframe = CFrame.new(-4602, 16, -2881)
		local cframe2 = CFrame.new(-6126, 16, -2250)
		local cframe3 = CFrame.new(3911, 7, -2582)
		local cframe4 = CFrame.new
		tbl17[1] = cframe
		tbl17[2] = cframe2
		tbl17[3] = cframe3

		do
			local values = table.pack(cframe4(-426, 11, 5301))
			table.move(values, 1, values.n, 4, tbl17)
		end

		fn31("AutoCDKQuest", function()
			local v24 = tbl6:CDKProgress()

			if v24 == "Start Yama" then
				if not utilities:CheckToolName("Yama") then
					tbl6:FireInvoke("LoadItem", "Yama")
				end

				local cursed = map:FindFirstChild("Turtle") and map.Turtle:FindFirstChild("Cursed")
				local pedestal2 = cursed and cursed:FindFirstChild("Pedestal2")

				if pedestal2 then
					if v18:DistanceFromCharacter(pedestal2.Position) <= 12 then
						if pedestal2:FindFirstChild("ProximityPrompt") and pedestal2.ProximityPrompt.Enabled then
							fireproximityprompt(pedestal2.ProximityPrompt, math.huge)
						end

						tbl6:FireInvoke("CDKQuest", "StartTrial", "Evil")
						task.wait(0.5)
					else
						tweenManager:topos(pedestal2.CFrame)
					end
				else
					tbl6:FireInvoke("CDKQuest", "StartTrial", "Evil")
					tweenManager:topos(CFrame.new(-12391.56, 600.24, -6500.53))
				end
			elseif v24 == "Pain Quest" then
				if not utilities:CheckToolName("Yama") then
					tbl6:FireInvoke("LoadItem", "Yama")
				end

				if tick() - n7 > 10 then
					n7 = tick()
					tbl6:FireInvoke("CDKQuest", "StartTrial", "Evil")
				end

				local enemies2 = utilities:GetEnemies("Forest Pirate") or utilities:GetEnemies("Jungle Pirate") or utilities:GetEnemies("Pirate Millionaire")

				if enemies2 and enemies2:FindFirstChild("HumanoidRootPart") then
					tweenManager:topos(enemies2.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
				else
					tweenManager:topos(CFrame.new(-13234, 520, -6800))
				end
			elseif v24 == "Haze Quest" then
				if not utilities:CheckToolName("Yama") then
					tbl6:FireInvoke("LoadItem", "Yama")
				end

				local questHaze = v18:FindFirstChild("QuestHaze")

				if not questHaze then
					tbl6:FireInvoke("CDKQuest", "StartTrial", "Evil")
					local now3 = tick()

					while true do
						task.wait(0.3)
						questHaze = v18:FindFirstChild("QuestHaze")
						if not (questHaze or tick() - now3 > 4 or not tbl.AutoGetCDK) then
							continue
						end
						break
					end
				end

				if questHaze then
					local v25 = gameData:HazeMobs()

					if v25 then
						subFunction:Attack(v25, true)
					else
						local v26 = gameData:HazePosition()

						if v26 then
							local v27 = tweenManager
							local topos = v27.topos
							local cframe5 = CFrame.new
							local vector = Vector3.new
							topos(v27, cframe5(v26 + Vector3.new(0, 20, 0)))
						else
							tweenManager:topos(CFrame.new(-12391.56, 600.24, -6500.53))
						end
					end
				end
			elseif v24 == "Hell Quest" then
				if not utilities:CheckToolName("Yama") then
					tbl6:FireInvoke("LoadItem", "Yama")
				end

				if tick() - n7 > 10 then
					n7 = tick()
					tbl6:FireInvoke("CDKQuest", "StartTrial", "Evil")
				end

				local hellDimension = v2._WorldOrigin.Locations:FindFirstChild("Hell Dimension")
				local hellDimension2 = map:FindFirstChild("HellDimension")

				if hellDimension and v18:DistanceFromCharacter(hellDimension.Position) <= 1000 or hellDimension2 and hellDimension2:FindFirstChild("Exit") and v18:DistanceFromCharacter(hellDimension2.Exit.Position) <= 1000 then
					if hellDimension2 and hellDimension2:FindFirstChild("Exit") and hellDimension2.Exit.BrickColor == BrickColor.new("Olivine") then
						if v18:DistanceFromCharacter(hellDimension2.Exit.Position) <= 25 then
							pcall(function()
								firetouchinterest(humanoidRootPart, hellDimension2.Exit, 0)
								firetouchinterest(humanoidRootPart, hellDimension2.Exit, 1)
							end)
						end

						tweenManager:topos(hellDimension2.Exit.CFrame)
						return
					end

					local nearest = gameData:GetNearest(150)

					if nearest then
						local v25 = tweenManager
						local topos = v25.topos
						local cFrame = nearest.HumanoidRootPart.CFrame
						local vector = Vector3.new
						topos(v25, cFrame * Vector3.new(0, 30, 0), true)
						utilities:AutoHaki()
						utilities:EquipWeapon()
					elseif hellDimension2 then
						local exitTo = nil
						local proximityPrompt

						for _, child in ipairs(hellDimension2:GetChildren()) do
							if child.Name:find("Torch") and child:IsA("MeshPart") then
								proximityPrompt = child:FindFirstChildOfClass("ProximityPrompt")
								if proximityPrompt and proximityPrompt.Enabled then
									exitTo = 1
									break
								end
							end
						end

						if exitTo == 1 then
							if v18:DistanceFromCharacter(t4_1.Position) > 15 then
								tweenManager:topos(t4_1.CFrame, true)
								task.wait(0.2)
							end

							fireproximityprompt(proximityPrompt, math.huge)
							task.wait(0.1)
							tweenManager:topos(t4_1.CFrame * CFrame.new(0, 30, 0), true)
							task.wait(0.3)
						end
					end
				elseif utilities:CheckMon("Soul Reaper") then
					local enemies2 = utilities:GetEnemies("Soul Reaper")

					if enemies2 and enemies2:FindFirstChild("HumanoidRootPart") then
						tweenManager:topos(enemies2.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3))
					end
				else
					local Bones, v25, v26, v27 = tbl6:FireInvoke("Bones", "Check")

					if v27 ~= nil and v27 ~= "00:00" then
					end

					if v26 and v26 > 0 and Bones and Bones >= 50 then
						if utilities:CheckToolName("Hallow Essence") then
							utilities:EquipTool("Hallow Essence")
							tweenManager:topos(CFrame.new(-8932, 142, 6063))
						else
							local v28 = v18
							local distanceFromCharacter = v28.DistanceFromCharacter
							local vector = Vector3.new

							if distanceFromCharacter(v28, Vector3.new(-8934, 142, 6036)) <= 50 then
								tbl6:FireInvoke("Bones", "Buy", 1, 1)
							else
								tweenManager:topos(CFrame.new(-8934, 142, 6036))
							end
						end
					elseif utilities:CheckToolName("Hallow Essence") then
						utilities:EquipTool("Hallow Essence")
						tweenManager:topos(CFrame.new(-8932, 142, 6063))
					else
						joinAPI("SoulReaper", 2)
					end
				end
			elseif v24 == "Burn Yama Scroll" then
				local cursed = map:FindFirstChild("Turtle") and map.Turtle:FindFirstChild("Cursed")
				cursed = cursed and cursed:FindFirstChild("Pedestal2")

				if cursed then
					if v18:DistanceFromCharacter(cursed.Position) <= 12 then
						if cursed:FindFirstChild("ProximityPrompt") and cursed.ProximityPrompt.Enabled then
							fireproximityprompt(cursed.ProximityPrompt, math.huge)
							v4.DialogueController._Close:Fire()
						end

						tbl6:FireInvoke("CDKQuest", "StartTrial", "Evil")
						task.wait(0.5)
					else
						tweenManager:topos(cursed.CFrame)
					end
				else
					tweenManager:topos(CFrame.new(-12391.56, 600.24, -6500.53))
				end
			elseif v24 == "Start Tushita" then
				if not utilities:CheckToolName("Tushita") then
					tbl6:FireInvoke("LoadItem", "Tushita")
				end

				local cursed = map:FindFirstChild("Turtle") and map.Turtle:FindFirstChild("Cursed")
				local pedestal1 = cursed and cursed:FindFirstChild("Pedestal1")

				if pedestal1 then
					if v18:DistanceFromCharacter(pedestal1.Position) <= 12 then
						if pedestal1:FindFirstChild("ProximityPrompt") and pedestal1.ProximityPrompt.Enabled then
							fireproximityprompt(pedestal1.ProximityPrompt, math.huge)
						end

						tbl6:FireInvoke("CDKQuest", "StartTrial", "Good")
						task.wait(0.5)
					else
						tweenManager:topos(pedestal1.CFrame)
					end
				else
					tbl6:FireInvoke("CDKQuest", "StartTrial", "Good")
					tweenManager:topos(CFrame.new(-12391.07, 600.24, -6599.23))
				end
			elseif v24 == "Boat Quest" then
				if not utilities:CheckToolName("Tushita") then
					tbl6:FireInvoke("LoadItem", "Tushita")
				end

				if tick() - n7 > 10 then
					n7 = tick()
					tbl6:FireInvoke("CDKQuest", "StartTrial", "Good")
				end

				local v25 = tbl17[n8] or tbl17[1]

				if v18:DistanceFromCharacter(v25.Position) > 15 then
					tweenManager:topos(v25)
					local luxuryBoatDealer = v2.NPCs:FindFirstChild("Luxury Boat Dealer")

					if luxuryBoatDealer and v18:DistanceFromCharacter(luxuryBoatDealer:GetPivot().Position) <= 25 then
						pcall(function()
							tbl6:FireInvoke("CDKQuest", "BoatQuest", luxuryBoatDealer, "Check")
							tbl6:FireInvoke("CDKQuest", "BoatQuest", luxuryBoatDealer)
							tbl6:FireInvoke("CDKQuest", "BoatQuest", luxuryBoatDealer, "Pardon me...")
							v4.DialogueController._Close:Fire()
						end)
					end
				else
					local luxuryBoatDealer = v2.NPCs:FindFirstChild("Luxury Boat Dealer")

					if luxuryBoatDealer then
						pcall(function()
							tbl6:FireInvoke("CDKQuest", "BoatQuest", luxuryBoatDealer, "Check")
							tbl6:FireInvoke("CDKQuest", "BoatQuest", luxuryBoatDealer)
							tbl6:FireInvoke("CDKQuest", "BoatQuest", luxuryBoatDealer, "Pardon me...")
							v4.DialogueController._Close:Fire()
						end)
					end

					task.wait(1.5)
					n8 = n8 % #tbl17 + 1
				end
			elseif v24 == "Raid Quest" then
				if not utilities:CheckToolName("Tushita") then
					tbl6:FireInvoke("LoadItem", "Tushita")
				end

				if tick() - n7 > 10 then
					n7 = tick()
					tbl6:FireInvoke("CDKQuest", "StartTrial", "Good")
				end

				local v25 = gameData:DetectPirateRaid()

				if v25 then
					n9 = tick()
					subFunction:Attack(v25, true)
				else
					tweenManager:topos(CFrame.new(-5542, 330, -2971))

					if n9 == 0 then
						n9 = tick()
					end

					if tick() - n9 > 35 then
						joinAPI("pirate", 2)
						n9 = tick()
					end
				end
			elseif v24 == "Heavenly Quest" then
				if not utilities:CheckToolName("Tushita") then
					tbl6:FireInvoke("LoadItem", "Tushita")
				end

				if tick() - n7 > 10 then
					n7 = tick()
					tbl6:FireInvoke("CDKQuest", "StartTrial", "Good")
				end

				local heavenlyDimension = worldOrigin.Locations:FindFirstChild("Heavenly Dimension")
				local heavenlyDimension2 = map:FindFirstChild("HeavenlyDimension")

				if heavenlyDimension and v18:DistanceFromCharacter(heavenlyDimension.Position) <= 1000 or heavenlyDimension2 and heavenlyDimension2:FindFirstChild("Exit") and v18:DistanceFromCharacter(heavenlyDimension2.Exit.Position) <= 1000 then
					if heavenlyDimension2 and heavenlyDimension2:FindFirstChild("Exit") and heavenlyDimension2.Exit.BrickColor == BrickColor.new("Cloudy grey") then
						if v18:DistanceFromCharacter(heavenlyDimension2.Exit.Position) <= 25 then
							pcall(function()
								firetouchinterest(humanoidRootPart, heavenlyDimension2.Exit, 0)
								firetouchinterest(humanoidRootPart, heavenlyDimension2.Exit, 1)
							end)
						end

						tweenManager:topos(heavenlyDimension2.Exit.CFrame)
						return
					end

					local nearest = gameData:GetNearest(150)

					if nearest then
						local v25 = tweenManager
						local topos = v25.topos
						local cFrame = nearest.HumanoidRootPart.CFrame
						local vector = Vector3.new
						topos(v25, cFrame * Vector3.new(0, 30, 0), true)
						utilities:AutoHaki()
						utilities:EquipWeapon()
					elseif heavenlyDimension2 then
						local exitTo2 = nil
						local proximityPrompt

						for _, child in ipairs(heavenlyDimension2:GetChildren()) do
							if child.Name:find("Torch") and child:IsA("MeshPart") then
								proximityPrompt = child:FindFirstChildOfClass("ProximityPrompt")
								if proximityPrompt and proximityPrompt.Enabled then
									exitTo2 = 1
									break
								end
							end
						end

						if exitTo2 == 1 then
							if v18:DistanceFromCharacter(t7_2.Position) > 15 then
								tweenManager:topos(t7_2.CFrame, true)
								task.wait(0.2)
							end

							fireproximityprompt(proximityPrompt, math.huge)
							task.wait(0.1)
							tweenManager:topos(t7_2.CFrame * CFrame.new(0, 30, 0), true)
							task.wait(0.3)
						end
					end
				elseif utilities:CheckMon("Cake Queen") then
					local enemies2 = utilities:GetEnemies("Cake Queen")

					if enemies2 then
						subFunction:Attack(enemies2, true)
					end
				else
					utilities:MobsNextSpawn("Cake Queen")
				end
			elseif v24 == "Burn Tushita Scroll" then
				local turtle = map:FindFirstChild("Turtle")
				turtle = turtle and map.Turtle:FindFirstChild("Cursed")
				turtle = turtle and turtle:FindFirstChild("Pedestal1")

				if turtle then
					if v18:DistanceFromCharacter(turtle.Position) <= 12 then
						if turtle:FindFirstChild("ProximityPrompt") and turtle.ProximityPrompt.Enabled then
							fireproximityprompt(turtle.ProximityPrompt, math.huge)
						end

						tbl6:FireInvoke("CDKQuest", "StartTrial", "Good")
						task.wait(0.5)
					else
						tweenManager:topos(turtle.CFrame)
					end
				else
					tweenManager:topos(CFrame.new(-12391.07, 600.24, -6599.23))
				end
			elseif v24 == "Alucard Boss" then
				local cursed = map:FindFirstChild("Turtle") and map.Turtle:FindFirstChild("Cursed")

				if not cursed then
					tweenManager:topos(CFrame.new(-12389, 601, -6548))
				elseif cursed:FindFirstChild("PlacedGem") and cursed.PlacedGem.Transparency == 0 then
					if not utilities:CheckMon("Cursed Skeleton Boss") then
						tweenManager:topos(CFrame.new(-12341.67, 603.35, -6550.61))
					else
						local enemies2 = utilities:GetEnemies("Cursed Skeleton Boss")

						if enemies2 then
							subFunction:Attack(enemies2, true)
						end
					end
				else
					local pedestal3 = cursed:FindFirstChild("Pedestal3")

					if pedestal3 and pedestal3:FindFirstChild("ProximityPrompt") then
						if v18:DistanceFromCharacter(pedestal3.Position) <= 12 then
							fireproximityprompt(pedestal3.ProximityPrompt, math.huge)
							v4.DialogueController._Close:Fire()
						else
							tweenManager:topos(pedestal3.CFrame)
						end
					else
						tbl6:FireInvoke("CDKQuest", "Alucard")
						tweenManager:topos(CFrame.new(-12356.77, 600.24, -6551.03))
					end
				end
			end
		end, flag3)

		local cframe5 = CFrame.new(-11892, 931, -8761)

		fn31("GetRainbowHaki", function()
			for _, v24 in ipairs({ "Stone", "Hydra Leader", "Kilo Admiral", "Captain Elephant", "Beautiful Pirate" }) do
				if VerifyQuest(v24) then
					local enemies2 = utilities:GetEnemies(v24)
					if enemies2 then
						return subFunction:Attack(enemies2)
					end
					utilities:MobsNextSpawn(v24)
					return
				end
			end

			if v18:DistanceFromCharacter(cframe5.Position) <= 10 then
				tbl6:FireInvoke("HornedMan", "Bet")
			else
				tweenManager:topos(cframe5)
			end
		end, flag3)

		fn31("CompleteCitizenQuest", function()
			local CitizenQuestProgress = tbl6:FireInvoke("CitizenQuestProgress")

			if CitizenQuestProgress then
				local foundTreasure = CitizenQuestProgress.FoundTreasure
				local killedBandits = CitizenQuestProgress.KilledBandits
				local killedBoss = CitizenQuestProgress.KilledBoss
				if foundTreasure then
					return nil
				end

				if killedBoss then
					tweenManager:topos(CFrame.new(-12512, 340, -9872))
					return true
				end

				if not killedBandits then
					if VerifyQuest("Forest Pirate") and VerifyQuest("50") then
						local enemies2 = utilities:GetEnemies("Forest Pirate")
						if enemies2 then
							return subFunction:Attack(enemies2, true)
						end
						tweenManager:topos(CFrame.new(-13497, 391, -7909))
					else
						local v24 = v18
						local distanceFromCharacter = v24.DistanceFromCharacter
						local vector = Vector3.new

						if distanceFromCharacter(v24, Vector3.new(-12445, 332, -7676)) <= 8 then
							tbl6:FireInvoke("StartQuest", "CitizenQuest", 1)
						else
							tweenManager:topos(CFrame.new(-12445, 332, -7676))
						end
					end
				else
					local enemies2 = utilities:GetEnemies("Captain Elephant")

					if VerifyQuest("Captain Elephant") then
						if enemies2 then
							return subFunction:Attack(enemies2)
						end
						tweenManager:topos(CFrame.new(-13382, 367, -8539))
					else
						local v24 = v18
						local distanceFromCharacter = v24.DistanceFromCharacter
						local vector = Vector3.new

						if distanceFromCharacter(v24, Vector3.new(-12445, 332, -7676)) <= 8 then
							tbl6:FireInvoke("CitizenQuestProgress", "Citizen")
						else
							tweenManager:topos(CFrame.new(-12445, 332, -7676))
						end
					end
				end
			end
		end, flag3)

		fn31("AutoFullyPullLever", function()
			local RaceV4Progress = tbl6:FireInvoke("RaceV4Progress", "Check")

			if RaceV4Progress == 1 then
				tbl6:FireInvoke("RaceV4Progress", "Begin")
			else
				if RaceV4Progress == 2 then
					if utilities:GetDistance(CFrame.new(28610, 14897, 106)) > 500 then
						local v24 = tbl6
						local fireInvoke = v24.FireInvoke
						local vector = Vector3.new
						fireInvoke(v24, "requestEntrance", Vector3.new(28283, 14897, 105))
						tweenManager:topos(CFrame.new(28610, 14897, 106))
						return
					end

					if utilities:GetDistance(CFrame.new(28610, 14897, 107)) < 20 then
						wait(1)
						tbl6:FireInvoke("RaceV4Progress", "TeleportBack")
						wait(0.5)
						tweenManager:topos(CFrame.new(2956, 2282, -7216))
						tbl6:FireInvoke("RaceV4Progress", "Teleport")
					end

					return
				end

				if RaceV4Progress == 3 then
					tbl6:FireInvoke("RaceV4Progress", "Continue")
				else
					local mysticIsland = map:FindFirstChild("MysticIsland")

					if mysticIsland and not tbl6:FireInvoke("CheckTempleDoor") then
						if v7.ClockTime > 16 or v7.ClockTime < 5 then
							local cframe6 = CFrame.new(map.MysticIsland.Center.Position.X, 500, map.MysticIsland.Center.Position.Z)
							tweenManager:topos(cframe6, true)
							local flag4 = false

							for _, child in pairs(map.MysticIsland:GetChildren()) do
								if child.Name == "Part" and child:IsA("MeshPart") and child.Transparency == 0 then
									flag4 = child
								end
							end

							if not flag4 then
								if utilities:GetDistance(cframe6) < 200 then
									v2.CurrentCamera.CFrame = CFrame.lookAt(v2.CurrentCamera.CFrame.p, v2.CurrentCamera.CFrame.p + v7:GetMoonDirection() * 100)
									wait(0.5)
									v4.Remotes.CommE:FireServer("ActivateAbility")
								end
							else
								tweenManager:topos(flag4.CFrame)
							end
						end
					elseif tbl6:FireInvoke("CheckTempleDoor") then
						if utilities:GetDistance(CFrame.new(28575, 14937, 72)) > 10 then
							tweenManager:topos(CFrame.new(28575, 14937, 72))
						else
							fireproximityprompt(map["Temple of Time"].Lever.Prompt.ProximityPrompt, math.huge)
						end
					end
				end
			end
		end, flag3)

		fn31("AutoKenV2", function()
			if not tbl6:FireInvoke("CitizenQuestProgress").FoundTreasure then
				functions.CompleteCitizenQuest.Call()
			end

			if not utilities:CheckToolName("Fruit Bowl") then
				if not utilities:CheckToolName("Apple") then
					for _, child in pairs(v2:GetChildren()) do
						if child.Name == "Apple" then
							tweenManager:topos(CFrame.new(child.Handle.Position))
							task.wait()
						end
					end
				elseif not utilities:CheckToolName("Banana") then
					for _, child in pairs(v2:GetChildren()) do
						if child.Name == "Banana" then
							tweenManager:topos(CFrame.new(child.Handle.Position))
							task.wait()
						end
					end
				elseif not utilities:CheckToolName("Pineapple") then
					for _, child in pairs(v2:GetChildren()) do
						if child.Name == "Pineapple" then
							tweenManager:topos(CFrame.new(child.Handle.Position))
						end
					end
				end

				if utilities:CheckToolName("Banana") and utilities:CheckToolName("Apple") and utilities:CheckToolName("Pineapple") then
					tweenManager:topos(CFrame.new(-12445, 332, -7673))
					tbl6:FireInvoke("CitizenQuestProgress", "Citizen")
				end
			end

			if utilities:CheckToolName("Fruit Bowl") then
				tweenManager:topos(CFrame.new(-10920, 624, -10267))
				task.wait(0.5)
				tbl6:FireInvoke("KenTalk2", "Start")
				task.wait(0.1)
				tbl6:FireInvoke("KenTalk2", "Buy")
			end
		end, flag3)

		local function fn63()
			if utilities:CheckToolName("Death Step") then
				return
			end
			local v24 = utilities:CheckToolName("Black Leg")

			if not v24 or v24.Level.Value < 400 then
				tbl.SelectMelee = "Black Leg"
				functions.AutoBuyMelee.Call()

				if v24 and v24.Level.Value < 400 then
					local enemies2 = utilities:GetEnemies({ "Arctic Warrior", "Snow Lurker" })
					if enemies2 then
						return subFunction:Attack(enemies2)
					end
					utilities:MobsNextSpawn("Arctic Warrior")
				end

				return
			end

			tbl.SelectMelee = "Death Step"
			functions.AutoBuyMelee.Call()

			if v2.Map.IceCastle.Hall.LibraryDoor.PhoeyuDoor.Transparency == 0 then
				if utilities:CheckToolName("Library Key") then
					tweenManager:topos(CFrame.new(6371, 297, -6841))
					task.wait(0.3)
					tbl6:FireInvoke("BuyDeathStep")
				else
					local enemies2 = utilities:GetEnemies("Awakened Ice Admiral")
					if enemies2 then
						return subFunction:Attack(enemies2)
					end
					tweenManager:topos(CFrame.new(5669, 29, -6483))
				end
			end
		end

		fn31("AutoDeathStep", fn63, flag2)

		local function fn64()
			if utilities:CheckToolName("Sharkman Karate") then
				return
			end
			local v24 = utilities:CheckToolName("Fishman Karate")

			if not v24 or v24.Level.Value < 400 then
				tbl.SelectMelee = "Fishman Karate"
				functions.AutoBuyMelee.Call()

				if v24 and v24.Level.Value < 400 then
					local enemies2 = utilities:GetEnemies("Water Fighter")
					if enemies2 then
						return subFunction:Attack(enemies2)
					end
					utilities:MobsNextSpawn("Water Fighter")
				end

				return
			end

			local BuySharkmanKarate = tbl6:FireInvoke("BuySharkmanKarate")

			if type(BuySharkmanKarate) == "string" and BuySharkmanKarate:find("keys") then
				if utilities:CheckToolName("Water Key") then
					tweenManager:topos(CFrame.new(-2605, 239, -10315))
					task.wait(0.3)
					tbl6:FireInvoke("BuySharkmanKarate")
				else
					local enemies2 = utilities:GetEnemies("Tide Keeper")
					if enemies2 then
						return subFunction:Attack(enemies2)
					end
					tweenManager:topos(CFrame.new(-3054, 237, -10145))
				end
			else
				tbl.SelectMelee = "Sharkman Karate"
				functions.AutoBuyMelee.Call()
			end
		end

		fn31("AutoSharkmanKarate", fn64, flag2)

		local function fn65()
			if utilities:CheckToolName("Electric Claw") then
				return
			end
			local Electro = utilities:CheckToolName("Electro")

			if not Electro or Electro.Level.Value < 400 then
				tbl.SelectMelee = "Electro"
				functions.AutoBuyMelee.Call()

				if Electro and Electro.Level.Value < 400 then
					local enemies2 = utilities:GetEnemies("Fishman Raider")
					if enemies2 then
						return subFunction:Attack(enemies2)
					end
					utilities:MobsNextSpawn("Fishman Raider")
				end

				return
			end

			if tbl6:FireInvoke("BuyElectricClaw", "Start") == nil then
				tweenManager:topos(CFrame.new(-12548, 337, -7481))
				task.wait(0.3)
			else
				tbl.SelectMelee = "Electric Claw"
				functions.AutoBuyMelee.Call()
			end
		end

		fn31("AutoElectricClaw", fn65, flag3)

		local function fn66()
			if utilities:CheckToolName("Dragon Talon") then
				return
			end
			local v24 = utilities:CheckToolName("Dragon Claw")

			if not v24 or v24.Level.Value < 400 then
				tbl.SelectMelee = "Dragon Claw"
				functions.AutoBuyMelee.Call()

				if v24 and v24.Level.Value < 400 then
					local enemies2 = utilities:GetEnemies("Reborn Skeleton")
					if enemies2 then
						return subFunction:Attack(enemies2, true)
					end
					utilities:MobsNextSpawn("Reborn Skeleton")
				end

				return
			end

			if not utilities:CheckToolName("Fire Essence") then
				tbl6:FireInvoke("Bones", "Buy", 1, 1)
				task.wait(0.1)
			else
				tbl.SelectMelee = "Dragon Talon"
				functions.AutoBuyMelee.Call()
			end
		end

		fn31("AutoDragonTalon", fn66, flag3)

		local function fn67()
			if enemies:FindFirstChild("Terrorshark") then
				for _, child in pairs(enemies:GetChildren()) do
					if child.Name == "Terrorshark" then
						local humanoid2 = child:FindFirstChild("Humanoid")

						if humanoid2 and child:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 then
							while true do
								task.wait()
								local tool = v18.Character and v18.Character:FindFirstChildOfClass("Tool")
								local n10 = tool and tool.ToolTip == "Blox Fruit" and tool.Name ~= "Ice-Ice" and tool.Name ~= "Light-Light" and 16 or 40
								task.wait()
								utilities:AutoHaki()
								utilities:EquipWeapon()
								local cframe6

								if child.HumanoidRootPart.CFrame.Y > -3 then
									cframe6 = CFrame.new(0, 250, 0)
								elseif gameData:TerrorDodge() then
									cframe6 = CFrame.new(0, 150, 30)
								else
									cframe6 = CFrame.new(0, n10, 0)
								end

								tweenManager:topos(child.HumanoidRootPart.CFrame * cframe6, true)
								subFunction:Attack(child)
								local flag4 = not tbl.AutoSharkAnchor
								if not (flag4 or not child.Parent or child.Humanoid.Health <= 0) then
									continue
								end
								break
							end
						end
					end
				end
			else
				local v24 = GetSelectedBoat()
				local character2 = v18.Character
				character2 = character2 and character2:FindFirstChildOfClass("Humanoid")

				if not v24 then
					tweenManager:StopBoatTween()

					if utilities:GetDistance(CFrame.new(-16927.451, 9.086, 433.864)) <= 12 then
						BuyBoatSafe(tbl.BoatSelected)
					else
						tweenManager:topos(CFrame.new(-16927.451, 9.086, 433.864))
					end
				elseif not character2.Sit then
					tweenManager:StopBoatTween()
					local vehicleSeat = v24:FindFirstChildWhichIsA("VehicleSeat", true)
					vehicleSeat = vehicleSeat or v24:FindFirstChild("VehicleSeat", true) or v24:FindFirstChildWhichIsA("Seat", true)

					if vehicleSeat and vehicleSeat:IsA("BasePart") then
						tweenManager:topos(vehicleSeat.CFrame * CFrame.new(0, 1.5, 0))
						task.wait(0.3)
					end
				else
					tweenManager:toposboat(CFrame.new(-10000000, 31, 37016.25))
				end
			end
		end

		fn31("AutoSharkAnchor", fn67, flag3)

		fn31("Tweenfruit", function()
			local huge = math.huge
			local v24 = nil

			for _, child in ipairs(v2:GetChildren()) do
				if child:IsA("Model") and child.Name:find("Fruit") then
					local handle = child:FindFirstChild("Handle") or child:FindFirstChildWhichIsA("BasePart")

					if handle then
						local magnitude = humanoidRootPart and (handle.Position - humanoidRootPart.Position).Magnitude or 0

						if magnitude < huge then
							huge = magnitude
							v24 = handle
						end
					end
				end
			end

			if v24 then
				tweenManager:topos(v24.CFrame)
			elseif tbl.HopIfNoFruit then
				utilities:ServerHop()
			end
		end, true)

		local now3 = nil

		local function fn68()
			local v24 = nil
			local v25 = nil
			local v26, v27, v28 = ipairs(v5:GetTagged("BerryBush"))
			local huge = math.huge
			local v29 = nil
			local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v26, v27, v28)

			for _, v30 in v26, v27, v28 do
				local parent = v30.Parent

				if parent and parent:IsDescendantOf(v2) then
					local attribute2 = parent:GetAttribute("CFrame") or parent:IsA("Model") and parent:GetPivot()

					for k, v31 in pairs(v30:GetAttributes()) do
						if type(v31) == "string" and #v31 > 0 and k:sub(1, 12) == "_BerryCFrame" then
							local attribute3 = parent:GetAttribute(k)
							local v32 = attribute2 and attribute3 and attribute2:ToWorldSpace(attribute3)

							if v32 then
								local magnitude = humanoidRootPart and (v32.Position - humanoidRootPart.Position).Magnitude or 0

								if magnitude < huge then
									v24 = parent
									v25 = k
									huge = magnitude
									v29 = v32
								end
							end
						end
					end
				end
			end

			local _vm_a_0
			_vm_a_1 = _vm_a_0
			local _vm_U_0
			local _vm_U_1 = _vm_U_0
			local _vm___0
			local _vm___1 = _vm___0

			if v24 and v25 and v29 then
				now3 = nil
				tweenManager:topos(v29)

				if humanoidRootPart and (v29.Position - humanoidRootPart.Position).Magnitude <= 60 then
					task.spawn(function()
						local rfClaimBerry = net:FindFirstChild("RF/ClaimBerry")

						if rfClaimBerry then
							rfClaimBerry:InvokeServer(v24.Name, v25)
						end
					end)
				end
			elseif tbl.HopIfNoBerries then
				if not now3 then
					now3 = tick()
				elseif tick() - now3 >= 5 then
					local n10 = tbl and tonumber(tbl.HopDelay) or 10

					if tbl6 and tbl6.SendNotify then
						tbl6:SendNotify("Berry Farm", "No Berries found in server. Hopping in " .. tostring(math.floor(n10)) .. "s...", math.min(math.floor(n10), 5))
					end

					utilities:ServerHop(n10)
					task.wait(n10 + 5)
				end
			else
				now3 = nil
			end
		end

		fn31("AutoBerrySafe", fn68, true)

		fn31("AutoKillLeviathan", function()
			for _, child in ipairs(seaBeasts:GetChildren()) do
				if child.Name == "Leviathan Segment" and child:FindFirstChild("HumanoidRootPart") then
					tweenManager:topos(child.HumanoidRootPart.CFrame * CFrame.new(0, 21, 0), true)
					utilities:AutoHaki()

					if (v18.Character.HumanoidRootPart.Position - child.HumanoidRootPart.Position).Magnitude < 150 then
						humanoidRootPart2 = child.HumanoidRootPart
						fn16()
						humanoidRootPart2 = nil
					end

					return
				end
			end

			for _, child in ipairs(seaBeasts:GetChildren()) do
				if child.Name == "Leviathan" and child:FindFirstChild("Head") then
					tweenManager:topos(CFrame.new(child.Head.Position.X, 60, child.Head.Position.Z), true)
					utilities:AutoHaki()

					if (v18.Character.HumanoidRootPart.Position - child.Head.Position).Magnitude < 150 then
						humanoidRootPart2 = child.Head
						fn16()
						humanoidRootPart2 = nil
					end

					return
				end
			end
		end, flag3)

		local function fn69()
			local seaEventTargets = gameData:GetSeaEventTargets() or {}
			local autoIgnoreSeaEventsLeviathan = tbl.AutoFindLeviatan and tbl.AutoIgnoreSeaEventsLeviathan
			local flag4 = tbl.AutoFarmSeaEvents and not autoIgnoreSeaEventsLeviathan and #seaEventTargets > 0
			local v24 = nil
			local str5 = nil

			if flag4 then
				local flag5 = table.find(seaEventTargets, "SeaBeast") ~= nil
				flag5 = flag5 or table.find(seaEventTargets, "Sea Beast") ~= nil
				v24 = nil
				str5 = nil
				local _vm_a_1, _vm_a_0, _vm_U_0, _vm_U_1, _vm___0, _vm___1

				if flag5 then
					local v25, v26, v27 = ipairs(seaBeasts:GetChildren())
					_vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v25, v26, v27)
					v24 = nil
					str5 = nil
					local exitTo = nil

					for _, v28 in v25, v26, v27 do
						if tbl6:IsReady(v28) then
							local humanoidRootPart3 = v28:FindFirstChild("HumanoidRootPart") or v28:FindFirstChildWhichIsA("BasePart")

							if humanoidRootPart3 and v18:DistanceFromCharacter(humanoidRootPart3.Position) <= 1500 then
								exitTo = 1
								break
							else
								v24 = nil
								str5 = nil
							end
						else
							v24 = nil
							str5 = nil
						end
					end

					if exitTo == 1 then
						str5 = "SeaBeast"
						v24 = t4_1
					end

					_vm_a_1 = _vm_a_0
					_vm_U_1 = _vm_U_0
					_vm___1 = _vm___0
				end

				if not v24 then
					local v25, v26, v27 = ipairs(enemies:GetChildren())
					_vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v25, v26, v27)
					local exitTo3 = nil

					for _, v28 in v25, v26, v27 do
						if tbl6:IsReady(v28) then
							local exitTo2 = nil

							for _, seaEventTarget in ipairs(seaEventTargets) do
								if seaEventTarget ~= "SeaBeast" and (string.find(v28.Name, seaEventTarget) or seaEventTarget == "FishBoat" and v28.Name:find("FishBoat")) then
									local humanoidRootPart3 = v28:FindFirstChild("HumanoidRootPart") or v28:FindFirstChild("Engine") or v28:FindFirstChildWhichIsA("BasePart")
									if humanoidRootPart3 and v18:DistanceFromCharacter(humanoidRootPart3.Position) <= 1500 then
										exitTo2 = 1
										break
									end
								end
							end

							if exitTo2 == 1 then
								v24 = v28
								str5 = t10
							end

							if v24 then
								exitTo3 = 1
								break
							end
						end
					end

					if exitTo3 ~= 1 then
					end

					_vm_a_1 = _vm_a_0
					_vm_U_1 = _vm_U_0
					_vm___1 = _vm___0
				end
			end

			if v24 then
				tweenManager:StopBoatTween()
				local v25 = GetSelectedBoat()

				if tbl.ProtectBoat and v25 then
					fn24(v25, 450)
				end

				if humanoid and humanoid.Sit then
					humanoid.Sit = false
					task.wait(0.05)
				end

				utilities:AutoHaki()

				if str5 == "SeaBeast" then
					if tbl.UseDragonSforSeabeasts then
						utilities:EquipWeapon("Gun")
					else
						utilities:EquipWeapon()
					end

					local humanoidRootPart3 = v24:FindFirstChild("HumanoidRootPart")
					humanoidRootPart3 = humanoidRootPart3 or v24:FindFirstChildWhichIsA("BasePart")

					if humanoidRootPart3 then
						local waterBasePlane = workspace.Map:FindFirstChild("WaterBase-Plane")
						waterBasePlane = waterBasePlane and waterBasePlane.Position.Y or 0
						local dodgefSeabeast = tbl.DodgefSeabeast and gameData:DodgeSeabeast()
						local n10 = dodgefSeabeast and 400 or 250
						dodgefSeabeast = dodgefSeabeast and 20 or 2

						if (Vector3.new(0, humanoidRootPart3.Position.Y, 0) - Vector3.new(0, waterBasePlane, 0)).Magnitude <= 175 then
							tweenManager:topos(humanoidRootPart3.CFrame * CFrame.new(0, n10, dodgefSeabeast), true)
						else
							tweenManager:topos(CFrame.new(humanoidRootPart3.Position.X, waterBasePlane + n10, humanoidRootPart3.Position.Z), true)
						end

						if tbl.UseDragonSforSeabeasts then
							shootGun()
						else
							fn16()
						end
					end
				else
					if str5 == "PirateBrigade" or str5 == "Pirate Grand Brigade" or str5 == "Ghost Ship" or str5 == "FishBoat" or v24:FindFirstChild("Engine") then
						local health = v24:FindFirstChild("Health")
						local humanoid2 = v24:FindFirstChildOfClass("Humanoid") or v24:FindFirstChild("Humanoid")

						if health then
							local flag5 = health:IsA("ValueBase") and health.Value <= 0

							if flag5 then
								health = flag5
							else
								health = type(health.Value) == "number" and health.Value <= 0
							end
						end

						local flag5

						if health then
							flag5 = health
						elseif humanoid2 then
							local flag6 = humanoid2:IsA("Humanoid") and humanoid2.Health <= 0

							if flag6 then
								flag5 = flag6
							else
								flag5 = humanoid2:IsA("ValueBase") and humanoid2.Value <= 0
							end
						else
							flag5 = humanoid2
						end

						local flag6 = flag5 or v24:GetAttribute("Dead") == true or v24:GetAttribute("Sunk") == true
						local engine = v24:FindFirstChild("Engine") or v24.PrimaryPart or v24:FindFirstChildWhichIsA("BasePart")

						if engine and engine.Position.Y < -15 then
							flag6 = true
						end

						if not flag6 and engine then
							if tbl.UseDragonSforSeabeasts then
								utilities:EquipWeapon("Gun")
								shootGun()
							else
								utilities:EquipWeapon()
							end

							tweenManager:topos(engine.CFrame * CFrame.new(0, 25, 0), true)
							position = engine.Position
							fn16()
							position = nil
						end
					else
						local humanoidRootPart3 = v24:FindFirstChild("HumanoidRootPart") or v24.PrimaryPart

						if humanoidRootPart3 then
							if str5 == "Terror Shark" or str5 == "Terrorshark" or v24.Name:find("Terror") then
								task.wait()
								utilities:AutoHaki()
								utilities:EquipWeapon()
								local cframe6

								if humanoidRootPart3.CFrame.Y > -3 then
									cframe6 = CFrame.new(0, 250, 0)
								elseif gameData:TerrorDodge() then
									cframe6 = CFrame.new(0, 150, 30)
								else
									cframe6 = CFrame.new(0, 40, 0)
								end

								tweenManager:topos(humanoidRootPart3.CFrame * cframe6, true)
								subFunction:Attack(v24)
							else
								utilities:EquipWeapon()
								tweenManager:topos(humanoidRootPart3.CFrame * CFrame.new(0, 20, 0), true)
								subFunction:Attack(v24)
							end
						end
					end
				end
			else
				local v25 = GetSelectedBoat()

				if v25 then
					fn25(v25)
				end

				subFunction:AutoBoatSail()
				task.wait(0.4)
			end
		end

		fn31("AutoSail", fn69, flag2 or flag3)

		local function fn70()
			if map:FindFirstChild("MysticIsland") or worldOrigin.Locations:FindFirstChild("Mirage Island") then
				tweenManager:StopBoatTween()
			else
				subFunction:AutoBoatSail(CFrame.new(-10000000, 31, 37016.25))
			end
		end

		fn31("AutoFindMirageIsland", fn70, flag3)

		fn31("AutoFindKitsuneIsland", function()
			if map:FindFirstChild("KitsuneIsland") or worldOrigin.Locations:FindFirstChild("Kitsune Island") then
				tweenManager:StopBoatTween()

				if humanoid.Sit then
					humanoid.Sit = false
				end
			else
				subFunction:AutoBoatSail(CFrame.new(-10000000, 31, 37016.25))
			end
		end, flag3)

		fn31("AutoFindPrehistoricIsland", function()
			if map:FindFirstChild("PrehistoricIsland") or worldOrigin.Locations:FindFirstChild("Prehistoric Island") then
				tweenManager:StopBoatTween()

				if humanoid.Sit then
					humanoid.Sit = false
				end

				tbl6._FindPrehistoricIsland.Update(false)
			else
				subFunction:AutoBoatSail(CFrame.new(-10000000, 31, 37016.25))
			end
		end, flag3)

		local function fn71()
			local emberTemplate = v2:FindFirstChild("EmberTemplate")

			if emberTemplate and emberTemplate:FindFirstChild("Part") then
				tweenManager:topos(emberTemplate.Part.CFrame)
			end
		end

		fn31("CollectAzure", fn71, flag3)

		fn31("AutoFinishTrial", function()
			if tbl and tbl.AutoCompleteDracoTrial then
				return
			end
			local value = data.Race.Value
			if value == "Draco" or not tbl12[value] then
				return
			end

			if v18.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
				if value == "Mink" and map:FindFirstChild("MinkTrial") then
					local ceiling = map.MinkTrial.Ceiling

					if (ceiling.Position - v18.Character.HumanoidRootPart.Position).Magnitude <= 500 then
						tweenManager:topos(ceiling.CFrame * CFrame.new(0, -5, 0))
					end
				elseif value == "Human" and map:FindFirstChild("HumanTrial") then
					if (v18.Character.HumanoidRootPart.Position - map.HumanTrial.BossSpawn.Position).Magnitude <= 250 then
						for _, child in ipairs(enemies:GetChildren()) do
							if child:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 then
								if (child.HumanoidRootPart.Position - map.HumanTrial.BossSpawn.Position).Magnitude <= 200 then
									subFunction:Attack(child)
									return
								end
							end
						end
					end
				elseif value == "Ghoul" and map:FindFirstChild("GhoulTrial") then
					if (v18.Character.HumanoidRootPart.Position - map.GhoulTrial.BossSpawn.Position).Magnitude <= 250 then
						for _, child in ipairs(enemies:GetChildren()) do
							if child:FindFirstChild("HumanoidRootPart") and child.Humanoid.Health > 0 then
								if (child.HumanoidRootPart.Position - map.GhoulTrial.BossSpawn.Position).Magnitude <= 200 then
									subFunction:Attack(child, true)
									return
								end
							end
						end
					end
				elseif value == "Cyborg" and map:FindFirstChild("CyborgTrial") then
					if (v18.Character.HumanoidRootPart.Position - map.CyborgTrial.Floor.Position).Magnitude <= 250 then
						tweenManager:topos(map.CyborgTrial.Floor.CFrame * CFrame.new(0, 180, 0), true)
					end
				elseif value == "Skypiea" and map:FindFirstChild("SkyTrial") then
					local finishPart = map.SkyTrial.Model.FinishPart

					if (finishPart.Position - v18.Character.HumanoidRootPart.Position).Magnitude <= 1000 then
						tweenManager:topos(finishPart.CFrame, true)
					end
				elseif value == "Fishman" and map:FindFirstChild("FishmanTrial") then
					if (v18.Character.HumanoidRootPart.Position - map.FishmanTrial:GetPivot().Position).Magnitude < 1000 then
						local trialOfWater = worldOrigin.Locations:FindFirstChild("Trial of Water")

						if trialOfWater then
							local v24 = next
							local children, v25 = v2.SeaBeasts:GetChildren()
							local exitTo = nil

							for _, v26 in v24, children, v25 do
								if string.find(v26.Name, "SeaBeast") and v26:FindFirstChild("HumanoidRootPart") then
									if (v26.HumanoidRootPart.Position - trialOfWater.Position).Magnitude <= 1500 then
										if v26.Health.Value > 0 then
											exitTo = 1
											break
										end
									end
								end
							end

							if exitTo == 1 then
								utilities:AutoHaki()
								utilities:EquipWeapon()
								local dodgefSeabeast = tbl.DodgefSeabeast and gameData:DodgeSeabeast()
								local n10 = 150
								local n11 = 5

								if dodgefSeabeast then
									n11 = math.random(-30, 30)
									n10 = 400
								end

								tweenManager:topos(t6_2.HumanoidRootPart.CFrame * CFrame.new(0, n10, n11), true)
								position = t6_2.HumanoidRootPart.CFrame.Position
								fn16()
								position = nil
							end
						end
					end
				end
			elseif tbl12[value] then
				tweenManager:topos(tbl12[value], true)
			end
		end, flag3)

		local function fn72()
			if v18.PlayerGui.Main.TopHUDList.RaidTimer.Visible then
				for _, child in pairs(workspace.Characters:GetChildren()) do
					if child.Name ~= v18.Name and child:FindFirstChild("HumanoidRootPart") and child:FindFirstChild("Humanoid") and child.Humanoid.Health > 0 then
						if (child.HumanoidRootPart.Position - v18.Character.HumanoidRootPart.Position).Magnitude < 300 then
							tweenManager:topos(child.HumanoidRootPart.CFrame * CFrame.new(0, 20, 10), true)
							utilities:EquipWeapon()
							utilities:AutoHaki()
							return
						end
					end
				end
			end
		end

		fn31("AutoKillPlayerinTrial", fn72, flag3)

		fn31("AutoChooseGear", function()
			local ok, result = pcall(function()
				return tbl6:FireInvoke("TempleClock", "Check")
			end)

			if ok and result and result.HadPoint == true or not result then
				local str5 = result and result.RaceDetails and result.RaceDetails.B == 2 and "Omega" or "Alpha"

				for _, v24 in ipairs({
					{},
					{ "Gear1" },
					{ "Gear2", "Omega" },
					{ "Gear2", "Alpha" },
					{ "Gear2", true },
					{ "Gear2", false },
					{ "Gear3", "Alpha" },
					{ "Gear3", "Omega" },
					{ "Gear3", true },
					{ "Gear3", false },
					{ "Gear4", str5 },
					{ "Gear4", true },
					{ "Gear4", false },
					{ "Gear5", "Default" },
					{ "Gear5", true },
					{ "Gear5", false },
				}) do
					pcall(function()
						tbl6:FireInvoke("TempleClock", "SpendPoint", table.unpack(v24))
					end)
				end
			end
		end, flag3)

		fn31("AutoFindLeviatan", function()
			local v24 = GetSelectedBoat()

			if not v24 then
				tweenManager:StopBoatTween()

				if utilities:GetDistance(CFrame.new(-16927.451, 9.086, 433.864)) <= 12 then
					BuyBoatSafe("Beast Hunter")
				else
					tweenManager:topos(CFrame.new(-16927.451, 9.086, 433.864))
				end
			elseif not tbl.AutoIgnoreSeaEventsLeviathan and tbl.AutoFarmSeaEvents and not humanoid.Sit then
				local seaEventTargets = gameData:GetSeaEventTargets() or {}
				local v25 = next
				local flag4 = false
				local _vm_a_1 = (function(iterator, iteratorState, control) return function() local values = table.pack(iterator(iteratorState, control)); control = values[1]; if control == nil then return false end; return true, table.unpack(values, 1, values.n) end end)(v25, seaEventTargets, nil)
				local exitTo2 = nil

				for _, v26 in v25, seaEventTargets, nil do
					local flag5 = v26 == "SeaBeast" and seaBeasts or enemies
					local v27 = next
					local children, v28 = flag5:GetChildren()
					local exitTo = nil

					for _, v29 in v27, children, v28 do
						if v29 and v29.Parent and string.find(v29.Name, v26) then
							local humanoidRootPart3 = v29:FindFirstChild("HumanoidRootPart") or v29:FindFirstChildWhichIsA("BasePart")
							if humanoidRootPart3 and v18:DistanceFromCharacter(humanoidRootPart3.Position) <= 1500 then
								exitTo = 1
								break
							end
						end
					end

					if exitTo == 1 then
						flag4 = true
					end

					if flag4 then
						exitTo2 = 1
						break
					end
				end

				if exitTo2 ~= 1 then
				end

				local _vm_a_0
				_vm_a_1 = _vm_a_0
				local _vm_U_0
				local _vm_U_1 = _vm_U_0
				local _vm___0
				local _vm___1 = _vm___0
				if flag4 then
					return
				end
			elseif not humanoid.Sit then
				tweenManager:StopBoatTween()
				local vehicleSeat = v24:FindFirstChildWhichIsA("VehicleSeat", true)
				local vehicleSeat2 = vehicleSeat or v24:FindFirstChild("VehicleSeat", true) or v24:FindFirstChildWhichIsA("Seat", true)

				if vehicleSeat2 and vehicleSeat2:IsA("BasePart") then
					tweenManager:topos(vehicleSeat2.CFrame * CFrame.new(0, 1.5, 0))
					task.wait(0.3)
				end
			else
				if map:FindFirstChild("LeviathanGate") or worldOrigin.Locations:FindFirstChild("Frozen Dimension") then
					tweenManager:StopBoatTween()

					if humanoid.Sit then
						humanoid.Sit = false
					end

					tbl6._FindLeviathan.Update(false)
				else
					tweenManager:toposboat(CFrame.new(-10000000, 30.0003, -1244.8584), true)
				end
			end
		end, flag3)

		fn31("AutoSailbacktoTiki", function()
			local v24 = GetSelectedBoat()
			local humanoid2 = character and character:FindFirstChildOfClass("Humanoid")

			if v24 and not humanoid2.Sit then
				tweenManager:StopBoatTween()
				local vehicleSeat = v24:FindFirstChildWhichIsA("VehicleSeat", true) or v24:FindFirstChild("VehicleSeat", true) or v24:FindFirstChildWhichIsA("Seat", true)

				if vehicleSeat and vehicleSeat:IsA("BasePart") then
					tweenManager:topos(vehicleSeat.CFrame * CFrame.new(0, 1.5, 0))
					task.wait(0.3)
				end
			else
				tweenManager:toposboat(CFrame.new(-16892, 37, 384))
			end
		end, flag3)

		local function fn73()
			local topHUDList = v18.PlayerGui:FindFirstChild("Main") and v18.PlayerGui.Main:FindFirstChild("TopHUDList")
			topHUDList = topHUDList and topHUDList:FindFirstChild("RaidTimer")

			if topHUDList and topHUDList.Visible then
				local dracoTrial = map:FindFirstChild("DracoTrial") or v2:FindFirstChild("DracoTrial", true)
				if not dracoTrial then
					return
				end
				local _vm___1 = 1

				for i = state.CurrentDracoStage, 6 do
					local v24 = dracoTrial:FindFirstChild(state.DracoSequence[i], true)
					local proximityPrompt = v24 and (v24:FindFirstChildOfClass("ProximityPrompt") or v24:FindFirstChildWhichIsA("ProximityPrompt", true))

					if proximityPrompt and proximityPrompt.Enabled then
						state.CurrentDracoStage = i
						local parent = proximityPrompt.Parent:IsA("BasePart") and proximityPrompt.Parent or v24:IsA("BasePart") and v24 or v24.PrimaryPart

						if parent then
							tweenManager:topos(parent.CFrame, true)

							if humanoidRootPart and (parent.Position - humanoidRootPart.Position).Magnitude <= 20 then
								fireproximityprompt(proximityPrompt, math.huge)
								task.wait(0.3)

								if not proximityPrompt.Enabled then
									state.CurrentDracoStage = i + 1
								end
							end
						end

						return
					end
				end

				local _vm___0
				_vm___1 = _vm___0
				local trialDoor = dracoTrial:FindFirstChild("TrialDoor", true)
				local doorTouch

				if trialDoor then
					doorTouch = trialDoor:FindFirstChild("DoorTouch", true) or trialDoor:FindFirstChildWhichIsA("BasePart", true)
				else
					doorTouch = trialDoor
				end

				if doorTouch then
					tweenManager:topos(doorTouch.CFrame, true)
				end
			else
				state.CurrentDracoStage = 1

				pcall(function()
					remotes.DracoTrial:InvokeServer()
				end)
			end
		end

		fn31("AutoCompleteDracoTrial", fn73, flag3)

		local function fn74()
			local trialTeleport = map.PrehistoricIsland:FindFirstChild("TrialTeleport")
			if trialTeleport and trialTeleport:IsA("Part") and (humanoidRootPart.Position - trialTeleport.Position).Magnitude <= 10 then
				tbl6._AutoTrialDracoToggle.Update(false)
				return
			end

			if trialTeleport and trialTeleport:IsA("Part") then
				local v24 = tweenManager
				local topos = v24.topos
				local cframe6 = CFrame.new
				local position2 = trialTeleport:GetPivot().Position
				local vector = Vector3.new
				topos(v24, cframe6(position2 + Vector3.zero), true)
			end
		end

		fn31("AutoTrialDracoTP", fn74, flag3)

		local function fn75()
			state.ActiveSword = nil
			local exitTo = nil

			for _, v24 in ipairs(state.SwordList) do
				local Moveset = utilities:CheckInventory("Moveset", v24)
				if Moveset ~= nil and Moveset > 0 and Moveset < 300 then
					exitTo = 1
					break
				end
			end

			if exitTo == 1 then
				state.ActiveSword = t8
			end

			if state.ActiveSword then
				if not v18.Character:FindFirstChild(state.ActiveSword) then
					tbl6:FireInvoke("LoadItem", state.ActiveSword)
				end

				utilities:EquipWeapon("Sword")
				local enemies2 = utilities:GetEnemies({ "Water Fighter", "Sea Soldier" })
				if enemies2 then
					return subFunction:Attack(enemies2, true)
				end
				return utilities:MobsNextSpawn("Water Fighter")
			end

			local Moveset = utilities:CheckInventory("Moveset", "Shizu")
			local Moveset2 = utilities:CheckInventory("Moveset", "Saishi")
			local Moveset3 = utilities:CheckInventory("Moveset", "Oroshi")

			if Moveset and Moveset >= 300 and Moveset2 and Moveset2 >= 300 and Moveset3 and Moveset3 >= 300 then
				tbl6:FireInvoke("MysteriousMan", "2")
			elseif tbl6:FireInvoke("LegendarySwordDealer", "1") then
				print("Buy")
				tbl6:FireInvoke("LegendarySwordDealer", "2")
			else
				print("Hop")
				joinAPI("legendarysword", 2)
			end
		end

		fn31("AutoTTK", fn75, flag2)
	end

	tbl6.CoreSetup = function(arg)
		if arg.SetupData then
			arg:SetupData()
		end
	end

	tbl6.CombatHooks = function(arg)
		if arg.LoadFunctions then
			arg:LoadFunctions()
		end
	end

	tbl6.RuntimeServices = function(arg)
		if arg.LoadLoops then
			arg:LoadLoops()
		end
	end

	local function fn30(arg, ...)
		local now = tick()
		local v22 = tbl6[arg]

		if v22 then
			v22(tbl6, ...)
		end

		print(string.format("[OnionHub] %s initialized in %.4fs", arg, tick() - now))
	end

	fn30("CoreSetup")
	fn30("CombatHooks")
	fn30("RuntimeServices")
	task.spawn(fn30, "LoadLibrary")

	task.spawn(function()
		task.wait(1.5)
		tbl6:SendNotify("Onion Loaded", "All Functions, Modules, Dependencies, Successfully loaded.", 8)
		task.wait(1)
		tbl6:SendNotify("Onion INFO", "OnionHub Script is 100% Free and Keyless", 8)

		pcall(function()
			if OnionConfig.EnableEventReports then fn6("Util/BloxFruitModule/Preload/Weebo.lua") end
		end)
	end)


]=]

--[[
    ██████╗ ███╗   ██╗██╗ ██████╗ ███╗   ██╗██╗  ██╗██╗   ██╗██████╗ 
   ██╔═══██╗████╗  ██║██║██╔═══██╗████╗  ██║██║  ██║██║   ██║██╔══██╗
   ██║   ██║██╔██╗ ██║██║██║   ██║██╔██╗ ██║███████║██║   ██║██████╔╝
   ██║   ██║██║╚██╗██║██║██║   ██║██║╚██╗██║██╔══██║██║   ██║██╔══██╗
   ╚██████╔╝██║ ╚████║██║╚██████╔╝██║ ╚████║██║  ██║╚██████╔╝██████╔╝
    ╚═════╝ ╚═╝  ╚═══╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ 
    
    OnionHub — Blox Fruit Script
    Free, Keyless, Open
    Onion integration — based on the supplied Quantum source
--]]

-- ═══════════════════════════════════════════════════════════════════════
--  SECTION 0 — LOADER / BOOTSTRAP
-- ═══════════════════════════════════════════════════════════════════════

local ONIONHUB_VERSION   = "v1.1 Integrated"
local ONIONHUB_DISCORD   = "Not configured"
local ONIONHUB_RAW       = "https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/"
-- ^ swap this to your own raw URL when you host the sub-modules yourself

local Players        = game:GetService("Players")
local HttpService    = game:GetService("HttpService")
local TweenService   = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local StarterGui     = game:GetService("StarterGui")
if not game:IsLoaded() then game.Loaded:Wait() end
local LocalPlayer = Players.LocalPlayer
assert(LocalPlayer, "Onion requires a Roblox client")
local Mouse          = LocalPlayer:GetMouse()
local GameId         = game.GameId

-- file helpers (safe fallbacks)
local IsFile    = isfile    or function() return false end
local ReadFile  = readfile  or function() return "" end
local WriteFile = writefile or function() end
local MakeFolder= makefolder or function() end
local IsFolder  = isfolder  or function() return false end

local FOLDER    = "OnionHub"
local KEY_FILE  = FOLDER .. "/Key.json"   -- kept for compat, always empty now

-- ───────────────────────────────────────────────────────────────────────
-- tween / ui helpers
-- ───────────────────────────────────────────────────────────────────────
local function Tween(obj, props, t, style, dir)
    style = style or Enum.EasingStyle.Quint
    dir   = dir   or Enum.EasingDirection.Out
    TweenService:Create(obj, TweenInfo.new(t, style, dir), props):Play()
end

local function Protect(gui)
    local env = (getgenv and getgenv()) or _G
    if env.HIDEUI then
        gui.Parent = env.HIDEUI
    elseif gethui then
        gui.Parent = gethui()
    elseif syn and syn.protect_gui then
        syn.protect_gui(gui)
        gui.Parent = game:GetService("CoreGui")
    else
        gui.Parent = game:GetService("CoreGui")
    end
end

local function New(class, props, parent)
    local inst = Instance.new(class)
    for k, v in pairs(props) do
        if k ~= "Children" and k ~= "Parent" then
            pcall(function() inst[k] = v end)
        end
    end
    if props.Children then
        for _, c in ipairs(props.Children) do
            pcall(function() c.Parent = inst end)
        end
    end
    inst.Parent = props.Parent or parent
    return inst
end

local function CircleRipple(btn, mx, my)
    task.spawn(function()
        btn.ClipsDescendants = true
        local nx = mx - btn.AbsolutePosition.X
        local ny = my - btn.AbsolutePosition.Y
        local sz = math.max(btn.AbsoluteSize.X, btn.AbsoluteSize.Y) * 1.6
        local c = New("ImageLabel", {
            Name = "Ripple",
            Image = "rbxassetid://266543268",
            ImageColor3 = Color3.fromRGB(255,255,255),
            ImageTransparency = 0.82,
            BackgroundTransparency = 1,
            ZIndex = btn.ZIndex + 5,
            Size = UDim2.new(0,0,0,0),
            Position = UDim2.new(0,nx,0,ny),
        }, btn)
        Tween(c, {Size=UDim2.new(0,sz,0,sz), Position=UDim2.new(0.5,-sz/2,0.5,-sz/2)}, 0.45, Enum.EasingStyle.Quad)
        Tween(c, {ImageTransparency=1}, 0.45, Enum.EasingStyle.Linear)
        task.wait(0.46)
        c:Destroy()
    end)
end

local function Notify(title, desc, duration)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title    = title or "OnionHub",
            Text     = desc  or "",
            Duration = duration or 5,
        })
    end)
end

-- ───────────────────────────────────────────────────────────────────────
-- SECTION 1 — SPLASH / WELCOME UI  (replaces key gate — no key needed)
-- ───────────────────────────────────────────────────────────────────────
local function ShowSplash(onReady)
    local SG = Instance.new("ScreenGui")
    SG.Name = "OnionHub_Splash"
    SG.ZIndexBehavior = Enum.ZIndexBehavior.Global
    SG.ResetOnSpawn = false
    SG.IgnoreGuiInset = true
    Protect(SG)

    local Backdrop = New("Frame", {
        BackgroundColor3 = Color3.fromRGB(0,0,0),
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        Size = UDim2.new(1,0,1,0),
        ZIndex = 200,
        Parent = SG,
    })

    local W, H = 460, 320
    local Card = New("Frame", {
        AnchorPoint = Vector2.new(0.5,0.5),
        Position = UDim2.new(0.5,0,0.5,0),
        Size = UDim2.new(0,W,0,H),
        BackgroundColor3 = Color3.fromRGB(8,6,18),
        BorderSizePixel = 0,
        ZIndex = 201,
        ClipsDescendants = true,
        Parent = SG,
        Children = {
            New("UICorner",  {CornerRadius = UDim.new(0,14)}),
            New("UIStroke",  {
                Color = Color3.fromRGB(0,200,255),
                Transparency = 0.25,
                Thickness = 1.6,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            }),
        }
    })

    -- background blobs
    New("Frame",{BackgroundColor3=Color3.fromRGB(0,120,200),BackgroundTransparency=0.88,BorderSizePixel=0,
        Position=UDim2.new(0,-50,0,-50),Size=UDim2.new(0,210,0,210),ZIndex=201,Parent=Card,
        Children={New("UICorner",{CornerRadius=UDim.new(1,0)})}})
    New("Frame",{BackgroundColor3=Color3.fromRGB(0,60,120),BackgroundTransparency=0.88,BorderSizePixel=0,
        Position=UDim2.new(1,-90,1,-90),Size=UDim2.new(0,170,0,170),ZIndex=201,Parent=Card,
        Children={New("UICorner",{CornerRadius=UDim.new(1,0)})}})

    -- header bar
    local Header = New("Frame",{
        BackgroundColor3=Color3.fromRGB(12,10,26),BorderSizePixel=0,
        Size=UDim2.new(1,0,0,46),ZIndex=202,Parent=Card,
        Children={
            New("UICorner",{CornerRadius=UDim.new(0,14)}),
            New("Frame",{BackgroundColor3=Color3.fromRGB(12,10,26),BorderSizePixel=0,
                Position=UDim2.new(0,0,0.5,0),Size=UDim2.new(1,0,0.5,0),ZIndex=202}),
        }
    })
    New("TextLabel",{
        BackgroundTransparency=1,Position=UDim2.new(0,16,0,0),Size=UDim2.new(1,-80,1,0),
        Font=Enum.Font.FredokaOne,Text="OnionHub — Blox Fruit",
        TextColor3=Color3.fromRGB(0,220,255),TextSize=15,
        TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203,Parent=Header
    })
    -- version badge
    New("Frame",{
        AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=Color3.fromRGB(0,40,70),BorderSizePixel=0,
        Position=UDim2.new(1,-12,0.5,0),Size=UDim2.new(0,80,0,22),ZIndex=203,Parent=Header,
        Children={
            New("UICorner",{CornerRadius=UDim.new(0,5)}),
            New("UIStroke",{Color=Color3.fromRGB(0,200,255),Transparency=0.3,Thickness=1,ApplyStrokeMode=Enum.ApplyStrokeMode.Border}),
            New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),
                Font=Enum.Font.GothamBold,Text=ONIONHUB_VERSION,
                TextColor3=Color3.fromRGB(0,210,255),TextSize=10,ZIndex=204}),
        }
    })
    -- divider
    New("Frame",{BackgroundColor3=Color3.fromRGB(0,200,255),BackgroundTransparency=0.4,
        BorderSizePixel=0,Position=UDim2.new(0,0,0,46),Size=UDim2.new(1,0,0,1),ZIndex=202,Parent=Card})

    -- avatar + user info block
    local AvatarRing = New("Frame",{
        BackgroundColor3=Color3.fromRGB(0,180,230),BackgroundTransparency=0.3,BorderSizePixel=0,
        AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0,W/2,0,60),Size=UDim2.new(0,56,0,56),
        ZIndex=203,Parent=Card,Children={New("UICorner",{CornerRadius=UDim.new(1,0)})}
    })
    local AvatarImg = New("ImageLabel",{
        BackgroundColor3=Color3.fromRGB(20,10,40),BackgroundTransparency=0,BorderSizePixel=0,
        AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,0),Size=UDim2.new(0,50,0,50),
        Image="",ZIndex=204,Parent=AvatarRing,Children={New("UICorner",{CornerRadius=UDim.new(1,0)})}
    })
    task.spawn(function()
        local ok,img = pcall(function()
            return Players:GetUserThumbnailAsync(LocalPlayer.UserId,
                Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100)
        end)
        if ok and img then AvatarImg.Image = img end
    end)
    New("TextLabel",{
        BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0),
        Position=UDim2.new(0.5,0,0,122),Size=UDim2.new(1,-20,0,16),
        Font=Enum.Font.GothamBold,Text=LocalPlayer.DisplayName,
        TextColor3=Color3.fromRGB(200,240,255),TextSize=13,ZIndex=203,Parent=Card
    })
    New("TextLabel",{
        BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0),
        Position=UDim2.new(0.5,0,0,140),Size=UDim2.new(1,-20,0,12),
        Font=Enum.Font.Gotham,Text="@"..LocalPlayer.Name,
        TextColor3=Color3.fromRGB(100,180,210),TextSize=10,ZIndex=203,Parent=Card
    })

    -- free badge
    New("Frame",{
        AnchorPoint=Vector2.new(0.5,0),BackgroundColor3=Color3.fromRGB(0,40,20),BorderSizePixel=0,
        Position=UDim2.new(0.5,0,0,157),Size=UDim2.new(0,120,0,22),ZIndex=203,Parent=Card,
        Children={
            New("UICorner",{CornerRadius=UDim.new(0,5)}),
            New("UIStroke",{Color=Color3.fromRGB(0,220,120),Transparency=0.3,Thickness=1,ApplyStrokeMode=Enum.ApplyStrokeMode.Border}),
            New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),
                Font=Enum.Font.GothamBold,Text="✓  Free — No Key Needed",
                TextColor3=Color3.fromRGB(80,230,140),TextSize=10,ZIndex=204}),
        }
    })

    -- info rows
    local infoY = 188
    local infos = {
        {"Discord",  ONIONHUB_DISCORD},
        {"Version",  ONIONHUB_VERSION},
        {"Game",     tostring(GameId)},
    }
    for _, row in ipairs(infos) do
        New("TextLabel",{BackgroundTransparency=1,Position=UDim2.new(0,30,0,infoY),Size=UDim2.new(0,80,0,14),
            Font=Enum.Font.GothamBold,Text=row[1]..":",TextColor3=Color3.fromRGB(0,160,200),
            TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203,Parent=Card})
        New("TextLabel",{BackgroundTransparency=1,Position=UDim2.new(0,115,0,infoY),Size=UDim2.new(1,-130,0,14),
            Font=Enum.Font.Gotham,Text=row[2],TextColor3=Color3.fromRGB(180,230,245),
            TextSize=10,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=203,Parent=Card})
        infoY = infoY + 16
    end

    -- launch button
    local LaunchBtn = New("TextButton",{
        AnchorPoint=Vector2.new(0.5,0),BackgroundColor3=Color3.fromRGB(0,80,140),BorderSizePixel=0,
        Position=UDim2.new(0.5,0,0,270),Size=UDim2.new(0,200,0,34),
        AutoButtonColor=false,Text="",ClipsDescendants=true,ZIndex=202,Parent=Card,
        Children={
            New("UICorner",{CornerRadius=UDim.new(0,8)}),
            New("UIStroke",{Color=Color3.fromRGB(0,200,255),Transparency=0.2,Thickness=1.5,ApplyStrokeMode=Enum.ApplyStrokeMode.Border}),
            New("TextLabel",{BackgroundTransparency=1,Size=UDim2.new(1,0,1,0),
                Font=Enum.Font.FredokaOne,Text="▶  Launch Script",
                TextColor3=Color3.fromRGB(0,220,255),TextSize=15,ZIndex=203}),
        }
    })
    LaunchBtn.MouseEnter:Connect(function()
        Tween(LaunchBtn,{BackgroundColor3=Color3.fromRGB(0,110,180)},0.12)
    end)
    LaunchBtn.MouseLeave:Connect(function()
        Tween(LaunchBtn,{BackgroundColor3=Color3.fromRGB(0,80,140)},0.14)
    end)
    local launched = false
    LaunchBtn.MouseButton1Click:Connect(function()
        if launched then return end
        launched = true
        CircleRipple(LaunchBtn, Mouse.X, Mouse.Y)
        Tween(Card,{Size=UDim2.new(0,W*0.6,0,H*0.6),BackgroundTransparency=1},0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.In)
        Tween(Backdrop,{BackgroundTransparency=1},0.2,Enum.EasingStyle.Quint)
        task.delay(0.22,function()
            SG:Destroy()
            if onReady then onReady() end
        end)
    end)

    -- entry animation
    Card.Size = UDim2.new(0,W*0.7,0,H*0.7)
    Card.BackgroundTransparency = 1
    Tween(Card,{Size=UDim2.new(0,W,0,H),BackgroundTransparency=0},0.28,Enum.EasingStyle.Back,Enum.EasingDirection.Out)
end


ShowSplash(function()
    local main, compileError = loadstring(OnionCoreSource, "@Onion/main")
    if not main then
        OnionEnvironment.OnionHubBooting = false
        error(compileError)
    end
    local ok, runtimeError = xpcall(function()
        main(OnionBundle, OnionConfig)
    end, function(message)
        return debug.traceback(tostring(message), 2)
    end)
    OnionEnvironment.OnionHubBooting = false
    if not ok then
        warn("[OnionHub] Startup failed: " .. tostring(runtimeError))
        Notify("OnionHub startup failed", "See the console for the full error. Rejoin before retrying.", 10)
    end
end)
