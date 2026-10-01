return function(TDS, selectedTower)
    selectedTower = tostring(selectedTower or "")

    if selectedTower == "" or selectedTower == "None" then
        return false
    end

    if selectedTower == "All Normal Tower" then
        TDS:Loadout("Pyromancer", "Scout", "Shotgunner", "Crook Boss", "Minigunner")

        TDS:Mode("Hardcore")
        TDS:GameInfo("Wretched Front")

        TDS:VoteSkip()

        TDS:Place("Pyromancer", -5.936307430267334, 0.9551397562026978, -31.831748962402344, true)
        TDS:Ready()
        TDS:UpgradeTimes(1, 3)

        TDS:Place("Crook Boss", -1.002932071685791, 0.66132575273513794, -22.218265533447266, true)
        TDS:UpgradeTimes(2, 2)

        TDS:Place("Crook Boss", -1.002932071685791, 0.66132575273513794, -22.218265533447266, true)
        TDS:UpgradeTimes(3, 2)

        TDS:Place("Crook Boss", -1.002932071685791, 0.66132575273513794, -22.218265533447266, true)
        TDS:UpgradeTimes(4, 2)

        TDS:Place("Scout", -1.002932071685791, 0.66132575273513794, -22.218265533447266, true)

        TDS:Place("Shotgunner", -1.002932071685791, 0.66132575273513794, -22.218265533447266, true)

        TDS:Place("Minigunner", -1.002932071685791, 0.66132575273513794, -22.218265533447266, true)

        return true
    end

    local EvolvedLoadoutNames = {
        Operator = "EvolvedOperator",
        Juggernaut = "EvolvedJuggernaut",
        Kingpin = "EvolvedKingpin",
        Enforcer = "EvolvedEnforcer"
    }

    local loadoutTower =
        EvolvedLoadoutNames[selectedTower]
        or selectedTower

    TDS:Loadout("Pyromancer", "Hunter", loadoutTower, "None", "None")
    TDS:Mode("Hardcore")
    TDS:GameInfo("Wretched Front")
    TDS:VoteSkip(1,23)
    TDS:Place("Pyromancer", -5.936307430267334, 0.9551397562026978, -31.831748962402344, true)
    TDS:Ready()
    TDS:UpgradeTimes(1, 4)
    for _ = 1, 4 do TDS:Place("Hunter", 2.679039716720581, 1.341203212738037, 21.30302619934082, true) end
    TDS:WaitForWave(20)
    TDS:Sell(1)
    TDS:Place(loadoutTower, 2.679039716720581, 1.341203212738037, 21.30302619934082, true)

    return true
end
