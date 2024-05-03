
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()

local watermark = library:Watermark("Slammy.hook")

local main = library:Load{
    Name = "Slammy.hook",
    SizeX = 630,
    SizeY = 560,
    Theme = "Midnight",
    Extension = "json", -- config file extension
    Folder = "SlammyTron V3 Configs LOOLOLOOLOLOLOLOOLOLOLOLOLOLOLOLO" -- config folder name
}

-- library.Extension = "txt" (config file extension)
-- library.Folder = "config folder name"

local tab = main:Tab("Main Aimlock")

local section = tab:Section{
    Name = "Main Aimlock Section",
    Side = "Left"
}





section:Button{
    Name = "Click this first monkey",
    Callback  = function()
    getgenv().Target = false
-- Configuration
getgenv().Key = Enum.KeyCode.Q
getgenv().Prediction = 0.12654321
getgenv().ChatMode = false
getgenv().NotifMode = false
getgenv().PartMode = true
getgenv().AirshotFunc = true
getgenv().Partz = "HumanoidRootPart"
getgenv().View = true

    --
    _G.Types = {
        Ball = Enum.PartType.Ball,
        Block = Enum.PartType.Block, 
        Cylinder = Enum.PartType.Cylinder
    }
    
    --variables                 
    	local Tracer = Instance.new("Part", game.Workspace)
    Tracer.Name = "gay"	
    Tracer.Anchored = true		
    Tracer.CanCollide = false
    Tracer.Transparency = 0.4
    Tracer.Parent = game.Workspace	
    Tracer.Shape = _G.Types.Block
    Tracer.Size = Vector3.new(4,4,4)
    Tracer.Color = Color3.fromRGB(128,128,128)
    
    --
    local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local Runserv = game:GetService("RunService")

circle = Drawing.new("Circle")
circle.Color = Color3.fromRGB(106,13,173)
circle.Thickness = 3
circle.NumSides = 732
circle.Radius = 130
circle.Thickness = 0
circle.Transparency = 0.7
circle.Visible = false
circle.Filled = true

Runserv.RenderStepped:Connect(function()
    circle.Position = Vector2.new(mouse.X,mouse.Y+35)
end)
    
    	local guimain = Instance.new("Folder", game.CoreGui)
    	local CC = game:GetService"Workspace".CurrentCamera
    local LocalMouse = game.Players.LocalPlayer:GetMouse()
    	local Locking = false
    
    	
    --
    if getgenv().valiansh == true then
                        game.StarterGui:SetCore("SendNotification", {
                   Title = "Slammy.Hook",
                   Text = "Already Loaded!",
                   Duration = 5
        
                   })
        return
    end
    
    getgenv().valiansh = true
    
        local UserInputService = game:GetService("UserInputService")

    UserInputService.InputBegan:Connect(function(keygo,ok)
           if (not ok) then
           if (keygo.KeyCode == getgenv().Key) then
               if getgenv().Target == true then
               Locking = not Locking
               
               if Locking then
               Plr =  getClosestPlayerToCursor()
                if getgenv().ChatMode then
        local A_1 = "Target: "..tostring(Plr.Character.Humanoid.DisplayName) local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
        	end	
               if getgenv().NotifMode then
    			game.StarterGui:SetCore("SendNotification", {
        Title = "Slammy.Hook";
        Text = "Target: "..tostring(Plr.Character.Humanoid.DisplayName);
    
    })
    end
    elseif not Locking then
         if getgenv().ChatMode then
        local A_1 = "Unlocked!" local A_2 = "All" local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest Event:FireServer(A_1, A_2) 
        	end	
        if getgenv().NotifMode then
                        game.StarterGui:SetCore("SendNotification", {
                   Title = "Slammy.Hook",
                   Text = "Unlocked",
                   Duration = 5
               })
           elseif getgenv().Target == false then
                        game.StarterGui:SetCore("SendNotification", {
                   Title = "Slammy.Hook",
                   Text = "Target isn't enabled",
                   Duration = 5
     
                   })
               
               end
                  
 
 end     end   
end
end
end)
	
	function getClosestPlayerToCursor()
		local closestPlayer
		local shortestDistance = circle.Radius

		for i, v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("LowerTorso") then
				local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
				local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(LocalMouse.X, LocalMouse.Y)).magnitude
				if magnitude < shortestDistance then
					closestPlayer = v
					shortestDistance = magnitude
				end
			end
		end
		return closestPlayer
	end
--
if getgenv().PartMode then
	game:GetService"RunService".Stepped:connect(function()
		if Locking and Plr.Character and Plr.Character:FindFirstChild("LowerTorso") then
			Tracer.CFrame = CFrame.new(Plr.Character.LowerTorso.Position+(Plr.Character.LowerTorso.Velocity*Prediction))
		else
			Tracer.CFrame = CFrame.new(0, 9999, 0)

		end
	end)
end

    
    
    --
	local rawmetatable = getrawmetatable(game)
	local old = rawmetatable.__namecall
	setreadonly(rawmetatable, false)
	rawmetatable.__namecall = newcclosure(function(...)
		local args = {...}
		if Locking and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
			args[3] = Plr.Character[getgenv().Partz].Position+(Plr.Character[getgenv().Partz].Velocity*Prediction)
			return old(unpack(args))
		end
		return old(...)
	end)
	if getgenv.AirshotFunc then
	if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        getgenv().Partz = "RightFoot"
    else
        getgenv().Partz = "RightFoot"
	end
end

	if getgenv.View then
 game.Workspace.CurrentCamera.CameraSubject = Plr.Character
 end
 end
}


local toggle = section:Toggle{
    Name = "Enable Aimlock",
    Flag = "Toggle 1",
   
    Callback  = function(bool)
    getgenv().Target = bool    
    end
 }











local box = section:Box{
    Name = "Prediction Changer",
    --Default = "hi",
    Placeholder = "Prediction Here!",
    Flag = "Changes Aimlock Prediction",
    Callback = function(bool)
      getgenv().Prediction = bool  
    end
}



local toggle = section:Toggle{
    Name = "Notfication Mode",
    Flag = "Toggle 1",
    --Default = true,
    Callback  = function(bool)
    getgenv().NotifMode = bool    
    end
 }

local toggle = section:Toggle{
    Name = "Airshot Function",
    Flag = "Toggle 1",
    Default = true,
    Callback  = function(bool)
     getgenv().AirshotFunc = bool    
    end
    }
    
    local toggle = section:Toggle{
    Name = "Chat Mode",
    Flag = "Toggle 1",
    
    Callback  = function(bool)
    getgenv().ChatMode = bool    
    end
    }
    

    local dropdown = section:Dropdown{
    Name = "Aim Part",
    --Default = "Option 1",
    Content = {
        "Head",
        "UpperTorso",
        "HumanoidRootPart",
        "LowerTorso"
    },
    Flag = "Dropdown 1",
    Callback = function(option)
    getgenv().Partz = option    
    end
}



local section = tab:Section{
    Name = "Legit",
    Side = "Right"
}

section:Button{
    Name = "Enable Streamable",
    Callback  = function()
    getgenv().RecurringPoint = "HumanoidRootPart"
getgenv().Hitbox = "HumanoidRootPart"
getgenv().Keybind = "q"
getgenv().AimbotStrengthAmount = 0.27
getgenv().PredictionAmount = 6.5
getgenv().Radius = 25
getgenv().UsePrediction = true
getgenv().AimbotStrength = false
getgenv().FirstPerson = true
getgenv().ThirdPerson = true
getgenv().TeamCheck = false
getgenv().Enabled = true




loadstring(game:HttpGet("https://raw.githubusercontent.com/tenaaki/GenericAimbot/main/v1.0.0"))()    
    end
}

local toggle = section:Toggle{
    Name = "Enable",
    Flag = "Toggle 1",
    --Default = true,
    Callback  = function(bool)
     getgenv().Enabled = bool 
    end
}



local toggle = section:Toggle{
    Name = "TeamCheck",
    Flag = "Toggle 1",
    --Default = true,
    Callback  = function(bool)
    getgenv().TeamCheck = bool  
    end
}

local toggle = section:Toggle{
    Name = "Enable Smoothness",
    Flag = "Toggle 1",
    
    Callback  = function(bool)
    getgenv().AimbotStrength = bool  
    end
}

local box = section:Box{
    Name = "Prediction Changer",
    --Default = "hi",
    Placeholder = "Prediction Here!",
    Flag = "Changes Aimlock Prediction",
    Callback = function(bool)
      getgenv().PredictionAmount = bool  
    end
}

