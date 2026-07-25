-- ==================== KEY SYSTEM ====================
local CORRECT_KEY = "TURKEYMM2"  -- Change this to your desired key
local scriptToExecute = loadstring(game:HttpGet("https://raw.githubusercontent.com/TerminalGames26/mainnnn/refs/heads/main/Mm2.lua", true))

local keyGui = Instance.new("ScreenGui")
keyGui.ResetOnSpawn = false
keyGui.DisplayOrder = 1000000000
keyGui.Parent = game:GetService("CoreGui")

local keyFrame = Instance.new("Frame")
keyFrame.Size = UDim2.new(0, 280, 0, 180)
keyFrame.Position = UDim2.new(0.5, -140, 0.5, -90)
keyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
keyFrame.BorderSizePixel = 0
keyFrame.Parent = keyGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = keyFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(80, 80, 255)
stroke.Thickness = 2
stroke.Parent = keyFrame

-- Discord Button (Top Left)
local discordBtn = Instance.new("ImageButton")
discordBtn.Size = UDim2.new(0, 28, 0, 28)
discordBtn.Position = UDim2.new(0, 10, 0, 10)
discordBtn.BackgroundTransparency = 1
discordBtn.Image = "rbxassetid://10734950309" -- Discord logo
discordBtn.Parent = keyFrame

discordBtn.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/Um77QHWBEM")
end)

-- Close Button (Top Right)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -38, 0, 10)
closeBtn.BackgroundTransparency = 1
closeBtn.Text = "✕"
closeBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
closeBtn.TextSize = 20
closeBtn.Font = Enum.Font.GothamBold
closeBtn.Parent = keyFrame

closeBtn.MouseButton1Click:Connect(function()
    keyGui:Destroy()
end)

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -80, 0, 30)
title.Position = UDim2.new(0, 45, 0, 8)
title.BackgroundTransparency = 1
title.Text = "Key System"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.FredokaOne
title.TextSize = 18
title.Parent = keyFrame

-- Key TextBox
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.85, 0, 0, 35)
keyBox.Position = UDim2.new(0.075, 0, 0, 55)
keyBox.PlaceholderText = "Key"
keyBox.Text = ""
keyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.Font = Enum.Font.SourceSans
keyBox.TextSize = 16
keyBox.ClearTextOnFocus = true
keyBox.Parent = keyFrame

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 8)
boxCorner.Parent = keyBox

-- Submit Button
local submitBtn = Instance.new("TextButton")
submitBtn.Size = UDim2.new(0.85, 0, 0, 40)
submitBtn.Position = UDim2.new(0.075, 0, 0, 105)
submitBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
submitBtn.Text = "Submit"
submitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
submitBtn.Font = Enum.Font.FredokaOne
submitBtn.TextSize = 16
submitBtn.Parent = keyFrame

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 8)
submitCorner.Parent = submitBtn

-- Function to execute the loaded script
local function executeScript()
    if scriptToExecute then
        local success, result = pcall(scriptToExecute)
        
        if not success then
            warn("Error executing script: " .. tostring(result))
        end
    end
end

submitBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == CORRECT_KEY then
        keyGui:Destroy()
        task.spawn(executeScript)
    else
        submitBtn.Text = "Invalid Key!"
        submitBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.delay(1.5, function()
            if submitBtn and submitBtn.Parent then
                submitBtn.Text = "Submit"
                submitBtn.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
            end
        end)
    end
end)

print("Key system loaded. Waiting for correct key...")
