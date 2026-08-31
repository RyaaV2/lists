TDS:Loadout("Hacker", "Gatling Gun", "Mercenary Base", "Trapper")

TDS:Mode("Fallen")

TDS:GameInfo("Lay By", {
    "HiddenEnemies",
    "Glass",
    "ExplodingEnemies",
    "Limitation",
    "Committed",
    "Quarantine",
    "Fog"
})

TDS:VoteSkip()

TDS:Mercenary(140, 1)

TDS:Place("Trapper", -3.336249351501465, 242.999984741210938, 267.680694580078125, true)

TDS:Ready()

TDS:Place("Trapper", -3.336249351501465, 242.999984741210938, 267.680694580078125, true)
TDS:Place("Trapper", -3.336249351501465, 242.999984741210938, 267.680694580078125, true)

TDS:Place("Trapper", -2.942691802978516, 242.999969482421875, 234.732269287109375, true)
TDS:Place("Trapper", -2.942691802978516, 242.999969482421875, 234.732269287109375, true)

TDS:UpgradeTimes(5, 2)
TDS:SetOption(5, "Trap", "Landmine")
TDS:SetTarget(5, "Strongest")

TDS:UpgradeTimes(1, 2)
TDS:SetOption(1, "Trap", "Landmine")

TDS:Upgrade(4)
TDS:Upgrade(2)
TDS:Upgrade(3)

TDS:Place("Gatling Gun", 4.991236209869385, 243.000000000000000, 156.658065795898438, true)

TDS:UpgradeTimes(6, 2)

TDS:Place("Hacker", -3.519666671752930, 242.999984741210938, 278.660736083984375, true)

TDS:UpgradeTimes(7, 3)

TDS:UpgradeTimes(6, 2)

TDS:Place("Mercenary Base", 4.991236209869385, 243.000000000000000, 156.658065795898438, true)

TDS:UpgradeTimes(8, 6)

TDS:Upgrade(7)
TDS:Upgrade(7, 2)

TDS:UpgradeTimes(6, 2)

TDS:Place("Mercenary Base", 4.991236209869385, 243.000000000000000, 156.658065795898438, true)
TDS:UpgradeTimes(9, 6)

TDS:UpgradeTimes(5, 2)
TDS:SetOption(5, "Trap", "Bear Traps")

TDS:UpgradeTimes(4, 3)
TDS:SetOption(4, "Trap", "Bear Traps")

TDS:UpgradeTimes(3, 3)
TDS:SetOption(3, "Trap", "Bear Traps")

TDS:UpgradeTimes(2, 3)
TDS:SetOption(2, "Trap", "Bear Traps")

TDS:Place("Mercenary Base", 4.991236209869385, 243.000000000000000, 156.658065795898438, true)
TDS:UpgradeTimes(10, 6)

TDS:LoopAbility(7, "Hologram Tower", {
    towerPosition = Vector3.new(4.991236209869385, 243.000000000000000, 156.658065795898438),
    towerToClone = 6
})
