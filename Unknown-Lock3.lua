local Settings = {
    Main = {
        Enabled = true,
        Key = "q",
        Dot = true,
        AirShot = true,
        Notif = true,
        AutoPred = false,
        FOV = math.huge,
        Resolver = false
    }
}

local SelectedPart = "LowerTorso"
local PredictionValue = 0.124231
local PingToPrediction = {
    [130] = 0.151,
    [125] = 0.149,
    [110] = 0.146,
    [105] = 0.138,
    [90] = 0.136,
    [80] = 0.134,
    [70] = 0.131,
    [60] = 0.1229,
    [50] = 0.1225,
    [40] = 0.1256
}

local Camera = game:GetService("Workspace").CurrentCamera
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local Marker = Instance.new("Part", game.Workspace)
Marker.Anchored = true
Marker.CanCollide = false
Marker.Size = Vector3.new(1, 1, 1)
Marker.Transparency = 0.3

function CreateMarker(Parent, Adornee, Color, Size, Size2)
    local BillboardGui = Instance.new("BillboardGui", Parent)
    BillboardGui.Adornee = Adornee
    BillboardGui.Size = UDim2.new(Size, Size2, Size, Size2)
    BillboardGui.AlwaysOnTop = Settings.Main.Dot

    local Frame = Instance.new("Frame", BillboardGui)
    Frame.Size = UDim2.new(Settings.Main.Dot and 1 or 400, 0, 1, 0)
    Frame.Transparency = Settings.Main.Dot and 0.107 or 0.9
    Frame.BackgroundTransparency = 0.107
    Frame.BackgroundColor3 = Color

    local UICorner = Instance.new("UICorner", Frame)
    UICorner.CornerRadius = UDim.new(Settings.Main.Dot and 10 or 0, 10)

    return BillboardGui
end

local function GetClosestPlayerToCursor()
    local ClosestPlayer
    local ShortestDistance = Settings.Main.FOV

    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer and Player.Character and Player.Character:FindFirstChild("Humanoid") and Player.Character.Humanoid.Health > 0 and Player.Character:FindFirstChild("HumanoidRootPart") then
            local Position = Camera:WorldToViewportPoint(Player.Character.PrimaryPart.Position)
            local Distance = (Vector2.new(Position.X, Position.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
            if Distance < ShortestDistance then
                ClosestPlayer = Player
                ShortestDistance = Distance
            end
        end
    end

    return ClosestPlayer
end

local function UpdatePrediction()
    if Settings.Main.AutoPred then
        local Ping = tonumber(string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), "(")[1])
        for pingThreshold, predictionValue in pairs(PingToPrediction) do
            if Ping < pingThreshold then
                PredictionValue = predictionValue
                break
            end
        end
    end
end

local function GetAimPosition(Player)
    local Character = Player.Character
    if Character and Character:FindFirstChild("HumanoidRootPart") then
        return Character[SelectedPart].Position + (Character[SelectedPart].Velocity * PredictionValue)
    end
end

local function HandleKey(key)
    if key == Settings.Main.Key and Settings.Main.Enabled then
        if enabled then
            enabled = false
            if Settings.Main.Notif then
                local Player = GetClosestPlayerToCursor()
                if Player then
                    game.StarterGui:SetCore("SendNotification", {
                        Title = ".gg/closetcheating",
                        Text = "Unlocked",
                        Icon = "http://www.roblox.com/asset/?id=8850953349",
                        Duration = 1
                    })
                end
            end
        else
            local Player = GetClosestPlayerToCursor()
            if Player then
                enabled = true
                if Settings.Main.Notif then
                    game.StarterGui:SetCore("SendNotification", {
                        Title = "@scorchinsun",
                        Text = Player.Name,
                        Icon = "http://www.roblox.com/asset/?id=8850953349",
                        Duration = 1
                    })
                end
            end
        end
    end
end

game.Players.PlayerAdded:Connect(function(Player)
    if Player ~= LocalPlayer then
        noob(Player)
    end
end)

game:GetService("RunService").Stepped:Connect(function()
    if enabled then
        local AimPosition = GetAimPosition(Plr)
        if AimPosition then
            Marker.CFrame = CFrame.new(AimPosition)
        else
            Marker.CFrame = CFrame.new(0, 9999, 0)
        end
    end

    UpdatePrediction()
end)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" and Settings.Main.Enabled and Plr.Character then
        args[3] = GetAimPosition(Plr) or args[3]
        return old(unpack(args))
    end
    return old(...)
end)
