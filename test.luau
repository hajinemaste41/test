-- load wind ui
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "XION TESTIN HUB",
    Icon = "door-open",
    Author = "Xion testin hub",
})

local Player = game:GetService("Players").LocalPlayer

-------------------------------------------------------
-- TABS
-------------------------------------------------------

local Tab = Window:Tab({
    Title = "Main",
    Icon = "crown",
})

local Misc = Window:Tab({
    Title = "Misc",
    Icon = "setting",
})

-------------------------------------------------------
-- MAIN > AUTO FISHING SECTION
-------------------------------------------------------

local AutoFishSection = Tab:Section({
    Title = "Auto Fishing System",
})

local AutoFish1 = false
local AutoFish2 = false

local CancelDelay = 1.8
local CompleteDelay = 1.53

local RS = game:GetService("ReplicatedStorage"):WaitForChild("Packages")
    :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
    :WaitForChild("net")

local ChargeRod = RS["RF/ChargeFishingRod"]
local RequestMinigame = RS["RF/RequestFishingMinigameStarted"]
local FishingComplete = RS["RE/FishingCompleted"]

-------------------------------------------------------
-- AUTO FISHING MODES
-------------------------------------------------------

function AutoFishingMode1()
    while AutoFish1 do
        task.wait(CancelDelay)

        ChargeRod:InvokeServer()

        RequestMinigame:InvokeServer(
            -0.5718746185302734,
            0.4597192119700099,
            1763573070.48863
        )

        task.wait(CompleteDelay)
        FishingComplete:FireServer()
    end
end

function AutoFishingMode2()
    while AutoFish2 do
        for i = 1, 20 do
            FishingComplete:FireServer()
        end
        task.wait(CompleteDelay)
    end
end

-------------------------------------------------------
-- AUTO FISHING UI
-------------------------------------------------------

AutoFishSection:Toggle({
    Title = "Auto Fishing",
    Desc = "Beta version",
    Icon = "fish",
    Value = false,
    Callback = function()
        AutoFish1 = false
        AutoFish2 = false
    end
})

AutoFishSection:Textbox({
    Title = "Cancel Delay",
    Desc = "Example: 1.8",
    Default = tostring(CancelDelay),
    Callback = function(v)
        if tonumber(v) then CancelDelay = tonumber(v) end
    end
})

AutoFishSection:Textbox({
    Title = "Complete Delay",
    Desc = "Example: 1.53",
    Default = tostring(CompleteDelay),
    Callback = function(v)
        if tonumber(v) then CompleteDelay = tonumber(v) end
    end
})

AutoFishSection:Toggle({
    Title = "Mode 1 (Legit)",
    Desc = "Safe mode",
    Icon = "shield",
    Value = false,
    Callback = function(state)
        AutoFish1 = state
        AutoFish2 = false
        if state then task.spawn(AutoFishingMode1) end
    end
})

AutoFishSection:Toggle({
    Title = "Mode 2 (Blatant)",
    Desc = "Fast mode",
    Icon = "bolt",
    Value = false,
    Callback = function(state)
        AutoFish2 = state
        AutoFish1 = false
        if state then task.spawn(AutoFishingMode2) end
    end
})

AutoFishSection:Button({
    Title = "Sell All Fish",
    Callback = function()
        RS["RF/SellAllItems"]:InvokeServer()
    end
})

AutoFishSection:Button({
    Title = "Fix Rod",
    Callback = function()
        FishingComplete:FireServer()
    end
})

-------------------------------------------------------
-- MISC > TELEPORT SECTION
-------------------------------------------------------

local TeleportSection = Misc:Section({
    Title = "Teleport",
})

local Locations = {
    ["Kohana"] = Vector3.new(-597.4342651367188, 3.035492181777954, 758.4493408203125)
}

local SelectedLocation = "Kohana"

TeleportSection:Dropdown({
    Title = "Select Location",
    Values = {"Kohana"},
    Default = "Kohana",
    Callback = function(v)
        SelectedLocation = v
    end
})

TeleportSection:Button({
    Title = "Teleport",
    Callback = function()
        local root = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            root.CFrame = CFrame.new(Locations[SelectedLocation])
        end
    end
})

-------------------------------------------------------
-- MISC > PLAYER SECTION
-------------------------------------------------------

local PlayerSection = Misc:Section({
    Title = "Player",
})

local WalkSpeedValue = 16
local JumpPowerValue = 50

PlayerSection:Slider({
    Title = "WalkSpeed",
    Desc = "Run speed",
    Step = 1,
    Value = {Min = 10, Max = 200, Default = 16},
    Callback = function(v)
        WalkSpeedValue = v
        local h = Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid")
        if h then h.WalkSpeed = v end
    end
})

PlayerSection:Slider({
    Title = "JumpPower",
    Desc = "Jump height",
    Step = 1,
    Value = {Min = 20, Max = 300, Default = 50},
    Callback = function(v)
        JumpPowerValue = v
        local h = Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid")
        if h then h.JumpPower = v end
    end
})
