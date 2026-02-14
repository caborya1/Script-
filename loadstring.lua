--[[
    REDYNHUB AutoScript - Loadstring Version
    
    Quick Execute:
    loadstring(game:HttpGet("https://raw.githubusercontent.com/caborya1/Script-/main/loadstring.lua"))()
    
    This is a compact version designed for loadstring execution
]]

print("[REDYNHUB] Loading AutoScript...")

local AutoScript = {
    Config = {
        AutoMoney = true,
        AutoCollect = true,
        AutoTrade = true,
        AutoUpgrade = true,
        AutoSpeed = true,
        AutoRebirth = true,
        RebirthThreshold = 1000000,
        UpgradeInterval = 5,
        CollectInterval = 1,
        TradeInterval = 10,
        SpeedMultiplier = 2,
    },
    State = {
        Running = false,
        LastUpgrade = 0,
        LastCollect = 0,
        LastTrade = 0,
        TotalMoney = 0,
        Rebirths = 0,
    }
}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

function AutoScript:Log(msg)
    print("[REDYNHUB] " .. msg)
end

function AutoScript:GetPlayerMoney()
    local leaderstats = LocalPlayer:FindFirstChild("leaderstats")
    if leaderstats then
        local money = leaderstats:FindFirstChild("Money") or leaderstats:FindFirstChild("Cash") or leaderstats:FindFirstChild("Coins") or leaderstats:FindFirstChild("Gold")
        if money then return money.Value end
    end
    return self.State.TotalMoney
end

function AutoScript:AutoMoney()
    if not self.Config.AutoMoney then return end
    local workspace = game:GetService("Workspace")
    local moneyFolder = workspace:FindFirstChild("Money") or workspace:FindFirstChild("Coins") or workspace:FindFirstChild("Cash")
    if moneyFolder then
        for _, money in pairs(moneyFolder:GetChildren()) do
            if money:IsA("BasePart") or money:IsA("Model") then
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local hrp = character.HumanoidRootPart
                    if money:IsA("Model") and money.PrimaryPart then
                        hrp.CFrame = money.PrimaryPart.CFrame
                    elseif money:IsA("BasePart") then
                        hrp.CFrame = money.CFrame
                    end
                    wait(0.1)
                end
            end
        end
    end
end

function AutoScript:AutoCollect()
    if not self.Config.AutoCollect then return end
    local currentTime = tick()
    if currentTime - self.State.LastCollect < self.Config.CollectInterval then return end
    
    if ReplicatedStorage:FindFirstChild("Events") then
        local events = ReplicatedStorage.Events
        local collectEvent = events:FindFirstChild("Collect") or events:FindFirstChild("Claim") or events:FindFirstChild("CollectAll")
        if collectEvent then
            if collectEvent:IsA("RemoteEvent") then collectEvent:FireServer()
            elseif collectEvent:IsA("RemoteFunction") then collectEvent:InvokeServer() end
        end
    end
    
    local workspace = game:GetService("Workspace")
    local collectibles = workspace:FindFirstChild("Collectibles") or workspace:FindFirstChild("Drops") or workspace:FindFirstChild("Items")
    if collectibles then
        for _, item in pairs(collectibles:GetChildren()) do
            if item:IsA("BasePart") or item:IsA("Model") then
                local character = LocalPlayer.Character
                if character and character:FindFirstChild("HumanoidRootPart") then
                    local hrp = character.HumanoidRootPart
                    if item:IsA("Model") and item.PrimaryPart then hrp.CFrame = item.PrimaryPart.CFrame
                    elseif item:IsA("BasePart") then hrp.CFrame = item.CFrame end
                    wait(0.05)
                end
            end
        end
    end
    self.State.LastCollect = currentTime
end

