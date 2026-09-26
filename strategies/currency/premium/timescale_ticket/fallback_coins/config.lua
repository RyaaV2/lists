-- Timescale Ticket fallback route.
-- Uses the Premium Coins Fallen strategies for one match,
-- then returns to the lobby so the current Trial can be checked again.

return {
    RouteKey = "PremiumCurrency.TimescaleTicketFallbackCoins",
    GameOverAction = "BackToLobby",

    MatchTimeoutMinutes = 20,
    DisableMatchTimeout = true,

    Matchmaking = {Difficulty = "Fallen", Type = "survival"},

    Priority = {
        "Lay By",
        "Dead Ahead",
        "Construction Crazy",
        "The Heights",
        "Retro The Heights",
        "Forgetten Docks",
        "Winter Abyss",
        "Sacred Mountains"
    },

    Maps = {
        ["Dead Ahead"] = "strategies/currency/premium/fallen_late/dead_ahead.lua",
        ["Lay By"] = "strategies/currency/premium/fallen_late/lay_by.lua",
        ["Construction Crazy"] = "strategies/currency/premium/fallen_late/construction_crazy.lua",
        ["Winter Abyss"] = "strategies/currency/premium/fallen_late/winter_abyss.lua",
        ["The Heights"] = "strategies/currency/premium/fallen_late/the_heights.lua",
        ["Retro The Heights"] = "strategies/currency/premium/fallen_late/retro_the_heights.lua",
        ["Forgetten Docks"] = "strategies/currency/premium/fallen_late/forgetten_docks.lua",
        ["Sacred Mountains"] = "strategies/currency/premium/fallen_late/sacred_mountains.lua"
    }
}
