--[[
    Name-7 - TEAM EDITION (5 ACCOUNTS)
    COMMANDS: 
    "Name-7 open"  - Munculkan Menu
    "Name-7 close" - Sembunyikan Menu
]]

local ScreenGui_Name7 = Instance.new("ScreenGui")
ScreenGui_Name7.Parent = game.CoreGui
ScreenGui_Name7.Name = "Name-7_Team"

-- 1. DATABASE DENGAN 5 AKAUN (KEKAL SAMA, HANYA RENAME VARIABLE)
local UserDatabase_Name7 = {
    ["adam123"] = "pass123",
    ["hacker1"] = "hack77",
    ["user2"] = "team99",
    ["admin"] = "root123",
    ["guest"] = "guest123"
}

local MainFrame_Name7 = nil 

-- 2. FUNGSI UTAMA EXECUTOR (RENAME KE Name-7)
local function BuildExecutor_Name7()
    MainFrame_Name7 = Instance.new("Frame")
    MainFrame_Name7.Parent = ScreenGui_Name7
    MainFrame_Name7.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame_Name7.Position = UDim2.new(0.5, -190, 0.5, -140)
    MainFrame_Name7.Size = UDim2.new(0, 380, 0, 280)
    MainFrame_Name7.Active = true
    MainFrame_Name7.Draggable = true
    MainFrame_Name7.Visible = true 
    Instance.new("UIStroke", MainFrame_Name7).Color = Color3.fromRGB(60, 60, 60)

    -- Top Bar
    local TopBar_Name7 = Instance.new("Frame")
    TopBar_Name7.Parent = MainFrame_Name7
    TopBar_Name7.Size = UDim2.new(1, 0, 0, 25)
    TopBar_Name7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    
    local Title_Name7 = Instance.new("TextLabel")
    Title_Name7.Parent = TopBar_Name7
    Title_Name7.Text = "  Name-7"
    Title_Name7.TextColor3 = Color3.fromRGB(50, 50, 50)
    Title_Name7.TextSize = 14
    Title_Name7.Font = Enum.Font.SourceSansBold
    Title_Name7.Size = UDim2.new(1, 0, 1, 0)
    Title_Name7.TextXAlignment = Enum.TextXAlignment.Left

    -- Sidebar
    local Sidebar_Name7 = Instance.new("Frame")
    Sidebar_Name7.Parent = MainFrame_Name7
    Sidebar_Name7.Size = UDim2.new(0.18, 0, 0.9, 0)
    Sidebar_Name7.Position = UDim2.new(0.82, 0, 0.1, 0)
    Sidebar_Name7.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

    local LogoSide_Name7 = Instance.new("TextLabel")
    LogoSide_Name7.Parent = Sidebar_Name7
    LogoSide_Name7.Text = "N\nA\nM\nE\n7"
    LogoSide_Name7.Size = UDim2.new(1, 0, 0, 60)
    LogoSide_Name7.TextColor3 = Color3.fromRGB(255, 255, 255)
    LogoSide_Name7.Font = Enum.Font.GothamBold
    LogoSide_Name7.TextSize = 16

    -- Tab System
    local TabBar_Name7 = Instance.new("ScrollingFrame")
    TabBar_Name7.Parent = MainFrame_Name7
    TabBar_Name7.Size = UDim2.new(0.78, 0, 0, 25)
    TabBar_Name7.Position = UDim2.new(0.02, 0, 0.1, 0)
    TabBar_Name7.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabBar_Name7.ScrollBarThickness = 0

    local EditorContainer_Name7 = Instance.new("Frame")
    EditorContainer_Name7.Parent = MainFrame_Name7
    EditorContainer_Name7.Position = UDim2.new(0.02, 0, 0.2, 0)
    EditorContainer_Name7.Size = UDim2.new(0.78, 0, 0.45, 0)
    EditorContainer_Name7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

    local CurrentTab_Name7 = nil
    local function CreateTab_Name7(name)
        local TabBtn_Name7 = Instance.new("TextButton")
        local NewEditor_Name7 = Instance.new("TextBox")
        TabBtn_Name7.Parent = TabBar_Name7
        TabBtn_Name7.Size = UDim2.new(0, 80, 1, -2)
        TabBtn_Name7.Text = name
        TabBtn_Name7.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        TabBtn_Name7.TextColor3 = Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", TabBtn_Name7)
        
        NewEditor_Name7.Parent = EditorContainer_Name7
        NewEditor_Name7.Size = UDim2.new(0.96, 0, 0.94, 0)
        NewEditor_Name7.Position = UDim2.new(0.02, 0, 0.03, 0)
        NewEditor_Name7.Text = "-- Welcome to Name-7\nprint('System Ready')"
        NewEditor_Name7.MultiLine = true
        NewEditor_Name7.Visible = false
        NewEditor_Name7.TextColor3 = Color3.fromRGB(0, 0, 0)
        NewEditor_Name7.Font = Enum.Font.Code
        NewEditor_Name7.ClearTextOnFocus = false
        NewEditor_Name7.TextXAlignment = Enum.TextXAlignment.Left
        NewEditor_Name7.TextYAlignment = Enum.TextYAlignment.Top

        TabBtn_Name7.MouseButton1Click:Connect(function()
            if CurrentTab_Name7 then CurrentTab_Name7.Editor.Visible = false end
            NewEditor_Name7.Visible = true
            CurrentTab_Name7 = {Button = TabBtn_Name7, Editor = NewEditor_Name7}
        end)
        if not CurrentTab_Name7 then NewEditor_Name7.Visible = true; CurrentTab_Name7 = {Button = TabBtn_Name7, Editor = NewEditor_Name7} end
    end

    -- Sidebar Icons
    local icons_Name7 = {"💾", "W", "A", "📂", "➕"}
    for i, icon in ipairs(icons_Name7) do
        local b_Name7 = Instance.new("TextButton")
        b_Name7.Parent = Sidebar_Name7
        b_Name7.Text = icon
        b_Name7.Size = UDim2.new(0, 35, 0, 25)
        b_Name7.Position = UDim2.new(0.15, 0, 0, 65 + (i * 32))
        b_Name7.BackgroundColor3 = Color3.fromRGB(66, 170, 150)
        b_Name7.TextColor3 = Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", b_Name7)
        if icon == "➕" then b_Name7.MouseButton1Click:Connect(function() CreateTab_Name7("Script " .. #TabBar_Name7:GetChildren()) end) end
    end

    -- Control Buttons
    local function makeBtn_Name7(name, x, func)
        local b_Name7 = Instance.new("TextButton")
        b_Name7.Parent = MainFrame_Name7
        b_Name7.Size = UDim2.new(0.25, 0, 0, 28)
        b_Name7.Position = UDim2.new(x, 0, 0.68, 0)
        b_Name7.Text = name
        b_Name7.BackgroundColor3 = Color3.fromRGB(102, 204, 185)
        b_Name7.Font = Enum.Font.SourceSansBold
        b_Name7.MouseButton1Click:Connect(func)
        Instance.new("UICorner", b_Name7)
    end
    makeBtn_Name7("Open", 0.02, function() end)
    makeBtn_Name7("Execute", 0.285, function() if CurrentTab_Name7 then loadstring(CurrentTab_Name7.Editor.Text)() end end)
    makeBtn_Name7("Clear", 0.55, function() if CurrentTab_Name7 then CurrentTab_Name7.Editor.Text = "" end end)

    local ConsoleFrame_Name7 = Instance.new("Frame")
    ConsoleFrame_Name7.Parent = MainFrame_Name7
    ConsoleFrame_Name7.Position = UDim2.new(0.02, 0, 0.8, 0)
    ConsoleFrame_Name7.Size = UDim2.new(0.78, 0, 0.16, 0)
    ConsoleFrame_Name7.BackgroundColor3 = Color3.fromRGB(200, 200, 200)

    local ConsoleLog_Name7 = Instance.new("TextLabel")
    ConsoleLog_Name7.Parent = ConsoleFrame_Name7
    ConsoleLog_Name7.Size = UDim2.new(1, -10, 1, 0)
    ConsoleLog_Name7.Position = UDim2.new(0, 5, 0, 0)
    ConsoleLog_Name7.Text = "[02:13:00]: Injected by Name-7\n[SYSTEM]: Chat 'Name-7 close' to hide"
    ConsoleLog_Name7.TextColor3 = Color3.fromRGB(0, 0, 0)
    ConsoleLog_Name7.TextXAlignment = Enum.TextXAlignment.Left
    ConsoleLog_Name7.Font = Enum.Font.Code
    ConsoleLog_Name7.TextSize = 9

    CreateTab_Name7("Script 1")

    -- SISTEM CHAT COMMAND (Name-7)
    game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
        if msg:lower() == "name-7 open" then
            MainFrame_Name7.Visible = true
        elseif msg:lower() == "name-7 close" then
            MainFrame_Name7.Visible = false
        end
    end)
end

-- 3. LOGIN GUI (RENAME KE Name-7)
local LoginFrame_Name7 = Instance.new("Frame")
LoginFrame_Name7.Parent = ScreenGui_Name7
LoginFrame_Name7.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LoginFrame_Name7.Position = UDim2.new(0.5, -140, 0.5, -115)
LoginFrame_Name7.Size = UDim2.new(0, 280, 0, 235)
LoginFrame_Name7.Active = true
LoginFrame_Name7.Draggable = true
Instance.new("UIStroke", LoginFrame_Name7).Color = Color3.fromRGB(60, 60, 60)

local LoginLogo_Name7 = Instance.new("TextLabel")
LoginLogo_Name7.Parent = LoginFrame_Name7
LoginLogo_Name7.Text = "NAME-7"
LoginLogo_Name7.TextColor3 = Color3.fromRGB(102, 204, 185)
LoginLogo_Name7.TextSize = 35
LoginLogo_Name7.Font = Enum.Font.GothamBold
LoginLogo_Name7.Size = UDim2.new(1, 0, 0, 60)

local UserIn_Name7 = Instance.new("TextBox")
UserIn_Name7.Parent = LoginFrame_Name7
UserIn_Name7.Size = UDim2.new(0.8, 0, 0, 32)
UserIn_Name7.Position = UDim2.new(0.1, 0, 0.35, 0)
UserIn_Name7.PlaceholderText = "Username"
UserIn_Name7.BackgroundColor3 = Color3.fromRGB(66, 170, 150)
Instance.new("UICorner", UserIn_Name7)

local PassIn_Name7 = Instance.new("TextBox")
PassIn_Name7.Parent = LoginFrame_Name7
PassIn_Name7.Size = UDim2.new(0.8, 0, 0, 32)
PassIn_Name7.Position = UDim2.new(0.1, 0, 0.52, 0)
PassIn_Name7.PlaceholderText = "Password"
PassIn_Name7.BackgroundColor3 = Color3.fromRGB(66, 170, 150)
Instance.new("UICorner", PassIn_Name7)

local Submit_Name7 = Instance.new("TextButton")
Submit_Name7.Parent = LoginFrame_Name7
Submit_Name7.Size = UDim2.new(0.4, 0, 0, 32)
Submit_Name7.Position = UDim2.new(0.3, 0, 0.72, 0)
Submit_Name7.Text = "Submit"
Submit_Name7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Submit_Name7)

local Footer_Name7 = Instance.new("TextLabel")
Footer_Name7.Parent = LoginFrame_Name7
Footer_Name7.Position = UDim2.new(0.05, 0, 0.88, 0)
Footer_Name7.Size = UDim2.new(0.9, 0, 0, 25)
Footer_Name7.Text = "HACKER: ADAM\nPROJECT: Name-7"
Footer_Name7.TextColor3 = Color3.fromRGB(200, 200, 200)
Footer_Name7.TextSize = 10
Footer_Name7.TextXAlignment = Enum.TextXAlignment.Left

Submit_Name7.MouseButton1Click:Connect(function()
    if UserDatabase_Name7[UserIn_Name7.Text] == PassIn_Name7.Text then
        LoginFrame_Name7:Destroy()
        BuildExecutor_Name7()
    else
        Submit_Name7.Text = "FAILED"
        task.wait(1)
        Submit_Name7.Text = "Submit"
    end
end)