function AutoScript:AutoTrade()
    if not self.Config.AutoTrade then return end
    local currentTime = tick()
    if currentTime - self.State.LastTrade < self.Config.TradeInterval then return end
    
    if ReplicatedStorage:FindFirstChild("Events") then
        local events = ReplicatedStorage.Events
        local tradeEvent = events:FindFirstChild("Trade") or events:FindFirstChild("Sell") or events:FindFirstChild("SellAll")
        if tradeEvent then
            if tradeEvent:IsA("RemoteEvent") then tradeEvent:FireServer()
            elseif tradeEvent:IsA("RemoteFunction") then tradeEvent:InvokeServer() end
        end
    end
    self.State.LastTrade = currentTime
end

function AutoScript:AutoUpgrade()
    if not self.Config.AutoUpgrade then return end
    local currentTime = tick()
    if currentTime - self.State.LastUpgrade < self.Config.UpgradeInterval then return end
    
    local upgradeStats = {"Damage", "Speed", "Collection", "Multiplier", "Power", "Strength"}
    if ReplicatedStorage:FindFirstChild("Events") then
        local events = ReplicatedStorage.Events
        for _, stat in pairs(upgradeStats) do
            local upgradeEvent = events:FindFirstChild("Upgrade" .. stat) or events:FindFirstChild("Upgrade")
            if upgradeEvent then
                if upgradeEvent:IsA("RemoteEvent") then
                    upgradeEvent:FireServer(stat)
                    upgradeEvent:FireServer({stat = stat})
                    upgradeEvent:FireServer()
                elseif upgradeEvent:IsA("RemoteFunction") then
                    pcall(function() upgradeEvent:InvokeServer(stat) end)
                    pcall(function() upgradeEvent:InvokeServer({stat = stat}) end)
                end
            end
        end
    end
    self.State.LastUpgrade = currentTime
end

function AutoScript:AutoSpeed()
    if not self.Config.AutoSpeed then return end
    local character = LocalPlayer.Character
    if character and character:FindFirstChild("Humanoid") then
        character.Humanoid.WalkSpeed = 16 * self.Config.SpeedMultiplier
    end
end

function AutoScript:AutoRebirth()
    if not self.Config.AutoRebirth then return end
    local currentMoney = self:GetPlayerMoney()
    if currentMoney >= self.Config.RebirthThreshold then
        if ReplicatedStorage:FindFirstChild("Events") then
            local events = ReplicatedStorage.Events
            local rebirthEvent = events:FindFirstChild("Rebirth") or events:FindFirstChild("Prestige") or events:FindFirstChild("Reset")
            if rebirthEvent then
                if rebirthEvent:IsA("RemoteEvent") then rebirthEvent:FireServer()
                elseif rebirthEvent:IsA("RemoteFunction") then rebirthEvent:InvokeServer() end
                self.State.Rebirths = self.State.Rebirths + 1
                self:Log("Auto Rebirth! Total: " .. self.State.Rebirths)
            end
        end
    end
end

function AutoScript:Start()
    if self.State.Running then return end
    self.State.Running = true
    self:Log("Starting all features...")
    
    spawn(function() while self.State.Running do pcall(function() self:AutoMoney() end) wait(0.5) end end)
    spawn(function() while self.State.Running do pcall(function() self:AutoCollect() end) wait(0.5) end end)
    spawn(function() while self.State.Running do pcall(function() self:AutoTrade() end) wait(1) end end)
    spawn(function() while self.State.Running do pcall(function() self:AutoUpgrade() end) wait(1) end end)
    spawn(function() while self.State.Running do pcall(function() self:AutoSpeed() end) wait(2) end end)
    spawn(function() while self.State.Running do pcall(function() self:AutoRebirth() end) wait(3) end end)
    
    LocalPlayer.CharacterAdded:Connect(function() wait(1) if self.State.Running then self:AutoSpeed() end end)
    self:Log("All features activated!")
end

AutoScript:Start()

game.StarterGui:SetCore("SendNotification", {
    Title = "REDYNHUB AutoScript";
    Text = "All automation features activated!";
    Duration = 5;
})

return AutoScript
