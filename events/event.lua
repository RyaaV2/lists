local Event = {}
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remote = ReplicatedStorage:WaitForChild("RemoteFunction")
local LOBBY_PLACE_ID = 3260590327

local Requirements = {
    ["Night 1"] = {
        Easy = {"Boomerang", "Militant"},
        Hard = {"Boomerang", "Militant", "Commander"},
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
    if night == "Night 1" and mode == "Easy" then
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
    TDS:Loadout("Boomerang", "Militant", "Commander", "Turret", "None")

    TDS:Place("Boomerang", -8.55457878112793, 2.0652565956115723, 207.20245361328125, true)
    TDS:Place("Boomerang", -8.55457878112793, 2.0652565956115723, 207.20245361328125, true)
    TDS:Ready()

    -- Wave 1
    TDS:VoteSkip(1)
    TDS:Upgrade(1)

    -- Wave 2
    TDS:VoteSkip(2)

    -- Wave 3
    TDS:Upgrade(2)
    TDS:VoteSkip(3)

    -- Wave 4
    TDS:VoteSkip(4)

    -- Wave 5
    TDS:Place("Militant", -7.364101409912109, 2.059061050415039, 207.34213256835938, true)
    TDS:Place("Militant", -8.865612030029297, 2.050936222076416, 208.03802490234375, true)
    TDS:Place("Militant", -10.657787322998047, 2.0503177642822266, 207.81719970703125, true)
    TDS:Upgrade(5)
    TDS:Upgrade(4)
    TDS:Upgrade(3)
    TDS:Place("Militant", -10.332830429077148, 2.0369067192077637, 207.84109497070312, true)
    TDS:Upgrade(6)
    TDS:Upgrade(6)

    -- Wave 6
    TDS:Upgrade(5)
    TDS:Upgrade(4)
    TDS:Place("Commander", -8.37071418762207, 2.0034849643707275, 201.2025146484375)

    -- Wave 7
    TDS:Upgrade(2)
    TDS:Upgrade(7)
    TDS:Upgrade(3)

    -- Wave 8
    TDS:Upgrade(2)
    TDS:VoteSkip(8)

    -- Wave 9
    TDS:Upgrade(1)
    TDS:Upgrade(1)
    TDS:Upgrade(3)
    TDS:Upgrade(6)

    -- Wave 10
    TDS:Upgrade(4)

    -- Wave 11
    TDS:Place("Turret", -8.82754898071289, 2.0518181324005127, 205.82386779785156, true)

    -- Wave 12
    TDS:Upgrade(8)

    -- Wave 13
    TDS:Upgrade(8)
    TDS:Upgrade(7)

    -- Wave 14
    TDS:Place("Commander", -11.818249702453613, 2.001413345336914, 201.78997802734375, true)
    TDS:Place("Commander", -12.282033920288086, 2.0866596698760986, 202.96209716796875, true)
    TDS:Upgrade(9)
    TDS:Upgrade(10)
    TDS:Upgrade(10)
    TDS:Upgrade(9)
    TDS:Place("Turret", -10.076197624206543, 2.091841459274292, 205.66558837890625, true)

    -- Wave 15
    TDS:Upgrade(11)
    TDS:Upgrade(11)
    TDS:Upgrade(9)
    TDS:Place("Turret", -7.479306221008301, 2.038647413253784, 204.6977081298828, true)
    TDS:Upgrade(12)
    TDS:Upgrade(12)
    TDS:Upgrade(8)
    TDS:Upgrade(11)
    TDS:Upgrade(12)
    TDS:VoteSkip(15)
end

function Event.Start(night, mode, TDS)
    if night ~= "Night 1" or (mode ~= "Hard" and mode ~= "Easy") then
        return false
    end
    if Running or MatchQueued then
        return false
    end

    if game.PlaceId == LOBBY_PLACE_ID then
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
