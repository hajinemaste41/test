-- load ui library wind
local Version = "1.6.53"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" ..
Version .. "/main.lua"))()

-- create window
local Window = WindUI:CreateWindow({
    Title = "Xion Testin hub",
    Theme = "Dark",
    LoadingTitle = "Xion Testin hub",
    LoadingSubtitle = "by Xion",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "XionTestinHub", -- Create a custom folder for your hub/game
        FileName = "Configuration"
    }
})

-- create home tab
local Home = Window:CreateTab("Home")

-- create features tab
local Features = Window:CreateTab("Auto Fishing") 

