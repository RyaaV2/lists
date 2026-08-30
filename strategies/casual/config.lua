return {
    MatchTimeoutMinutes = 15,
    Matchmaking = {Difficulty = "Casual", Type = "survival"},
    RequiredTowers = {
        "Militant",
        "Commander",
        "Assassin"
    },
    Priority = {
        "Dead Ahead",
        "Lay By",
        "Mason Arch",
        "Black Spot Exchange",
    },
    Maps = {
        ["Mason Arch"] = "strategies/casual/mason_arch.lua",
        ["Dead Ahead"] = "strategies/casual/dead_ahead.lua",
        ["Lay By"] = "strategies/casual/lay_by.lua",
        ["Black Spot Exchange"] = "strategies/casual/black_spot_exchange.lua"
    }
}
