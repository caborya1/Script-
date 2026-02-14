--[[
    REDYNHUB GUI - User Interface
    
    Simple GUI to control all auto features
]]

-- Load the main REDYNHUB module
local REDYNHUB = loadstring(game:HttpGet("https://raw.githubusercontent.com/caborya1/Script-/main/REDYNHUB.lua"))()

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local ScrollingFrame = Instance.new("ScrollingFrame")

-- GUI Properties
ScreenGui.Name = "REDYNHUB_GUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.8, 0, 0.3, 0)
MainFrame.Size = UDim2.new(0, 250, 0, 400)
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 127)
TitleLabel.BackgroundTransparency = 0.3
TitleLabel.BorderSizePixel = 0
TitleLabel.Size = UDim2.new(1, 0, 0, 40)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "REDYNHUB v" .. REDYNHUB.Version
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 18
TitleLabel.TextStrokeTransparency = 0.5

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleLabel

ScrollingFrame.Name = "ScrollingFrame"
ScrollingFrame.Parent = MainFrame
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.BorderSizePixel = 0
ScrollingFrame.Position = UDim2.new(0, 5, 0, 45)
ScrollingFrame.Size = UDim2.new(1, -10, 1, -50)
ScrollingFrame.ScrollBarThickness = 4
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Function to create toggle button
local function createToggleButton(name, feature, parent)
    local Button = Instance.new("TextButton")
    local ButtonCorner = Instance.new("UICorner")
    local StatusLabel = Instance.new("TextLabel")
    
    Button.Name = name .. "Button"
    Button.Parent = parent
    Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Button.BorderSizePixel = 0
    Button.Size = UDim2.new(1, 0, 0, 35)
    Button.Font = Enum.Font.Gotham
    Button.Text = "  " .. name
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.TextSize = 14
    Button.TextXAlignment = Enum.TextXAlignment.Left
    
    ButtonCorner.CornerRadius = UDim.new(0, 6)
    ButtonCorner.Parent = Button
    
    StatusLabel.Name = "StatusLabel"
    StatusLabel.Parent = Button
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Position = UDim2.new(1, -60, 0, 0)
    StatusLabel.Size = UDim2.new(0, 50, 1, 0)
    StatusLabel.Font = Enum.Font.GothamBold
    StatusLabel.Text = "OFF"
    StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
    StatusLabel.TextSize = 12
    
    -- Update status
    local function updateStatus()
        local config = REDYNHUB:GetConfig()
        if config[feature] then
            StatusLabel.Text = "ON"
            StatusLabel.TextColor3 = Color3.fromRGB(50, 255, 50)
            Button.BackgroundColor3 = Color3.fromRGB(40, 80, 40)
        else
            StatusLabel.Text = "OFF"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
            Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        end
    end
    
    Button.MouseButton1Click:Connect(function()
        REDYNHUB:Toggle(feature)
        updateStatus()
    end)
    
    updateStatus()
    
    return Button
end

-- Create toggle buttons for each feature
createToggleButton("Auto Money", "AutoMoney", ScrollingFrame)
createToggleButton("Auto Collect", "AutoCollect", ScrollingFrame)
createToggleButton("Auto Trade", "AutoTrade", ScrollingFrame)
createToggleButton("Auto Upgrade", "AutoUpgrade", ScrollingFrame)
createToggleButton("Auto Speed", "AutoSpeed", ScrollingFrame)
createToggleButton("Auto Rebirth", "AutoRebirth", ScrollingFrame)

-- Create Start/Stop button
local StartStopButton = Instance.new("TextButton")
local StartStopCorner = Instance.new("UICorner")

StartStopButton.Name = "StartStopButton"
StartStopButton.Parent = ScrollingFrame
StartStopButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
StartStopButton.BorderSizePixel = 0
StartStopButton.Size = UDim2.new(1, 0, 0, 45)
StartStopButton.Font = Enum.Font.GothamBold
StartStopButton.Text = "START ALL"
StartStopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartStopButton.TextSize = 16

StartStopCorner.CornerRadius = UDim.new(0, 8)
StartStopCorner.Parent = StartStopButton

local isRunning = false
StartStopButton.MouseButton1Click:Connect(function()
    if not isRunning then
        REDYNHUB:Start()
        StartStopButton.Text = "STOP ALL"
        StartStopButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        isRunning = true
    else
        REDYNHUB:Stop()
        StartStopButton.Text = "START ALL"
        StartStopButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        isRunning = false
    end
end)

-- Create Settings Section
local SettingsDivider = Instance.new("TextLabel")
SettingsDivider.Name = "SettingsDivider"
SettingsDivider.Parent = ScrollingFrame
SettingsDivider.BackgroundColor3 = Color3.fromRGB(255, 0, 127)
SettingsDivider.BackgroundTransparency = 0.7
SettingsDivider.BorderSizePixel = 0
SettingsDivider.Size = UDim2.new(1, 0, 0, 25)
SettingsDivider.Font = Enum.Font.GothamBold
SettingsDivider.Text = "SETTINGS"
SettingsDivider.TextColor3 = Color3.fromRGB(255, 255, 255)
SettingsDivider.TextSize = 14