local box = section:Box{
    Name = "Smoothness Amount",
    --Default = "hi",
    Placeholder = "Smoothness Amount",
    Flag = "Changes Aimlock Prediction",
    Callback = function(bool)
      getgenv().AimbotStrengthAmount = bool  
    end
}

    local dropdown = section:Dropdown{
    Name = "Aim Part",
    --Default = "Option 1",
    Content = {
        "Head",
        "UpperTorso",
        "HumanoidRootPart",
        "LowerTorso"
    },
    Flag = "Dropdown 1",
    Callback = function(option)
    getgenv().Hitbox = option    
    end
    }
    
local Misc = main:Tab("AimLocks V2")
local section = Misc:Section{
    Name = "Tracer",
    Side = "Left"
}

section:Button{
    Name = "Enable Tracer",
    Callback  = function()
     getgenv().Prediction = 0.131
getgenv().AirshotFunc = true


local new = { 
    main = { 
        Mario = true,
        Part = "HumanoidRootPart", -- Head, UpperTorso, HumanoidRootPart, LowerTorso, RightFoot, LeftFoot, RightArm, LeftArm 
        Key = "q",
        Notifications = true,
    },
    Tracer = { 
        TracerThickness = 1, -- made by thusky
        TracerTransparency = 1, -- made by thusky
        TracerColor = Color3.fromRGB(255,0,211) -- made by thusky
    }
}



local CurrentCamera = game:GetService "Workspace".CurrentCamera
local Mouse = game.Players.LocalPlayer:GetMouse()
local RunService = game:GetService("RunService")
local Plr = game.Players.LocalPlayer
local Line = Drawing.new("Line")
local Inset = game:GetService("GuiService"):GetGuiInset().Y

Mouse.KeyDown:Connect(function(KeyPressed)
    if KeyPressed == (new.main.Key) then
        if new.main.Mario == true then
            new.main.Mario = false
            if new.main.Notifications == true then
                Plr = FindClosestUser()
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Slammys Tracer",
                    Text = "No longer locked on"
                })
            end
        else
            Plr = FindClosestUser()
            new.main.Mario = true
            if new.main.Notifications == true then
                game.StarterGui:SetCore("SendNotification", {
                    Title = "Slammys Tracer",
                    Text = "Locked on to:" .. tostring(Plr.Character.Humanoid.DisplayName)
                })
            end
        end
    end
end)

function FindClosestUser()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
            v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
            local pos = CurrentCamera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end




RunService.Stepped:connect(function()
    if new.main.Mario == true then
        local Vector = CurrentCamera:WorldToViewportPoint(Plr.Character[new.main.Part].Position +
                                                              (Plr.Character.HumanoidRootPart.Velocity *
                                                                  Prediction))
        Line.Color = new.Tracer.TracerColor                                                                          -- made by thusky
        Line.Thickness = new.Tracer.TracerThickness
        Line.Transparency = new.Tracer.TracerTransparency
 

        Line.From = Vector2.new(Mouse.X, Mouse.Y + Inset)
        Line.To = Vector2.new(Vector.X, Vector.Y)
        Line.Visible = true
    else
        Line.Visible = false

    end
end)


local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(...)
    local args = {...}
    if new.main.Mario and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
        args[3] = Plr.Character[new.main.Part].Position +
                      (Plr.Character[new.main.Part].Velocity * Prediction)
        return old(unpack(args))
    end
    return old(...)
end)

if AirshotFunc == true then
    if Plr.Character.Humanoid.Jump == true and Plr.Character.Humanoid.FloorMaterial == Enum.Material.Air then
        settings.main.Part = "RightFoot"
    else
        Plr.Character:WaitForChild("Humanoid").StateChanged:Connect(function(old,new)
            if new == Enum.HumanoidStateType.Freefall then
                settings.main.Part = "RightFoot"
            else
                settings.main.Part = "RightFoot"
            end
        end)
    end
end

    end
}

local box = section:Box{
    Name = "Prediction Changer",
    --Default = "hi",
    Placeholder = "Prediction Here!",
    Flag = "Box 1",
    Callback = function(bool)
    getgenv().Prediction = bool   
    end
}

local toggle = section:Toggle{
    Name = "Airshot Function",
    Flag = "Toggle 1",
    Default = true,
    Callback  = function(bool)
    getgenv().AirshotFunc = bool  
    end
}

local section = Misc:Section{
    Name = "Dot",
    Side = "Right"
}

section:Button{
    Name = "Enable Dot",
    Callback  = function()
    
local ScreenGui = Instance.new("ScreenGui")
local TextLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling



_G.KEY = "q"
_G.PART = "LowerTorso"
_G.PRED = 0.043
_G.Frame = Vector3.new(0,0.53,0)


local CC = game:GetService "Workspace".CurrentCamera
local Plr
local enabled = false
local accomidationfactor = nil
local mouse = game.Players.LocalPlayer:GetMouse()
local placemarker = Instance.new("Part", game.Workspace)
local guimain = Instance.new("Folder", game.CoreGui)

function makemarker(Parent, Adornee, Color, Size, Size2)
    local e = Instance.new("BillboardGui", Parent)
    e.Name = "PP"
    e.Adornee = Adornee
    e.Size = UDim2.new(Size, Size2, Size, Size2)
    e.AlwaysOnTop = true
    local a = Instance.new("Frame", e)
    a.Size = UDim2.new(2, 0, 2, 0)
    a.BackgroundTransparency = 0.1
    a.BackgroundColor3 = Color
    local g = Instance.new("UICorner", a)
    g.CornerRadius = UDim.new(50, 50)
    return (e)
end

local data = game.Players:GetPlayers()
function noob(player)
    local character
    repeat
        wait()
    until player.Character
    local handler = makemarker(guimain, player.Character:WaitForChild(_G.PART), Color3.fromRGB(166, 122, 238), 0.0, 0)
    handler.Name = player.Name
    player.CharacterAdded:connect(
        function(Char)
            handler.Adornee = Char:WaitForChild(_G.PART)
        end
    )

    local TextLabel = Instance.new("TextLabel", handler)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Position = UDim2.new(0, 0, 0, -50)
    TextLabel.Size = UDim2.new(0, 100, 0, 100)
    TextLabel.Font = Enum.Font.SourceSansSemibold
    TextLabel.TextSize = 14
    TextLabel.TextColor3 = Color3.new(166, 122, 238)
    TextLabel.TextStrokeTransparency = 0
    TextLabel.TextYAlignment = Enum.TextYAlignment.Bottom
    TextLabel.Text = "Name: " .. player.Name
    TextLabel.ZIndex = 10

    spawn(
        function()
            while wait() do
                if player.Character then
                --TextLabel.Text = player.Name.." | Bounty: "..tostring(player:WaitForChild("leaderstats").Wanted.Value).." | "..tostring(math.floor(player.Character:WaitForChild("Humanoid").Health))
                end
            end
        end
    )
end

for i = 1, #data do
    if data[i] ~= game.Players.LocalPlayer then
        noob(data[i])
    end
end

game.Players.PlayerAdded:connect(
    function(Player)
        noob(Player)
    end
)

game.Players.PlayerRemoving:Connect(
    function(player)
        guimain[player.Name]:Destroy()
    end
)

spawn(
    function()
        placemarker.Anchored = true
        placemarker.CanCollide = false
        placemarker.Size = Vector3.new(0.1, 0.1, 0.1)
        placemarker.Transparency = 0.1
        makemarker(placemarker, placemarker, Color3.fromRGB(166, 122, 238), 0.20, 0)
    end
)

mouse.KeyDown:Connect(
    function(k)
        if k ~= _G.KEY then
            return
        end
        if enabled then
            -- guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            enabled = false
            TextLabel.TextColor3 = Color3.fromRGB(166, 122, 238)
            TextLabel.Text = "------"
        else
            --guimain[Plr.Name].Frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            enabled = true
            Plr = getClosestPlayerToCursor()
            TextLabel.TextColor3 = Color3.fromRGB(166, 122, 238)
            TextLabel.Text = Plr.Character.Humanoid.DisplayName
        end
    end)

function getClosestPlayerToCursor()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        if
            v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and
                v.Character.Humanoid.Health ~= 0 and
                v.Character:FindFirstChild(_G.PART)
         then
            local pos = CC:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).magnitude
            if magnitude < shortestDistance then
                closestPlayer = v
                shortestDistance = magnitude
            end
        end
    end
    return closestPlayer
end

game:GetService "RunService".Stepped:connect(
    function()
        if enabled and Plr.Character and Plr.Character:FindFirstChild(_G.PART) then
            placemarker.CFrame =
                CFrame.new(Plr.Character[_G.PART].Position + _G.Frame + (Plr.Character[_G.PART].Velocity * accomidationfactor))
        else
            placemarker.CFrame = CFrame.new(0, 9999, 0)
        end
    end
)

local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall =
    newcclosure(
    function(...)
        local args = {...}
        if enabled and getnamecallmethod() == "FireServer" and args[2] == "UpdateMousePos" then
            args[3] = Plr.Character[_G.PART].Position+ _G.Frame + (Plr.Character[_G.PART].Velocity * accomidationfactor)
            return old(unpack(args))
        end
        return old(...)
    end
)

