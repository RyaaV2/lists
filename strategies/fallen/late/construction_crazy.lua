TDS:Loadout("Hacker", "Gatling Gun", "Mercenary Base", "DJ Booth", "Trapper")

TDS:Mode("Fallen")

TDS:GameInfo("Construction Crazy", {
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

TDS:Place("Trapper", 5.974642753601074, 0.505009293556213, -25.299703598022461, true)

TDS:Ready()

TDS:Place("Trapper", 5.974642753601074, 0.505009293556213, -25.299703598022461, true)
TDS:Place("Trapper", 5.974642753601074, 0.505009293556213, -25.299703598022461, true)

TDS:Place("Trapper", 8.493666648864746, 0.505009293556213, -13.058300971984863, true)
TDS:Place("Trapper", 8.493666648864746, 0.505009293556213, -13.058300971984863, true)

TDS:UpgradeTimes(5, 2)
TDS:SetOption(5, "Trap", "Landmine")
TDS:SetTarget(5, "Strongest")

TDS:UpgradeTimes(4, 2)
TDS:SetOption(4, "Trap", "Landmine")

TDS:Upgrade(1)
TDS:Upgrade(2)
TDS:Upgrade(3)

TDS:Place("Gatling Gun", -41.209049224853516, 0.255012869834900, -1.575437545776367, true)

TDS:UpgradeTimes(6, 2)

TDS:Place("Hacker", 2.350373744964600, 0.505009293556213, -25.131578445434570, true)

TDS:UpgradeTimes(7, 3)

TDS:Place("DJ Booth", -41.209049224853516, 0.255012869834900, -1.575437545776367, true)

TDS:UpgradeTimes(8, 3)
TDS:SetOption(8, "Track", "Green")

TDS:UpgradeTimes(6, 2)
TDS:UpgradeTimes(8, 2)

TDS:Place("Mercenary Base", -41.209049224853516, 0.255012869834900, -1.575437545776367, true)

TDS:UpgradeTimes(9, 6)

TDS:Upgrade(7)
TDS:Upgrade(7, 2)

TDS:UpgradeTimes(6, 2)

TDS:Place("Mercenary Base", -41.209049224853516, 0.255012869834900, -1.575437545776367, true)

TDS:UpgradeTimes(5, 2)
TDS:SetOption(5, "Trap", "Bear Traps")

TDS:UpgradeTimes(1, 3)
TDS:SetOption(1, "Trap", "Bear Traps")

TDS:UpgradeTimes(3, 3)
TDS:SetOption(3, "Trap", "Bear Traps")

TDS:UpgradeTimes(2, 3)

TDS:SetOption(8, "Track", "Red")

TDS:LoopAbility(7, "Hologram Tower", {
    towerPosition = Vector3.new(-41.209049224853516, 25.255012869834900, -1.575437545776367),
    towerToClone = 6
})
