-- Timescale Ticket premium currency farm configuration.
-- Kept separate from the live currency configs while this route is being built.

return {
    CurrencyName = "Timescale Ticket",
    TestOnly = true,
    AllowTestWithoutPremium = true,

    ModifierDisplayNames = {
        HiddenEnemies = "Hidden",
        ExplodingEnemies = "Exploding",
        FlyingEnemies = "Flying",
        SpeedyEnemies = "Speedy",
        JailedToers = "Jailed"
    },

    Description = "Timescale Ticket Trial Farm",

    TrialStatePath = "strategies/currency/trial_state.lua",

    RouteKey = "PremiumCurrency.TimescaleTicket",

    GameOverAction = "Rematch",

    Matchmaking = {
        Difficulty = "Trial",
        Type = "Trials",
        Count = 1
    },

    SupportedModifiersTrials = {
        "HiddenEnemies",
        "Glass",
        "ExplodingEnemies",
        "Limitation",
        "Fog",
        "FlyingEnemies",
        "Broke",
        "SpeedyEnemies",
        "Quarantine"
    },

    Requirements = {
        MinimumLevel = 175,

        RequiredTowers = {
            "Gatling Gun",
            "Hacker",
            "Trapper",
            "DJ Booth",
            "Militant"
        }
    }
}
