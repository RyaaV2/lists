-- Premium Currency Farm configuration.
-- UI is available, but Premium Currency Farm backend logic is not implemented yet.
-- Add matchmaking/routes/strategies here when the premium farm is ready.

return {
    Coins = {
        ComingSoon = true,

        SupportedModifiersTrials = {
            "HiddenEnemies",
            "ExplodingEnemies",
            "Limitation",
            "Committed",
            "Quarantine",
            "Fog"
        },

        Requirements = {
            MinimumLevel = 0,
            RequiredTowers = {
            }
        }
    },

    ComingSoon = {
        ComingSoon = true
    }
}
