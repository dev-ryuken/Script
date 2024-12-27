-- Aim Assist Script with GUI Toggle for Educational Purposes Only

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local uis = game:GetService("UserInputService")

-- Settings
local aimAssistEnabled = true
local trackPlayer = false
local aimRadius = 50
local currentTarget = nil

-- Create GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AimAssistGUI"
screenGui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 120)
frame.Position = UDim2.new(0, 20, 0, 20)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.BorderSizePixel = 0
frame.Visible = false -- Start hidden
frame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "Aim Assist Menu"
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BorderSizePixel = 0
titleLabel.Parent = frame

local aimToggleButton = Instance.new("TextButton")
aimToggleButton.Text = "Aim Assist: Enabled"
aimToggleButton.Size = UDim2.new(1, 0, 0, 30)
aimToggleButton.Position = UDim2.new(0, 0, 0, 40)
aimToggleButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
aimToggleButton.TextColor3 = Color3.new(1, 1, 1)
aimToggleButton.Parent = frame

local trackToggleButton = Instance.new("TextButton")
trackToggleButton.Text = "Player Tracking: Disabled"
trackToggleButton.Size = UDim2.new(1, 0, 0, 30)
trackToggleButton.Position = UDim2.new(0, 0, 0, 80)
trackToggleButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
trackToggleButton.TextColor3 = Color3.new(1, 1, 1)
trackToggleButton.Parent = frame

-- Function to get the closest target within aim radius
local function getClosestTarget()
    local closestTarget = nil
    local shortestDistance = aimRadius

    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local charPart = v.Character.HumanoidRootPart
            local screenPos, onScreen = workspace.CurrentCamera:WorldToScreenPoint(charPart.Position)
            
            if onScreen then
                local mousePos = Vector2.new(mouse.X, mouse.Y)
                local targetPos = Vector2.new(screenPos.X, screenPos.Y)
                local distance = (mousePos - targetPos).Magnitude

                if distance < shortestDistance then
                    closestTarget = charPart
                    shortestDistance = distance
                end
            end
        end
    end

    return closestTarget
end

-- Function to aim at a target
local function aimAt(target)
    if target then
        local targetPos = workspace.CurrentCamera:WorldToScreenPoint(target.Position)
        mousemoverel((targetPos.X - mouse.X) / 2, (targetPos.Y - mouse.Y) / 2)
    end
end

-- Main loop for aim assist and player tracking
game:GetService("RunService").RenderStepped:Connect(function()
    if aimAssistEnabled then
        if trackPlayer and currentTarget then
            -- Track the specific player
            if currentTarget.Parent and currentTarget:FindFirstChild("HumanoidRootPart") then
                aimAt(currentTarget.HumanoidRootPart)
            else
                -- If the player leaves or no longer exists, stop tracking
                currentTarget = nil
                trackPlayer = false
                trackToggleButton.Text = "Player Tracking: Disabled"
                print("Lost target, stopping tracking.")
            end
        else
            -- Find a new target and aim
            local target = getClosestTarget()
            if target then
                aimAt(target)
            end
        end
    end
end)

-- Toggle Aim Assist via GUI
aimToggleButton.MouseButton1Click:Connect(function()
    aimAssistEnabled = not aimAssistEnabled
    aimToggleButton.Text = "Aim Assist: " .. (aimAssistEnabled and "Enabled" or "Disabled")
end)

-- Toggle Player Tracking via GUI
trackToggleButton.MouseButton1Click:Connect(function()
    if not trackPlayer then
        local target = getClosestTarget()
        if target then
            currentTarget = target.Parent
            trackPlayer = true
            trackToggleButton.Text = "Player Tracking: Enabled"
            print("Tracking player:", currentTarget.Name)
        else
            print("No target found to track.")
        end
    else
        currentTarget = nil
        trackPlayer = false
        trackToggleButton.Text = "Player Tracking: Disabled"
        print("Stopped tracking.")
    end
end)

-- Toggle GUI Visibility (F8 Key)
uis.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F8 then
        frame.Visible = not frame.Visible
    end
end)
