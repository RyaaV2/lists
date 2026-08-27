-- Fallen route configuration.
-- Edit matchmaking, required towers, map priority, and map strategy paths here.

return {
    MatchTimeoutMinutes = 20,
    UseAutoGutlin = true,

    -- Route-specific engine behavior.
    DisableMatchTimeout = true,
    CompletionBehavior = "ReturnToLobby",

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
    }
