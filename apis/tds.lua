-- Auto Progress TDS Strategy API
-- Upload this file to:
--   RyaaV2/lists/apis/tds.lua
--
-- Only the TDS: strategy methods live here.
-- Main-script helpers/state are passed in through Context.

return function(Context)
    if type(Context) ~= "table" then
        warn("[TDS API] Missing context")
        return nil
    end

    local TDS = Context.TDS

    if type(TDS) ~= "table" then
        warn("[TDS API] Missing TDS table")
        return nil
    end

    local plr = Context.plr
    local rf = Context.rf
    local ReplicatedStorage = Context.ReplicatedStorage
    local StrategyConfig = Context.StrategyConfig

    local ProtectedNoop = Context.ProtectedNoop
    local IsStrategyRuntimeEnabled = Context.IsStrategyRuntimeEnabled
    local GetDirectGameStateReplicator = Context.GetDirectGameStateReplicator
    local DirectResponseOK = Context.DirectResponseOK
    local DirectSetLoadout = Context.DirectSetLoadout
    local DirectSelectMap = Context.DirectSelectMap
    local StartDirectSelectiveSkip = Context.StartDirectSelectiveSkip
    local StartDirectAutoSkip = Context.StartDirectAutoSkip
    local DirectReady = Context.DirectReady
    local DirectUpgradeTower = Context.DirectUpgradeTower
    local DirectSellTower = Context.DirectSellTower
    local DirectWaitForWave = Context.DirectWaitForWave
    local DirectSetTarget = Context.DirectSetTarget

    local MarketplaceService = game:GetService("MarketplaceService")
    local VIP_GAMEPASS_ID = 10518590

    local RuntimeGlobals = getgenv()
    RuntimeGlobals.__RyaVIPVoteSkipVersion =
        (tonumber(RuntimeGlobals.__RyaVIPVoteSkipVersion) or 0) + 1

    local VIPVoteSkipVersion =
        RuntimeGlobals.__RyaVIPVoteSkipVersion

    local HasVIP = Context.HasVIP

    if HasVIP == nil then
        HasVIP = false

        pcall(function()
            HasVIP = MarketplaceService:UserOwnsGamePassAsync(
                plr.UserId,
                VIP_GAMEPASS_ID
            ) == true
        end)
    end

    TDS.HasVIP = HasVIP

    local VoteSkipWaves = {}
    local VoteSkipAll = false
    local VoteSkipConfigured = false
    local VIPVoteSkipWorkerRunning = false
    local NormalVoteSkipWorkerRunning = false

    function TDS:ResetIndex()
        self.PlacedTowers = {}
        self.placed_towers = self.PlacedTowers
        self.StackCounts = {}

        table.clear(VoteSkipWaves)
        VoteSkipAll = false
        VoteSkipConfigured = false
    end

    function TDS:Place(towerName, x, y, z, ...)
        local args = {...}
        local isStacking =
            args[#args] == true
            or args[#args] == "stack"

        local position = Vector3.new(x, y, z)

        if isStacking then
            local baseY = tonumber(y) or 0

            
            
            if math.abs(baseY) < 0.001 then
                local rayParams = RaycastParams.new()
                rayParams.FilterType = Enum.RaycastFilterType.Exclude

                local ignore = {}
                local towersFolder = workspace:FindFirstChild("Towers")

                if towersFolder then
                    table.insert(ignore, towersFolder)
                end

                if plr.Character then
                    table.insert(ignore, plr.Character)
                end

                rayParams.FilterDescendantsInstances = ignore

                local hit = workspace:Raycast(
                    Vector3.new(x, 250, z),
                    Vector3.new(0, -1000, 0),
                    rayParams
                )

                if not hit then
                    ProtectedNoop("[STACKER] No surface found:", towerName, x, y, z)
                    return false
                end

                baseY = hit.Position.Y
            end

            local stackKey = string.format("%.5f|%.5f", tonumber(x) or 0, tonumber(z) or 0)
            local stackNumber = (self.StackCounts[stackKey] or 0) + 1
            self.StackCounts[stackKey] = stackNumber

            position = Vector3.new(
                x,
                baseY + 25,
                z
            )
        end

        local towersFolder = workspace:WaitForChild("Towers")

        local existing = {}

        for _, tower in ipairs(towersFolder:GetChildren()) do
            local owner = tower:FindFirstChild("Owner")

            if owner and owner.Value == plr.UserId then
                existing[tower] = true
            end
        end

        
        while IsStrategyRuntimeEnabled() do
            local gameStateReplicator = GetDirectGameStateReplicator()

            if gameStateReplicator
                and gameStateReplicator:GetAttribute("GameOver") == true then
                return false
            end

            local ok, result = pcall(function()
                if isStacking then
                    return rf:InvokeServer(
                        "Troops",
                        "Place",
                        {
                            Rotation = CFrame.new(),
                            Position = position
                        },
                        towerName
                    )
                end

                return rf:InvokeServer(
                    "Troops",
                    "Place",
                    {
                        Rotation = CFrame.new(),
                        Position = position
                    },
                    towerName,
                    unpack(args)
                )
            end)

            if ok and DirectResponseOK(result) then
                break
            end

            task.wait(0.25)
        end

        if not IsStrategyRuntimeEnabled() then
            return false
        end

        local newTower

        repeat
            local gameStateReplicator = GetDirectGameStateReplicator()

            if gameStateReplicator
                and gameStateReplicator:GetAttribute("GameOver") == true then
                return false
            end

            for _, tower in ipairs(towersFolder:GetChildren()) do
                if not existing[tower] then
                    local owner = tower:FindFirstChild("Owner")

                    if owner and owner.Value == plr.UserId then
                        newTower = tower
                        break
                    end
                end
            end

            if not newTower then
                task.wait(0.05)
            end
        until newTower

        table.insert(TDS.PlacedTowers, newTower)
        return #TDS.PlacedTowers
    end

    function TDS:Loadout(...)
        return DirectSetLoadout(...)
    end

    function TDS:Mode(_mode)
        return true
    end

    function TDS:GameInfo(mapName, modifiers)
        if type(modifiers) == "table"
            and #modifiers > 0 then

            local votes = {}

            for _, modifierName in ipairs(
                modifiers
            ) do
                votes[tostring(modifierName)] =
                    true
            end

            pcall(function()
                ReplicatedStorage
                    :WaitForChild("Network")
                    :WaitForChild("Modifiers")
                    :WaitForChild(
                        "RF:BulkVoteModifiers"
                    )
                    :InvokeServer(votes)
            end)
        end

        return DirectSelectMap(
            tostring(mapName)
        )
    end

    local function GetAutoSkipButton()
        local playerGui = plr:FindFirstChild("PlayerGui")
        local settings = playerGui and playerGui:FindFirstChild("ReactUniversalSettings")
        local window = settings and settings:FindFirstChild("window")
        local scrollingFrame = window and window:FindFirstChild("scrollingFrame")
        local unknown = scrollingFrame and scrollingFrame:FindFirstChild("Unknown")
        local autoSkip = unknown and unknown:FindFirstChild("Auto Skip")
        local button = autoSkip and autoSkip:FindFirstChild("button")
        local toggle = button and button:FindFirstChild("toggle")

        return toggle and toggle:FindFirstChild("imageButton")
    end

    local function GetAutoSkipState()
        local button = GetAutoSkipButton()

        if not button then
            return nil
        end

        local contentText = button:FindFirstChild("contentText")

        if not contentText then
            return nil
        end

        local text = tostring(contentText.Text):lower()

        if text == "enabled" then
            return true
        end

        if text == "disabled" then
            return false
        end

        return nil
    end

    local AutoSkipPendingState = nil
    local AutoSkipLastClickAt = 0

    local function ToggleAutoSkip()
        local button = GetAutoSkipButton()

        if not button
            or type(firesignal) ~= "function" then

            return false
        end

        local ok = pcall(function()
            firesignal(button.MouseButton1Down)
            task.wait(0.05)
            firesignal(button.MouseButton1Up)
        end)

        return ok
    end

    local function SetAutoSkip(enabled)
        enabled = enabled == true

        local current = GetAutoSkipState()

        if current == nil then
            return false
        end

        if current == enabled then
            AutoSkipPendingState = nil
            return true
        end

        if AutoSkipPendingState == enabled
            and os.clock() - AutoSkipLastClickAt < 0.5 then

            return false
        end

        AutoSkipPendingState = enabled
        AutoSkipLastClickAt = os.clock()

        if not ToggleAutoSkip() then
            AutoSkipPendingState = nil
            return false
        end

        task.wait(0.15)

        current = GetAutoSkipState()

        if current == enabled then
            AutoSkipPendingState = nil
            return true
        end

        return false
    end

    local function GetCurrentWaveNoWait()
        local playerGui = plr:FindFirstChild("PlayerGui")
        local gui = playerGui and playerGui:FindFirstChild("ReactGameTopGameDisplay")
        local frame = gui and gui:FindFirstChild("Frame")
        local wave = frame and frame:FindFirstChild("wave")
        local container = wave and wave:FindFirstChild("container")
        local value = container and container:FindFirstChild("value")

        if not value then
            return nil
        end

        return tonumber(tostring(value.Text):match("(%d+)"))
    end

    local function GetNormalVoteButton()
        local playerGui = plr:FindFirstChild("PlayerGui")
        local voteGui = playerGui and playerGui:FindFirstChild("ReactOverridesVote")
        local frameObject = voteGui and voteGui:FindFirstChild("Frame")
        local votes = frameObject and frameObject:FindFirstChild("votes")

        return votes and votes:FindFirstChild("vote")
    end

    local function UpdateVIPAutoSkip()
        if not VoteSkipConfigured then
            return
        end

        if VoteSkipAll then
            SetAutoSkip(true)
            return
        end

        local currentWave = GetCurrentWaveNoWait()

        if not currentWave or currentWave <= 0 then
            SetAutoSkip(VoteSkipWaves[1] == true)
            return
        end

        SetAutoSkip(VoteSkipWaves[currentWave] == true)
    end

    local function StartVIPVoteSkip()
        if VIPVoteSkipWorkerRunning then
            return
        end

        VIPVoteSkipWorkerRunning = true

        task.spawn(function()
            while IsStrategyRuntimeEnabled()
                and RuntimeGlobals.__RyaVIPVoteSkipVersion
                    == VIPVoteSkipVersion do

                UpdateVIPAutoSkip()
                task.wait(0.1)
            end

            VIPVoteSkipWorkerRunning = false
        end)
    end

    local function StartNormalVoteSkip()
        if NormalVoteSkipWorkerRunning then
            return
        end

        NormalVoteSkipWorkerRunning = true

        task.spawn(function()
            while IsStrategyRuntimeEnabled() do
                local gameStateReplicator = GetDirectGameStateReplicator()

                if not gameStateReplicator
                    or gameStateReplicator:GetAttribute("GameOver") == true then

                    task.wait(0.2)
                    continue
                end

                local currentWave = GetCurrentWaveNoWait()

                if currentWave and VoteSkipWaves[currentWave] then
                    local voteButton = GetNormalVoteButton()

                    if voteButton
                        and voteButton.Position == UDim2.new(0.5, 0, 0.5, 0) then

                        pcall(function()
                            rf:InvokeServer("Voting", "Skip")
                        end)

                        task.wait(0.2)
                    else
                        task.wait(0.1)
                    end
                else
                    task.wait(0.1)
                end
            end

            NormalVoteSkipWorkerRunning = false
        end)
    end

    function TDS:VoteSkip(startWave, endWave)
        VoteSkipConfigured = true

        if startWave == nil and endWave == nil then
            VoteSkipAll = true

            if HasVIP then
                UpdateVIPAutoSkip()
                StartVIPVoteSkip()
            else
                StartDirectAutoSkip()
            end

            return true
        end

        startWave = tonumber(startWave)

        if not startWave then
            return false
        end

        if endWave == nil then
            endWave = startWave
        else
            endWave = tonumber(endWave)

            if not endWave then
                return false
            end
        end

        startWave = math.floor(startWave)
        endWave = math.floor(endWave)

        if endWave < startWave then
            startWave, endWave = endWave, startWave
        end

        for wave = startWave, endWave do
            VoteSkipWaves[wave] = true
        end

        if HasVIP then
            UpdateVIPAutoSkip()
            StartVIPVoteSkip()
        else
            StartNormalVoteSkip()
        end

        return true
    end

    function TDS:Ready()
        return DirectReady()
    end

    function TDS:Upgrade(index, path)
        return DirectUpgradeTower(
            tonumber(index),
            tonumber(path) or 1
        )
    end

    function TDS:UpgradeTimes(index, count, path)
        count =
            math.max(
                tonumber(count) or 0,
                0
            )

        for _ = 1, count do
            if not TDS:Upgrade(
                index,
                path
            ) then
                return false
            end
        end

        return true
    end

    function TDS:Sell(index)
        return DirectSellTower(
            tonumber(index)
        )
    end

    function TDS:WaitForWave(wave)
        return DirectWaitForWave(
            tonumber(wave) or 0
        )
    end

    function TDS:SetTarget(index, targetType)
        return DirectSetTarget(
            tonumber(index),
            targetType
        )
    end

    function TDS:SetOption(index, name, value)
        local tower =
            TDS.PlacedTowers[
                tonumber(index)
            ]

        if not tower
            or not tower.Parent then

            return false
        end

        while IsStrategyRuntimeEnabled() do
            local ok, result =
                pcall(function()
                    return rf:InvokeServer(
                        "Troops",
                        "Option",
                        "Set",
                        {
                            Troop = tower,
                            Name = name,
                            Value = value
                        }
                    )
                end)

            if ok
                and DirectResponseOK(
                    result
                ) then

                return true
            end

            local rep =
                GetDirectGameStateReplicator()

            if rep
                and rep:GetAttribute(
                    "GameOver"
                ) == true then

                return false
            end

            task.wait(0.25)
        end

        return false
    end

    function TDS:StackPosition(x, y, z, offset)
        return Vector3.new(
            tonumber(x) or 0,
            (tonumber(y) or 0)
                + (
                    tonumber(offset)
                    or 0
                ) * 3.5,
            tonumber(z) or 0
        )
    end

    function TDS:Mercenary(dist, pathName)
        dist =
            tonumber(dist)
            or 140

        pathName =
            tonumber(pathName)
            or 1

        local towerConfig =
            type(StrategyConfig) == "table"
            and type(StrategyConfig.Towers) == "table"
            and type(StrategyConfig.Towers.Automation) == "table"
            and StrategyConfig.Towers.Automation.Mercenary
            or nil
        local towerName = type(towerConfig) == "table" and tostring(towerConfig.Tower or "") or ""
        local abilityName = type(towerConfig) == "table" and tostring(towerConfig.Ability or "") or ""
        local minUpgrade = type(towerConfig) == "table" and tonumber(towerConfig.MinUpgrade) or 0
        local interval = type(towerConfig) == "table" and tonumber(towerConfig.Interval) or 0.5

        task.spawn(function()
            while IsStrategyRuntimeEnabled() do
                local towersFolder =
                    workspace:FindFirstChild(
                        "Towers"
                    )

                if towersFolder then
                    for _, towerRep in ipairs(
                        towersFolder:GetDescendants()
                    ) do
                        if towerRep:IsA("Folder")
                            and towerRep.Name
                                == "TowerReplicator"
                            and towerRep:GetAttribute(
                                "Name"
                            ) == towerName
                            and towerRep:GetAttribute(
                                "OwnerId"
                            ) == plr.UserId
                            and (
                                towerRep:GetAttribute(
                                    "Upgrade"
                                )
                                or 0
                            ) >= minUpgrade then

                            pcall(function()
                                rf:InvokeServer(
                                    "Troops",
                                    "Abilities",
                                    "Activate",
                                    {
                                        Troop =
                                            towerRep.Parent,
                                        Name =
                                            abilityName,
                                        Data = {
                                            pathName =
                                                pathName,
                                            directionCFrame =
                                                CFrame.new(),
                                            dist =
                                                dist
                                        }
                                    }
                                )
                            end)
                        end
                    end
                end

                task.wait(interval)
            end
        end)

        return true
    end

    function TDS:LoopAbility(index, abilityName, data)
        index =
            tonumber(index)

        data =
            type(data) == "table"
            and data
            or {}

        task.spawn(function()
            while IsStrategyRuntimeEnabled() do
                local tower =
                    TDS.PlacedTowers[
                        index
                    ]

                if tower
                    and tower.Parent then

                    local payload =
                        table.clone(
                            data
                        )

                    if type(
                        payload.towerToClone
                    ) == "number" then

                        payload.towerToClone =
                            TDS.PlacedTowers[
                                payload.towerToClone
                            ]
                    end

                    pcall(function()
                        rf:InvokeServer(
                            "Troops",
                            "Abilities",
                            "Activate",
                            {
                                Troop = tower,
                                Name = abilityName,
                                Data = payload
                            }
                        )
                    end)
                end

                local rep =
                    GetDirectGameStateReplicator()

                if rep
                    and rep:GetAttribute(
                        "GameOver"
                    ) == true then

                    return
                end

                task.wait(0.5)
            end
        end)

        return true
    end


    local MedicChainAPI

    function TDS:MedicChain(...)
        if not MedicChainAPI then
            local loaded = loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/Ceepizz/rya/refs/heads/main/api"
            ))()

            if type(loaded) == "table"
                and type(loaded.MedicChain) == "function" then

                MedicChainAPI = loaded.MedicChain

            elseif type(loaded) == "function" then
                MedicChainAPI = loaded

            else
                warn("[MedicChain] Failed to load API")
                return false
            end
        end

        return MedicChainAPI(self, ...)
    end

    return TDS
end