game.Players.LocalPlayer.Chatted:Connect(
    function(Chat)
        if Chat == "print" then
            print(_G.PRED)
        end
    end
)

game.Players.LocalPlayer.Chatted:Connect(
    function(Chat)
        if Chat == "Code:1029" then

            _G.KEY = nil
            _G.AIR = nil
            _G.PART = nil
            _G.PRED = nil
            TextLabel.Visible = false


        end
    end
)

game.Players.LocalPlayer.Chatted:Connect(
    function(Chat)
        if Chat == "Code:1030" then

            _G.KEY = "q"
            _G.AIR = 0.00005
            _G.PART = "LowerTorso"
            _G.PRED = 0.029
            TextLabel.Visible = true


        end
    end
)

game.Players.LocalPlayer.Chatted:Connect(
    function(Chat)
        if Chat == "P+" then


            _G.PRED = _G.PRED+0.001



        end
    end
)

game.Players.LocalPlayer.Chatted:Connect(
    function(Chat)
        if Chat == "P-" then

            _G.PRED = _G.PRED-0.001



        end
    end
)



while wait() do
    --[[
    if getClosestPlayerToCursor().Character.Humanoid.FloorMaterial == Enum.Material.Air then
        accomidationfactor = _G.AIR
        print("jump 1")
    else
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local Value = tostring(ping)
        local pingValue = Value:split(" ")
        local PingNumber = pingValue[1]

        accomidationfactor = PingNumber / 1000 + 0.016
    end
    ]]
    if getClosestPlayerToCursor().Character.Humanoid.Jump == true and getClosestPlayerToCursor().Character.Humanoid.FloorMaterial == Enum.Material.Air then
        _G.Frame = Vector3.new(0,-2.3,0)
wait(0.05)
    else
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local Value = tostring(ping)
        local pingValue = Value:split(" ")
        local PingNumber = pingValue[1]
        
        accomidationfactor = PingNumber / 1000 + _G.PRED
        _G.Frame = Vector3.new(0,0.53,0)

    end
    
end

    
    end
}

local box = section:Box{
    Name = "Prediction Changer",
    --Default = "hi",
    Placeholder = "Prediction Here!",
    Flag = "Box 1",
    Callback = function(bool)
    _G.PRED = bool   
    end
}

local dropdown = section:Dropdown{
    Name = "Aimpart",
    --Default = "Option 1",
    Content = {
        "Head",
        "UpperTorso",
        "HumanoidRootpart",
        "LowerTorso"
    },
    Flag = "Dropdown 1",
    Callback = function(option)
        _G.PART = option
    end
}

local section = Misc:Section{
    Name = "Camlock",
    Side = "Left"
}

section:Button{
    Name = "Enable Camlock",
    Callback  = function()
    

getgenv().Prediction = 0.15038
getgenv().AimPart = "HumanoidRootPart"
getgenv().Key = "Q"
getgenv().DisableKey = "|"
getgenv().AutoPrediction = false

getgenv().FOV = true
getgenv().ShowFOV = false
getgenv().FOVSize = 55

--// Variables (Service)

local Players = game:GetService("Players")
local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")
local GS = game:GetService("GuiService")
local SG = game:GetService("StarterGui")

--// Variables (regular)

local LP = Players.LocalPlayer
local Mouse = LP:GetMouse()
local Camera = WS.CurrentCamera
local GetGuiInset = GS.GetGuiInset

local AimlockState = true
local Locked
local Victim

local SelectedKey = getgenv().Key
local SelectedDisableKey = getgenv().DisableKey

--// Notification function

function Notify(tx)
    SG:SetCore("SendNotification", {
        Title = "Slammy.Hook",
        Text = tx,
        Duration = 5
    })
end

--// Check if aimlock is loaded

if getgenv().Loaded == true then
    Notify("Aimlock is already loaded!")
    return
end

getgenv().Loaded = true

--// FOV Circle

local fov = Drawing.new("Circle")
fov.Filled = false
fov.Transparency = 1
fov.Thickness = 2
fov.Color = Color3.fromRGB(255, 255, 0)
fov.NumSides = 1000

--// Functions

function update()
    if getgenv().FOV == true then
        if fov then
            fov.Radius = getgenv().FOVSize * 2
            fov.Visible = getgenv().ShowFOV
            fov.Position = Vector2.new(Mouse.X, Mouse.Y + GetGuiInset(GS).Y)

            return fov
        end
    end
end

function WTVP(arg)
    return Camera:WorldToViewportPoint(arg)
end

function WTSP(arg)
    return Camera.WorldToScreenPoint(Camera, arg)
end

function getClosest()
    local closestPlayer
    local shortestDistance = math.huge

    for i, v in pairs(game.Players:GetPlayers()) do
        local notKO = v.Character:WaitForChild("BodyEffects")["K.O"].Value ~= true
        local notGrabbed = v.Character:FindFirstChild("GRABBING_COINSTRAINT") == nil
        
        if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild(getgenv().AimPart) and notKO and notGrabbed then
            local pos = Camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Mouse.X, Mouse.Y)).magnitude
            
            if (getgenv().FOV) then
                if (fov.Radius > magnitude and magnitude < shortestDistance) then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            else
                if (magnitude < shortestDistance) then
                    closestPlayer = v
                    shortestDistance = magnitude
                end
            end
        end
    end
    return closestPlayer
end
 
--// Checks if key is down

Mouse.KeyDown:Connect(function(k)
    SelectedKey = SelectedKey:lower()
    SelectedDisableKey = SelectedDisableKey:lower()
    if k == SelectedKey then
        if AimlockState == true then
            Locked = not Locked
            if Locked then
                Victim = getClosest()

                Notify("Locked onto: "..tostring(Victim.Character.Humanoid.DisplayName))
            else
                if Victim ~= nil then
                    Victim = nil

                    Notify("Unlocked!")
                end
            end
        else
            Notify("Aimlock is not enabled!")
        end
    end
    if k == SelectedDisableKey then
        AimlockState = not AimlockState
    end
end)

--// Loop update FOV and loop camera lock onto target

RS.RenderStepped:Connect(function()
    update()
    if AimlockState == true then
        if Victim ~= nil then
            Camera.CFrame = CFrame.new(Camera.CFrame.p, Victim.Character[getgenv().AimPart].Position + Victim.Character[getgenv().AimPart].Velocity*getgenv().Prediction)
        end
    end
end)
	while wait() do
        if getgenv().AutoPrediction == true then
        local pingvalue = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        local split = string.split(pingvalue,'(')
        local ping = tonumber(split[1])
            if ping < 225 then
            getgenv().Prediction = 1.4
        elseif ping < 215 then
            getgenv().Prediction = 1.2
	    elseif ping < 205 then
            getgenv().Prediction = 1.0
	    elseif ping < 190 then
            getgenv().Prediction = 0.10
        elseif ping < 180 then
            getgenv().Prediction = 0.12
	    elseif ping < 170 then
            getgenv().Prediction = 0.15
	    elseif ping < 160 then
            getgenv().Prediction = 0.18
	    elseif ping < 150 then
            getgenv().Prediction = 0.110
        elseif ping < 140 then
            getgenv().Prediction = 0.113
        elseif ping < 130 then
            getgenv().Prediction = 0.116
        elseif ping < 120 then
            getgenv().Prediction = 0.120
        elseif ping < 110 then
            getgenv().Prediction = 0.124
        elseif ping < 105 then
            getgenv().Prediction = 0.127
        elseif ping < 90 then
            getgenv().Prediction = 0.130
        elseif ping < 80 then
            getgenv().Prediction = 0.133
        elseif ping < 70 then
            getgenv().Prediction = 0.136
        elseif ping < 60 then
            getgenv().Prediction = 0.15038
        elseif ping < 50 then
            getgenv().Prediction = 0.15038
        elseif ping < 40 then
            getgenv().Prediction = 0.145
        elseif ping < 30 then
            getgenv().Prediction = 0.155
        elseif ping < 20 then
            getgenv().Prediction = 0.157
        end
        end
	end    
    end
}

local box = section:Box{
    Name = "Prediction Changer",
    --Default = "hi",
    Placeholder = "Prediction Here!",
    Flag = "Box 1",
    Callback = function(bool)
    getgenv().Prediction = bool   
    end
}

local dropdown = section:Dropdown{
    Name = "Aimpart",
    --Default = "Option 1",
    Content = {
        "Head",
        "UpperTorso",
        "HumanoidRootPart",
        "LowerTorso"
    },
    Flag = "Dropdown 1",
    Callback = function(option)
        getgenv().AimPart = option
    end
}

