return {
    MinimumLevel = 50,

    RequiredTowers = {
        ["All Normal Tower"] = {
            "Pyromancer",
            "Shotgunner",
            "Minigunner"
        },

        ["Evolved Towers"] = {
            "Pyromancer"
        }
    },

    Strategy = "strategies/towerxp.lua",

    Matchmaking = {
        Difficulty = "Easy",
        Type = "hardcore"
    },

    Towers = {
        {Name = "All Normal Tower", GameName = "All Normal Tower"},
        {Name = "Operator", GameName = "Operator"},
        {Name = "Juggernaut", GameName = "Juggernaut"},
        {Name = "Kingpin", GameName = "Kingpin"},
        {Name = "Enforcer", GameName = "Enforcer"}
    }
}
