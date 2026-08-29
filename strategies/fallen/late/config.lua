-- Late-game Fallen strategy route.
-- The strategy files in this folder are temporary copies of Starter.
-- Replace them with the new Fallen Late strategy files when ready.

return {
    MatchTimeoutMinutes = 20,
    UseAutoGutlin = true,
    DisableMatchTimeout = true,

    Matchmaking = {Difficulty = "Fallen", Type = "survival"},
    RequiredTowers = {
        "Hacker",
        "Gatling Gun",
        "Mercenary Base",
        "Turret",
        "Soldier"
    },
    Priority = {
        "Dead Ahead"
        "Construction Crazy",
        "The Heights",
        "Retro The Heights",
        "Forgetten Docks"
    },
    Maps = {
        ["Construction Crazy"] = "strategies/fallen/late/construction_crazy.lua",
        ["The Heights"] = "strategies/fallen/late/the_heights.lua",
        ["Retro The Heights"] = "strategies/fallen/late/retro_the_heights.lua",
        ["Forgetten Docks"] = "strategies/fallen/late/forgetten_docks.lua"
    }
}
