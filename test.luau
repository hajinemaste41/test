-- load wind ui
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "XION TESTIN HUB",
    Icon = "door-open",
    Author = "Xion testin hub",
})

local get = game:GetService("Players").LocalPlayer

-- Create Tabs
local Tab = Window:Tab({
    Title = "Main",
    Icon = "crown",
    Locked = false,
})

local Misc = Window:Tab({
    Title = "Misc",
    Icon = "setting",
    Locked = false,
})

-- Sections
local TabSection = Tab:Section({
    Title = "Auto Instant fishing",
})

-------------------------------------------------------
-- FUNCTIONS
-------------------------------------------------------

-- Instant fish
local InstantFishToggle = false
local InstantFishSpeed = 1

function InstantFish()
    while InstantFishToggle do
        task.wait(1.5)
        
        game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net"):WaitForChild("RF/ChargeFishingRod"):InvokeServer()

        local args = {
            -0.5718746185302734,
            0.4597192119700099,
            1763573070.48863
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net"):WaitForChild("RF/RequestFishingMinigameStarted"):InvokeServer(unpack(args))

        task.wait(InstantFishSpeed)

        game:GetService("ReplicatedStorage"):WaitForChild("Packages")
        :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
        :WaitForChild("net"):WaitForChild("RE/FishingCompleted"):FireServer()
    end
end

function SellAllFish()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages")
    :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
    :WaitForChild("net"):WaitForChild("RF/SellAllItems"):InvokeServer()
end

function FixStuckRod()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages")
    :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
    :WaitForChild("net"):WaitForChild("RE/FishingCompleted"):FireServer()
end

-------------------------------------------------------
-- TELEPORT SYSTEM
-------------------------------------------------------

local TeleportLocations = {
    ["Kohana"] = Vector3.new(-597.4342651367188, 3.035492181777954, 758.4493408203125)
}

local SelectedLocation = "Kohana"

function TeleportTo(locationName)
    local root = get.Character and get.Character:FindFirstChild("HumanoidRootPart")
    local target = TeleportLocations[locationName]

    if root and target then
        root.CFrame = CFrame.new(target)
        print("Teleported to:", locationName)
    else
        warn("Teleport failed.")
    end
end

-------------------------------------------------------
-- PLAYER STATS (WalkSpeed + JumpPower)
-------------------------------------------------------

local WalkSpeedValue = 16
local JumpPowerValue = 50

function ApplyWalkSpeed()
    local humanoid = get.Character and get.Character:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = WalkSpeedValue
    end
end

function ApplyJumpPower()
    local humanoid = get.Character and get.Character:FindFirstChildWhichIsA("Humanoid")
    if humanoid then
        humanoid.JumpPower = JumpPowerValue
    end
end

-------------------------------------------------------
-- UI ITEMS
-------------------------------------------------------

-- Toggle instant fish
TabSection:Toggle({
    Title = "Auto Instant fishing",
    Desc = "Automatically instant fish for you.",
    Icon = "bird",
    Type = "Checkbox",
    Value = InstantFishToggle,
    Callback = function(state)
        InstantFishToggle = state
        if InstantFishToggle then
            InstantFish()
        end
    end
})

-- Speed slider
TabSection:Slider({
    Title = "delay speed",
    Desc = "Fishing delay speed.",
    Step = 1,
    Value = {
        Min = 1,
        Max = 10,
        Default = InstantFishSpeed,
    },
    Callback = function(value)
        InstantFishSpeed = value
    end
})

-- Buttons
Tab:Button({
    Title = "Sell All Fish",
    Desc = "Sells all the fish in your inventory.",
    Callback = SellAllFish
})

Tab:Button({
    Title = "Fix Stuck Fishing Rod",
    Desc = "Fix your stuck fishing rod.",
    Callback = FixStuckRod
})

-------------------------------------------------------
-- TELEPORT UI
-------------------------------------------------------

local TeleportSection = Misc:Section({
    Title = "Teleport",
})

TeleportSection:Dropdown({
    Title = "Select Location",
    Desc = "Choose where to teleport.",
    Values = {"Kohana"},
    Multi = false,
    Default = "Kohana",
    Callback = function(v)
        SelectedLocation = v
    end
})

TeleportSection:Button({
    Title = "Teleport",
    Desc = "Teleport to selected location.",
    Callback = function()
        TeleportTo(SelectedLocation)
    end
})

-------------------------------------------------------
-- PLAYER SECTION 
-------------------------------------------------------

local PlayerSection = Misc:Section({
    Title = "Player",
})

PlayerSection:Slider({
    Title = "WalkSpeed",
    Desc = "Adjust walking speed.",
    Step = 1,
    Value = {
        Min = 10,
        Max = 200,
        Default = WalkSpeedValue,
    },
    Callback = function(v)
        WalkSpeedValue = v
    end
})

PlayerSection:Button({
    Title = "Apply WalkSpeed",
    Desc = "Apply WalkSpeed to your character.",
    Callback = ApplyWalkSpeed
})

PlayerSection:Slider({
    Title = "JumpPower",
    Desc = "Adjust jump strength.",
    Step = 1,
    Value = {
        Min = 20,
        Max = 300,
        Default = JumpPowerValue,
    },
    Callback = function(v)
        JumpPowerValue = v
    end
})

PlayerSection:Button({
    Title = "Apply JumpPower",
    Desc = "Apply JumpPower to your character.",
    Callback = ApplyJumpPower
})
