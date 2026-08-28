-- Tower ownership / prices / per-tower GrindRules.
-- FarmBehavior can live inside each GrindRules entry.

return {
        FarmRoutes = {
            Gems = {Route = "Frost", FarmBehavior = "RematchUntilAffordable"},
            Coins = {Route = "Frost", FarmBehavior = "RematchUntilAffordable"}
        },

        DisplayPriority = {
            "Engineer",
            "Brawler",
            "Accelerator",
            "Hacker",
            "Necromancer",
            "Turret",
            "Mercenary Base",
            "Pursuit",
            "DJ Booth",
            "Commander",
            "Tesla",
            "Mortar",
            "Minigunner",
            "Ranger",
            "Gatling Gun",
            "Hunter",
            "Rocketeer",
            "Crook Boss",
            "Trapper",
            "Shotgunner",
            "Electroshocker",
            "Pyromancer",
            "Medic",
            "Assassin",
            "Farm",
            "Ace Pilot",
            "Freezer",
            "Military Base",
            "Militant",
            "Paintballer",
            "Scout",
            "Soldier",
            "Boomerang",
            "Sniper",
            "Demoman"
        },

        Priority = {
            "Engineer",
            "Brawler",
            "Accelerator",
            "Hacker",
            "Necromancer",
            "Pursuit",
            "DJ Booth",
            "Commander",
            "Tesla",
            "Minigunner",
            "Ranger",
            "Gatling Gun",
            "Hunter",
            "Rocketeer",
            "Trapper",
            "Shotgunner",
            "Electroshocker",
            "Pyromancer",
            "Medic",
            "Assassin",
            "Farm",
            "Ace Pilot",
            "Freezer",
            "Military Base",
            "Militant",
            "Paintballer",
            "Scout",
            "Soldier",
            "Boomerang",
            "Sniper",
            "Demoman"
        },

        Info = {
            ["Engineer"] = {Type = "Currency", Currency = "Gems", Price = 4500, Level = 50},
            ["Brawler"] = {Type = "Currency", Currency = "Gems", Price = 1250, Level = 50},
            ["Accelerator"] = {Type = "Currency", Currency = "Gems", Price = 2500, Level = 50},
            ["Hacker"] = {
                Type = "Currency",
                Currency = "Gems",
                Price = 5500,
                Level = 50,
                GrindRules = {
                    {MinLevel = 175, Route = "Hardcore", FarmBehavior = "ReturnAfterMatch"}
                }
            },
            ["Necromancer"] = {Type = "Currency", Currency = "Gems", Price = 2250, Level = 50},
            ["Turret"] = {Type = "Level", Level = 50},
            ["Mercenary Base"] = {Type = "Level", Level = 150},
            ["Pursuit"] = {Type = "Currency", Currency = "Coins", Price = 15000, Level = 100},
            ["DJ Booth"] = {
                Type = "Currency",
                Currency = "Coins",
                Price = 5000,
                GrindRules = {
                    {MinLevel = 175, Route = "Fallen", FarmBehavior = "ReturnAfterMatch"}
                }
            },
            ["Commander"] = {Type = "Currency", Currency = "Coins", Price = 4000},
            ["Tesla"] = {Type = "Currency", Currency = "Coins", Price = 6000},
            ["Mortar"] = {Type = "Level", Level = 75},
            ["Minigunner"] = {Type = "Currency", Currency = "Coins", Price = 8000},
            ["Ranger"] = {Type = "Currency", Currency = "Coins", Price = 12000},
            ["Gatling Gun"] = {
                Type = "Currency",
                Currency = "Coins",
                Price = 35000,
                Level = 175,
                GrindRules = {
                    {MinLevel = 175, Route = "Molten", FarmBehavior = "RepeatUntilAffordable"}
                }
            },
            ["Hunter"] = {
                Type = "Currency",
                Currency = "Coins",
                Price = 1000,
                GrindRules = {
                    {MinLevel = 50, MaxLevel = 174, Route = "Molten", FarmBehavior = "RepeatUntilAffordable"}
                }
            },
            ["Rocketeer"] = {Type = "Currency", Currency = "Coins", Price = 2500},
            ["Crook Boss"] = {Type = "Level", Level = 30},
            ["Trapper"] = {
                Type = "Currency",
                Currency = "Coins",
                Price = 3000,
                GrindRules = {
                    {MinLevel = 175, Route = "Fallen", FarmBehavior = "ReturnAfterMatch"}
                }
            },
            ["Shotgunner"] = {Type = "Currency", Currency = "Coins", Price = 850},
            ["Electroshocker"] = {Type = "Currency", Currency = "Coins", Price = 2500},
            ["Pyromancer"] = {
                Type = "Currency",
                Currency = "Coins",
                Price = 1250,
                GrindRules = {
                    {MinLevel = 50, MaxLevel = 174, Route = "Molten", FarmBehavior = "RepeatUntilAffordable"}
                }
            },
            ["Medic"] = {Type = "Currency", Currency = "Coins", Price = 2000},
            ["Assassin"] = {Type = "Currency", Currency = "Coins", Price = 800},
            ["Farm"] = {Type = "Currency", Currency = "Coins", Price = 2000},
            ["Ace Pilot"] = {Type = "Currency", Currency = "Coins", Price = 1500},
            ["Freezer"] = {Type = "Currency", Currency = "Coins", Price = 650},
            ["Military Base"] = {Type = "Currency", Currency = "Coins", Price = 4000},
            ["Militant"] = {Type = "Currency", Currency = "Coins", Price = 800},
            ["Paintballer"] = {Type = "Currency", Currency = "Coins", Price = 100},
            ["Scout"] = {Type = "Free"},
            ["Soldier"] = {
                Type = "Currency",
                Currency = "Coins",
                Price = 350,
                GrindRules = {
                    {ProgressionMode = "Win", MaxLevel = 49, Route = "Easy.Starter", FarmBehavior = "ReturnAfterMatch"},
                    {ProgressionMode = "Lose", MaxLevel = 49, Route = "Easy.Lose", FarmBehavior = "RestartUntilAffordable"},
                    {ProgressionMode = "AutoMax", MaxLevel = 49, Route = "Easy.Lose", FarmBehavior = "RestartUntilAffordable"}
                }
            },
            ["Boomerang"] = {Type = "Currency", Currency = "Coins", Price = 300},
            ["Sniper"] = {Type = "Free"},
            ["Demoman"] = {Type = "Currency", Currency = "Coins", Price = 200}
        }
    }
