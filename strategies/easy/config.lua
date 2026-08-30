return {
    MatchTimeoutMinutes = 10,

    Starter = {
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
            ["Meltdown"] = "strategies/easy/starter/meltdown.lua",
            ["Simplicity"] = "strategies/easy/starter/simplicity.lua",
            ["Stained Temple"] = "strategies/easy/starter/stained_temple.lua",
            ["Midnight Issue"] = "strategies/easy/starter/midnight_issue.lua",
            ["Spring Fever"] = "strategies/easy/starter/spring_fever.lua"
        }
    },

    Win = {
        Matchmaking = {Difficulty = "Easy", Type = "survival"},
        RequiredTowers = {"Soldier"},
        Priority = {
            "Black Spot Exchange",
            "Dead Ahead",
            "Lay By"
        },
        Maps = {
            ["Black Spot Exchange"] = "strategies/easy/win/black_spot_exchange.lua",
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
