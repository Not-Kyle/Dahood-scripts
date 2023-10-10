getgenv().Players = game:GetService'Players'
getgenv().User = Players.LocalPlayer
getgenv().UserInputService = game:GetService'UserInputService'
getgenv().RunService = game:GetService'RunService'
getgenv().AddNotification = function(title, text, time) game.StarterGui:SetCore("SendNotification", {Title = title; Text = text}) end

local Sprint = true
local Sprinting = false
local SprintSpeed = 200

RunService.Stepped:Connect(function()
    if User and User.Character and User.Character:FindFirstChild'HumanoidRootPart' then
        if Sprint then
            if Sprinting then
                User.Character:WaitForChild'HumanoidRootPart'.Velocity = User.Character:WaitForChild'HumanoidRootPart'.CFrame.lookVector * SprintSpeed
            end
        end
    end
end)

UserInputService.InputBegan:Connect(function(Array, Kill)
    if Kill then
        return nil
    elseif Array.KeyCode == Enum.KeyCode.LeftShift then
        Sprinting = true
    elseif Array.KeyCode == Enum.KeyCode.X then
        Sprint = not Sprint
        AddNotification('Macro', 'Marco is now '..tostring(Sprint))
    end
end)

UserInputService.InputEnded:Connect(function(Array)
    if Array.KeyCode == Enum.KeyCode.LeftShift then
        Sprinting = false
    end
end)

