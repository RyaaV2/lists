return {
    MinimumLevel = 50,

    RequiredTowers = {
        "Pyromancer",
        "Scout",
        "Shotgunner",
        "Crook Boss",
        "Minigunner"
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
