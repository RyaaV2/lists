-- Timescale Ticket premium currency farm configuration.
-- Kept separate from the live currency configs while this route is being built.

return {
    Description = "Timescale Ticket Trial Farm",

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
        "JailedTowers"
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
