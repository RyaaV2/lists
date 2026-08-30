return {
    MatchTimeoutMinutes = 15,
    Matchmaking = {Difficulty = "Casual", Type = "survival"},
    RequiredTowers = {
        "Militant",
        "Commander",
        "Assassin"
    },
    Priority = {
        "Mason Arch",
        "Dead Ahead"
    },
    Maps = {
        ["Mason Arch"] = "strategies/casual/mason_arch.lua",
        ["Dead Ahead"] = "strategies/casual/dead_ahead.lua"
    }
}
