local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- GUI Toggle Variables
local isAimAssistEnabled = false
local guiEnabled = false
local aimAssistDistance = 50 -- Default distance for aim assist

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