local toggle = section:Toggle{
    Name = "Auto Prediction",
    Flag = "Toggle 1",
    --Default = true,
    Callback  = function(bool)
    getgenv().AutoPrediction = bool  
    end
}

local toggle = section:Toggle{
    Name = "Camlock FOV",
    Flag = "Toggle 1",
    --Default = true,
    Callback  = function(bool)
    getgenv().ShowFOV = bool  
    end
}

local box = section:Box{
    Name = "Prediction Changer",
    --Default = "hi",
    Placeholder = "Camlock FOV Changer",
    Flag = "Box 1",
    Callback = function(bool)
     getgenv().FOVSize = bool  
    end
}


local Misc = main:Tab("Misc")
local section = Misc:Section{
    Name = "Cframe",
    Side = "Left"
}



section:Button{
    Name = "Cframe (Z)",
    Callback = function()
           	repeat
		wait()
	until game:IsLoaded()
	local L_134_ = game:service('Players')
	local L_135_ = L_134_.LocalPlayer
	repeat
		wait()
	until L_135_.Character
	local L_136_ = game:service('UserInputService')
	local L_137_ = game:service('RunService')
	getgenv().Multiplier = 1
	local L_138_ = true
	local L_139_
	L_136_.InputBegan:connect(function(L_140_arg0)
		if L_140_arg0.KeyCode == Enum.KeyCode.LeftBracket then
			Multiplier = Multiplier + 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.LeftBracket) do
				wait()
				Multiplier = Multiplier + 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.RightBracket then
			Multiplier = Multiplier - 0.01
			print(Multiplier)
			wait(0.2)
			while L_136_:IsKeyDown(Enum.KeyCode.RightBracket) do
				wait()
				Multiplier = Multiplier - 0.01
				print(Multiplier)
			end
		end
		if L_140_arg0.KeyCode == Enum.KeyCode.Z then
			L_138_ = not L_138_
			if L_138_ == true then
				repeat
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Multiplier
					game:GetService("RunService").Stepped:wait()
				until L_138_ == false
			end
		end
	end)
    end
}

local slider = section:Slider{
    Name = "Cframe Speed",
    Text = "[value]/1",
    --Default = 0.1,
    Min = 0,
    Max = 7,
    Float = 0.1,
    Flag = "Dunno",
    Callback = function(s)
     getgenv().Multiplier = s 
    end
}

section:Button{
    Name = "Cframe Fixer",
    Callback  = function()
           for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if v:IsA("Script") and v.Name ~= "Health" and v.Name ~= "Sound" and v:FindFirstChild("LocalScript") then
            v:Destroy()
        end
    end
    game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
        repeat
            wait()
        until game.Players.LocalPlayer.Character
        char.ChildAdded:Connect(function(child)
            if child:IsA("Script") then 
                wait(0.1)
                if child:FindFirstChild("LocalScript") then
                    child.LocalScript:FireServer()
                end
            end
        end)
        end)
end
}

local seperator = section:Separator("Others")

section:Button{
    Name = "AntiStomp (M)",
    Callback  = function()
            game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(KeyPressed)
 if KeyPressed == "m" then
    for L_170_forvar0, L_171_forvar1 in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
        if L_171_forvar1:IsA("BasePart") then
            L_171_forvar1:Destroy()
        end
    end
    end
end)    
    end
}


section:Button{
    Name = "No Jump Cooldown",
    Callback  = function()
      if not game.IsLoaded(game) then 
        game.Loaded.Wait(game.Loaded);
    end

    local IsA = game.IsA;
    local newindex = nil 

    newindex = hookmetamethod(game, "__newindex", function(self, Index, Value)
        if not checkcaller() and IsA(self, "Humanoid") and Index == "JumpPower" then 
            return
        end

        return newindex(self, Index, Value);
    end)       
    end
}

section:Button{
    Name = "AntiSlow (H)",
    Callback  = function()
        repeat
		wait()
	until game:IsLoaded()
	getgenv().Fix = true
	getgenv().TeclasWS = {
		["tecla1"] = "nil",
		["tecla2"] = "nil",
		["tecla3"] = "H"
	}
	local L_121_ = game:GetService("Players")
	local L_122_ = game:GetService("StarterGui") or "son una mierda"
	local L_123_ = L_121_.LocalPlayer
	local L_124_ = L_123_:GetMouse()
	local L_125_ = getrenv()._G
	local L_126_ = getrawmetatable(game)
	local L_127_ = L_126_.__newindex
	local L_128_ = L_126_.__index
	local L_129_ = 22
	local L_130_ = true
	function anunciar_atentado_terrorista(L_138_arg0)
		L_122_:SetCore("SendNotification", {
			Title = "AntiSlow",
			Text = L_138_arg0
		})
	end
	getgenv().TECHWAREWALKSPEED_LOADED = true
	wait(1.5)
	anunciar_atentado_terrorista("Press  " .. TeclasWS.tecla3 .. " to turn on/off antislow")
	L_124_.KeyDown:Connect(
            function(L_139_arg0)
		if L_139_arg0:lower() == TeclasWS.tecla1:lower() then
			L_129_ = L_129_ + 1
			anunciar_atentado_terrorista("播放器速度已提高 (speed = " .. tostring(L_129_) .. ")")
		elseif L_139_arg0:lower() == TeclasWS.tecla2:lower() then
			L_129_ = L_129_ - 1
			anunciar_atentado_terrorista("玩家的速度已降低 (speed = " .. tostring(L_129_) .. ")")
		elseif L_139_arg0:lower() == TeclasWS.tecla3:lower() then
			if L_130_ then
				L_130_ = false
				anunciar_atentado_terrorista("AntiSlow off")
			else
				L_130_ = true
				anunciar_atentado_terrorista("AntiSlow on")
			end
		end
	end
        )
	setreadonly(L_126_, false)
	L_126_.__index =
            newcclosure(
            function(L_140_arg0, L_141_arg1)
		local L_142_ = checkcaller()
		if L_141_arg1 == "WalkSpeed" and not L_142_ then
			return L_125_.CurrentWS
		end
		return L_128_(L_140_arg0, L_141_arg1)
	end
        )
	L_126_.__newindex =
            newcclosure(
            function(L_143_arg0, L_144_arg1, L_145_arg2)
		local L_146_ = checkcaller()
		if L_130_ then
			if L_144_arg1 == "WalkSpeed" and L_145_arg2 ~= 0 and not L_146_ then
				return L_127_(L_143_arg0, L_144_arg1, L_129_)
			end
		end
		return L_127_(L_143_arg0, L_144_arg1, L_145_arg2)
	end
        )
	setreadonly(L_126_, true)
	repeat
		wait()
	until game:IsLoaded()
	local L_131_ = game:service("Players")
	local L_132_ = L_131_.LocalPlayer
	repeat
		wait()
	until L_132_.Character
	local L_133_ = game:service("UserInputService")
	local L_134_ = game:service("RunService")
	local L_135_ = -0.27
	local L_136_ = false
	local L_137_
	L_133_.InputBegan:connect(
            function(L_147_arg0)
		if L_147_arg0.KeyCode == Enum.KeyCode.LeftBracket then
			L_135_ = L_135_ + 0.01
			print(L_135_)
			wait(0.2)
			while L_133_:IsKeyDown(Enum.KeyCode.LeftBracket) do
				wait()
				L_135_ = L_135_ + 0.01
				print(L_135_)
			end
		end
		if L_147_arg0.KeyCode == Enum.KeyCode.RightBracket then
			L_135_ = L_135_ - 0.01
			print(L_135_)
			wait(0.2)
			while L_133_:IsKeyDown(Enum.KeyCode.RightBracket) do
				wait()
				L_135_ = L_135_ - 0.01
				print(L_135_)
			end
		end
		if L_147_arg0.KeyCode == Enum.KeyCode.OP then
			L_136_ = not L_136_
			if L_136_ == true then
				repeat
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame +
                                game.Players.LocalPlayer.Character.Humanoid.MoveDirection * L_135_
					game:GetService("RunService").Stepped:wait()
				until L_136_ == false
			end
		end
	end
        )  
    end
}

section:Button{
    Name = "No Fog",
    Callback  = function()
          while true do
                wait()
                game.Lighting.FogEnd = 1000000000
                wait()  
                end
    end
}

section:Button{
    Name = "No Recoil",
    Callback  = function()
          local CurrentFocus = game:GetService("Workspace").CurrentCamera.CFrame
    game:GetService("Workspace").CurrentCamera:Destroy()
    local Instance = Instance.new("Camera", game:GetService("Workspace"))
    Instance.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
    Instance.CameraType = Enum.CameraType.Custom
    Instance.CFrame = CurrentFocus     
    end
}

