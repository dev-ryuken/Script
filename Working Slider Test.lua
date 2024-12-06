local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")

-- Create ScreenGui for the slider
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Create Slider UI
local slider = Instance.new("Frame")
slider.Size = UDim2.new(0.8, 0, 0.1, 0)
slider.Position = UDim2.new(0.1, 0, 0.85, 0) -- Position at the bottom of the screen
slider.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
slider.Parent = screenGui

local handle = Instance.new("ImageButton")
handle.Size = UDim2.new(0, 20, 1, 0)
handle.Position = UDim2.new(0, 0, 0, 0)
handle.BackgroundColor3 = Color3.new(1, 0, 0)
handle.Parent = slider

-- Variables for dragging
local dragging = false
local sliderBounds = slider.AbsoluteSize.X
local sliderValue = 0

-- Handle Dragging
handle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or 
       input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
    end
end)

handle.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or 
       input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

userInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or 
                     input.UserInputType == Enum.UserInputType.Touch) then
        local relativePosition = input.Position.X - slider.AbsolutePosition.X
        local clampedPosition = math.clamp(relativePosition, 0, sliderBounds)
        handle.Position = UDim2.new(clampedPosition / sliderBounds, 0, 0, 0)

        -- Update slider value based on handle position
        sliderValue = clampedPosition / sliderBounds
        print("Slider Value:", sliderValue)
    end
end)

-- Main Functionality
while true do
    if player.Character then
        pcall(function()
            local array = { died = false } -- Example: Add your necessary variables
            local npc = workspace:FindFirstChild("TargetNPC") -- Replace with your actual NPC-finding logic
            
            if npc then
                labels("Kills", 1)
                if npc.Name ~= "Eto Yoshimura" and not findobj(npc.Parent, "Gyakusatsu") and npc.Name ~= "Gyakusatsu" then  
                    -- Adjust behavior dynamically based on slider value
                    labels("text", "Collecting corpse...")
                    
                    if sliderValue > 0.5 then
                        collect(npc) -- Only collect if slider value exceeds 0.5
                        labels("text", "Slider value high, collecting...")
                    else
                        labels("text", "Slider value too low, waiting...")
                    end
                end
            else
                labels("text", "Target not found, waiting...")
            end
        end)
    else
        labels("text", "Waiting for character to respawn")
    end
    wait()
end
