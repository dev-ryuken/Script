local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- GUI Toggle Variables
local isAimAssistEnabled = false
local guiEnabled = false
local aimAssistDistance = 50 -- Default distance for aim assist
local showPlayerHitbox = false
local showPlayerInfo = false

-- GUI Setup
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.ResetOnSpawn = false

local toggleButton = Instance.new("TextButton")
toggleButton.Parent = screenGui
toggleButton.Size = UDim2.new(0, 200, 0, 50)
toggleButton.Position = UDim2.new(0.5, -100, 0, 20) -- Default position: Top Center
toggleButton.Text = "Aim Assist: OFF"
toggleButton.TextScaled = true

-- GUI Style
toggleButton.BackgroundColor3 = Color3.new(0, 0, 0) -- Black background
toggleButton.TextColor3 = Color3.new(1, 1, 1) -- White font
toggleButton.BorderColor3 = Color3.new(1, 0, 0) -- Red border
toggleButton.BorderSizePixel = 2

-- Slider for Aim Assist Distance
local distanceSlider = Instance.new("TextBox")
distanceSlider.Parent = screenGui
distanceSlider.Size = UDim2.new(0, 200, 0, 50)
distanceSlider.Position = UDim2.new(0.5, -100, 0, 80) -- Positioned below the toggle button
distanceSlider.Text = "Distance: " .. aimAssistDistance
distanceSlider.TextScaled = true
distanceSlider.BackgroundColor3 = Color3.new(0, 0, 0)
distanceSlider.TextColor3 = Color3.new(1, 1, 1)
distanceSlider.BorderColor3 = Color3.new(1, 0, 0)
distanceSlider.BorderSizePixel = 2

-- Hitbox Toggle Button
local hitboxToggleButton = Instance.new("TextButton")
hitboxToggleButton.Parent = screenGui
hitboxToggleButton.Size = UDim2.new(0, 200, 0, 50)
hitboxToggleButton.Position = UDim2.new(0.5, -100, 0, 140) -- Positioned below the distance slider
hitboxToggleButton.Text = "Hitbox: OFF"
hitboxToggleButton.TextScaled = true
hitboxToggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
hitboxToggleButton.TextColor3 = Color3.new(1, 1, 1)
hitboxToggleButton.BorderColor3 = Color3.new(1, 0, 0)
hitboxToggleButton.BorderSizePixel = 2

-- Info Toggle Button
local infoToggleButton = Instance.new("TextButton")
infoToggleButton.Parent = screenGui
infoToggleButton.Size = UDim2.new(0, 200, 0, 50)
infoToggleButton.Position = UDim2.new(0.5, -100, 0, 200) -- Positioned below the hitbox toggle
infoToggleButton.Text = "Player Info: OFF"
infoToggleButton.TextScaled = true
infoToggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
infoToggleButton.TextColor3 = Color3.new(1, 1, 1)
infoToggleButton.BorderColor3 = Color3.new(1, 0, 0)
infoToggleButton.BorderSizePixel = 2

-- Player Info Display
local playerInfoText = Instance.new("TextLabel")
playerInfoText.Parent = screenGui
playerInfoText.Size = UDim2.new(0, 200, 0, 50)
playerInfoText.Position = UDim2.new(0.5, -100, 0, 260) -- Positioned below the info toggle
playerInfoText.Text = ""
playerInfoText.TextScaled = true
playerInfoText.BackgroundColor3 = Color3.new(0, 0, 0)
playerInfoText.TextColor3 = Color3.new(1, 1, 1)
playerInfoText.BorderColor3 = Color3.new(1, 0, 0)
playerInfoText.BorderSizePixel = 2
playerInfoText.Visible = false -- Initially hidden

-- Dragging Logic for GUI
local dragging = false
local dragInput, mousePos, framePos

toggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragInput = input
        mousePos = input.Position
        framePos = toggleButton.Position
    end
end)

toggleButton.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - mousePos
        toggleButton.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale, framePos.Y.Offset + delta.Y)
    end
end)

toggleButton.InputEnded:Connect(function(input)
    if input == dragInput then
        dragging = false
    end
end)

-- Toggle Aim Assist on Button Click
toggleButton.MouseButton1Click:Connect(function()
    isAimAssistEnabled = not isAimAssistEnabled
    toggleButton.Text = "Aim Assist: " .. (isAimAssistEnabled and "ON" or "OFF")
end)

-- Update Distance Slider Value
distanceSlider.FocusLost:Connect(function()
    local newValue = tonumber(distanceSlider.Text)
    if newValue and newValue > 0 then
        aimAssistDistance = newValue
        distanceSlider.Text = "Distance: " .. aimAssistDistance
    else
        distanceSlider.Text = "Invalid Input"
    end
end)

-- Toggle Hitbox Display
hitboxToggleButton.MouseButton1Click:Connect(function()
    showPlayerHitbox = not showPlayerHitbox
    hitboxToggleButton.Text = "Hitbox: " .. (showPlayerHitbox and "ON" or "OFF")
end)

-- Toggle Player Info Display
infoToggleButton.MouseButton1Click:Connect(function()
    showPlayerInfo = not showPlayerInfo
    infoToggleButton.Text = "Player Info: " .. (showPlayerInfo and "ON" or "OFF")
    playerInfoText.Visible = showPlayerInfo
end)

-- Toggle GUI Visibility with F8
UserInputService.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F8 then
        guiEnabled = not guiEnabled
        screenGui.Enabled = guiEnabled
    end
end)

-- Get Closest Target Based on Aim Assist Distance
local function getClosestTarget()
    local closestDistance = math.huge
    local closestPlayer = nil

    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos = v.Character.HumanoidRootPart.Position
            local distance = (targetPos - player.Character.HumanoidRootPart.Position).Magnitude

            if distance < closestDistance and distance < aimAssistDistance then
                closestDistance = distance
                closestPlayer = v
            end
        end
    end

    return closestPlayer
end

-- Aim Assist Logic
RunService.RenderStepped:Connect(function()
    if isAimAssistEnabled then
        local closestPlayer = getClosestTarget()
        if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetPart = closestPlayer.Character.HumanoidRootPart
            local targetPosition = targetPart.Position

            local camera = workspace.CurrentCamera
            camera.CFrame = CFrame.new(camera.CFrame.Position, targetPosition)
        end
    end
end)

-- Display Player Info
RunService.RenderStepped:Connect(function()
    if showPlayerInfo then
        local targetPlayer = getClosestTarget()

        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
            local humanoid = targetPlayer.Character.Humanoid
            local health = humanoid.Health
            local level = humanoid:GetAttribute("Level") or 0  -- Assuming level is stored as an attribute on the humanoid

            local distance = (targetPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
            playerInfoText.Text = string.format("Health: %.0f\nLevel: %d\nDistance: %.0f", health, level, distance)
        else
            playerInfoText.Text = "No target found"
        end
    end
end)

-- Draw Hitbox
RunService.RenderStepped:Connect(function()
    if showPlayerHitbox then
        for _, v in ipairs(Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local hitboxPart = Instance.new("Part")
                hitboxPart.Size = Vector3.new(4, 4, 4)  -- Example size, adjust as needed
                hitboxPart.Position = v.Character.HumanoidRootPart.Position
                hitboxPart.Anchored = true
                hitboxPart.CanCollide = false
                hitboxPart.Parent = workspace
                hitboxPart.BrickColor = BrickColor.new("Bright red")  -- Red color for visibility
                game.Debris:AddItem(hitboxPart, 0.1)  -- Clean up after 0.1 seconds
            end
        end
    end
end)
