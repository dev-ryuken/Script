local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.CoreGui

-- Main Frame (everything will be inside this)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 400, 0, 400)
mainFrame.Position = UDim2.new(0.5, -200, 0.1, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
mainFrame.BorderSizePixel = 2
mainFrame.Visible = true
mainFrame.Parent = ScreenGui

-- Title label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Text = "Aim Assist Settings"
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Parent = mainFrame

-- Aim Assist Toggle
local aimAssistToggle = Instance.new("TextButton")
aimAssistToggle.Size = UDim2.new(0, 180, 0, 40)
aimAssistToggle.Position = UDim2.new(0, 10, 0, 50)
aimAssistToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
aimAssistToggle.Text = "Toggle Aim Assist"
aimAssistToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
aimAssistToggle.TextScaled = true
aimAssistToggle.Parent = mainFrame

local aimAssistEnabled = false
aimAssistToggle.MouseButton1Click:Connect(function()
    aimAssistEnabled = not aimAssistEnabled
end)

-- Aim Assist Distance Slider
local distanceSlider = Instance.new("TextLabel")
distanceSlider.Size = UDim2.new(1, -20, 0, 40)
distanceSlider.Position = UDim2.new(0, 10, 0, 100)
distanceSlider.Text = "Aim Assist Distance"
distanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
distanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
distanceSlider.TextScaled = true
distanceSlider.Parent = mainFrame

-- Slider functionality
local distanceSliderVal = 10 -- default value
local distanceSliderBox = Instance.new("TextBox")
distanceSliderBox.Size = UDim2.new(0.8, 0, 0, 20)
distanceSliderBox.Position = UDim2.new(0, 10, 0, 150)
distanceSliderBox.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
distanceSliderBox.TextColor3 = Color3.fromRGB(255, 255, 255)
distanceSliderBox.Text = "Distance: " .. distanceSliderVal
distanceSliderBox.ClearTextOnFocus = false
distanceSliderBox.TextScaled = true
distanceSliderBox.Parent = mainFrame

distanceSliderBox.FocusLost:Connect(function()
    local value = tonumber(distanceSliderBox.Text)
    if value then
        distanceSliderVal = math.clamp(value, 0, 50)
        distanceSliderBox.Text = "Distance: " .. distanceSliderVal
    end
end)

-- Toggle for Player Hitbox
local playerHitboxToggle = Instance.new("TextButton")
playerHitboxToggle.Size = UDim2.new(0, 180, 0, 40)
playerHitboxToggle.Position = UDim2.new(0, 10, 0, 200)
playerHitboxToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerHitboxToggle.Text = "Toggle Player Hitbox"
playerHitboxToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
playerHitboxToggle.TextScaled = true
playerHitboxToggle.Parent = mainFrame

local playerHitboxEnabled = false
playerHitboxToggle.MouseButton1Click:Connect(function()
    playerHitboxEnabled = not playerHitboxEnabled
end)

-- Toggle for Player Info (Health, Level, Distance)
local playerInfoToggle = Instance.new("TextButton")
playerInfoToggle.Size = UDim2.new(0, 180, 0, 40)
playerInfoToggle.Position = UDim2.new(0, 10, 0, 250)
playerInfoToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerInfoToggle.Text = "Toggle Player Info"
playerInfoToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
playerInfoToggle.TextScaled = true
playerInfoToggle.Parent = mainFrame

local playerInfoEnabled = false
playerInfoToggle.MouseButton1Click:Connect(function()
    playerInfoEnabled = not playerInfoEnabled
end)

-- Toggle button to show/hide GUI
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 180, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0, 300)
toggleButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
toggleButton.Text = "Toggle GUI Visibility"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.TextScaled = true
toggleButton.Parent = mainFrame

toggleButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

-- Destroy button
local destroyButton = Instance.new("TextButton")
destroyButton.Size = UDim2.new(0, 180, 0, 40)
destroyButton.Position = UDim2.new(0, 10, 0, 350)
destroyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
destroyButton.Text = "Destroy GUI"
destroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
destroyButton.TextScaled = true
destroyButton.Parent = mainFrame

destroyButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()  -- Destroy the entire ScreenGui and all its components
end)

-- Update player info above their head
game:GetService("RunService").Heartbeat:Connect(function()
    if playerInfoEnabled then
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("Head") then
                local head = player.Character.Head
                local health = player.Character.Humanoid.Health
                local level = player:FindFirstChild("Level") and player.Level.Value or "N/A"
                local distance = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                local infoLabel = Instance.new("BillboardGui")
                infoLabel.Size = UDim2.new(0, 200, 0, 50)
                infoLabel.Adornee = head
                infoLabel.StudsOffset = Vector3.new(0, 3, 0)
                infoLabel.Parent = head

                local infoText = Instance.new("TextLabel")
                infoText.Size = UDim2.new(1, 0, 1, 0)
                infoText.BackgroundTransparency = 1
                infoText.TextColor3 = Color3.fromRGB(255, 255, 255)
                infoText.Text = "Health: " .. health .. "\nLevel: " .. level .. "\nDistance: " .. math.floor(distance)
                infoText.TextScaled = true
                infoText.Parent = infoLabel
            end
        end
    end
end)

-- Update player hitbox visibility and make it green when enabled
game:GetService("RunService").Heartbeat:Connect(function()
    if playerHitboxEnabled then
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hitbox = player.Character:FindFirstChild("HumanoidRootPart")
                if hitbox then
                    hitbox.BrickColor = BrickColor.new("Bright green")
                    hitbox.Size = Vector3.new(10, 10, 10)  -- Increase the size of hitboxes for better visibility
                end
            end
        end
    else
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                local hitbox = player.Character:FindFirstChild("HumanoidRootPart")
                if hitbox then
                    hitbox.BrickColor = BrickColor.new("Bright red")
                    hitbox.Size = Vector3.new(2, 2, 2)  -- Reset size when toggled off
                end
            end
        end
    end
end)
