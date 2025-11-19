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

do
    local ButtonTab = ElementsSection:Tab({
        Title = "Button",
        Icon = "mouse-pointer-click",
    })
