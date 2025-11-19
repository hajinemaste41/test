-- load wind ui
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "XION TESTIN HUB", -- Window title
    Icon = "door-open", -- lucide icon. optional
    Author = "Xion testin hub", -- optional
})


-- Create Tab
local Tab = Window:Tab({
    Title = "Main", -- Tab title
    Icon = "crown", -- optional
    Locked = false,
})

local TabSection = Tab:Section({
        Title = "Auto Instant fishing", -- Section title
    })

Slider:SetTitle("Title Example")
TabSection:Slider({
    Title = "Delay",
    Desc = "Slider Description",
    Icon = "activity",
    Min = 0,
    Max = 100,
    Default = 50, -- default value
    Increment = 1, -- amount to increment by
    Suffix = "units", -- optional
    Callback = function(value) 
        print("Slider Changed to " .. tostring(value))
    


TabSection:Toggle({
    Title = "Toggle",
    Desc = "Toggle Description",
    Icon = "bird",
    Type = "Checkbox",
    Value = false, -- default value
    Callback = function(state) 
        print("Toggle Activated" .. tostring(state))
    end
})
