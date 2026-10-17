local Night = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = ReplicatedStorage:WaitForChild("RemoteFunction")

Night.Requirements = {
    Hard = {"Freezer", "Crook Boss", "DJ Booth", "Commander", "Trapper"}
}

function Night.PrepareLobby(mode)
    return mode == "Hard"
end

function Night.Queue(mode)
    if mode ~= "Hard" then return false end
    local ok, result = pcall(function()
        return Remote:InvokeServer("Multiplayer", "v2:start", {
            difficulty = "Act2",
            night = 2,
            count = 1,
            mode = "halloween2026"
        })
    end)
    return ok and result ~= false
end

function Night.Run(mode, TDS)
    if mode ~= "Hard" then return false end
    TDS:Loadout("Freezer", "Crook Boss", "DJ Booth", "Commander", "Trapper")
    TDS:Place("Trapper", 10.050795555114746, 47.70799255371094, 1.0367521047592163)
    TDS:Place("Trapper", 9.647570610046387, 47.68596649169922, -2.012082576751709)
    TDS:Upgrade(2)
    TDS:Ready()

    TDS:WaitForWave(2)
    TDS:Upgrade(1)

    TDS:WaitForWave(3)
    TDS:Upgrade(2)

    TDS:WaitForWave(5)
    TDS:Upgrade(1)
    TDS:Place("DJ Booth", 7.05073356628418, 47.83967590332031, -5.06990909576416)

    TDS:WaitForWave(6)
    TDS:SetOption(3, "Track", "Green")

    TDS:WaitForWave(7)
    TDS:Place("Crook Boss", 2.878124713897705, 47.65865707397461, -10.927541732788086)
    TDS:Upgrade(4)

    TDS:WaitForWave(8)
    TDS:Place("Commander", 3.1028892993927, 47.862220764160156, -5.8558454513549805)
    TDS:Place("Freezer", 0.2942955493927002, 47.73551940917969, -4.692487716674805)

    TDS:WaitForWave(9)
    TDS:Place("Crook Boss", 5.918124675750732, 47.69390869140625, -10.927541732788086)
    TDS:Upgrade(7)
    TDS:Upgrade(5)
    TDS:Upgrade(6)
    TDS:Upgrade(6)
    TDS:Upgrade(6)

    TDS:WaitForWave(10)
    TDS:Place("Trapper", 8.817151069641113, 47.69758224487305, 3.8590240478515625)
    TDS:Upgrade(8)
    TDS:Upgrade(8)
    TDS:SetOption(8, "Trap", "Landmine")

    TDS:WaitForWave(11)
    TDS:Place("Trapper", 6.399267196655273, 47.73211669921875, 5.6743669509887695)
    TDS:Upgrade(9)
    TDS:Upgrade(9)
    TDS:SetOption(9, "Trap", "Landmine")
    TDS:Place("Trapper", 3.241562843322754, 47.665672302246094, 6.187073230743408)
    TDS:Upgrade(10)
    TDS:Upgrade(10)
    TDS:SetOption(10, "Trap", "Landmine")

    TDS:WaitForWave(12)
    TDS:Upgrade(4)
    TDS:Upgrade(7)

    TDS:WaitForWave(13)
    TDS:Place("Crook Boss", 0.06953096389770508, 47.62562561035156, -12.090899467468262)
    TDS:Upgrade(11)
    TDS:Upgrade(11)

    TDS:WaitForWave(14)
    TDS:Place("Crook Boss", 8.765157699584961, 47.692771911621094, -9.942680358886719)
    TDS:Upgrade(12)
    TDS:Upgrade(12)

    TDS:WaitForWave(15)
    TDS:Place("Crook Boss", 2.56889271736145, 47.85989761352539, -13.951774597167969)
    TDS:Upgrade(13)
    TDS:Upgrade(13)
    TDS:Upgrade(5)
    TDS:Upgrade(3)
    TDS:Upgrade(3)
    TDS:Upgrade(3)
    TDS:SetOption(3, "Track", "Purple")

    TDS:WaitForWave(16)
    TDS:Place("Trapper", 0.43323469161987305, 47.626766204833984, 5.0234456062316895)
    TDS:Upgrade(14)
    TDS:Upgrade(14)
    TDS:SetOption(14, "Trap", "Landmine")
    TDS:Place("Trapper", -1.5239448547363281, 47.68352508544922, 2.575798511505127)
    TDS:Upgrade(15)
    TDS:Upgrade(15)
    TDS:SetOption(15, "Trap", "Landmine")
    TDS:SetOption(3, "Track", "Green")
    TDS:Upgrade(2)

    TDS:WaitForWave(17)
    TDS:Upgrade(2)
    TDS:Place("Commander", -3.536414623260498, 47.610565185546875, -7.936890602111816)
    TDS:Upgrade(16)
    TDS:Upgrade(16)
    TDS:Place("Commander", 11.438133239746094, 47.64118957519531, -8.053886413574219)
    TDS:Upgrade(17)
    TDS:Upgrade(17)

    TDS:WaitForWave(18)
    TDS:Upgrade(6)
    TDS:Upgrade(4)

    TDS:WaitForWave(19)
    TDS:Upgrade(7)
    TDS:Upgrade(12)

    TDS:WaitForWave(20)
    TDS:SetOption(3, "Track", "Purple")
    TDS:Upgrade(3)
    TDS:Upgrade(3)
    TDS:SetOption(3, "Track", "Red")
    TDS:SetOption(2, "Trap", "Bear Traps")
    TDS:Upgrade(1)
    TDS:Upgrade(1)
    TDS:SetOption(1, "Trap", "Bear Traps")
    TDS:Upgrade(8)
    TDS:Upgrade(8)
    TDS:SetOption(8, "Trap", "Bear Traps")
    TDS:Upgrade(9)
    TDS:Upgrade(9)
    TDS:SetOption(9, "Trap", "Bear Traps")
    TDS:Upgrade(10)
    TDS:Upgrade(10)
    TDS:SetOption(10, "Trap", "Bear Traps")
    TDS:Upgrade(14)
    TDS:Upgrade(14)
    TDS:SetOption(14, "Trap", "Bear Traps")
    TDS:Upgrade(15)
    TDS:Upgrade(15)
    TDS:SetOption(15, "Trap", "Bear Traps")
    TDS:Upgrade(11)
    TDS:Upgrade(13)
    TDS:Upgrade(11)
    TDS:Upgrade(4)
    TDS:Upgrade(7)
    TDS:Upgrade(13)
    TDS:Upgrade(12)
    TDS:Upgrade(17)
    TDS:Upgrade(17)
    TDS:Upgrade(16)
    TDS:Upgrade(16)
    TDS:Upgrade(5)
    TDS:Upgrade(5)

    return true
end

return Night
