-- Create the main GUI container for aim assist
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AimAssistUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.25, 0, 0.1, 0)  -- Smaller size (25% width, 10% height)
MainFrame.Position = UDim2.new(0.375, 0, 0.1, 0)  -- Centered horizontally on the screen
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = true
MainFrame.Parent = ScreenGui

-- Create a toggle button to show/hide the GUI
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(1, 0, 0.3, 0)  -- Button takes up 30% height of the frame
ToggleButton.Position = UDim2.new(0, 0, 0, 0)
ToggleButton.Text = "Hide GUI"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ToggleButton.TextSize = 18
ToggleButton.TextScaled = true
ToggleButton.Parent = MainFrame

-- GUI visibility state
local guiVisible = true
ToggleButton.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    MainFrame.Visible = guiVisible
    ToggleButton.Text = guiVisible and "Hide GUI" or "Show GUI"
end)

-- Add a label for Aim Assist Strength
local AimStrengthLabel = Instance.new("TextLabel")
AimStrengthLabel.Size = UDim2.new(1, 0, 0.3, 0)  -- Label takes 30% of the height
AimStrengthLabel.Position = UDim2.new(0, 0, 0.3, 0)  -- Position below the toggle button
AimStrengthLabel.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red border
AimStrengthLabel.Text = "Aim Assist Strength: 0.5"
AimStrengthLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
AimStrengthLabel.TextSize = 18
AimStrengthLabel.TextScaled = true
AimStrengthLabel.Parent = MainFrame

-- Variable for Aim Assist strength
local aimStrength = 0.5  -- Default aim assist strength value

-- Function to increase/decrease Aim Assist strength
local function changeAimStrength(value)
    aimStrength = value
    AimStrengthLabel.Text = "Aim Assist Strength: " .. string.format("%.2f", aimStrength)
end

-- Add buttons to control Aim Assist Strength
local increaseButton = Instance.new("TextButton")
increaseButton.Size = UDim2.new(0.5, 0, 0.3, 0)
increaseButton.Position = UDim2.new(0, 0, 0.6, 0)
increaseButton.Text = "Increase Strength"
increaseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
increaseButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
increaseButton.TextSize = 14
increaseButton.Parent = MainFrame
increaseButton.MouseButton1Click:Connect(function()
    changeAimStrength(math.min(aimStrength + 0.1, 1))  -- Max strength of 1
end)

local decreaseButton = Instance.new("TextButton")
decreaseButton.Size = UDim2.new(0.5, 0, 0.3, 0)
decreaseButton.Position = UDim2.new(0.5, 0, 0.6, 0)
decreaseButton.Text = "Decrease Strength"
decreaseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
decreaseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
decreaseButton.TextSize = 14
decreaseButton.Parent = MainFrame
decreaseButton.MouseButton1Click:Connect(function()
    changeAimStrength(math.max(aimStrength - 0.1, 0))  -- Min strength of 0
end)

-- Function to find the closest player
local function getClosestPlayer()
    local closestPlayer = nil
    local closestDistance = math.huge
    local player = game.Players.LocalPlayer
    local aimAssistDistance = 20  -- You can adjust this range if needed

    -- Check Players
    for _, target in pairs(game.Players:GetChildren()) do
        if target.Character and target.Character:FindFirstChild("HumanoidRootPart") and target ~= player then
            local distance = (target.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude
            if distance <= aimAssistDistance and distance < closestDistance then
                closestPlayer = target.Character
                closestDistance = distance
            end
        end
    end

    return closestPlayer
end

-- Function to assist in aiming towards the closest player
local function aimAssist()
    local target = getClosestPlayer()
    if target then
        -- Calculate the direction and apply the aim assist
        local targetPosition = target.HumanoidRootPart.Position
        local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        local direction = (targetPosition - playerPosition).unit
        local lookAt = CFrame.new(playerPosition, targetPosition)
        
        -- Apply aim assist strength by adjusting the angle of the aim
        local currentCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local newCFrame = currentCFrame:Lerp(lookAt, aimStrength)  -- Lerp between current and target position based on aim strength
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = newCFrame
    end
end

-- Aim assist loop
while true do
    wait(0.1)  -- 0.1 second interval
    if guiVisible then
        aimAssist()
    end
end
