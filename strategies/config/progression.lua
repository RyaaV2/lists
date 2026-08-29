-- Level/progression routing only.
-- Keep map lists out of this file.

return {
    MatchTimeoutMinutes = 15,
    GameOverStuckMinutes = 5,

    AutoFarmUntilGatling = {
        TargetTower = "Gatling Gun",

        Win = {
            RoutePriority = {
                "Easy.Win",
                "Easy.Starter"
            },
            GrindRules = {
                {
                    Route = "Easy.Win",
                    RequiredTowers = {"Soldier"}
                }
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
                    TargetLevel = 50,
                    RequiredTowers = {"Soldier"}
                },
                {
                    MinLevel = 50,
                    MaxLevel = 174,
                    Route = "Hardcore",
                    TargetLevel = 175,
                    RequiredTowers = {"Pyromancer", "Hunter"}
                },
                {
                    MinLevel = 175,
                    Route = "Molten"
                }
            }
        }
    },

    AutoMaxAccount = {
        GrindRules = {
            {
                MaxLevel = 14,
                Route = "Easy.Lose",
                TargetLevel = 15,
                RequiredTowers = {"Soldier"}
            },
            {
                MinLevel = 15,
                MaxLevel = 49,
                Route = "Molten",
                TargetLevel = 50,
                RequiredTowers = {"Soldier"}
            },
            {
                MinLevel = 50,
                MaxLevel = 174,
                Route = "Hardcore",
                TargetLevel = 175,
                RequiredTowers = {"Pyromancer", "Hunter"}
            },
            {
                MinLevel = 175,
                Route = "LateGrind",
                RequiredTowers = {
                    "Gatling Gun",
                    "Hacker",
                    "Trapper",
                    "DJ Booth",
                    "Mercenary Base"
                }
            }
        }
    }
}
