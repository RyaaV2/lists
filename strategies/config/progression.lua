-- Level/progression routing only.
-- Keep map lists and route requirements out of this file.

return {
    MatchTimeoutMinutes = 15,
    GameOverStuckMinutes = 5,

    AutoFarmUntilGatling = {
        TargetTower = "Gatling Gun",

        Win = {
            RoutePriority = {
                "Casual",
                "Easy.Win",
                "Easy.Starter"
            }
        },

        Lose = {
            GrindRules = {
                {
                    MaxLevel = 14,
                    Route = "Easy.Lose",
                    TargetLevel = 15
                },
                {
                    MinLevel = 15,
                    MaxLevel = 49,
                    Route = "Molten",
                    TargetLevel = 50
                },
                {
                    MinLevel = 50,
                    MaxLevel = 174,
                    Route = "Hardcore",
                    TargetLevel = 175
                },
                {
                    MinLevel = 175,
                    Route = "Molten"
                }
            }
        }
    },

    AutoBuyAllTowers = {
        Win = {
            UseWinRoutePriority = true,
            GemRoute = "Hardcore"
        },

        Lose = {
            CoinRoute = "Molten",
            GemRoute = "Hardcore"
        }
    },

    AutoMaxAccount = {
        GrindRules = {
            {
                MaxLevel = 14,
                Route = "Easy.Lose",
                TargetLevel = 15
            },
            {
                MinLevel = 15,
                MaxLevel = 49,
                Route = "Molten",
                TargetLevel = 50
            },
            {
                MinLevel = 50,
                MaxLevel = 174,
                Route = "Hardcore",
                TargetLevel = 175
            },
            {
                MinLevel = 175,
                Route = "LateGrind"
            }
        }
    }
}
