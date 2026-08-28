-- Hardcore route configuration.
-- Edit matchmaking, required towers, map priority, and map strategy paths here.

return {
    MatchTimeoutMinutes = 10,

    CountLoseGameOver = true,

        Matchmaking = {Difficulty = "Easy", Type = "hardcore"},
        RequiredTowers = {"Pyromancer", "Hunter"},
        Priority = {
            "Wretched Front"
        },
        Maps = {
            ["Wretched Front"] = "strategies/hardcore/wretched_front.lua"
        }
    }
