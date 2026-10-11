local Event = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = ReplicatedStorage:WaitForChild("RemoteFunction")
local LOBBY_PLACE_ID = 3260590327

local Requirements = {
    ["Night 1"] = {
        Easy = {"Boomerang", "Militant"},
        Hard = {"Sniper"},
    },
}

local Running = false
local SkipGeneration = 0
local StrategyStarted = false
local MatchQueued = false
local ModuleSession = 0

local function IsGameOver()
    local rs = ReplicatedStorage:FindFirstChild("StateReplicators")
    local rep = rs and rs:FindFirstChild("GameStateReplicator")
    return rep and rep:GetAttribute("GameOver") == true or false
end

local function EquipNight1EasyLobbyLoadout()
    local stateReplicators = ReplicatedStorage:WaitForChild("StateReplicators", 10)
    if not stateReplicators then return false end

    local playerReplicator
    local deadline = os.clock() + 10
    repeat
        for _, rep in ipairs(stateReplicators:GetChildren()) do
            if rep.Name == "PlayerReplicator"
                and tonumber(rep:GetAttribute("UserId")) == Players.LocalPlayer.UserId then
                playerReplicator = rep
                break
            end
        end
        if not playerReplicator then task.wait(0.2) end
    until playerReplicator or os.clock() >= deadline
    if not playerReplicator then return false end

    local equipped = {}
    local raw = playerReplicator:GetAttribute("EquippedTowers")
    if type(raw) == "string" then
        local json = raw:match("%[.*%]")
        if json then
            pcall(function()
                equipped = game:GetService("HttpService"):JSONDecode(json)
            end)
        end
    end

    local remoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")
    for _, tower in ipairs(equipped) do
        if tower and tower ~= "" and tower ~= "None" then
            remoteEvent:FireServer("Inventory", "Unequip", "Tower", tower)
            task.wait(0.3)
        end
    end

    task.wait(0.2)
    for _, tower in ipairs({"Boomerang", "Militant"}) do
        remoteEvent:FireServer("Inventory", "Equip", "Tower", tower)
        task.wait(0.3)
    end

    return true
end

local function QueueNight1(mode)
    return pcall(function()
        return Remote:InvokeServer("Multiplayer", "v2:start", {
            difficulty = mode == "Easy" and "Act1Easy" or "Act1",
            night = 1,
            count = 1,
            mode = "halloween2026",
        })
    end)
end

local function ReturnToLobby()
    local network = ReplicatedStorage:FindFirstChild("Network")
    local teleport = network and network:FindFirstChild("Teleport")
    local back = teleport and teleport:FindFirstChild("RE:backToLobby")

    if back then
        pcall(function()
            back:FireServer()
        end)
    end

    -- The back-to-lobby remote can be absent or fail to teleport.
    task.wait(5)
    if game.PlaceId ~= LOBBY_PLACE_ID then
        pcall(function()
            game:GetService("TeleportService"):Teleport(
                LOBBY_PLACE_ID,
                Players.LocalPlayer
            )
        end)
    end
end

local function EndMatchWatch(session)
    task.spawn(function()
        while Running and ModuleSession == session do
            if IsGameOver() then
                -- Give the match-complete webhook time to record rewards.
                task.wait(3.5)
                if not Running or ModuleSession ~= session then
                    break
                end

                local globals = getgenv()
                local pending = tostring(
                    globals.__RyaAutoFarmTransitionTarget
                    or globals.PendingAutoFarmTarget
                    or ""
                )

                if pending ~= "" and pending ~= "Event" then
                    if globals.__RyaApplyAutoFarmTransition then
                        globals.__RyaApplyAutoFarmTransition()
                    end
                    Running = false
                    SkipGeneration += 1
                    ReturnToLobby()
                    break
                end

                -- Matchmaking is attempted immediately after game over.
                -- If the server does not accept it, lobby startup retries.
                if globals.AutoEventEnabled == true
                    and tostring(globals.EventNight or "Night 1") == "Night 1"
                    then
                    local ok, result = QueueNight1(tostring(globals.EventMode or "Easy"))
                    if ok and result ~= false then
                        MatchQueued = true
                        -- An InvokeServer call may return without actually
                        -- starting matchmaking. Verify the match transitions.
                        local originalJob = game.JobId
                        local deadline = os.clock() + 8
                        repeat
                            task.wait(0.5)
                            if not IsGameOver()
                                or game.JobId ~= originalJob
                                or game.PlaceId == LOBBY_PLACE_ID then
                                Running = false
                                SkipGeneration += 1
                                return
                            end
                        until os.clock() >= deadline
                        MatchQueued = false
                    end
                end

                Running = false
                SkipGeneration += 1
                ReturnToLobby()
                break
            end
            task.wait(0.25)
        end
    end)
