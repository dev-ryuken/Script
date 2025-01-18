local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- GUI and Aim Assist Variables
local isAimAssistEnabled = false
local guiEnabled = false
local aimAssistDistance = 50 -- Default distance for aim assist
local screenGui = nil
local aimRing = nil

-- Ensure old GUI is destroyed if it exists
if screenGui then
    screenGui:Destroy()
end

-- Create GUI
local function createGui()
    -- Ensure the GUI doesn't already exist
    if screenGui then
        screenGui:Destroy() -- Destroy existing GUI if it exists
    end

    -- GUI Setup
    screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.CoreGui
    screenGui.ResetOnSpawn = false

    -- Main Frame
    local mainFrame = Instance.new("Frame")
    mainFrame.Parent = screenGui
    mainFrame.Size = UDim2.new(0, 150, 0, 120)
    mainFrame.Position = UDim2.new(0.5, -75, 0, 20)
    mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    mainFrame.BorderSizePixel = 2
    mainFrame.BorderColor3 = Color3.new(1, 0, 0)

    -- Toggle Button for Aim Assist
    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = mainFrame
    toggleButton.Size = UDim2.new(1, 0, 0.3, 0)
    toggleButton.Text = "Aim Assist: OFF"
    toggleButton.TextScaled = true
    toggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
    toggleButton.TextColor3 = Color3.new(1, 1, 1)
    toggleButton.BorderColor3 = Color3.new(1, 0, 0)

    -- Distance Label and Slider
    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Parent = mainFrame
    distanceLabel.Size = UDim2.new(1, 0, 0.3, 0)
    distanceLabel.Position = UDim2.new(0, 0, 0.4, 0)
    distanceLabel.Text = "Dist: " .. aimAssistDistance
    distanceLabel.TextScaled = true
    distanceLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    distanceLabel.TextColor3 = Color3.new(1, 1, 1)
    distanceLabel.BorderColor3 = Color3.new(1, 0, 0)

    -- Slider for Distance (using TextBox for simplicity)
    local distanceSlider = Instance.new("TextBox")
    distanceSlider.Parent = mainFrame
    distanceSlider.Size = UDim2.new(1, 0, 0.3, 0)
    distanceSlider.Position = UDim2.new(0, 0, 0.7, 0)
    distanceSlider.Text = tostring(aimAssistDistance)
    distanceSlider.TextScaled = true
    distanceSlider.BackgroundColor3 = Color3.new(0, 0, 0)
    distanceSlider.TextColor3 = Color3.new(1, 1, 1)
    distanceSlider.BorderColor3 = Color3.new(1, 0, 0)

    -- Add Ring for Aim Assist
    aimRing = Instance.new("Frame")
    aimRing.Parent = screenGui
    aimRing.AnchorPoint = Vector2.new(0.5, 0.5)
    aimRing.Position = UDim2.new(0.5, 0, 0.5, 0)
    aimRing.Size = UDim2.new(0, aimAssistDistance * 2, 0, aimAssistDistance * 2)
    aimRing.BackgroundTransparency = 1
    aimRing.Visible = false
    aimRing.ZIndex = 10

    local ringStroke = Instance.new("UIStroke")
    ringStroke.Parent = aimRing
    ringStroke.Thickness = 2
    ringStroke.Color = Color3.new(1, 0, 0)

    -- Update Distance Slider Value
    distanceSlider.FocusLost:Connect(function()
        local newValue = tonumber(distanceSlider.Text)
        if newValue and newValue > 0 then
            aimAssistDistance = newValue
            distanceLabel.Text = "Dist: " .. aimAssistDistance
            aimRing.Size = UDim2.new(0, aimAssistDistance * 2, 0, aimAssistDistance * 2)
        else
            distanceSlider.Text = "Invalid Input"
        end
    end)

    -- Toggle Aim Assist with Tap
    toggleButton.MouseButton1Click:Connect(function()
        isAimAssistEnabled = not isAimAssistEnabled
        toggleButton.Text = "Aim Assist: " .. (isAimAssistEnabled and "ON" or "OFF")
        aimRing.Visible = isAimAssistEnabled
    end)

    -- Toggle GUI Visibility with Tap
    screenGui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            guiEnabled = not guiEnabled
            screenGui.Enabled = guiEnabled
        end
    end)
end

-- Get Closest Target Based on Aim Assist Distance and Direction
local function getClosestTarget()
    local closestDistance = math.huge
    local closestPlayer = nil
    local camera = workspace.CurrentCamera

    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos = v.Character.HumanoidRootPart.Position
            local screenPoint, onScreen = camera:WorldToViewportPoint(targetPos)
            
            if onScreen then
                local distance = (targetPos - player.Character.HumanoidRootPart.Position).Magnitude
                if distance < closestDistance and distance < aimAssistDistance then
                    local screenSize = camera.ViewportSize
                    local squareMin = (screenSize - Vector2.new(aimAssistDistance * 2, aimAssistDistance * 2)) / 2
                    local squareMax = (screenSize + Vector2.new(aimAssistDistance * 2, aimAssistDistance * 2)) / 2

                    -- Check if the target is within the square area defined by the aim assist distance
                    if screenPoint.X >= squareMin.X and screenPoint.X <= squareMax.X and screenPoint.Y >= squareMin.Y and screenPoint.Y <= squareMax.Y then
                        closestDistance = distance
                        closestPlayer = v
                    end
                end
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
            local cameraPos = camera.CFrame.Position

            -- Only aim at the target if the target is in front of the camera and inside the square area
            local distanceToTarget = (targetPosition - cameraPos).Magnitude
            if distanceToTarget <= aimAssistDistance then
                camera.CFrame = CFrame.new(cameraPos, targetPosition)
            end
        end
    end
end)

-- Initialize GUI
createGui()
