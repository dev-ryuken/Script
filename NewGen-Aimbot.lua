local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

-- Aim Assist Variables
local isAimAssistEnabled = false
local aimAssistDistance = 50

-- Load External GUI
local gui = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/z4gs/scripts/master/testtttt.lua"))():AddWindow("RYUKEN HUB", {
    main_color = Color3.fromRGB(204, 0, 0),
    min_size = Vector2.new(373, 340),
    can_resize = false
})

-- Add Aim Assist Toggle
gui:AddSwitch("Enable Aim Assist", function(state)
    isAimAssistEnabled = state
end)

-- Add Distance Slider
gui:AddSlider("Aim Assist Distance", function(value)
    aimAssistDistance = value
end, {
    min = 10,
    max = 200,
    default = aimAssistDistance,
})

-- Aim Assist Logic
local function getClosestTarget()
    local closestDistance = math.huge
    local closestPlayer = nil
    local camera = workspace.CurrentCamera

    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local targetPos = v.Character.HumanoidRootPart.Position
            local screenPoint = camera:WorldToViewportPoint(targetPos)
            local screenDistance = (Vector2.new(screenPoint.X, screenPoint.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude

            if screenDistance < aimAssistDistance then
                local distance = (targetPos - player.Character.HumanoidRootPart.Position).Magnitude
                if distance < closestDistance then
                    closestDistance = distance
                    closestPlayer = v
                end
            end
        end
    end

    return closestPlayer
end

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
