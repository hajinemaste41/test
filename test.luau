-- load wind ui
local Version = "1.6.41"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. Version .. "/main.lua"))()


local Window = WindUI:CreateWindow({
    Title = "Xion Testin hub", -- Window title
    Icon = "door-open", -- lucide icon
    Author = "XionTestingHub", -- Your name
    Folder = "XionTestinHub", -- Folder name in your Roblox-Data folder
    
    
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            print("clicked")
        end,
    },
     
})

local Tab = Window:Tab({
    Title = "Main", -- Tab title
    Icon = "crown", -- optional
    Locked = false,
})

    local ButtonTab = ElementsSection:Tab({
        Title = "Button",
        Icon = "mouse-pointer-click",
    })
