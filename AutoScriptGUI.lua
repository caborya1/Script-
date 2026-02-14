--[[
    REDYNHUB Auto Script with GUI
    Simple interface for toggling automation features
]]

-- Load the main AutoScript
local AutoScript = loadfile("AutoScript.lua")()

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
    button.Text = button.Text:gsub("ON", "TEMP"):gsub("OFF", "ON"):gsub("TEMP", "OFF")
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
