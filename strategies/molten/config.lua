-- Molten route configuration.
-- Edit matchmaking, required towers, map priority, and map strategy paths here.

return {
    MilestoneBehavior = "ReturnToLobby",

    CountLoseGameOver = true,

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
    }
