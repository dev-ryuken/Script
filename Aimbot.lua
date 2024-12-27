-- Create the main GUI container for aim assist
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AimAssistUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0.25, 0, 0.1, 0)  -- Smaller size (25% width, 10% height)
MainFrame.Position = UDim2.new(0.375, 0, 0.1, 0)  -- Centered horizontally on the screen
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
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

-- Add a slider for adjusting aim assist distance
local DistanceSlider = Instance.new("TextLabel")
DistanceSlider.Size = UDim2.new(1, 0, 0.3, 0)  -- Label takes 30% of the height
DistanceSlider.Position = UDim2.new(0, 0, 0.3, 0)  -- Position below the toggle button
DistanceSlider.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Red border
DistanceSlider.Text = "Aim Assist Distance: 10"
DistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
DistanceSlider.TextSize = 18
DistanceSlider.TextScaled = true
DistanceSlider.Parent = MainFrame

local Slider = Instance.new("Slider")
Slider.Size = UDim2.new(1, -20, 0, 30) -- Fit width within screen (minus some space)
Slider.Position = UDim2.new(0, 10, 0, 60) -- Position below the label
Slider.MinValue = 0
Slider.MaxValue = 20
Slider.Value = 10
Slider.Parent = MainFrame

Slider.Changed:Connect(function(newValue)
    DistanceSlider.Text = "Aim Assist Distance: " .. math.floor(newValue)
    -- You can apply this value to adjust the aim assist distance in your game
end)

-- Function to find the closest target (Player or NPC)
local function getClosestTarget()
    local closestTarget = nil
    local closestDistance = math.huge
    local player = game.Players.LocalPlayer
    local aimAssistDistance = Slider.Value -- Distance from slider

    -- Check NPCs (Ghouls)
    for _, npc in pairs(workspace:GetChildren()) do
        if npc:FindFirstChild("HumanoidRootPart") then
            local humanoid = npc:FindFirstChild("Humanoid")
            if humanoid and humanoid.Health > 0 and (npc:FindFirstChild("Tag") and npc.Tag.Value == "G") then
                local distance = (npc.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude
                if distance <= aimAssistDistance and distance < closestDistance then
                    closestTarget = npc
                    closestDistance = distance
                end
            end
        end
    end

    -- Check Players (if applicable)
    for _, target in pairs(game.Players:GetChildren()) do
        if target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
            local distance = (target.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).magnitude
            if distance <= aimAssistDistance and distance < closestDistance then
                closestTarget = target.Character
                closestDistance = distance
            end
        end
    end

    return closestTarget
end

-- Function to assist in aiming towards the closest target
local function aimAssist()
    local target = getClosestTarget()
    if target then
        -- Rotate player to face the target
        local targetPosition = target.HumanoidRootPart.Position
        local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        local direction = (targetPosition - playerPosition).unit
        local lookAt = CFrame.new(playerPosition, targetPosition)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(playerPosition, targetPosition)
    end
end

-- Aim assist loop
while true do
    wait(0.1)  -- 0.1 second interval
    if guiVisible then
        aimAssist()
    end
end
