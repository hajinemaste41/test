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
        FolderName = "XionTestinHub", 
        FileName = "Configuration"
    }
})

-- create tab
local Home = Window:CreateTab("Home") 

-- create home section
local AutoFishing = Home:CreateSection("Auto Fishing") HomeSection

-- function Auto Fishing

        AutoFishing:CreateToggle({
            Title = "Auto Fishing",
            Description = "TEST FOR PURPOSE ONLY",
            State = false,
            Callback = function(State)
                if State then
                    getgenv().AutoFishing = true
                    while getgenv().AutoFishing do
                        wait()
                        -- fishing logic here
                        
                    end
                else
                    getgenv().AutoFishing = false
                end
            end
        })

    function AutoFishing()
        print("Auto Fishing Enabled")
    end