section:Button{
    Name = "Realistic Zombie Animations",
    Callback  = function()
        game.Players.LocalPlayer.Character.Animate:ClearAllChildren()
for _, v in pairs(game:GetObjects("rbxassetid://3924238625")[1]:Clone().Animate:GetChildren()) do
    v:Clone().Parent = game.Players.LocalPlayer.Character.Animate
end       
    end
}

section:Button{
    Name = "Rejoin",
    Callback  = function()
            local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Rejoin = coroutine.create(function()
    local Success, ErrorMessage = pcall(function()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end)

    if ErrorMessage and not Success then
        warn(ErrorMessage)
    end
end)

coroutine.resume(Rejoin)    
    end
}

section:Button{
    Name = "UnderGround AA (N)",
    Callback  = function()
    local Toggled = false
local KeyCode = 'n'
local hip = 2.80
local val = -35





function AA()
    local oldVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, val, oldVelocity.Z)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, oldVelocity.Y, oldVelocity.Z)
    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(oldVelocity.X, val, oldVelocity.Z)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = hip
end

game:GetService('UserInputService').InputBegan:Connect(function(Key)
    if Key.KeyCode == Enum.KeyCode[KeyCode:upper()] and not game:GetService('UserInputService'):GetFocusedTextBox() then
        if Toggled then
            Toggled = false
            game.Players.LocalPlayer.Character.Humanoid.HipHeight = hip

        elseif not Toggled then
            Toggled = true

            while Toggled do
                AA()
                task.wait()
            end
        end
    end
end)    
    end
}

section:Button{
    Name = "AntiBag",
    Callback  = function()
     game.Players.LocalPlayer.Character["Christmas_Sock"]:Destroy()    
    end
}



section:Button{
    Name = "Gun Chams",
    Callback  = function()
          local Client = game.GetService(game, "Players").LocalPlayer
        Client.Character:FindFirstChildOfClass("Tool").Default.Material = Enum.Material.ForceField
        Client.Character:FindFirstChildOfClass("Tool").Default.BrickColor  = BrickColor.new(255, 0, 0)
      
    end
}

local colorpicker = section:ColorPicker{
    Name = "Color picker",
    Default = Color3.fromRGB(255, 0, 0),
    Flag = "Color picker 1",
    Callback = function()
    
    
    end
}

section:Button{
    Name = "Spin Bot (B)",
    Callback  = function()
         local L_165_ = false
    local L_166_ = game:GetService("UserInputService");
    L_166_.InputBegan:Connect(function(L_167_arg0, L_168_arg1)
        if (L_167_arg0.KeyCode == Enum.KeyCode.B and L_168_arg1 == false) then
            if L_165_ == false then
                L_165_ = true
                wait()
                getgenv().urspeed = 500
                local L_169_ = game.Players.LocalPlayer.Character
                while wait() do
                    L_169_.HumanoidRootPart.CFrame = L_169_.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(urspeed), 0)
                end
            else
                L_165_ = false
                getgenv().urspeed = 0
            end
        end
    end);
    game:GetService('RunService').Stepped:connect(function()
        if L_165_ == true then
        end
    end)
    game:GetService('RunService').Stepped:connect(function()
        if L_165_ == false then
            stopTracks();
        end
    end)   
    end
}

section:Button{
    Name = "Desync (V)",
    Callback  = function()
    local P1000ToggleKey = "v" -- Change that to whatever keybind: "t"


--// Services
checkcaller = checkcaller
newcclosure = newcclosure
hookmetamethod = hookmetamethod

local PastedSources = false
local BruhXD = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Bullshit = LocalPlayer:GetMouse()


--// Toggles
Bullshit.KeyDown:Connect(function(SayNoToOblivity)
	if SayNoToOblivity == string.lower(P1000ToggleKey) then
		pcall(function()
			if PastedSources == false then
				PastedSources = true
				print("Enabled P1000")
			elseif PastedSources == true then
				PastedSources = false
				print("Disabled P1000")
			end
		end)
	end
end)

Bullshit.KeyDown:Connect(function(SayNoToOblivity)
	if SayNoToOblivity == ("=") then
		game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer) 
	end
end)


--// Desync_Source
function RandomNumberRange(a)
	return math.random(-a * 100, a * 100) / 100
end

function RandomVectorRange(a, b, c)
	return Vector3.new(RandomNumberRange(a), RandomNumberRange(b), RandomNumberRange(c))
end


local DesyncTypes = {}
BruhXD.Heartbeat:Connect(function()
	if PastedSources == true then
		DesyncTypes[1] = LocalPlayer.Character.HumanoidRootPart.CFrame
		DesyncTypes[2] = LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity

		local SpoofThis = LocalPlayer.Character.HumanoidRootPart.CFrame

		SpoofThis = SpoofThis * CFrame.new(Vector3.new(0, 0, 0))
		SpoofThis = SpoofThis * CFrame.Angles(math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)), math.rad(RandomNumberRange(180)))

		LocalPlayer.Character.HumanoidRootPart.CFrame = SpoofThis

		LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(1, 1, 1) * 16384

		BruhXD.RenderStepped:Wait()

		LocalPlayer.Character.HumanoidRootPart.CFrame = DesyncTypes[1]
		LocalPlayer.Character.HumanoidRootPart.AssemblyLinearVelocity = DesyncTypes[2]
	end
end)


--// Hook_CFrame
local XDDDDDD = nil
XDDDDDD = hookmetamethod(game, "__index", newcclosure(function(self, key)
	if PastedSources == true then
		if not checkcaller() then
			if key == "CFrame" and PastedSources == true and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
				if self == LocalPlayer.Character.HumanoidRootPart then
					return DesyncTypes[1] or CFrame.new()
				elseif self == LocalPlayer.Character.Head then
					return DesyncTypes[1] and DesyncTypes[1] + Vector3.new(0, LocalPlayer.Character.HumanoidRootPart.Size / 2 + 0.5, 0) or CFrame.new()
				end
			end
		end
	end
	return XDDDDDD(self, key)
end))    
    end
}

section:Button{
    Name = "Antiban",
    Callback  = function()
     assert(getrawmetatable)
gmt = getrawmetatable(game)
setreadonly(gmt, false)
old = gmt.__namecall
gmt.__namecall =
    newcclosure(
        function(self, ...)
        local args = {...}
        if tostring(args[1]) == "BreathingHAMON" then
            return
        elseif tostring(args[1]) == "TeleportDetect" then
            return
        elseif tostring(args[1]) == "JJARC" then
            return
        elseif tostring(args[1]) == "TakePoisonDamage" then
            return
        elseif tostring(args[1]) == "CHECKER_1" then
            return
        elseif tostring(args[1]) == "CHECKER" then
            return
        elseif tostring(args[1]) == "GUI_CHECK" then
            return
        elseif tostring(args[1]) == "OneMoreTime" then
            return
        elseif tostring(args[1]) == "checkingSPEED" then
            return
        elseif tostring(args[1]) == "BANREMOTE" then
            return
        elseif tostring(args[1]) == "PERMAIDBAN" then
            return
        elseif tostring(args[1]) == "KICKREMOTE" then
            return
        elseif tostring(args[1]) == "BR_KICKPC" then
            return
        elseif tostring(args[1]) == "FORCEFIELD" then
            return
        elseif tostring(args[1]) == "Christmas_Sock" then
            return
        elseif tostring(args[1]) == "VirusCough" then
            return
        elseif tostring(args[1]) == "Symbiote" then
            return
        elseif tostring(args[1]) == "Symbioted" then
            return 
         
        end
        return old(self, ...)
    end)   
    end
}




local Characteristics = main:Tab("Visuals")
local section = Characteristics:Section{
    Name = "Characteristics",
    Side = "Left"
}

section:Button{
    Name = "Headless",
    Callback  = function()
             local L_393_ = game.Players.LocalPlayer.Character
    local L_394_ = L_393_:WaitForChild("Head")
    local L_395_ = L_394_:WaitForChild("face")
    L_395_.Transparency = 1 
    L_394_.Transparency = 1   
    end
}

section:Button{
    Name = "Korblox",
    Callback  = function()
            local L_396_ = game.Players.LocalPlayer.Character
    local L_397_ = game.Players.LocalPlayer.Character
    local L_398_ = L_396_.Head
    local L_399_ = L_398_.face
    local L_400_ = L_397_.RightFoot
    local L_401_ = L_397_.RightLowerLeg
    local L_402_ = L_397_.RightUpperLeg
    local L_403_ = L_397_.LeftFoot
    local L_404_ = L_397_.LeftLowerLeg
    local L_405_ = L_397_.LeftUpperLeg
    
    -- Right
    L_400_.MeshId = "http://www.roblox.com/asset/?id=902942093"
    L_401_.MeshId = "http://www.roblox.com/asset/?id=902942093"
    L_402_.MeshId = "http://www.roblox.com/asset/?id=902942096"
    L_402_.TextureID = "http://roblox.com/asset/?id=902843398"
    L_400_.Transparency = 1
    L_401_.Transparency = 1    
    end
}

