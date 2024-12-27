local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- GUI Toggle Variables
local isAimAssistEnabled = false
local guiEnabled = false
local aimAssistDistance = 50 -- Default distance for aim assist
local screenGui = nil -- Track the instance of the GUI to manage multiple executions

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

    -- Main Frame for Compact Layout
    local mainFrame = Instance.new("Frame")
    mainFrame.Parent = screenGui
    mainFrame.Size = UDim2.new(0, 150, 0, 120)  -- Slightly larger to fit the kill button
    mainFrame.Position = UDim2.new(0.5, -75, 0, 20)
    mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    mainFrame.BorderSizePixel = 2
    mainFrame.BorderColor3 = Color3.new(1, 0, 0)

    -- Toggle Button for Aim Assist
    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = mainFrame
    toggleButton.Size = UDim2.new(1, 0, 0.3, 0)  -- Takes up the top portion of the frame
    toggleButton.Text = "Aim Assist: OFF"
    toggleButton.TextScaled = true
    toggleButton.BackgroundColor3 = Color3.new(0, 0, 0)
    toggleButton.TextColor3 = Color3.new(1, 1, 1)
    toggleButton.BorderColor3 = Color3.new(1, 0, 0)

    -- Distance Label and Slider
    local distanceLabel = Instance.new("TextLabel")
    distanceLabel.Parent = mainFrame
    distanceLabel.Size = UDim2.new(1, 0, 0.3, 0)  -- Takes up the bottom portion
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

    -- Kill Button to remove the GUI
    local killButton = Instance.new("TextButton")
    killButton.Parent = mainFrame
    killButton.Size = UDim2.new(1, 0, 0.3, 0)
    killButton.Position = UDim2.new(0, 0, 1, -40)
    killButton.Text = "Kill GUI"
    killButton.TextScaled = true
    killButton.BackgroundColor3 = Color3.new(1, 0, 0)
    killButton.TextColor3 = Color3.new(1, 1, 1)
    killButton.BorderColor3 = Color3.new(1, 0, 0)

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
            distanceLabel.Text = "Dist: " .. aimAssistDistance
        else
            distanceSlider.Text = "Invalid Input"
        end
    end)

    -- Kill the GUI when the button is clicked
    killButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
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
end

-- Check if GUI already exists, if not, create it
createGui()

