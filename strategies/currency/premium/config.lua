-- Premium Currency Farm configuration.
-- Coins uses the duplicated Fallen Late route under currency/premium/.

return {
    Coins = {
        ComingSoon = false,
        Description = "Better rewards if modifiers owned",
        RouteKey = "PremiumCurrency.Coins",
        RouteConfigPath = "strategies/currency/premium/fallen_late/config.lua",
        GameOverAction = "Rematch",

        SupportedModifiersTrials = {
            "HiddenEnemies",
            "ExplodingEnemies",
            "Limitation",
            "Committed",
            "Quarantine",
            "Fog"
        },

        Requirements = {
            MinimumLevel = 175,
            RequiredTowers = {
                "Hacker",
                "Gatling Gun",
                "Mercenary Base",
                "Trapper"
            }
        }
    },

    ComingSoon = {
        ComingSoon = true
    }
}