section:Button{
    Name = "Fat",
    Callback  = function()
        
    end
}

section:Button{
    Name = "FE Korbloz",
    Callback  = function()
       game.Players.LocalPlayer.Character.RightUpperLeg:Destroy()    
    end
}

local seperator = section:Separator("Faces")

section:Button{
    Name = "Playful Vampire",
    Callback  = function()
                local L_415_ = game.Players.LocalPlayer.Character
	local L_416_ = L_415_:WaitForChild("Head")
	local L_417_ = L_416_:WaitForChild("face")
	L_417_.Texture = "rbxassetid://2409281591"    
    end
}

section:Button{
    Name = "Red Beastmode",
    Callback  = function()
           local L_412_ = game.Players.LocalPlayer.Character
	local L_413_ = L_412_:WaitForChild("Head")
	local L_414_ = L_413_:WaitForChild("face")
	L_414_.Texture = "rbxassetid://127959433"    
    end
}

section:Button{
    Name = "Yum!",
    Callback  = function()
                local L_415_ = game.Players.LocalPlayer.Character
	local L_416_ = L_415_:WaitForChild("Head")
	local L_417_ = L_416_:WaitForChild("face")
	L_417_.Texture = "rbxassetid://26018945"    
    end
}

section:Button{
    Name = "Super Super Happy Face",
    Callback  = function()
                local L_415_ = game.Players.LocalPlayer.Character
	local L_416_ = L_415_:WaitForChild("Head")
	local L_417_ = L_416_:WaitForChild("face")
	L_417_.Texture = "rbxassetid://494290547"    
    end
}

section:Button{
    Name = "Prankster",
    Callback  = function()
                 local L_415_ = game.Players.LocalPlayer.Character
	local L_416_ = L_415_:WaitForChild("Head")
	local L_417_ = L_416_:WaitForChild("face")
	L_417_.Texture = "rbxassetid://20052028"   
    end
}

section:Button{
    Name = "Trouble Maker",
    Callback  = function()
                local L_415_ = game.Players.LocalPlayer.Character
	local L_416_ = L_415_:WaitForChild("Head")
	local L_417_ = L_416_:WaitForChild("face")
	L_417_.Texture = "rbxassetid://22920500"    
    end
}

section:Button{
    Name = "Meanie",
    Callback  = function()
                local L_415_ = game.Players.LocalPlayer.Character
	local L_416_ = L_415_:WaitForChild("Head")
	local L_417_ = L_416_:WaitForChild("face")
	L_417_.Texture = "rbxassetid://508490451"   
    end
}

section:Button{
    Name = "Stitch Face",
    Callback  = function()
                local L_415_ = game.Players.LocalPlayer.Character
	local L_416_ = L_415_:WaitForChild("Head")
	local L_417_ = L_416_:WaitForChild("face")
	L_417_.Texture = "rbxassetid://8329438"    
    end
}

section:Button{
    Name = "Madness",
    Callback  = function()
                 local L_415_ = game.Players.LocalPlayer.Character
	local L_416_ = L_415_:WaitForChild("Head")
	local L_417_ = L_416_:WaitForChild("face")
	L_417_.Texture = "rbxassetid://129900258"   
    end
}

local toggle = section:Button{
    Name = "Body Chams",
    Flag = "Toggle 1",
    --Default = true,
    Callback  = function(bool)
                 game.Players.LocalPlayer.Character.LeftHand.Material = "ForceField"
        game.Players.LocalPlayer.Character.RightHand.Material = "ForceField"
        game.Players.LocalPlayer.Character.LeftLowerArm.Material = "ForceField"
        game.Players.LocalPlayer.Character.RightLowerArm.Material = "ForceField"
        game.Players.LocalPlayer.Character.LeftUpperArm.Material = "ForceField"
        game.Players.LocalPlayer.Character.RightUpperArm.Material = "ForceField"
        game.Players.LocalPlayer.Character.LeftFoot.Material = "ForceField"
        game.Players.LocalPlayer.Character.RightFoot.Material = "ForceField"
        game.Players.LocalPlayer.Character.LeftLowerLeg.Material = "ForceField"
        game.Players.LocalPlayer.Character.RightLowerLeg.Material = "ForceField"
        game.Players.LocalPlayer.Character.UpperTorso.Material = "ForceField"
        game.Players.LocalPlayer.Character.LowerTorso.Material = "ForceField"
        game.Players.LocalPlayer.Character.LeftUpperLeg.Material = "ForceField"
        game.Players.LocalPlayer.Character.RightUpperLeg.Material = "ForceField"
        game.Players.LocalPlayer.Character.Head.Material = "ForceField" 
 
    end
}


local section = Characteristics:Section{
    Name = "World Settings",
    Side = "Right"
}

getgenv().Ambience = true
getgenv().Ambiencecolor = Color3.fromRGB(4, 0, 255)
getgenv().OutdoorAmbient = false
getgenv().OutdoorAmbientcolor = Color3.fromRGB(4, 0, 255)

local toggle = section:Toggle{
    Name = "Ambience",
    Flag = "Toggle 1",
    --Default = true,
    Callback  = function(x)
       getgenv().Ambience = x
   

       while getgenv().Ambience do
           wait()
           game:GetService("Lighting").Ambient = getgenv().Ambiencecolor
       end
   if getgenv().Ambience == false then
       game:GetService("Lighting").Ambient = Color3.fromRGB(0,0,0)
    end
end,
ColorPickerCallback = function(x2)
   getgenv().Ambiencecolor = x2  
    end
}

local colorpicker = section:ColorPicker{
    Name = "Ambience Color",
    Default = Color3.fromRGB(0, 255, 0),
    Flag = "Color picker 1",
    Callback = function(x)
    getgenv().Ambiencecolor = x  
    end
}

local slider = section:Slider{
    Name = "Brightness",
    Text = "[value]/1",
    --Default = 0.1,
    Min = 1,
    Max = 3000,
    Float = 0.3,
    Flag = "Slider 1",
    Callback = function(x)
     game:GetService("Lighting").Brightness = x
    end
}

local Misc = main:Tab("Tps/Autobuys")
local section = Misc:Section{
    Name = "Teleportations",
    Side = "Left"
}

section:Button{
    Name = "Admin Base Foods",
    Callback  = function()
       
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        CFrame.new(-788.39318847656, -39.649200439453, -935.27795410156)    
    end
}


section:Button{
    Name = "Admin Base Guns",
    Callback  = function()
      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-874.903992, -32.6492004, -525.215698)   
    end
}

section:Button{
    Name = "Casino",
    Callback  = function()
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-962.72345, 21.2549973, -186.814987, -0.0274876002, 2.91178949e-05, 0.999621451, -5.5798846e-06, 1, -2.92823333e-05, -0.999621451, -6.38268148e-06, -0.0274876002)
    end
}


section:Button{
    Name = "Bank",
    Callback  = function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-402.123718, 21.75, -283.988617, 0.0159681588, -0.000121377925, -0.999872446, -2.60148026e-05, 1, -0.000121808866, 0.999872506, 2.79565484e-05, 0.0159681737)    
    end
}


section:Button{
    Name = "High-Medium Armor",
    Callback  = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-934.73651123047, -28.492471694946, 565.99884033203)    
    end
}

section:Button{
    Name = "Double Barrel",
    Callback  = function()
     getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1039.59985, 18.8513641, -256.449951, -1, 0, 0, 0, 1, 0, 0, 0, -1)    
    end
}

section:Button{
    Name = "Revolver",
    Callback  = function()
     getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-638.75, 18.8500004, -118.175011, -1, 0, 0, 0, 1, 0, 0, 0, -1)    
    end
}

section:Button{
    Name = "Shotgun",
    Callback  = function()
     getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-578.623657, 5.47212696, -725.131531, 0, 0, 1, 0, 1, -0, -1, 0, 0)   
    end
}

section:Button{
    Name = "Tactical Shotgun",
    Callback  = function()
      getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(470.877533, 45.1272316, -620.630676, 0.999999821, 0.000604254019, -2.60802135e-08, -0.000604254019, 0.999999821, -8.63220048e-05, -2.60802135e-08, 8.63220048e-05, 1)    
    end
}

section:Button{
    Name = "Submachine Gun (SMG)",
    Callback  = function()
    getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-577.123413, 5.47666788, -718.031433, -1, 0, 0, 0, 1, 0, 0, 0, -1)    
    end
}

section:Button{
    Name = "RPG",
    Callback  = function()
     getgenv().game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-794.814697, -42.5468521, -932.97998, 5.96046448e-08, 2.91038305e-11, 1, -0.000610388815, 0.999999821, 2.91038305e-11, -0.999999762, -0.000610388815, 5.96046448e-08)    
    end
}

