local Globals = getgenv()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer or Players.PlayerAdded:Wait()
local PlayerGui = Player:WaitForChild("PlayerGui")

local AutoCollect = {}
local running = false

local function IsLobby()
    return PlayerGui:FindFirstChild("ReactLobbyHud") ~= nil
end

function AutoCollect.IsRunning()
    return running
end

function AutoCollect.Start()
    if running or not Globals.ClaimRewards or not IsLobby() then
        return false
    end

    running = true
    task.spawn(function()
        pcall(function()
            local network = ReplicatedStorage:WaitForChild("Network")
            local spinTickets = Player:WaitForChild("SpinTickets", 15)
            if spinTickets and spinTickets.Value > 0 then
                local dailySpin = network:WaitForChild("DailySpin", 5)
                local redeemSpin = dailySpin and dailySpin:WaitForChild("RF:RedeemSpin", 5)
                if redeemSpin then
                    local ticketCount = spinTickets.Value
                    for _ = 1, ticketCount do
                        if not Globals.ClaimRewards then
                            break
                        end
                        redeemSpin:InvokeServer()
                        task.wait(0.2)
                    end
                end
            end

            if Globals.ClaimRewards then
                local playtimeRewards = network:WaitForChild("PlaytimeRewards")
                local claimReward = playtimeRewards:WaitForChild("RF:ClaimReward")
                for i = 1, 6 do
                    if not Globals.ClaimRewards then
                        break
                    end
                    claimReward:InvokeServer(i)
                    task.wait(0.2)
                end
            end

            if Globals.ClaimRewards then
                local dailySpin = network:FindFirstChild("DailySpin")
                local redeemReward = dailySpin and dailySpin:FindFirstChild("RF:RedeemReward")
                if redeemReward then
                    redeemReward:InvokeServer()
                end
            end
        end)
        running = false
    end)
    return true
end

return AutoCollect
