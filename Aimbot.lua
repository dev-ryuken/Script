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

-- Drag functionality for mobile (touch)
local dragging = false
local dragStart = nil
local startPos = nil

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Title label
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Text = "Aim Assist Settings"
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Parent = mainFrame

-- Slider for Aim Assist Distance
local distanceSlider = Instance.new("TextLabel")
distanceSlider.Size = UDim2.new(1, -20, 0, 40)
distanceSlider.Position = UDim2.new(0, 10, 0, 50)
distanceSlider.Text = "Aim Assist Distance"
distanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
distanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255)
distanceSlider.TextScaled = true
distanceSlider.Parent = mainFrame

-- Slider functionality
local distanceSliderVal = 10 -- default value
local distanceSliderBox = Instance.new("TextBox")
distanceSliderBox.Size = UDim2.new(0.8, 0, 0, 20)
distanceSliderBox.Position = UDim2.new(0, 10, 0, 90)
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
playerHitboxToggle.Position = UDim2.new(0, 10, 0, 130)
playerHitboxToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerHitboxToggle.Text = "Toggle Player Hitbox"
playerHitboxToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
playerHitboxToggle.TextScaled = true
playerHitboxToggle.Parent = mainFrame

playerHitboxToggle.MouseButton1Click:Connect(function()
    -- Code to toggle player hitbox visibility here
end)

-- Toggle for Player Info (Health, Level, Distance)
local playerInfoToggle = Instance.new("TextButton")
playerInfoToggle.Size = UDim2.new(0, 180, 0, 40)
playerInfoToggle.Position = UDim2.new(0, 10, 0, 180)
playerInfoToggle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
playerInfoToggle.Text = "Toggle Player Info"
playerInfoToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
playerInfoToggle.TextScaled = true
playerInfoToggle.Parent = mainFrame

playerInfoToggle.MouseButton1Click:Connect(function()
    -- Code to toggle player info (Health, Level, Distance) here
end)

-- Toggle button to show/hide GUI
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 180, 0, 40)
toggleButton.Position = UDim2.new(0, 10, 0, 230)
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
destroyButton.Position = UDim2.new(0, 10, 0, 280)
destroyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
destroyButton.Text = "Destroy GUI"
destroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
destroyButton.TextScaled = true
destroyButton.Parent = mainFrame

destroyButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()  -- Destroy the entire ScreenGui and all its components
end)
