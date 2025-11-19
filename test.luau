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
  
function InstantFish()
   game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/ChargeFishingRod"):InvokeServer()
local args = {
    -0.5718746185302734,
    0.4597192119700099,
    1763573070.48863
}
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RF/RequestFishingMinigameStarted"):InvokeServer(unpack(args))    
            task.wait(10)
                game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_net@0.2.0"):WaitForChild("net"):WaitForChild("RE/FishingCompleted"):FireServer()
end


local InstantFishToggle =  false

TabSection:Toggle({
    Title = "Auto Instant fishing",
    Desc = "Automatically instant fish for you.",
    Icon = "bird",
    Type = "Checkbox",
    Value = InstantFishToggle, -- default value
    Callback = function(state) 
        InstantFishToggle = state
        if InstantFishToggle then
            InstantFish()
            print("Instant fishing started.")
        end
    end
})




