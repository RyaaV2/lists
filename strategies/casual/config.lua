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
        "Construction Crazy",
        "Forgetten Docks"
    },
    Maps = {
        ["Mason Arch"] = "strategies/casual/mason_arch.lua",
        ["Dead Ahead"] = "strategies/casual/dead_ahead.lua",
        ["Lay By"] = "strategies/casual/lay_by.lua",
        ["Black Spot Exchange"] = "strategies/casual/black_spot_exchange.lua",
        ["Construction Crazy"] = "strategies/casual/construction_crazy.lua",
        ["Forgetten Docks"] = "strategies/casual/forgetten_docks.lua"
    }
}
