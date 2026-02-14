--[[
    REDYNHUB Auto Script with GUI
    Simple interface for toggling automation features
    Standalone version - no external dependencies
]]

-- Embedded AutoScript
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
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

function AutoScript:Log(message)
    print("[AutoScript] " .. message)
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
                    if money:IsA("Model") and money.PrimaryPart then hrp.CFrame = money.PrimaryPart.CFrame
                    elseif money:IsA("BasePart") then hrp.CFrame = money.CFrame end
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
    self:Log("Starting...")
    
    spawn(function() while self.State.Running do pcall(function() self:AutoMoney() end) wait(0.5) end end)
    spawn(function() while self.State.Running do pcall(function() self:AutoCollect() end) wait(0.5) end end)
    spawn(function() while self.State.Running do pcall(function() self:AutoTrade() end) wait(1) end end)
    spawn(function() while self.State.Running do pcall(function() self:AutoUpgrade() end) wait(1) end end)
    spawn(function() while self.State.Running do pcall(function() self:AutoSpeed() end) wait(2) end end)
    spawn(function() while self.State.Running do pcall(function() self:AutoRebirth() end) wait(3) end end)
    
    LocalPlayer.CharacterAdded:Connect(function() wait(1) if self.State.Running then self:AutoSpeed() end end)
end

function AutoScript:Stop()
    self.State.Running = false
    self:Log("Stopped!")
end

-- Start the automation
AutoScript:Start()

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local AutoMoneyToggle = Instance.new("TextButton")
local AutoCollectToggle = Instance.new("TextButton")
local AutoTradeToggle = Instance.new("TextButton")
local AutoUpgradeToggle = Instance.new("TextButton")
local AutoSpeedToggle = Instance.new("TextButton")
local AutoRebirthToggle = Instance.new("TextButton")
local StatusLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")

-- GUI Properties
ScreenGui.Name = "AutoScriptGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main Frame
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.35, 0, 0.25, 0)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

-- Add rounded corners
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Title
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TitleLabel.BorderSizePixel = 0
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "REDYNHUB AutoScript"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 18

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleLabel

-- Function to create toggle buttons
local function createToggleButton(name, text, position, enabled)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = MainFrame
    button.BackgroundColor3 = enabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    button.BorderSizePixel = 0
    button.Position = position
    button.Size = UDim2.new(0, 250, 0, 40)
    button.Font = Enum.Font.Gotham
    button.Text = text .. ": " .. (enabled and "ON" or "OFF")
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.TextSize = 14
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 8)
    btnCorner.Parent = button
    
    return button
end

-- Create toggle buttons
AutoMoneyToggle = createToggleButton("AutoMoneyToggle", "Auto Money", UDim2.new(0, 25, 0, 60), AutoScript.Config.AutoMoney)
AutoCollectToggle = createToggleButton("AutoCollectToggle", "Auto Collect", UDim2.new(0, 25, 0, 110), AutoScript.Config.AutoCollect)
AutoTradeToggle = createToggleButton("AutoTradeToggle", "Auto Trade", UDim2.new(0, 25, 0, 160), AutoScript.Config.AutoTrade)
AutoUpgradeToggle = createToggleButton("AutoUpgradeToggle", "Auto Upgrade", UDim2.new(0, 25, 0, 210), AutoScript.Config.AutoUpgrade)
AutoSpeedToggle = createToggleButton("AutoSpeedToggle", "Auto Speed", UDim2.new(0, 25, 0, 260), AutoScript.Config.AutoSpeed)
AutoRebirthToggle = createToggleButton("AutoRebirthToggle", "Auto Rebirth", UDim2.new(0, 25, 0, 310), AutoScript.Config.AutoRebirth)

-- Status Label
StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 25, 0, 360)
StatusLabel.Size = UDim2.new(0, 250, 0, 30)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = "Status: Active"
StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
StatusLabel.TextSize = 12

-- Close Button
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 5)
closeCorner.Parent = CloseButton

-- Toggle Functions
local function toggleButton(button, configKey)
    AutoScript.Config[configKey] = not AutoScript.Config[configKey]
    local enabled = AutoScript.Config[configKey]
    button.BackgroundColor3 = enabled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(200, 0, 0)
    local featureName = button.Text:match("^[^:]+")
    button.Text = featureName .. ": " .. (enabled and "ON" or "OFF")
end

-- Button Connections
AutoMoneyToggle.MouseButton1Click:Connect(function()
    toggleButton(AutoMoneyToggle, "AutoMoney")
end)

AutoCollectToggle.MouseButton1Click:Connect(function()
    toggleButton(AutoCollectToggle, "AutoCollect")
end)

AutoTradeToggle.MouseButton1Click:Connect(function()
    toggleButton(AutoTradeToggle, "AutoTrade")
end)

AutoUpgradeToggle.MouseButton1Click:Connect(function()
    toggleButton(AutoUpgradeToggle, "AutoUpgrade")
end)

AutoSpeedToggle.MouseButton1Click:Connect(function()
    toggleButton(AutoSpeedToggle, "AutoSpeed")
end)

AutoRebirthToggle.MouseButton1Click:Connect(function()
    toggleButton(AutoRebirthToggle, "AutoRebirth")
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Update status periodically
spawn(function()
    while wait(1) do
        if AutoScript.State.Running then
            StatusLabel.Text = "Status: Active | Rebirths: " .. AutoScript.State.Rebirths
            StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            StatusLabel.Text = "Status: Stopped"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end
end)

print("AutoScript GUI loaded successfully!")