end

function Event.GetRequirements(night, mode)
    local config = Requirements[night]
    if not config then
        return "Coming soon"
    end
    local towers = config[mode]
    if not towers or #towers == 0 then
        return "Not configured yet"
    end
    return towers
end

function Event.GetRequiredLevel(night, mode)
    if night == "Night 1" and (mode == "Easy" or mode == "Hard") then
        return 0
    end
    return nil
end

local function StartSkipWatcher()
    SkipGeneration += 1
    local generation = SkipGeneration
    task.spawn(function()
        local gui = Players.LocalPlayer:WaitForChild("PlayerGui")
        local lastVote = 0
        while Running and SkipGeneration == generation do
            local voteGui = gui:FindFirstChild("ReactOverridesVote")
            local frame = voteGui and voteGui:FindFirstChild("Frame")
            local votes = frame and frame:FindFirstChild("votes")
            local button = votes and votes:FindFirstChild("button")
            local label = button and button:FindFirstChild("text")
            local visible = voteGui and voteGui.Enabled
                and frame and frame.Visible
                and votes and votes.Visible
                and button and button.Visible
            local isSkip = label and label:IsA("TextLabel")
                and label.Text:lower():find("hold to skip", 1, true)
            if visible and isSkip and os.clock() - lastVote >= 3 then
                lastVote = os.clock()
                task.spawn(function()
                    pcall(function()
                        Remote:InvokeServer("Voting", "Skip")
                    end)
                end)
            end
            task.wait(0.1)
        end
    end)
end

local function RunNight1Easy(TDS)
    TDS:Loadout("Boomerang", "Militant", "None", "None", "None")

    local playerManager = ReplicatedStorage:WaitForChild("Network"):WaitForChild("PlayerManager")
    playerManager["RE:SelectLoadout"]:FireServer()
    task.wait(0.2)
    playerManager["RE:UserLoadout"]:FireServer()

    TDS:VoteSkip()

    TDS:Place("Boomerang", -8.0976810455322266, 2.0595896244049072, 206.319091796875, true)
    TDS:Upgrade(1)
    TDS:Upgrade(1)
    TDS:Ready()

    TDS:Place("Boomerang", -8.0976810455322266, 2.0595896244049072, 206.319091796875, true)
    TDS:Upgrade(2)
    TDS:Upgrade(2)

    TDS:Place("Militant", -8.0976810455322266, 2.0595896244049072, 206.319091796875, true)
    TDS:Upgrade(3)
    TDS:Upgrade(3)

    TDS:Place("Militant", -8.0976810455322266, 2.0595896244049072, 206.319091796875, true)
    TDS:Upgrade(4)
    TDS:Upgrade(4)
    TDS:Upgrade(1)

    TDS:Place("Militant", -8.0976810455322266, 2.0595896244049072, 206.319091796875, true)
    TDS:Upgrade(5)

    TDS:Upgrade(2)
    TDS:Upgrade(5)
    TDS:Upgrade(3)
    TDS:Upgrade(4)
    TDS:Upgrade(5)
    TDS:Upgrade(3)
    TDS:Upgrade(1)

    TDS:Place("Militant", -8.0976810455322266, 2.0595896244049072, 206.319091796875, true)
    TDS:Upgrade(6)
    TDS:Upgrade(6)
    TDS:Upgrade(6)
    TDS:Upgrade(6)
    TDS:Upgrade(5)
    TDS:Upgrade(4)

    TDS:Place("Militant", -8.0976810455322266, 2.0595896244049072, 206.319091796875, true)
    TDS:Upgrade(7)
    TDS:Upgrade(7)
    TDS:Upgrade(7)

    TDS:Place("Boomerang", -8.0976810455322266, 2.0595896244049072, 206.319091796875, true)
    TDS:Upgrade(8)
    TDS:Upgrade(8)
    TDS:Upgrade(8)
    TDS:Upgrade(2)

    TDS:Place("Boomerang", -8.0976810455322266, 2.0595896244049072, 206.319091796875, true)
    TDS:Upgrade(9)
    TDS:Upgrade(9)
    TDS:Upgrade(9)
    TDS:Upgrade(9)

    TDS:Place("Boomerang", -8.0976810455322266, 2.0595896244049072, 206.319091796875, true)
    TDS:Upgrade(10)
    TDS:Upgrade(10)
    TDS:Upgrade(10)
    TDS:Upgrade(10)
