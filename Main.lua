--[[
    ADAM X RC7 - TEAM EDITION (5 ACCOUNTS)
    COMMANDS: 
    "RC7 open"  - Munculkan Menu
    "RC7 close" - Sembunyikan Menu
]]

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "AdamRC7_Team"

-- 1. DATABASE DENGAN 5 AKAUN
local UserDatabase = {
    ["adam123"] = "pass123",
    ["hacker1"] = "hack77",
    ["user2"] = "team99",
    ["admin"] = "root123",
    ["guest"] = "guest123"
}

local MainFrame = nil 

-- 2. FUNGSI UTAMA EXECUTOR
local function BuildExecutor()
    MainFrame = Instance.new("Frame")
    MainFrame.Parent = ScreenGui
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainFrame.Position = UDim2.new(0.5, -190, 0.5, -140)
    MainFrame.Size = UDim2.new(0, 380, 0, 280)
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Visible = true 
    Instance.new("UIStroke", MainFrame).Color = Color3.fromRGB(60, 60, 60)

    -- Top Bar
    local TopBar = Instance.new("Frame")
    TopBar.Parent = MainFrame
    TopBar.Size = UDim2.new(1, 0, 0, 25)
    TopBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    
    local Title = Instance.new("TextLabel")
    Title.Parent = TopBar
    Title.Text = "  ADAM X RC7"
    Title.TextColor3 = Color3.fromRGB(50, 50, 50)
    Title.TextSize = 14
    Title.Font = Enum.Font.SourceSansBold
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- Sidebar
    local Sidebar = Instance.new("Frame")
    Sidebar.Parent = MainFrame
    Sidebar.Size = UDim2.new(0.18, 0, 0.9, 0)
    Sidebar.Position = UDim2.new(0.82, 0, 0.1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

    local LogoSide = Instance.new("TextLabel")
    LogoSide.Parent = Sidebar
    LogoSide.Text = "R\nC\n7"
    LogoSide.Size = UDim2.new(1, 0, 0, 60)
    LogoSide.TextColor3 = Color3.fromRGB(255, 255, 255)
    LogoSide.Font = Enum.Font.GothamBold
    LogoSide.TextSize = 20

    -- Tab System
    local TabBar = Instance.new("ScrollingFrame")
    TabBar.Parent = MainFrame
    TabBar.Size = UDim2.new(0.78, 0, 0, 25)
    TabBar.Position = UDim2.new(0.02, 0, 0.1, 0)
    TabBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    TabBar.ScrollBarThickness = 0

    local EditorContainer = Instance.new("Frame")
    EditorContainer.Parent = MainFrame
    EditorContainer.Position = UDim2.new(0.02, 0, 0.2, 0)
    EditorContainer.Size = UDim2.new(0.78, 0, 0.45, 0)
    EditorContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

    local CurrentTab = nil
    local function CreateTab(name)
        local TabBtn = Instance.new("TextButton")
        local NewEditor = Instance.new("TextBox")
        TabBtn.Parent = TabBar
        TabBtn.Size = UDim2.new(0, 80, 1, -2)
        TabBtn.Text = name
        TabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", TabBtn)
        
        NewEditor.Parent = EditorContainer
        NewEditor.Size = UDim2.new(0.96, 0, 0.94, 0)
        NewEditor.Position = UDim2.new(0.02, 0, 0.03, 0)
        NewEditor.Text = "-- Welcome to ADAM X RC7\nprint('System Ready')"
        NewEditor.MultiLine = true
        NewEditor.Visible = false
        NewEditor.TextColor3 = Color3.fromRGB(0, 0, 0)
        NewEditor.Font = Enum.Font.Code
        NewEditor.ClearTextOnFocus = false
        NewEditor.TextXAlignment = Enum.TextXAlignment.Left
        NewEditor.TextYAlignment = Enum.TextYAlignment.Top

        TabBtn.MouseButton1Click:Connect(function()
            if CurrentTab then CurrentTab.Editor.Visible = false end
            NewEditor.Visible = true
            CurrentTab = {Button = TabBtn, Editor = NewEditor}
        end)
        if not CurrentTab then NewEditor.Visible = true; CurrentTab = {Button = TabBtn, Editor = NewEditor} end
    end

    -- Sidebar Icons (Tanpa Setting)
    local icons = {"💾", "W", "A", "📂", "➕"}
    for i, icon in ipairs(icons) do
        local b = Instance.new("TextButton")
        b.Parent = Sidebar
        b.Text = icon
        b.Size = UDim2.new(0, 35, 0, 25)
        b.Position = UDim2.new(0.15, 0, 0, 65 + (i * 32))
        b.BackgroundColor3 = Color3.fromRGB(66, 170, 150)
        b.TextColor3 = Color3.fromRGB(255, 255, 255)
        Instance.new("UICorner", b)
        if icon == "➕" then b.MouseButton1Click:Connect(function() CreateTab("Script " .. #TabBar:GetChildren()) end) end
    end

    -- Control Buttons
    local function makeBtn(name, x, func)
        local b = Instance.new("TextButton")
        b.Parent = MainFrame
        b.Size = UDim2.new(0.25, 0, 0, 28)
        b.Position = UDim2.new(x, 0, 0.68, 0)
        b.Text = name
        b.BackgroundColor3 = Color3.fromRGB(102, 204, 185)
        b.Font = Enum.Font.SourceSansBold
        b.MouseButton1Click:Connect(func)
        Instance.new("UICorner", b)
    end
    makeBtn("Open", 0.02, function() end)
    makeBtn("Execute", 0.285, function() if CurrentTab then loadstring(CurrentTab.Editor.Text)() end end)
    makeBtn("Clear", 0.55, function() if CurrentTab then CurrentTab.Editor.Text = "" end end)

    local ConsoleFrame = Instance.new("Frame")
    ConsoleFrame.Parent = MainFrame
    ConsoleFrame.Position = UDim2.new(0.02, 0, 0.8, 0)
    ConsoleFrame.Size = UDim2.new(0.78, 0, 0.16, 0)
    ConsoleFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)

    local ConsoleLog = Instance.new("TextLabel")
    ConsoleLog.Parent = ConsoleFrame
    ConsoleLog.Size = UDim2.new(1, -10, 1, 0)
    ConsoleLog.Position = UDim2.new(0, 5, 0, 0)
    ConsoleLog.Text = "[11:24:17]: Injected by ADAM\n[SYSTEM]: Chat 'RC7 close' to hide"
    ConsoleLog.TextColor3 = Color3.fromRGB(0, 0, 0)
    ConsoleLog.TextXAlignment = Enum.TextXAlignment.Left
    ConsoleLog.Font = Enum.Font.Code
    ConsoleLog.TextSize = 9

    CreateTab("Script 1")

    -- SISTEM CHAT COMMAND (OPEN / CLOSE)
    game:GetService("Players").LocalPlayer.Chatted:Connect(function(msg)
        if msg:lower() == "rc7 open" then
            MainFrame.Visible = true
        elseif msg:lower() == "rc7 close" then
            MainFrame.Visible = false
        end
    end)
end

-- 3. LOGIN GUI
local LoginFrame = Instance.new("Frame")
LoginFrame.Parent = ScreenGui
LoginFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LoginFrame.Position = UDim2.new(0.5, -140, 0.5, -115)
LoginFrame.Size = UDim2.new(0, 280, 0, 235)
LoginFrame.Active = true
LoginFrame.Draggable = true
Instance.new("UIStroke", LoginFrame).Color = Color3.fromRGB(60, 60, 60)

local LoginLogo = Instance.new("TextLabel")
LoginLogo.Parent = LoginFrame
LoginLogo.Text = "ADAM"
LoginLogo.TextColor3 = Color3.fromRGB(102, 204, 185)
LoginLogo.TextSize = 35
LoginLogo.Font = Enum.Font.GothamBold
LoginLogo.Size = UDim2.new(1, 0, 0, 60)

local UserIn = Instance.new("TextBox")
UserIn.Parent = LoginFrame
UserIn.Size = UDim2.new(0.8, 0, 0, 32)
UserIn.Position = UDim2.new(0.1, 0, 0.35, 0)
UserIn.PlaceholderText = "Username"
UserIn.BackgroundColor3 = Color3.fromRGB(66, 170, 150)
Instance.new("UICorner", UserIn)

local PassIn = Instance.new("TextBox")
PassIn.Parent = LoginFrame
PassIn.Size = UDim2.new(0.8, 0, 0, 32)
PassIn.Position = UDim2.new(0.1, 0, 0.52, 0)
PassIn.PlaceholderText = "Password"
PassIn.BackgroundColor3 = Color3.fromRGB(66, 170, 150)
Instance.new("UICorner", PassIn)

local Submit = Instance.new("TextButton")
Submit.Parent = LoginFrame
Submit.Size = UDim2.new(0.4, 0, 0, 32)
Submit.Position = UDim2.new(0.3, 0, 0.72, 0)
Submit.Text = "Submit"
Submit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Submit)

local Footer = Instance.new("TextLabel")
Footer.Parent = LoginFrame
Footer.Position = UDim2.new(0.05, 0, 0.88, 0)
Footer.Size = UDim2.new(0.9, 0, 0, 25)
Footer.Text = "HACKER: ADAM\nGRAPHICS: ADAM"
Footer.TextColor3 = Color3.fromRGB(200, 200, 200)
Footer.TextSize = 10
Footer.TextXAlignment = Enum.TextXAlignment.Left

Submit.MouseButton1Click:Connect(function()
    if UserDatabase[UserIn.Text] == PassIn.Text then
        LoginFrame:Destroy()
        BuildExecutor()
    else
        Submit.Text = "FAILED"
        task.wait(1)
        Submit.Text = "Submit"
    end
end)
