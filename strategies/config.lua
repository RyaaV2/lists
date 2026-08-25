return {
    Towers = {
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
                FarmBehavior = "ReturnAfterMatch",
                GrindRules = {
                    {MinLevel = 175, Route = "Hardcore"}
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
                FarmBehavior = "ReturnAfterMatch",
                GrindRules = {
                    {MinLevel = 175, Route = "Fallen"}
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
                FarmBehavior = "RepeatUntilAffordable",
                GrindRules = {
                    {MinLevel = 175, Route = "Molten"}
                }
            },
            ["Hunter"] = {
                Type = "Currency",
                Currency = "Coins",
                Price = 1000,
                FarmBehavior = "RepeatUntilAffordable",
                GrindRules = {
                    {MinLevel = 50, MaxLevel = 174, Route = "Molten"}
                }
            },
            ["Rocketeer"] = {Type = "Currency", Currency = "Coins", Price = 2500},
            ["Crook Boss"] = {Type = "Level", Level = 30},
            ["Trapper"] = {
                Type = "Currency",
                Currency = "Coins",
                Price = 3000,
                FarmBehavior = "ReturnAfterMatch",
                GrindRules = {
                    {MinLevel = 175, Route = "Fallen"}
                }
            },
            ["Shotgunner"] = {Type = "Currency", Currency = "Coins", Price = 850},
            ["Electroshocker"] = {Type = "Currency", Currency = "Coins", Price = 2500},
            ["Pyromancer"] = {
                Type = "Currency",
                Currency = "Coins",
                Price = 1250,
                FarmBehavior = "RepeatUntilAffordable",
                GrindRules = {
                    {MinLevel = 50, MaxLevel = 174, Route = "Molten"}
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
                FarmBehavior = "RepeatUntilAffordable",
                GrindRules = {
                    {MaxLevel = 49, Route = "Easy.Lose"}
                }
            },
            ["Boomerang"] = {Type = "Currency", Currency = "Coins", Price = 300},
            ["Sniper"] = {Type = "Free"},
            ["Demoman"] = {Type = "Currency", Currency = "Coins", Price = 200}
        }
    },

    AutoFarmUntilGatling = {
        Win = {
            GrindRules = {
                {
                    Route = "Easy.Win",
                    RequiredTowers = {"Soldier"}
                }
            }
        },

        Lose = {
            GrindRules = {
                {
                    MaxLevel = 14,
                    Route = "Easy.Lose"
                },
                {
                    MinLevel = 15,
                    MaxLevel = 49,
                    Route = "Molten",
                    RequiredTowers = {"Soldier"}
                },
                {
                    MinLevel = 50,
                    MaxLevel = 174,
                    Route = "Hardcore",
                    RequiredTowers = {"Pyromancer", "Hunter"}
                },
                {
                    MinLevel = 175,
                    Route = "Molten"
                }
            }
        }
    },

    AutoMaxAccount = {
        GrindRules = {
            {
                MaxLevel = 14,
                Route = "Easy.Lose",
                RequiredTowers = {"Soldier"}
            },
            {
                MinLevel = 15,
                MaxLevel = 49,
                Route = "Molten",
                RequiredTowers = {"Soldier"}
            },
            {
                MinLevel = 50,
                MaxLevel = 174,
                Route = "Hardcore",
                RequiredTowers = {"Pyromancer", "Hunter"}
            },
            {
                MinLevel = 175,
                Route = "Frost",
                RequiredTowers = {
                    "Gatling Gun",
                    "Hacker",
                    "Trapper",
                    "DJ Booth",
                    "Mercenary Base"
                }
            }
        }
    },

    Easy = {
        Win = {
            Matchmaking = {Difficulty = "Easy", Type = "survival"},
            RequiredTowers = {"Soldier"},
            Priority = {
                "Black Spot Exchange",
                "Mason Arch",
                "Gilded Path",
                "Dead Ahead",
                "Lay By"
            },
            Maps = {
                ["Black Spot Exchange"] = "strategies/easy/win/black_spot_exchange.lua",
                ["Mason Arch"] = "strategies/easy/win/mason_arch.lua",
                ["Gilded Path"] = "strategies/easy/win/gilded_path.lua",
                ["Dead Ahead"] = "strategies/easy/win/dead_ahead.lua",
                ["Lay By"] = "strategies/easy/win/lay_by.lua"
            }
        },

        Lose = {
            Matchmaking = {Difficulty = "Easy", Type = "survival"},
            RequiredTowers = {"Scout"},
            Priority = {
                "Meltdown",
                "Simplicity",
                "Stained Temple",
                "Midnight Issue",
                "Spring Fever"
            },
            Maps = {
                ["Meltdown"] = "strategies/easy/lose/meltdown.lua",
                ["Simplicity"] = "strategies/easy/lose/simplicity.lua",
                ["Stained Temple"] = "strategies/easy/lose/stained_temple.lua",
                ["Midnight Issue"] = "strategies/easy/lose/midnight_issue.lua",
                ["Spring Fever"] = "strategies/easy/lose/spring_fever.lua"
            }
        }
    },

    Molten = {
        Matchmaking = {Difficulty = "Molten", Type = "survival"},
        RequiredTowers = {"Soldier"},
        Priority = {
            "Wrecked Battlefield II",
            "Lighthaos",
            "Midnight Issue",
            "Nether"
        },
        Maps = {
            ["Wrecked Battlefield II"] = "strategies/molten/wrecked_battlefield_ii.lua",
            ["Lighthaos"] = "strategies/molten/lighthaos.lua",
            ["Midnight Issue"] = "strategies/molten/midnight_issue.lua",
            ["Nether"] = "strategies/molten/nether.lua"
        }
    },

    Hardcore = {
        Matchmaking = {Difficulty = "Easy", Type = "hardcore"},
        RequiredTowers = {"Pyromancer", "Hunter"},
        Priority = {
            "Wretched Front"
        },
        Maps = {
            ["Wretched Front"] = "strategies/hardcore/wretched_front.lua"
        }
    },

    Fallen = {
        Matchmaking = {Difficulty = "Fallen", Type = "survival"},
        RequiredTowers = {
            "Hacker",
            "Gatling Gun",
            "Mercenary Base",
            "Turret",
            "Soldier"
        },
        Priority = {
            "Construction Crazy",
            "The Heights",
            "Retro The Heights",
            "Forgetten Docks"
        },
        Maps = {
            ["Construction Crazy"] = "strategies/fallen/construction_crazy.lua",
            ["The Heights"] = "strategies/fallen/the_heights.lua",
            ["Retro The Heights"] = "strategies/fallen/retro_the_heights.lua",
            ["Forgetten Docks"] = "strategies/fallen/forgetten_docks.lua"
        }
    },

    Story = {
        Order = {
            "Chapter0Mission1",
            "Chapter0Mission2",
            "Chapter0Mission3",
            "Chapter0Mission4"
        },

        Missions = {
            ["Chapter0Mission1"] = {
                Name = "Boot Camp",
                Strategy = "strategies/story/boot_camp.lua"
            },
            ["Chapter0Mission2"] = {
                Name = "Live Fire",
                Strategy = "strategies/story/live_fire.lua"
            },
            ["Chapter0Mission3"] = {
                Name = "Breach Protocol",
                Strategy = "strategies/story/breach_protocol.lua"
            },
            ["Chapter0Mission4"] = {
                Name = "Brute Force",
                Strategy = "strategies/story/brute_force.lua"
            }
        }
    },

    Frost = {
        Matchmaking = {Difficulty = "Frost", Type = "survival"},
        RequiredTowers = {
            "Trapper",
            "Hacker",
            "Gatling Gun",
            "Mercenary Base",
            "DJ Booth"
        },
        Priority = {
            "Lay By",
            "Dead Ahead",
            "Retro The Heights",
            "Construction Crazy",
            "Forgetten Docks",
            "Winter Abyss",
            "The Heights"
        },
        Maps = {
            ["Lay By"] = "strategies/frost/lay_by.lua",
            ["Dead Ahead"] = "strategies/frost/dead_ahead.lua",
            ["Retro The Heights"] = "strategies/frost/retro_the_heights.lua",
            ["Construction Crazy"] = "strategies/frost/construction_crazy.lua",
            ["Forgetten Docks"] = "strategies/frost/forgetten_docks.lua",
            ["Winter Abyss"] = "strategies/frost/winter_abyss.lua",
            ["The Heights"] = "strategies/frost/the_heights.lua"
        }
    }
}
