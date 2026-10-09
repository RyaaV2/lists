return {
    MatchTimeoutMinutes = 15,
    Matchmaking = {Difficulty = "Casual", Type = "survival"},
    RequiredTowers = {
        "Militant",
        "Commander",
        "Assassin"
    },
    Priority = {
        "Lay By",
        "Dead Ahead",
        "Mason rch",
        "Construction Crazy",
        "Forgetten Docks"
    },
    Maps = {
        ["Mason rch"] = "strategies/casual/mason_arch.lua",
        ["Dead Ahead"] = "strategies/casual/dead_ahead.lua",
        ["Lay By"] = "strategies/casual/lay_by.lua",
        ["Construction Crazy"] = "strategies/casual/construction_crazy.lua",
        ["Forgetten Docks"] = "strategies/casual/forgetten_docks.lua"
    }
}
