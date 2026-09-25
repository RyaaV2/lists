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

TDS:Loadout("Pyromancer", "Hunter", "None", "None", "None")

TDS:Mode("Hardcore")
TDS:GameInfo("Wretched Front")

TDS:VoteSkip()

TDS:Place("Pyromancer", -5.936307430267334, 0.9551397562026978, -31.831748962402344, true) --1
TDS:Ready()

TDS:SetTarget(1, "Farthest")
TDS:UpgradeTimes(1, 4)

TDS:Place("Hunter", 2.679039716720581, 1.341203212738037, 21.30302619934082, true) --2
TDS:Place("Hunter", 2.679039716720581, 1.341203212738037, 21.30302619934082, true) --3
TDS:Place("Hunter", 2.679039716720581, 1.341203212738037, 21.30302619934082, true) --4
TDS:Place("Hunter", 2.679039716720581, 1.341203212738037, 21.30302619934082, true) --5
TDS:Place("Hunter", 2.679039716720581, 1.341203212738037, 21.30302619934082, true) --6
TDS:Place("Hunter", 2.679039716720581, 1.341203212738037, 21.30302619934082, true) --7
TDS:Place("Hunter", 2.679039716720581, 1.341203212738037, 21.30302619934082, true) --8
TDS:Place("Hunter", 2.679039716720581, 1.341203212738037, 21.30302619934082, true) --9
TDS:Place("Hunter", 2.679039716720581, 1.341203212738037, 21.30302619934082, true) --10