section:Button{
    Name = "Downhill Bush",
    Callback  = function()
     	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            CFrame.new(
            -626.288757,
            7.99984694,
            -772.322632,
            -0.997374237,
            -1.67662592e-10,
            -0.0724197701,
            -1.00076274e-10,
            1,
            -9.36886457e-10,
            0.0724197701,
            -9.27178945e-10,
            -0.997374237)   
    end
}

section:Button{
    Name = "Taco",
    Callback  = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(583.96, 51.0917, -479.596)
    end
}

section:Button{
    Name = "Police Station",
    Callback  = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-263.919, 21.8302, -112.858)    
    end
}

section:Button{
    Name = "Fire Department",
    Callback  = function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-129.534, 27.842, -113.062)    
    end
}

section:Button{
    Name = "Church",
    Callback  = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(205.53, 21.7803, -80.2361)    
    end
}

section:Button{
    Name = "Casino",
    Callback  = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-904.457, 24.7803, -156.994)    
    end
}

section:Button{
    Name = "Bank Food Shop",
    Callback  = function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-335.141, 23.7129, -298.029)    
    end
}

section:Button{
    Name = "Uphill Food Shop",
    Callback  = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(298.477, 49.3129, -615.231)     
    end
}

section:Button{
    Name = "Downhill Hamburger",
    Callback  = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-279.501, 22.6801, -803.887)    
    end
}

local section = Misc:Section{
    Name = "Autobuys",
    Side = "Right"
}

section:Button{
    Name = "Revolver",
    Callback  = function()
           LocalPlayer = game:GetService "Players".LocalPlayer
        local gunName = "[Revolver] - $1300"
        local k = game.Workspace.Ignored.Shop[gunName]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "Double Barrel",
    Callback  = function()
   
        LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Double-Barrel SG] - $1400"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)     
    end
}

section:Button{
    Name = "SMG",
    Callback  = function()
       LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[SMG] - $750"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[SMG] - $750"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[SMG] - $750"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "AK47",
    Callback  = function()
       LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[AK47] - $2250"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[AK47] - $2250"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[AK47] - $2250"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "LMG",
    Callback  = function()
     LocalPlayer = game:GetService "Players".LocalPlayer
    local k = game.Workspace.Ignored.Shop["[LMG] - $3750"]
    local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
    wait(0.5)
    fireclickdetector(game.Workspace.Ignored.Shop["[LMG] - $3750"].ClickDetector)
    fireclickdetector(game.Workspace.Ignored.Shop["[LMG] - $3750"].ClickDetector)
    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "Glock",
    Callback  = function()
         LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Glock] - $500"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Glock] - $500"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Glock] - $500"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "Silencer",
    Callback  = function()
       LocalPlayer = game:GetService "Players".LocalPlayer
    local k = game.Workspace.Ignored.Shop["[Silencer] - $550"]
    local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
    wait(0.5)
    fireclickdetector(game.Workspace.Ignored.Shop["[Silencer] - $550"].ClickDetector)
    fireclickdetector(game.Workspace.Ignored.Shop["[Silencer] - $550"].ClickDetector)
    LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "RPG",
    Callback  = function()
     LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[RPG] - $6000"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[RPG] - $6000"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[RPG] - $6000"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "FlameThrower",
    Callback  = function()
           LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Flamethrower] - $25000"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Flamethrower] - $25000"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Flamethrower] - $25000"].ClickDetector)

        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "Aug",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[AUG] - $1950"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[AUG] - $1950"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[AUG] - $1950"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}

local seperator = section:Separator("Ammo")

section:Button{
    Name = "Revolver Ammo",
    Callback  = function()
      local LocalPlayer = game:GetService "Players".LocalPlayer
        local gunName = "12 [Revolver Ammo] - $75"
        local k = game.Workspace.Ignored.Shop[gunName]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop[gunName].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "DB Ammo",
    Callback  = function()
           local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["18 [Double-Barrel SG Ammo] - $60"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "SMG Ammo",
    Callback  = function()
         LocalPlayer = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["80 [SMG Ammo] - $60"]
            local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["80 [SMG Ammo] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["80 [SMG Ammo] - $60"].ClickDetector)
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "AK47 Ammo",
    Callback  = function()
     LocalPlayer = game:GetService "Players".LocalPlayer
                local k = game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"]
                local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
                wait(0.5)
                fireclickdetector(game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"].ClickDetector)
                fireclickdetector(game.Workspace.Ignored.Shop["90 [AK47 Ammo] - $80"].ClickDetector)
                LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "LMG Ammo",
    Callback  = function()
            local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["200 [LMG Ammo] - $300"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["200 [LMG Ammo] - $300"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["200 [LMG Ammo] - $300"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "Glock Ammo",
    Callback  = function()
       local LocalPlayer = game:GetService "Players".LocalPlayer
            local k = game.Workspace.Ignored.Shop["25 [Glock Ammo] - $60"]
            local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
            wait(0.5)
            fireclickdetector(game.Workspace.Ignored.Shop["25 [Glock Ammo] - $60"].ClickDetector)
            fireclickdetector(game.Workspace.Ignored.Shop["25 [Glock Ammo] - $60"].ClickDetector)
            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "Silencer",
    Callback  = function()
               local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["25 [Silencer Ammo] - $50"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["25 [Silencer Ammo] - $50"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["25 [Silencer Ammo] - $50"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)   
    end
}

section:Button{
    Name = "RPG Ammo",
    Callback  = function()
         local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["5 [RPG Ammo] - $1000"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["5 [RPG Ammo] - $1000"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["5 [RPG Ammo] - $1000"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)     
    end
}

section:Button{
    Name = "FlameThrower",
    Callback  = function()
    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["140 [Flamethrower Ammo] - $1550"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["140 [Flamethrower Ammo] - $1550"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["140 [Flamethrower Ammo] - $1550"].ClickDetector)

        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "AUG Ammo",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["90 [AUG Ammo] - $80"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["90 [AUG Ammo] - $80"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["90 [AUG Ammo] - $80"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}

local Misc = main:Tab("Autobuys V2")
local section = Misc:Section{
    Name = "Melee's",
    Side = "Left"
}

 section:Button{
    Name = "Knife",
    Callback  = function()
                   local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Knife] - $150"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Knife] - $150"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Knife] - $150"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos) 
   
    end
}


section:Button{
    Name = "Bat",
    Callback  = function()
                       local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Bat] - $275"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Bat] - $275"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Bat] - $275"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos) 
       
    end
}

section:Button{
    Name = "Shovel",
    Callback  = function()
                       local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Shovel] - $320"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Shovel] - $320"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Shovel] - $320"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos) 
       
    end
}

section:Button{
    Name = "Pitchfork",
    Callback  = function()
                      local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Pitchfork] - 320$"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Pitchfork] - 320$"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Pitchfork] - 320$"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos) 
        
    end
}

section:Button{
    Name = "Pencil",
    Callback  = function()
                   local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Pencil] - $175"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Pencil] - $175"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Pencil] - $175"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)     
    end
}

section:Button{
    Name = "SledgeHammer",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[SledgeHammer] - $350"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[SledgeHammer] - $350"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[SledgeHammer] - $350"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}









local section = Misc:Section{
    Name = "Other Shit",
    Side = "Right"
}

section:Button{
    Name = "LockPick",
    Callback  = function()
                     local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[LockPick] - $125"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[LockPick] - $125"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[LockPick] - $125"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)       
    end
}

section:Button{
    Name = "Key",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Key] - $125"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Key] - $125"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Key] - $125"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}

section:Button{
    Name = "Flashlight",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Flashlight] - $10"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Flashlight] - $10"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Flashlight] - $10"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}

section:Button{
    Name = "Bag",
    Callback  = function()
                   local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[BrownBag] - $25"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[BrownBag] - $25"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[BrownBag] - $25"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)         
    end
}

section:Button{
    Name = "PepperSpray",
    Callback  = function()
                   local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[PepperSpray] - $150"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[PepperSpray] - $150"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[PepperSpray] - $150"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)         
    end
}

local section = Misc:Section{
    Name = "Mask",
    Side = "Left"
}
section:Button{
    Name = "Surgeon Mask",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Surgeon Mask] - $25"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}

section:Button{
    Name = "Hockey Mask ",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Hockey Mask] - $60"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Hockey Mask] - $60"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Hockey Mask] - $60"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}

section:Button{
    Name = "Ninja Mask",
    Callback  = function()
                     local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Ninja Mask] - $60"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Ninja Mask] - $60"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Ninja Mask] - $60"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)       
    end
}

section:Button{
    Name = "Paintball Mask",
    Callback  = function()
                     local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Paintball Mask] - $60"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["Paintball Mask] - $60"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["Paintball Mask] - $60"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)       
    end
}