-- Function to create slider
local function createSlider(name, setting, min, max, default, parent)
    local SliderFrame = Instance.new("Frame")
    local SliderLabel = Instance.new("TextLabel")
    local SliderBar = Instance.new("Frame")
    local SliderFill = Instance.new("Frame")
    local SliderButton = Instance.new("TextButton")
    local ValueLabel = Instance.new("TextLabel")
    
    SliderFrame.Name = name .. "Slider"
    SliderFrame.Parent = parent
    SliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    SliderFrame.BorderSizePixel = 0
    SliderFrame.Size = UDim2.new(1, 0, 0, 50)
    
    local SliderCorner = Instance.new("UICorner")
    SliderCorner.CornerRadius = UDim.new(0, 6)
    SliderCorner.Parent = SliderFrame
    
    SliderLabel.Name = "SliderLabel"
    SliderLabel.Parent = SliderFrame
    SliderLabel.BackgroundTransparency = 1
    SliderLabel.Position = UDim2.new(0, 10, 0, 5)
    SliderLabel.Size = UDim2.new(1, -20, 0, 15)
    SliderLabel.Font = Enum.Font.Gotham
    SliderLabel.Text = name
    SliderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SliderLabel.TextSize = 12
    SliderLabel.TextXAlignment = Enum.TextXAlignment.Left
    
    ValueLabel.Name = "ValueLabel"
    ValueLabel.Parent = SliderFrame
    ValueLabel.BackgroundTransparency = 1
    ValueLabel.Position = UDim2.new(1, -50, 0, 5)
    ValueLabel.Size = UDim2.new(0, 40, 0, 15)
    ValueLabel.Font = Enum.Font.GothamBold
    ValueLabel.Text = tostring(default)
    ValueLabel.TextColor3 = Color3.fromRGB(255, 0, 127)
    ValueLabel.TextSize = 12
    
    SliderBar.Name = "SliderBar"
    SliderBar.Parent = SliderFrame
    SliderBar.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    SliderBar.BorderSizePixel = 0
    SliderBar.Position = UDim2.new(0, 10, 0, 28)
    SliderBar.Size = UDim2.new(1, -20, 0, 6)
    
    local BarCorner = Instance.new("UICorner")
    BarCorner.CornerRadius = UDim.new(1, 0)
    BarCorner.Parent = SliderBar
    
    SliderFill.Name = "SliderFill"
    SliderFill.Parent = SliderBar
    SliderFill.BackgroundColor3 = Color3.fromRGB(255, 0, 127)
    SliderFill.BorderSizePixel = 0
    SliderFill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    
    local FillCorner = Instance.new("UICorner")
    FillCorner.CornerRadius = UDim.new(1, 0)
    FillCorner.Parent = SliderFill
    
    SliderButton.Name = "SliderButton"
    SliderButton.Parent = SliderBar
    SliderButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    SliderButton.BorderSizePixel = 0
    SliderButton.Position = UDim2.new((default - min) / (max - min), -8, 0.5, -8)
    SliderButton.Size = UDim2.new(0, 16, 0, 16)
    SliderButton.Text = ""
    
    local ButtonCorner = Instance.new("UICorner")
    ButtonCorner.CornerRadius = UDim.new(1, 0)
    ButtonCorner.Parent = SliderButton
    
    local dragging = false
    
    SliderButton.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePos = input.Position.X
            local barPos = SliderBar.AbsolutePosition.X
            local barSize = SliderBar.AbsoluteSize.X
            local relativePos = math.clamp((mousePos - barPos) / barSize, 0, 1)
            
            SliderFill.Size = UDim2.new(relativePos, 0, 1, 0)
            SliderButton.Position = UDim2.new(relativePos, -8, 0.5, -8)
            
            local value = min + (max - min) * relativePos
            value = math.floor(value * 10) / 10 -- Round to 1 decimal
            ValueLabel.Text = tostring(value)
            
            REDYNHUB:SetConfig(setting, value)
        end
    end)
    
    return SliderFrame
end

-- Create sliders for settings
createSlider("Money Interval", "MoneyInterval", 0.1, 5, 1, ScrollingFrame)
createSlider("Collect Interval", "CollectInterval", 0.1, 3, 0.5, ScrollingFrame)
createSlider("Speed Multiplier", "SpeedMultiplier", 1, 5, 2, ScrollingFrame)
createSlider("Rebirth Threshold", "RebirthThreshold", 100, 10000, 1000, ScrollingFrame)

-- Create Close Button
local CloseButton = Instance.new("TextButton")
local CloseCorner = Instance.new("UICorner")

CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.BorderSizePixel = 0
CloseButton.Position = UDim2.new(1, -30, 0, 5)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14

CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    REDYNHUB:Stop()
end)

-- Update canvas size
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end)

-- Initial notification
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "REDYNHUB",
    Text = "GUI Loaded! Drag to move.",
    Duration = 5,
})

print("REDYNHUB GUI loaded successfully!")
