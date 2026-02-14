--[[
    REDYNHUB Loader Script
    
    This is a simple loader that fetches and executes the GUI
    
    Copy and paste this entire script into your executor
]]

-- Version check
local version = "1.0.0"

-- Notification function
local function notify(title, text, duration)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration or 5,
    })
end

-- Check if already loaded
if game.CoreGui:FindFirstChild("REDYNHUB_GUI") then
    notify("REDYNHUB", "Script is already loaded!", 3)
    return
end

-- Loading notification
notify("REDYNHUB", "Loading script...", 3)

-- Try to load the GUI
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/caborya1/Script-/main/GUI.lua"))()
end)

if success then
    notify("REDYNHUB v" .. version, "Script loaded successfully!", 5)
else
    notify("REDYNHUB Error", "Failed to load: " .. tostring(err), 10)
    warn("REDYNHUB Load Error:", err)
end
