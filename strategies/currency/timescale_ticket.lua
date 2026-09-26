-- Timescale Ticket premium currency farm configuration.
-- Kept separate from the live currency configs while this route is being built.

return {
    CurrencyName = "Timescale Ticket",

    ModifierDisplayNames = {
        HiddenEnemies = "Hidden",
        ExplodingEnemies = "Exploding",
        FlyingEnemies = "Flying",
        SpeedyEnemies = "Speedy",
        JailedTowers = "Jailed",
        Inflation = "Inflation"
    },

    Description = "Timescale Ticket Trial Farm",

    TrialStatePath = "strategies/currency/trial_state.lua",
    RouteConfigPath = "strategies/currency/premium/timescale_ticket/config.lua",
    FallbackRouteConfigPath = "strategies/currency/premium/timescale_ticket/fallback_coins/config.lua",

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
        "Quarantine",
        "JailedTowers",
        "Inflation"
    },

    Requirements = {
        MinimumLevel = 175,

        RequiredTowers = {
            "Gatling Gun",
            "Hacker",
            "Trapper",
            "DJ Booth",
            "Militant",
            "Military Base"
        }
    }
}