end

local function RunNight1Hard(TDS)
    TDS:Loadout("Sniper", "None", "None", "None", "None")
    TDS:Place("Sniper", 9.266754150390625, 6.802427291870117, 203.55477905273438)
    TDS:Place("Sniper", 10.11859130859375, 6.741560459136963, 205.9476776123047)
    TDS:Upgrade(2)
    TDS:Upgrade(1)
    TDS:Ready()
    TDS:Place("Sniper", 7.6457014083862305, 8.861952781677246, 209.50477600097656)
    TDS:Upgrade(3)
    local function PlaceSniper()
        TDS:Place("Sniper", -7.591506004333496, 8.861952781677246, 197.08810424804688, true)
    end
    for i = 4, 14 do
        PlaceSniper()
        TDS:Upgrade(i)
    end
    for i = 4, 14 do
        for j = 1, 2 do
            TDS:Upgrade(i)
        end
    end
    for i = 1, 3 do
        for j = 1, 2 do
            TDS:Upgrade(i)
        end
    end
    for i = 15, 20 do
        PlaceSniper()
        for j = 1, 3 do
            TDS:Upgrade(i)
        end
    end
    for i = 4, 20 do
        TDS:Upgrade(i)
    end
    for i = 1, 3 do
        TDS:Upgrade(i)
    end
end

function Event.Start(night, mode, TDS)
    if night ~= "Night 1" or (mode ~= "Hard" and mode ~= "Easy") then
        return false
    end
    if Running or MatchQueued then
        return false
    end

    if game.PlaceId == LOBBY_PLACE_ID then
        if mode == "Easy" then
            local ok, result = pcall(EquipNight1EasyLobbyLoadout)
            if not ok or result ~= true then
                warn("[Auto Event] Failed to prepare Easy lobby loadout")
                return false
            end
        end

        local ok, result = QueueNight1(mode)
        if ok and result ~= false then
            MatchQueued = true
            return true
        end
        return false
    end

    -- Use the API instance installed by the main Auto Progress backend.
    -- apis/tds.lua returns a context installer, not a standalone TDS table.
    TDS = TDS or shared.TDSTable or shared["TDS_Table"]
    if type(TDS) ~= "table" or StrategyStarted then
        return false
    end

    Running = true
    StrategyStarted = true
    ModuleSession += 1
    StartSkipWatcher()
    EndMatchWatch(ModuleSession)
    task.spawn(function()
        local ok, err = pcall(mode == "Easy" and RunNight1Easy or RunNight1Hard, TDS)
        if not ok then
            warn("[Auto Event] Night 1 " .. mode .. " strategy error:", err)
        end
    end)
    return true
end

function Event.Stop()
    Running = false
    SkipGeneration += 1
    ModuleSession += 1
    MatchQueued = false
    return true
end

return Event
