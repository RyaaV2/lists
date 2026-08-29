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
        "Trapper",
        "DJ Booth"
    },
    Priority = {
        "Dead Ahead",
        "Lay By",
        "Construction Crazy",
        "The Heights",
        "Retro The Heights",
        "Forgetten Docks",
        "Winter Abyss",
        "Sacred Mountains"
    },
    Maps = {
        ["Dead Ahead"] = "strategies/fallen/late/dead_ahead.lua",
        ["Lay By"] = "strategies/fallen/late/lay_by.lua",
        ["Construction Crazy"] = "strategies/fallen/late/construction_crazy.lua",
        ["Winter Abyss"] = "strategies/fallen/late/winter_abyss.lua",
        ["The Heights"] = "strategies/fallen/late/the_heights.lua",
        ["Retro The Heights"] = "strategies/fallen/late/retro_the_heights.lua",
        ["Forgetten Docks"] = "strategies/fallen/late/forgetten_docks.lua"
        ["Sacred Mountains"] = "strategies/fallen/late/sacred_mountains.lua"
    }
}
