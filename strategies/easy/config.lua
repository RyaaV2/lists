-- Easy route configuration.
-- Edit matchmaking, required towers, map priority, and map strategy paths here.

return {
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
            CountLoseGameOver = true,
            MilestoneBehavior = "ReturnToLobby",
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
    }
