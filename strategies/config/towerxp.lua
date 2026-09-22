return {
    MinimumLevel = 50,

    Strategy = "strategies/towerxp.lua",

    Matchmaking = {
        Difficulty = "Easy",
        Type = "hardcore"
    },

    Towers = {
        {Name = "Scout", GameName = "Scout", OwnershipName = "Scout"},
        {Name = "Operator", GameName = "EvolvedOperator", OwnershipName = "EvolvedOperator"},
        {Name = "Minigunner", GameName = "Minigunner", OwnershipName = "Minigunner"},
        {Name = "Juggernaut", GameName = "EvolvedJuggernaut", OwnershipName = "EvolvedJuggernaut"},
        {Name = "Crook Boss", GameName = "Crook Boss", OwnershipName = "Crook Boss"},
        {Name = "Kingpin", GameName = "EvolvedKingpin", OwnershipName = "EvolvedKingpin"},
        {Name = "Shotgunner", GameName = "Shotgunner", OwnershipName = "Shotgunner"},
        {Name = "Enforcer", GameName = "EvolvedEnforcer", OwnershipName = "EvolvedEnforcer"}
    }
}
