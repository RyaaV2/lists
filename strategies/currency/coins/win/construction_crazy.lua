local RuntimeGlobals = getgenv()
local StandardCurrencyJobId = tostring(game.JobId or "")

if RuntimeGlobals.__RyaStandardCurrencyFarmRunning == true
    and RuntimeGlobals.__RyaStandardCurrencyFarmJobId == StandardCurrencyJobId then

    return
end

RuntimeGlobals.__RyaStandardCurrencyFarmRunning = true
RuntimeGlobals.__RyaStandardCurrencyFarmJobId = StandardCurrencyJobId

task.spawn(function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local stateReplicators =
        ReplicatedStorage:WaitForChild("StateReplicators")

    local rep =
        stateReplicators:WaitForChild("GameStateReplicator")

    while rep.Parent
        and rep:GetAttribute("GameOver") ~= true do

        task.wait(0.2)
    end

    if RuntimeGlobals.__RyaStandardCurrencyFarmJobId == StandardCurrencyJobId then
        RuntimeGlobals.__RyaStandardCurrencyFarmRunning = false
    end
end)

TDS:Loadout("Assassin", "Commander", "Militant", "None", "None")

TDS:Mode("Casual")

TDS:GameInfo("Construction Crazy", {})

TDS:VoteSkip()

TDS:Place("Assassin", 2.0906622409821, 0.50500327348709, -23.925266265869, true)
TDS:Place("Assassin", 2.0906622409821, 0.50500327348709, -23.925266265869, true)

TDS:Ready()

TDS:Place("Assassin", 2.0906622409821, 0.50500327348709, -23.925266265869, true)
TDS:Place("Assassin", 2.0906622409821, 0.50500327348709, -23.925266265869, true)

TDS:Upgrade(2)
TDS:Upgrade(1)

TDS:Upgrade(4)

TDS:Upgrade(3)
TDS:Upgrade(1)
TDS:Upgrade(2)
TDS:Upgrade(3)

TDS:Upgrade(4)

TDS:Upgrade(2)
TDS:Upgrade(1)
TDS:Upgrade(3)

TDS:Upgrade(4)

TDS:Place("Commander", 2.0906622409821, 0.50500327348709, -23.925266265869, true)
TDS:UpgradeTimes(5, 2)

TDS:Upgrade(2)

TDS:Upgrade(3)
TDS:Upgrade(1)

TDS:Upgrade(4)

TDS:Place("Commander", 2.0906622409821, 0.50500327348709, -23.925266265869, true)
TDS:Upgrade(5)
TDS:Upgrade(6)

TDS:Place("Commander", 2.0906622409821, 0.50500327348709, -23.925266265869, true)
TDS:UpgradeTimes(7, 2)

TDS:Upgrade(6)

for i = 1, 33 do
    local index = 7 + i

    TDS:Place("Militant", 2.0906622409821, 0.50500327348709, -23.925266265869, true)
    TDS:UpgradeTimes(index, 4)
end
