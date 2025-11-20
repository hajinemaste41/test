--// UI Loader
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "XION TESTIN HUB",
    LoadingTitle = "Xion testin hub",
    LoadingSubtitle = "UI Loaded",
    ConfigurationSaving = false
})

local Player = game:GetService("Players").LocalPlayer

-------------------------------------------------------
-- TABS
-------------------------------------------------------

local MainTab = Window:CreateTab("Main", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)

-------------------------------------------------------
-- REPLICATED SERVICES
-------------------------------------------------------

local RS = game:GetService("ReplicatedStorage"):WaitForChild("Packages")
    :WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0")
    :WaitForChild("net")

local ChargeRod = RS["RF/ChargeFishingRod"]
local RequestMinigame = RS["RF/RequestFishingMinigameStarted"]
local FishingComplete = RS["RE/FishingCompleted"]

-------------------------------------------------------
-- AUTO FISHING SECTION
-------------------------------------------------------

local AutoFish1 = false
local AutoFish2 = false

local CancelDelay = 1.8
local CompleteDelay = 1.53

MainTab:CreateToggle({
    Name = "AUTO FISHING",
    CurrentValue = false,
    Flag = "AutoFishingMain",
    Callback = function(v)
        AutoFish1 = false
        AutoFish2 = false
    end,
})

MainTab:CreateInput({
    Name = "Cancel Delay",
    PlaceholderText = "1.8",
    RemoveTextAfterFocusLost = false,
    Callback = function(v)
        CancelDelay = tonumber(v) or CancelDelay
    end,
})

MainTab:CreateInput({
    Name = "Complete Delay",
    PlaceholderText = "1.53",
    RemoveTextAfterFocusLost = false,
    Callback = function(v)
        CompleteDelay = tonumber(v) or CompleteDelay
    end,
})

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

MainTab:CreateToggle({
    Name = "Mode 1 (Legit)",
    CurrentValue = false,
    Flag = "AutoFish1",
    Callback = function(v)
        AutoFish1 = v
        AutoFish2 = false
        if v then task.spawn(AutoFishingMode1) end
    end,
})

MainTab:CreateToggle({
    Name = "Mode 2 (Blatant)",
    CurrentValue = false,
    Flag = "AutoFish2",
    Callback = function(v)
        AutoFish2 = v
        AutoFish1 = false
        if v then task.spawn(AutoFishingMode2) end
    end,
})

MainTab:CreateButton({
    Name = "Sell All Fish",
    Callback = function()
        RS["RF/SellAllItems"]:InvokeServer()
    end
})

MainTab:CreateButton({
    Name = "Fix Rod",
    Callback = function()
        FishingComplete:FireServer()
    end
})

-------------------------------------------------------
-- MISC > TELEPORT
-------------------------------------------------------

local Locations = {
    ["Kohana"] = Vector3.new(-597.4342651367188, 3.035492181777954, 758.4493408203125)
}

local SelectedLocation = "Kohana"

MiscTab:CreateDropdown({
    Name = "Select Location",
    Options = {"Kohana"},
    CurrentOption = "Kohana",
    Callback = function(v)
        SelectedLocation = v
    end
})

MiscTab:CreateButton({
    Name = "Teleport",
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

MiscTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {10, 200},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(v)
        local h = Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid")
        if h then h.WalkSpeed = v end
    end,
})

MiscTab:CreateSlider({
    Name = "JumpPower",
    Range = {20, 300},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(v)
        local h = Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid")
        if h then h.JumpPower = v end
    end,
})