section:Button{
    Name = "Riot Mask",
    Callback  = function()
                     local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Riot Mask] - $60"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Riot Mask] - $60"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Riot Mask] - $60"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)       
    end
}

section:Button{
    Name = "Pumpkin Mask",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Pumpkin Mask] - $60"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Pumpkin Mask] - $60"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Pumpkin Mask] - $60"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}

section:Button{
    Name = "Skull Mask",
    Callback  = function()
                     local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Skull Mask] - $60"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Skull Mask] - $60"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Skull Mask] - $60"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)       
    end
}

local section = Misc:Section{
    Name = "Food",
    Side = "Right"
}

section:Button{
    Name = "Chicken",
    Callback  = function()
                     local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Chicken] - $7"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Chicken] - $7"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)       
    end
}


section:Button{
    Name = "Pizza",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Pizza] - $5"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Pizza] - $5"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Pizza] - $5"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}

section:Button{
    Name = "Cranberry",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Cranberry] - $3"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Cranberry] - $3"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Cranberry] - $3"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}

section:Button{
    Name = "Hamburger",
    Callback  = function()
                     local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Hamburger] - $5"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Hamburger] - $5"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Hamburger] - $5"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)       
    end
}

section:Button{
    Name = "Taco",
    Callback  = function()
                        local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Taco] - $2"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Taco] - $2"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Taco] - $2"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)    
    end
}

section:Button{
    Name = "Starblox Latte",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Starblox Latte] - $5"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Starblox Latte] - $5"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Starblox Latte] - $5"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}

section:Button{
    Name = "Donut",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Donut] - $5"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Donut] - $5"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Donut] - $5"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}

section:Button{
    Name = "Popcorn",
    Callback  = function()
                    local LocalPlayer = game:GetService "Players".LocalPlayer
        local k = game.Workspace.Ignored.Shop["[Popcorn] - $7"]
        local savedsilencerpos = LocalPlayer.Character.HumanoidRootPart.Position
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = k.Head.CFrame + Vector3.new(0, 3, 0)
        wait(0.5)
        fireclickdetector(game.Workspace.Ignored.Shop["[Popcorn] - $7"].ClickDetector)
        fireclickdetector(game.Workspace.Ignored.Shop["[Popcorn] - $7"].ClickDetector)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(savedsilencerpos)        
    end
}

local configs = main:Tab("Settings")

local themes = configs:Section{Name = "Theme", Side = "Left"}

local themepickers = {}

local themelist = themes:Dropdown{
    Name = "Theme",
    Default = library.currenttheme,
    Content = library:GetThemes(),
    Flag = "Theme Dropdown",
    Callback = function(option)
        if option then
            library:SetTheme(option)

            for option, picker in next, themepickers do
                picker:Set(library.theme[option])
            end
        end
    end
}

library:ConfigIgnore("Theme Dropdown")

local namebox = themes:Box{
    Name = "Custom Theme Name",
    Placeholder = "Custom Theme",
    Flag = "Custom Theme"
}

library:ConfigIgnore("Custom Theme")

themes:Button{
    Name = "Save Custom Theme",
    Callback = function()
        if library:SaveCustomTheme(library.flags["Custom Theme"]) then
            themelist:Refresh(library:GetThemes())
            themelist:Set(library.flags["Custom Theme"])
            namebox:Set("")
        end
    end
}

local customtheme = configs:Section{Name = "Custom Theme", Side = "Right"}

themepickers["Accent"] = customtheme:ColorPicker{
    Name = "Accent",
    Default = library.theme["Accent"],
    Flag = "Accent",
    Callback = function(color)
        library:ChangeThemeOption("Accent", color)
    end
}

library:ConfigIgnore("Accent")

themepickers["Window Background"] = customtheme:ColorPicker{
    Name = "Window Background",
    Default = library.theme["Window Background"],
    Flag = "Window Background",
    Callback = function(color)
        library:ChangeThemeOption("Window Background", color)
    end
}

library:ConfigIgnore("Window Background")

themepickers["Window Border"] = customtheme:ColorPicker{
    Name = "Window Border",
    Default = library.theme["Window Border"],
    Flag = "Window Border",
    Callback = function(color)
        library:ChangeThemeOption("Window Border", color)
    end
}

library:ConfigIgnore("Window Border")

themepickers["Tab Background"] = customtheme:ColorPicker{
    Name = "Tab Background",
    Default = library.theme["Tab Background"],
    Flag = "Tab Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Background", color)
    end
}

library:ConfigIgnore("Tab Background")

themepickers["Tab Border"] = customtheme:ColorPicker{
    Name = "Tab Border",
    Default = library.theme["Tab Border"],
    Flag = "Tab Border",
    Callback = function(color)
        library:ChangeThemeOption("Tab Border", color)
    end
}

library:ConfigIgnore("Tab Border")

themepickers["Tab Toggle Background"] = customtheme:ColorPicker{
    Name = "Tab Toggle Background",
    Default = library.theme["Tab Toggle Background"],
    Flag = "Tab Toggle Background",
    Callback = function(color)
        library:ChangeThemeOption("Tab Toggle Background", color)
    end
}

library:ConfigIgnore("Tab Toggle Background")

themepickers["Section Background"] = customtheme:ColorPicker{
    Name = "Section Background",
    Default = library.theme["Section Background"],
    Flag = "Section Background",
    Callback = function(color)
        library:ChangeThemeOption("Section Background", color)
    end
}

library:ConfigIgnore("Section Background")

themepickers["Section Border"] = customtheme:ColorPicker{
    Name = "Section Border",
    Default = library.theme["Section Border"],
    Flag = "Section Border",
    Callback = function(color)
        library:ChangeThemeOption("Section Border", color)
    end
}

library:ConfigIgnore("Section Border")

themepickers["Text"] = customtheme:ColorPicker{
    Name = "Text",
    Default = library.theme["Text"],
    Flag = "Text",
    Callback = function(color)
        library:ChangeThemeOption("Text", color)
    end
}

library:ConfigIgnore("Text")

themepickers["Disabled Text"] = customtheme:ColorPicker{
    Name = "Disabled Text",
    Default = library.theme["Disabled Text"],
    Flag = "Disabled Text",
    Callback = function(color)
        library:ChangeThemeOption("Disabled Text", color)
    end
}

library:ConfigIgnore("Disabled Text")

themepickers["Object Background"] = customtheme:ColorPicker{
    Name = "Object Background",
    Default = library.theme["Object Background"],
    Flag = "Object Background",
    Callback = function(color)
        library:ChangeThemeOption("Object Background", color)
    end
}

library:ConfigIgnore("Object Background")

themepickers["Object Border"] = customtheme:ColorPicker{
    Name = "Object Border",
    Default = library.theme["Object Border"],
    Flag = "Object Border",
    Callback = function(color)
        library:ChangeThemeOption("Object Border", color)
    end
}

library:ConfigIgnore("Object Border")

themepickers["Dropdown Option Background"] = customtheme:ColorPicker{
    Name = "Dropdown Option Background",
    Default = library.theme["Dropdown Option Background"],
    Flag = "Dropdown Option Background",
    Callback = function(color)
        library:ChangeThemeOption("Dropdown Option Background", color)
    end
}

library:ConfigIgnore("Dropdown Option Background")

local configsection = configs:Section{Name = "Configs", Side = "Left"}

local configlist = configsection:Dropdown{
    Name = "Configs",
    Content = library:GetConfigs(), -- GetConfigs(true) if you want universal configs
    Flag = "Config Dropdown"
}

library:ConfigIgnore("Config Dropdown")

local loadconfig = configsection:Button{
    Name = "Load Config",
    Callback = function()
        library:LoadConfig(library.flags["Config Dropdown"]) -- LoadConfig(library.flags["Config Dropdown"], true)  if you want universal configs
    end
}

local delconfig = configsection:Button{
    Name = "Delete Config",
    Callback = function()
        library:DeleteConfig(library.flags["Config Dropdown"]) -- DeleteConfig(library.flags["Config Dropdown"], true)  if you want universal configs
        configlist:Refresh(library:GetConfigs())
    end
}


local configbox = configsection:Box{
    Name = "Config Name",
    Placeholder = "Config Name",
    Flag = "Config Name"
}

library:ConfigIgnore("Config Name")

local save = configsection:Button{
    Name = "Save Config",
    Callback = function()
        library:SaveConfig(library.flags["Config Dropdown"] or library.flags["Config Name"]) -- SaveConfig(library.flags["Config Name"], true) if you want universal configs
        configlist:Refresh(library:GetConfigs())
    end
}

local keybindsection = configs:Section{Name = "UI Toggle Keybind", Side = "Left"}

keybindsection:Keybind{
    Name = "UI Toggle",
    Flag = "UI Toggle",
    Default = Enum.KeyCode.RightShift,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Callback = function(_, fromsetting)
        if not fromsetting then
            library:Close()
        end
    end
}

