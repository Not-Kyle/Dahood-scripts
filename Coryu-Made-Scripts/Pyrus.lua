--pyrus

--[[
	Make More Info Esp (have deep info on the target)
    Make something to identify a Pyrus User
    Make Noclip work
    Make easy FOV
]]--

getgenv().Players = game:GetService'Players';
getgenv().LocalPlayer = Players.LocalPlayer;
getgenv().Mouse = LocalPlayer:GetMouse();
getgenv().Teleport = game:GetService'TeleportService'
getgenv().RunService = game:GetService'RunService'
getgenv().UserInputService = game:GetService'UserInputService'
getgenv().UserNotifications = function(title, text, time) game.StarterGui:SetCore("SendNotification", {Title = title; Text = text; Icon = 'rbxassetid://13941412659'; Duration = time;}) end
getgenv().Work = game:GetService'Workspace'
getgenv().Camera = Work.CurrentCamera
getgenv().StarterGui = game:GetService'StarterGui'
getgenv().GetHead = function() return LocalPlayer.Character:FindFirstChild'Head' end
getgenv().GetUpperTorso = function() return LocalPlayer.Character:FindFirstChild'UpperTorso' end
getgenv().GetLowerTorso = function() return LocalPlayer.Character:FindFirstChild'LowerTorso' end
getgenv().getHttp = game:GetService'HttpService'
local ColorsSaved;
local ChatSaved;
local function FolderCheck()
    if isfolder('Coryu') == nil then
        makefolder('Coryu') 
    elseif isfolder('Coryu/Dahood') == nil then
        makefolder('Coryu/Dahood')
    end
end
makefolder('Coryu/Dahood/Pyrus')
makefolder('Coryu/Dahood/Pyrus/Colors')
pcall(function()
    ColorsSaved = readfile('Coryu/Dahood/Pyrus/Colors/UiColors.lua')
    ChatSaved = readfile('Coryu/Dahood/Pyrus/Chat.lua')
end)
-- | Booleans | --

local BasicInfo = true
local Blink = true
local Blinking = false
local Camlock = false
local CamlockGui = false
local CFrameSprint = false
local CFrameSprinting = false
local DeepInfo = false
local EspColoringFrame = false
local EspShapesFrameToggle = false
local LookVectorSprint = false
local LookVectorSprinting = false
local MoreInfoEsp = false
local Noclip = false
local RectangeEsp = true
local RestoreUISettings = false
local ShapesEsp = true
local Sprint = false
local SprintGui = false
local TracerEsp = true

-- | Ints | --

local SprintSpeedLookVector = 200;
local BlinkSpeed = 8;
local CFrameSpeed = 5;
local ThicknessDraw = 2;
local Radius = 70;
local SpinSpeed = 30;

-- | Hotkeys | --

local LookVectorSpeedKey = 'LeftShift'
local BlinkKey = 'LeftShift'
local CFrameKey = 'LeftShift'
local CamlockKey = 'V'

-- | Nils | --

local CamlockTarget;
local DeepInfoTarget;
local EspColor;
local EspTarget;

-- | Methods | --

local CamlockedPart = 'HumanoidRootPart';
local EspMethod = 'Rectangle'

-- | Sounds | --

local UserJoins = 'rbxassetid://1862048961';

-- | Tables | --

local KeysTable = {
	['W'] = false;
	['A'] = false;
	['S'] = false;
	['D'] = false;
}

local AbledParts = {
	['Torso'] = 'Torso';
	['Head'] = 'Head';
	['HumanoidRootPart'] = 'HumanoidRootPart';
}

local EspColorTable = {
	['Red'] = Color3.fromRGB(255,0,0);
	['Royal Purple'] = Color3.fromRGB(85,0,255);
	['Yellow'] = Color3.fromRGB(255, 255, 0);
	['Orange'] = Color3.fromRGB(255,140,0);
	['Blue'] = Color3.fromRGB(0,0,255);
	['Green'] = Color3.fromRGB(0,255,0);
	['Pink'] = Color3.fromRGB(255, 85, 255);
}

local ChatT = {
	['T'] = 'Pyrus';
}

local ChatMsg = {
    ['TextSize'] = 20;
    ['Color'] = Color3.fromRGB(85,0,255);
    ['Font'] = Enum.Font.Code;
    ['Text'] = ChatT['T'];
}

local UiColors = {
    ['HotKey'] = 'X';
}


-- | Gui | --

local Yas = Instance.new'ScreenGui'
Yas.Name = "Yas" 
Yas.Parent = game:WaitForChild'CoreGui'
Yas.ResetOnSpawn = false

local BackFrameToStatusFrame = Instance.new("ImageLabel")
BackFrameToStatusFrame.Name = "BackFrameToStatusFrame"
BackFrameToStatusFrame.Parent = Yas
BackFrameToStatusFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BackFrameToStatusFrame.BackgroundTransparency = 1.000
BackFrameToStatusFrame.Position = UDim2.new(0.2, 0, 0.803837836, 0)
BackFrameToStatusFrame.Size = UDim2.new(0, 233, 0, 220)
BackFrameToStatusFrame.Image = "rbxassetid://3570695787"
BackFrameToStatusFrame.ImageColor3 = Color3.fromRGB(0, 0, 0)
BackFrameToStatusFrame.ScaleType = Enum.ScaleType.Slice
BackFrameToStatusFrame.SliceCenter = Rect.new(100, 100, 100, 100)
BackFrameToStatusFrame.SliceScale = 0.040

local StatusFrame = Instance.new("Frame")
StatusFrame.Name = "StatusFrame"
StatusFrame.Parent = BackFrameToStatusFrame
StatusFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
StatusFrame.BorderColor3 = Color3.fromRGB(85, 0, 255)
StatusFrame.BorderSizePixel = 2
StatusFrame.Position = UDim2.new(0.0257510729, 0, 0.0307692308, 0)
StatusFrame.Size = UDim2.new(0, 221, 0, 205)

local Gui = Instance.new("ImageLabel")
Gui.Name = "gui"
Gui.Parent = Yas
Gui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Gui.BackgroundTransparency = 1.000
Gui.Position = UDim2.new(0.642720938, 0, 0.0804721043, 0)
Gui.Size = UDim2.new(0, 475, 0, 563)
Gui.Image = "rbxassetid://3570695787"
Gui.ImageColor3 = Color3.fromRGB(0, 0, 0)
Gui.ScaleType = Enum.ScaleType.Slice
Gui.SliceCenter = Rect.new(100, 100, 100, 100)
Gui.SliceScale = 0.040
Gui.ZIndex = 1
Gui.Active = true
Gui.Draggable = true

local FrontGui = Instance.new("Frame")
FrontGui.Name = "FrontGui"
FrontGui.Parent = Gui
FrontGui.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
FrontGui.BorderColor3 = Color3.fromRGB(85, 0, 255)
FrontGui.BorderSizePixel = 2
FrontGui.Position = UDim2.new(0.0107457852, 0, 0.00946034119, 0)
FrontGui.Size = UDim2.new(0, 464, 0, 552)
FrontGui.ZIndex = 1

local Line = Instance.new("Frame")
Line.Name = "Line"
Line.Parent = FrontGui
Line.BackgroundColor3 = Color3.fromRGB(85, 0, 255)
Line.BorderColor3 = Color3.fromRGB(0, 0, 0)
Line.BorderSizePixel = 0
Line.Position = UDim2.new(0, 0, 0.954710126, 0)
Line.Size = UDim2.new(0, 464, 0, 2)
Line.ZIndex = 1

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = FrontGui
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.721, 0, 0.954710126, 0)
Title.Size = UDim2.new(0, 68, 0, 25)
Title.ZIndex = 1
Title.Font = Enum.Font.Highway
Title.Text = "Pyrus - Made By Coryu"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 17.000

local CombatButton = Instance.new("TextButton")
CombatButton.Name = "CombatButton"
CombatButton.Parent = FrontGui
CombatButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CombatButton.BackgroundTransparency = 1.000
CombatButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CombatButton.BorderSizePixel = 0
CombatButton.Position = UDim2.new(0, 0, 0.954710126, 0)
CombatButton.Size = UDim2.new(0, 61, 0, 25)
CombatButton.ZIndex = 1
CombatButton.Font = Enum.Font.Highway
CombatButton.Text = "Combat"
CombatButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CombatButton.TextSize = 17.000

local MiscellaneousButton = Instance.new("TextButton")
MiscellaneousButton.Name = "MiscellaneousButton"
MiscellaneousButton.Parent = FrontGui
MiscellaneousButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MiscellaneousButton.BackgroundTransparency = 1.000
MiscellaneousButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
MiscellaneousButton.BorderSizePixel = 0
MiscellaneousButton.Position = UDim2.new(0.118534483, 0, 0.954710126, 0)
MiscellaneousButton.Size = UDim2.new(0, 48, 0, 25)
MiscellaneousButton.Font = Enum.Font.Highway
MiscellaneousButton.Text = "Misc"
MiscellaneousButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MiscellaneousButton.TextSize = 17.000

local BackFrameCombat = Instance.new("Frame")
BackFrameCombat.Name = "BackFrameCombat"
BackFrameCombat.Parent = CombatButton
BackFrameCombat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BackFrameCombat.BackgroundTransparency = 1.000
BackFrameCombat.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackFrameCombat.BorderSizePixel = 0
BackFrameCombat.Position = UDim2.new(0, 0, -21.0799999, 0)
BackFrameCombat.Size = UDim2.new(0, 464, 0, 527)
BackFrameCombat.ZIndex = 1
BackFrameCombat.Visible = true

local BackFrameMisc = Instance.new("Frame")
BackFrameMisc.Name = "BackFrameMisc"
BackFrameMisc.Parent = MiscellaneousButton
BackFrameMisc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BackFrameMisc.BackgroundTransparency = 1.000
BackFrameMisc.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackFrameMisc.BorderSizePixel = 0
BackFrameMisc.Position = UDim2.new(-1.14583337, 0, -21.0799999, 0)
BackFrameMisc.Size = UDim2.new(0, 464, 0, 527)
BackFrameMisc.Visible = false

local ScrollFrameOneMisc = Instance.new("ScrollingFrame")
ScrollFrameOneMisc.Name = "ScrollFrameOneMisc"
ScrollFrameOneMisc.Parent = BackFrameMisc
ScrollFrameOneMisc.Active = true
ScrollFrameOneMisc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollFrameOneMisc.BackgroundTransparency = 1.000
ScrollFrameOneMisc.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollFrameOneMisc.BorderSizePixel = 0
ScrollFrameOneMisc.Size = UDim2.new(0, 232, 0, 527)
ScrollFrameOneMisc.ScrollBarThickness = 4
ScrollFrameOneMisc.ScrollBarImageColor3 = Color3.fromRGB(85,0,255)

local ScrollFrameOneCombat = Instance.new("ScrollingFrame")
ScrollFrameOneCombat.Name = "ScrollFrameOneCombat"
ScrollFrameOneCombat.Parent = BackFrameCombat
ScrollFrameOneCombat.Active = true
ScrollFrameOneCombat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollFrameOneCombat.BackgroundTransparency = 1.000
ScrollFrameOneCombat.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollFrameOneCombat.BorderSizePixel = 0
ScrollFrameOneCombat.Size = UDim2.new(0, 232, 0, 527)
ScrollFrameOneCombat.ZIndex = 1
ScrollFrameOneCombat.ScrollBarThickness = 4
ScrollFrameOneCombat.ScrollBarImageColor3 = Color3.fromRGB(85,0,255)

local MiscellaneousScrollFrameOne = Instance.new("Frame")
MiscellaneousScrollFrameOne.Name = "MiscellaneousScrollFrameOne"
MiscellaneousScrollFrameOne.Parent = ScrollFrameOneMisc
MiscellaneousScrollFrameOne.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MiscellaneousScrollFrameOne.BorderColor3 = Color3.fromRGB(0, 0, 0)
MiscellaneousScrollFrameOne.BorderSizePixel = 0
MiscellaneousScrollFrameOne.Position = UDim2.new(0.0299999993, 0, 0.00499999989, 0)
MiscellaneousScrollFrameOne.Size = UDim2.new(0, 215, 0, 80)

local CamlockFrameCombat = Instance.new("Frame")
CamlockFrameCombat.Name = "CamlockFrameCombat"
CamlockFrameCombat.Parent = ScrollFrameOneCombat
CamlockFrameCombat.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
CamlockFrameCombat.BorderColor3 = Color3.fromRGB(0, 0, 0)
CamlockFrameCombat.BorderSizePixel = 0
CamlockFrameCombat.Position = UDim2.new(0.0299999993, 0, 0.00499999989, 0)
CamlockFrameCombat.Size = UDim2.new(0, 215, 0, 191)

local EspConfigFrame = Instance.new("Frame")
EspConfigFrame.Name = "EspConfigFrame"
EspConfigFrame.Parent = ScrollFrameOneCombat
EspConfigFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
EspConfigFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspConfigFrame.BorderSizePixel = 0
EspConfigFrame.Position = UDim2.new(0.0299999993, 0, 0.194999993, 0)
EspConfigFrame.Size = UDim2.new(0, 215, 0, 335)

local EspTitle = Instance.new("TextLabel")
EspTitle.Name = "EspTitle"
EspTitle.Parent = EspConfigFrame
EspTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EspTitle.BackgroundTransparency = 1.000
EspTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspTitle.BorderSizePixel = 0
EspTitle.Position = UDim2.new(-0.00236646086, 0, -0.000779511291, 0)
EspTitle.Size = UDim2.new(0, 45, 0, 19)
EspTitle.Font = Enum.Font.Highway
EspTitle.Text = "Esp"
EspTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
EspTitle.TextSize = 13.000
EspTitle.TextXAlignment = Enum.TextXAlignment.Left

local EspColorButton = Instance.new("TextButton")
EspColorButton.Name = "EspColorButton"
EspColorButton.Parent = EspConfigFrame
EspColorButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
EspColorButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspColorButton.BorderSizePixel = 0
EspColorButton.Position = UDim2.new(0.0325581394, 0, 0.358803451, 0)
EspColorButton.Size = UDim2.new(0, 200, 0, 21)
EspColorButton.Font = Enum.Font.Highway
EspColorButton.Text = "Royal Purple"
EspColorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EspColorButton.TextSize = 14.000

local EspColorText = Instance.new("TextLabel")
EspColorText.Name = "EspColorText"
EspColorText.Parent = EspColorButton
EspColorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EspColorText.BackgroundTransparency = 1.000
EspColorText.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspColorText.BorderSizePixel = 0
EspColorText.Position = UDim2.new(0.264999986, 0, -1.07843161, 0)
EspColorText.Size = UDim2.new(0, 85, 0, 15)
EspColorText.Font = Enum.Font.Highway
EspColorText.Text = "Esp Color"
EspColorText.TextColor3 = Color3.fromRGB(255, 255, 255)
EspColorText.TextSize = 14.000

local EspColorTextUpOrDown = Instance.new("TextLabel")
EspColorTextUpOrDown.Name = "EspColorTextUpOrDown"
EspColorTextUpOrDown.Parent = EspColorButton
EspColorTextUpOrDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EspColorTextUpOrDown.BackgroundTransparency = 1.000
EspColorTextUpOrDown.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspColorTextUpOrDown.BorderSizePixel = 0
EspColorTextUpOrDown.Position = UDim2.new(0.899999976, 0, 0, 0)
EspColorTextUpOrDown.Size = UDim2.new(0, 20, 0, 21)
EspColorTextUpOrDown.Font = Enum.Font.Highway
EspColorTextUpOrDown.Text = "▼"
EspColorTextUpOrDown.TextColor3 = Color3.fromRGB(255, 255, 255)
EspColorTextUpOrDown.TextSize = 18.000

local EspColorFrame = Instance.new("Frame")
EspColorFrame.Name = "EspColorFrame"
EspColorFrame.Parent = EspColorButton
EspColorFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
EspColorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspColorFrame.BorderSizePixel = 0
EspColorFrame.Position = UDim2.new(0, 0, 1.00000143, 0)
EspColorFrame.Size = UDim2.new(0, 200, 0, 193)
EspColorFrame.Visible = false
EspColorFrame.ZIndex = 2

local RedEspButton = Instance.new("TextButton")
RedEspButton.Name = "RedEspButton"
RedEspButton.Parent = EspColorFrame
RedEspButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
RedEspButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
RedEspButton.BorderSizePixel = 0
RedEspButton.Position = UDim2.new(0.0280000009, 0, 0.0399999991, 0)
RedEspButton.Size = UDim2.new(0, 188, 0, 21)
RedEspButton.ZIndex = 2
RedEspButton.Font = Enum.Font.Highway
RedEspButton.Text = "Red"
RedEspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RedEspButton.TextSize = 14.000

local PurpleEspButton = Instance.new("TextButton")
PurpleEspButton.Name = "PurpleEspButton"
PurpleEspButton.Parent = EspColorFrame
PurpleEspButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
PurpleEspButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
PurpleEspButton.BorderSizePixel = 0
PurpleEspButton.Position = UDim2.new(0.0280000009, 0, 0.180000007, 0)
PurpleEspButton.Size = UDim2.new(0, 188, 0, 21)
PurpleEspButton.ZIndex = 2
PurpleEspButton.Font = Enum.Font.Highway
PurpleEspButton.Text = "Royal Purple"
PurpleEspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PurpleEspButton.TextSize = 14.000

local YellowEspButton = Instance.new("TextButton")
YellowEspButton.Name = "YellowEspButton"
YellowEspButton.Parent = EspColorFrame
YellowEspButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
YellowEspButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
YellowEspButton.BorderSizePixel = 0
YellowEspButton.Position = UDim2.new(0.0279998779, 0, 0.322020859, 0)
YellowEspButton.Size = UDim2.new(0, 188, 0, 21)
YellowEspButton.ZIndex = 2
YellowEspButton.Font = Enum.Font.Highway
YellowEspButton.Text = "Yellow"
YellowEspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
YellowEspButton.TextSize = 14.000

local OrangeEspButton = Instance.new("TextButton")
OrangeEspButton.Name = "OrangeEspButton"
OrangeEspButton.Parent = EspColorFrame
OrangeEspButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
OrangeEspButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
OrangeEspButton.BorderSizePixel = 0
OrangeEspButton.Position = UDim2.new(0.0280000009, 0, 0.460000008, 0)
OrangeEspButton.Size = UDim2.new(0, 188, 0, 21)
OrangeEspButton.ZIndex = 2
OrangeEspButton.Font = Enum.Font.Highway
OrangeEspButton.Text = "Orange"
OrangeEspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
OrangeEspButton.TextSize = 14.000

local BlueEspButton = Instance.new("TextButton")
BlueEspButton.Name = "BlueEspButton"
BlueEspButton.Parent = EspColorFrame
BlueEspButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BlueEspButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
BlueEspButton.BorderSizePixel = 0
BlueEspButton.Position = UDim2.new(0.0280000009, 0, 0.600000024, 0)
BlueEspButton.Size = UDim2.new(0, 188, 0, 21)
BlueEspButton.ZIndex = 2
BlueEspButton.Font = Enum.Font.Highway
BlueEspButton.Text = "Blue"
BlueEspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BlueEspButton.TextSize = 14.000

local GreenEspButton = Instance.new("TextButton")
GreenEspButton.Name = "GreenEspButton"
GreenEspButton.Parent = EspColorFrame
GreenEspButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GreenEspButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
GreenEspButton.BorderSizePixel = 0
GreenEspButton.Position = UDim2.new(0.0280000009, 0, 0.74000001, 0)
GreenEspButton.Size = UDim2.new(0, 188, 0, 21)
GreenEspButton.ZIndex = 2
GreenEspButton.Font = Enum.Font.Highway
GreenEspButton.Text = "Green"
GreenEspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GreenEspButton.TextSize = 14.000

local PinkEspButton = Instance.new("TextButton")
PinkEspButton.Name = "PinkEspButton"
PinkEspButton.Parent = EspColorFrame
PinkEspButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
PinkEspButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
PinkEspButton.BorderSizePixel = 0
PinkEspButton.Position = UDim2.new(0.0280000009, 0, 0.879999995, 0)
PinkEspButton.Size = UDim2.new(0, 188, 0, 21)
PinkEspButton.ZIndex = 2
PinkEspButton.Font = Enum.Font.Highway
PinkEspButton.Text = "Pink"
PinkEspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
PinkEspButton.TextSize = 14.000

local EspTargetBox = Instance.new("TextBox")
EspTargetBox.Name = "EspTargetBox"
EspTargetBox.Parent = EspConfigFrame
EspTargetBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
EspTargetBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspTargetBox.BorderSizePixel = 0
EspTargetBox.Position = UDim2.new(0.0325581394, 0, 0.128870174, 0)
EspTargetBox.Size = UDim2.new(0, 200, 0, 21)
EspTargetBox.Font = Enum.Font.Highway
EspTargetBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
EspTargetBox.PlaceholderText = "Enter Player Username!"
EspTargetBox.Text = ""
EspTargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
EspTargetBox.TextSize = 14.000

local EspTargetText = Instance.new("TextLabel")
EspTargetText.Name = "EspTargetText"
EspTargetText.Parent = EspTargetBox
EspTargetText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EspTargetText.BackgroundTransparency = 1.000
EspTargetText.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspTargetText.BorderSizePixel = 0
EspTargetText.Position = UDim2.new(0.264999986, 0, -1.07843161, 0)
EspTargetText.Size = UDim2.new(0, 85, 0, 15)
EspTargetText.Font = Enum.Font.Highway
EspTargetText.Text = "Esp Target"
EspTargetText.TextColor3 = Color3.fromRGB(255, 255, 255)
EspTargetText.TextSize = 14.000

local TracersButton = Instance.new("TextButton")
TracersButton.Name = "TracersButton"
TracersButton.Parent = EspConfigFrame
TracersButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
TracersButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
TracersButton.Position = UDim2.new(0.0744186044, 0, 0.797202885, 0)
TracersButton.Size = UDim2.new(0, 13, 0, 13)
TracersButton.Font = Enum.Font.Highway
TracersButton.Text = ""
TracersButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TracersButton.TextSize = 14.000

local TracersText = Instance.new("TextLabel")
TracersText.Name = "TracersText"
TracersText.Parent = TracersButton
TracersText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TracersText.BackgroundTransparency = 1.000
TracersText.BorderColor3 = Color3.fromRGB(0, 0, 0)
TracersText.BorderSizePixel = 0
TracersText.Position = UDim2.new(1.15384614, 0, 0, 0)
TracersText.Size = UDim2.new(0, 52, 0, 13)
TracersText.Font = Enum.Font.Highway
TracersText.Text = " - Tracers"
TracersText.TextColor3 = Color3.fromRGB(255, 255, 255)
TracersText.TextSize = 14.000
TracersText.TextXAlignment = Enum.TextXAlignment.Left

local EspConfigTitle = Instance.new("TextLabel")
EspConfigTitle.Name = "EspConfigTitle"
EspConfigTitle.Parent = EspConfigFrame
EspConfigTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EspConfigTitle.BackgroundTransparency = 1.000
EspConfigTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspConfigTitle.BorderSizePixel = 0
EspConfigTitle.Position = UDim2.new(-0.00236646086, 0, 0.22907123, 0)
EspConfigTitle.Size = UDim2.new(0, 60, 0, 19)
EspConfigTitle.Font = Enum.Font.Highway
EspConfigTitle.Text = "Esp Config"
EspConfigTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
EspConfigTitle.TextSize = 13.000
EspConfigTitle.TextXAlignment = Enum.TextXAlignment.Left

local EspShapeButton = Instance.new("TextButton")
EspShapeButton.Name = "EspShapeButton"
EspShapeButton.Parent = EspConfigFrame
EspShapeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
EspShapeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspShapeButton.BorderSizePixel = 0
EspShapeButton.Position = UDim2.new(0.0325581394, 0, 0.525967658, 0)
EspShapeButton.Size = UDim2.new(0, 200, 0, 21)
EspShapeButton.Font = Enum.Font.Highway
EspShapeButton.Text = "Rectangle"
EspShapeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EspShapeButton.TextSize = 14.000

local EspShapeText = Instance.new("TextLabel")
EspShapeText.Name = "EspShapeText"
EspShapeText.Parent = EspShapeButton
EspShapeText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EspShapeText.BackgroundTransparency = 1.000
EspShapeText.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspShapeText.BorderSizePixel = 0
EspShapeText.Position = UDim2.new(0.264999986, 0, -1.07843161, 0)
EspShapeText.Size = UDim2.new(0, 85, 0, 15)
EspShapeText.Font = Enum.Font.Highway
EspShapeText.Text = "Esp Shape"
EspShapeText.TextColor3 = Color3.fromRGB(255, 255, 255)
EspShapeText.TextSize = 14.000

local EspShapeUpOrDownText = Instance.new("TextLabel")
EspShapeUpOrDownText.Name = "EspShapeUpOrDownText"
EspShapeUpOrDownText.Parent = EspShapeButton
EspShapeUpOrDownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EspShapeUpOrDownText.BackgroundTransparency = 1.000
EspShapeUpOrDownText.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspShapeUpOrDownText.BorderSizePixel = 0
EspShapeUpOrDownText.Position = UDim2.new(0.899999976, 0, 0, 0)
EspShapeUpOrDownText.Size = UDim2.new(0, 20, 0, 21)
EspShapeUpOrDownText.Font = Enum.Font.Highway
EspShapeUpOrDownText.Text = "▼"
EspShapeUpOrDownText.TextColor3 = Color3.fromRGB(255, 255, 255)
EspShapeUpOrDownText.TextSize = 18.000

local EspShapeFrame = Instance.new("Frame")
EspShapeFrame.Name = "EspShapeFrame"
EspShapeFrame.Parent = EspShapeButton
EspShapeFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
EspShapeFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
EspShapeFrame.BorderSizePixel = 0
EspShapeFrame.Position = UDim2.new(0, 0, 1.00000143, 0)
EspShapeFrame.Size = UDim2.new(0, 200, 0, 100)
EspShapeFrame.Visible = false
EspShapeFrame.ZIndex = 2

local RectangleEspButton = Instance.new("TextButton")
RectangleEspButton.Name = "RectangleEspButton"
RectangleEspButton.Parent = EspShapeFrame
RectangleEspButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
RectangleEspButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
RectangleEspButton.BorderSizePixel = 0
RectangleEspButton.Position = UDim2.new(0.0279998779, 0, 0.119999997, 0)
RectangleEspButton.Size = UDim2.new(0, 188, 0, 21)
RectangleEspButton.ZIndex = 2
RectangleEspButton.Font = Enum.Font.Highway
RectangleEspButton.Text = "Rectangle"
RectangleEspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RectangleEspButton.TextSize = 14.000

local SquareEspButton = Instance.new("TextButton")
SquareEspButton.Name = "SquareEspButton"
SquareEspButton.Parent = EspShapeFrame
SquareEspButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SquareEspButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SquareEspButton.BorderSizePixel = 0
SquareEspButton.Position = UDim2.new(0.0279998779, 0, 0.389999986, 0)
SquareEspButton.Size = UDim2.new(0, 188, 0, 21)
SquareEspButton.ZIndex = 2
SquareEspButton.Font = Enum.Font.Highway
SquareEspButton.Text = "Square"
SquareEspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SquareEspButton.TextSize = 14.000

local CircleEspButton = Instance.new("TextButton")
CircleEspButton.Name = "CircleEspButton"
CircleEspButton.Parent = EspShapeFrame
CircleEspButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CircleEspButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CircleEspButton.BorderSizePixel = 0
CircleEspButton.Position = UDim2.new(0.0279998779, 0, 0.652020872, 0)
CircleEspButton.Size = UDim2.new(0, 188, 0, 21)
CircleEspButton.ZIndex = 2
CircleEspButton.Font = Enum.Font.Highway
CircleEspButton.Text = "Circle"
CircleEspButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CircleEspButton.TextSize = 14.000

local ShapesButton = Instance.new("TextButton")
ShapesButton.Name = "ShapesButton"
ShapesButton.Parent = EspConfigFrame
ShapesButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ShapesButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ShapesButton.Position = UDim2.new(0.0744186044, 0, 0.871829748, 0)
ShapesButton.Size = UDim2.new(0, 13, 0, 13)
ShapesButton.Font = Enum.Font.Highway
ShapesButton.Text = ""
ShapesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ShapesButton.TextSize = 14.000

local ShapesText = Instance.new("TextLabel")
ShapesText.Name = "ShapesText"
ShapesText.Parent = ShapesButton
ShapesText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ShapesText.BackgroundTransparency = 1.000
ShapesText.BorderColor3 = Color3.fromRGB(0, 0, 0)
ShapesText.BorderSizePixel = 0
ShapesText.Position = UDim2.new(1.15384614, 0, 0, 0)
ShapesText.Size = UDim2.new(0, 52, 0, 13)
ShapesText.Font = Enum.Font.Highway
ShapesText.Text = " - Shapes"
ShapesText.TextColor3 = Color3.fromRGB(255, 255, 255)
ShapesText.TextSize = 14.000
ShapesText.TextXAlignment = Enum.TextXAlignment.Left

local MoreInfoButton = Instance.new("TextButton")
MoreInfoButton.Name = "MoreInfoButton"
MoreInfoButton.Parent = EspConfigFrame
MoreInfoButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MoreInfoButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
MoreInfoButton.Position = UDim2.new(0.0697674453, 0, 0.725561082, 0)
MoreInfoButton.Size = UDim2.new(0, 13, 0, 13)
MoreInfoButton.Font = Enum.Font.Highway
MoreInfoButton.Text = ""
MoreInfoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MoreInfoButton.TextSize = 14.000

local MoreInfoText = Instance.new("TextLabel")
MoreInfoText.Name = "MoreInfoText"
MoreInfoText.Parent = MoreInfoButton
MoreInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MoreInfoText.BackgroundTransparency = 1.000
MoreInfoText.BorderColor3 = Color3.fromRGB(0, 0, 0)
MoreInfoText.BorderSizePixel = 0
MoreInfoText.Position = UDim2.new(1.15384614, 0, 0, 0)
MoreInfoText.Size = UDim2.new(0, 52, 0, 13)
MoreInfoText.Font = Enum.Font.Highway
MoreInfoText.Text = " - More Info"
MoreInfoText.TextColor3 = Color3.fromRGB(255, 255, 255)
MoreInfoText.TextSize = 14.000
MoreInfoText.TextXAlignment = Enum.TextXAlignment.Left

local BasicInfoButton = Instance.new("TextButton")
BasicInfoButton.Name = "BasicInfoButton"
BasicInfoButton.Parent = EspConfigFrame
BasicInfoButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
BasicInfoButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
BasicInfoButton.Position = UDim2.new(0.0700000003, 0, 0.649999976, 0)
BasicInfoButton.Size = UDim2.new(0, 13, 0, 13)
BasicInfoButton.Font = Enum.Font.Highway
BasicInfoButton.Text = ""
BasicInfoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BasicInfoButton.TextSize = 14.000

local BasicInfoText = Instance.new("TextLabel")
BasicInfoText.Name = "BasicInfoText"
BasicInfoText.Parent = BasicInfoButton
BasicInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BasicInfoText.BackgroundTransparency = 1.000
BasicInfoText.BorderColor3 = Color3.fromRGB(0, 0, 0)
BasicInfoText.BorderSizePixel = 0
BasicInfoText.Position = UDim2.new(1.15384614, 0, 0, 0)
BasicInfoText.Size = UDim2.new(0, 52, 0, 13)
BasicInfoText.Font = Enum.Font.Highway
BasicInfoText.Text = " - Basic Info"
BasicInfoText.TextColor3 = Color3.fromRGB(255, 255, 255)
BasicInfoText.TextSize = 14.000
BasicInfoText.TextXAlignment = Enum.TextXAlignment.Left

local MiscellaneousTitle = Instance.new("TextLabel")
MiscellaneousTitle.Name = "MiscellaneousTitle"
MiscellaneousTitle.Parent = MiscellaneousScrollFrameOne
MiscellaneousTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MiscellaneousTitle.BackgroundTransparency = 1.000
MiscellaneousTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
MiscellaneousTitle.BorderSizePixel = 0
MiscellaneousTitle.Position = UDim2.new(-0.00236646086, 0, -0.000779511291, 0)
MiscellaneousTitle.Size = UDim2.new(0, 40, 0, 19)
MiscellaneousTitle.Font = Enum.Font.Highway
MiscellaneousTitle.Text = "Game"
MiscellaneousTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
MiscellaneousTitle.TextSize = 13.000
MiscellaneousTitle.TextXAlignment = Enum.TextXAlignment.Left

local CamlockTitle = Instance.new("TextLabel")
CamlockTitle.Name = "CamlockTitle"
CamlockTitle.Parent = CamlockFrameCombat
CamlockTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CamlockTitle.BackgroundTransparency = 1.000
CamlockTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
CamlockTitle.BorderSizePixel = 0
CamlockTitle.Position = UDim2.new(-0.00236646086, 0, -0.000779511291, 0)
CamlockTitle.Size = UDim2.new(0, 45, 0, 19)
CamlockTitle.Font = Enum.Font.Highway
CamlockTitle.Text = "Camlock"
CamlockTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
CamlockTitle.TextSize = 13.000
CamlockTitle.TextXAlignment = Enum.TextXAlignment.Left

local CamlockPartsButton = Instance.new("TextButton")
CamlockPartsButton.Name = "CamlockPartsButton"
CamlockPartsButton.Parent = CamlockFrameCombat
CamlockPartsButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CamlockPartsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CamlockPartsButton.BorderSizePixel = 0
CamlockPartsButton.Position = UDim2.new(0.0325581394, 0, 0.58865422, 0)
CamlockPartsButton.Size = UDim2.new(0, 200, 0, 21)
CamlockPartsButton.Font = Enum.Font.Highway
CamlockPartsButton.Text = "HumanoidRootPart"
CamlockPartsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CamlockPartsButton.TextSize = 14.000

local CamlockPartsText = Instance.new("TextLabel")
CamlockPartsText.Name = "CamlockPartsText"
CamlockPartsText.Parent = CamlockPartsButton
CamlockPartsText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CamlockPartsText.BackgroundTransparency = 1.000
CamlockPartsText.BorderColor3 = Color3.fromRGB(0, 0, 0)
CamlockPartsText.BorderSizePixel = 0
CamlockPartsText.Position = UDim2.new(0.264999986, 0, -1.07843161, 0)
CamlockPartsText.Size = UDim2.new(0, 85, 0, 15)
CamlockPartsText.Font = Enum.Font.Highway
CamlockPartsText.Text = "Camlock Parts"
CamlockPartsText.TextColor3 = Color3.fromRGB(255, 255, 255)
CamlockPartsText.TextSize = 14.000

local CamlockPartsUpOrDownText = Instance.new("TextLabel")
CamlockPartsUpOrDownText.Name = "CamlockPartsUpOrDownText"
CamlockPartsUpOrDownText.Parent = CamlockPartsButton
CamlockPartsUpOrDownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CamlockPartsUpOrDownText.BackgroundTransparency = 1.000
CamlockPartsUpOrDownText.BorderColor3 = Color3.fromRGB(0, 0, 0)
CamlockPartsUpOrDownText.BorderSizePixel = 0
CamlockPartsUpOrDownText.Position = UDim2.new(0.899999976, 0, 0, 0)
CamlockPartsUpOrDownText.Size = UDim2.new(0, 20, 0, 21)
CamlockPartsUpOrDownText.Font = Enum.Font.Highway
CamlockPartsUpOrDownText.Text = "▼"
CamlockPartsUpOrDownText.TextColor3 = Color3.fromRGB(255, 255, 255)
CamlockPartsUpOrDownText.TextSize = 18.000

local BackFrameCamlockParts = Instance.new("Frame")
BackFrameCamlockParts.Name = "BackFrameCamlockParts"
BackFrameCamlockParts.Parent = CamlockPartsButton
BackFrameCamlockParts.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
BackFrameCamlockParts.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackFrameCamlockParts.BorderSizePixel = 0
BackFrameCamlockParts.Position = UDim2.new(0, 0, 1, 0)
BackFrameCamlockParts.Size = UDim2.new(0, 200, 0, 107)
BackFrameCamlockParts.Visible = false
BackFrameCamlockParts.ZIndex = 2

local HeadCamlockPartButton = Instance.new("TextButton")
HeadCamlockPartButton.Name = "HeadCamlockPartButton"
HeadCamlockPartButton.Parent = BackFrameCamlockParts
HeadCamlockPartButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
HeadCamlockPartButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
HeadCamlockPartButton.BorderSizePixel = 0
HeadCamlockPartButton.Position = UDim2.new(0.0280000009, 0, 0.0500000007, 0)
HeadCamlockPartButton.Size = UDim2.new(0, 188, 0, 21)
HeadCamlockPartButton.ZIndex = 2
HeadCamlockPartButton.Font = Enum.Font.Highway
HeadCamlockPartButton.Text = "Head"
HeadCamlockPartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HeadCamlockPartButton.TextSize = 14.000

local TorsoCamlockPartButton = Instance.new("TextButton")
TorsoCamlockPartButton.Name = "TorsoCamlockPartButton"
TorsoCamlockPartButton.Parent = BackFrameCamlockParts
TorsoCamlockPartButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TorsoCamlockPartButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TorsoCamlockPartButton.BorderSizePixel = 0
TorsoCamlockPartButton.Position = UDim2.new(0.0280000009, 0, 0.300000012, 0)
TorsoCamlockPartButton.Size = UDim2.new(0, 188, 0, 21)
TorsoCamlockPartButton.ZIndex = 2
TorsoCamlockPartButton.Font = Enum.Font.Highway
TorsoCamlockPartButton.Text = "Torso"
TorsoCamlockPartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TorsoCamlockPartButton.TextSize = 14.000

local HumanoidRootPartCamlockPartButton = Instance.new("TextButton")
HumanoidRootPartCamlockPartButton.Name = "HumanoidRootPartCamlockPartButton"
HumanoidRootPartCamlockPartButton.Parent = BackFrameCamlockParts
HumanoidRootPartCamlockPartButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
HumanoidRootPartCamlockPartButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
HumanoidRootPartCamlockPartButton.BorderSizePixel = 0
HumanoidRootPartCamlockPartButton.Position = UDim2.new(0.0280000009, 0, 0.550000012, 0)
HumanoidRootPartCamlockPartButton.Size = UDim2.new(0, 188, 0, 21)
HumanoidRootPartCamlockPartButton.ZIndex = 2
HumanoidRootPartCamlockPartButton.Font = Enum.Font.Highway
HumanoidRootPartCamlockPartButton.Text = "HumanoidRootPart"
HumanoidRootPartCamlockPartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
HumanoidRootPartCamlockPartButton.TextSize = 14.000

local CamlockTargetBox = Instance.new("TextBox")
CamlockTargetBox.Name = "CamlockTargetBox"
CamlockTargetBox.Parent = CamlockFrameCombat
CamlockTargetBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CamlockTargetBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
CamlockTargetBox.BorderSizePixel = 0
CamlockTargetBox.Position = UDim2.new(0.0325581394, 0, 0.257228404, 0)
CamlockTargetBox.Size = UDim2.new(0, 200, 0, 21)
CamlockTargetBox.Font = Enum.Font.Highway
CamlockTargetBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
CamlockTargetBox.PlaceholderText = "Enter Player Username!"
CamlockTargetBox.Text = ""
CamlockTargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CamlockTargetBox.TextSize = 14.000

local CamlockTargetsText = Instance.new("TextLabel")
CamlockTargetsText.Name = "CamlockTargetsText"
CamlockTargetsText.Parent = CamlockTargetBox
CamlockTargetsText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CamlockTargetsText.BackgroundTransparency = 1.000
CamlockTargetsText.BorderColor3 = Color3.fromRGB(0, 0, 0)
CamlockTargetsText.BorderSizePixel = 0
CamlockTargetsText.Position = UDim2.new(0.264999986, 0, -1.07843161, 0)
CamlockTargetsText.Size = UDim2.new(0, 85, 0, 15)
CamlockTargetsText.Font = Enum.Font.Highway
CamlockTargetsText.Text = "Camlock Target"
CamlockTargetsText.TextColor3 = Color3.fromRGB(255, 255, 255)
CamlockTargetsText.TextSize = 14.000

local CamlockButton = Instance.new("TextButton")
CamlockButton.Name = "CamlockButton"
CamlockButton.Parent = CamlockFrameCombat
CamlockButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
CamlockButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
CamlockButton.Position = UDim2.new(0.0744186044, 0, 0.797202885, 0)
CamlockButton.Size = UDim2.new(0, 13, 0, 13)
CamlockButton.Font = Enum.Font.Highway
CamlockButton.Text = ""
CamlockButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CamlockButton.TextSize = 14.000

local CamlockText = Instance.new("TextLabel")
CamlockText.Name = "CamlockText"
CamlockText.Parent = CamlockButton
CamlockText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CamlockText.BackgroundTransparency = 1.000
CamlockText.BorderColor3 = Color3.fromRGB(0, 0, 0)
CamlockText.BorderSizePixel = 0
CamlockText.Position = UDim2.new(1.15384614, 0, 0, 0)
CamlockText.Size = UDim2.new(0, 52, 0, 13)
CamlockText.Font = Enum.Font.Highway
CamlockText.Text = " - Camlock"
CamlockText.TextColor3 = Color3.fromRGB(255, 255, 255)
CamlockText.TextSize = 14.000
CamlockText.TextXAlignment = Enum.TextXAlignment.Left

local RejoinButton = Instance.new("TextButton")
RejoinButton.Name = "RejoinButton"
RejoinButton.Parent = MiscellaneousScrollFrameOne
RejoinButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
RejoinButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
RejoinButton.Position = UDim2.new(-0.00465116277, 0, 0.33, 0)
RejoinButton.Size = UDim2.new(0, 13, 0, 13)
RejoinButton.Font = Enum.Font.Highway
RejoinButton.Text = ""
RejoinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RejoinButton.TextSize = 14.000

local RejoinText = Instance.new("TextLabel")
RejoinText.Name = "RejoinText"
RejoinText.Parent = RejoinButton
RejoinText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RejoinText.BackgroundTransparency = 1.000
RejoinText.BorderColor3 = Color3.fromRGB(0, 0, 0)
RejoinText.BorderSizePixel = 0
RejoinText.Position = UDim2.new(1.15384614, 0, 0, 0)
RejoinText.Size = UDim2.new(0, 52, 0, 13)
RejoinText.Font = Enum.Font.Highway
RejoinText.Text = " - Rejoin"
RejoinText.TextColor3 = Color3.fromRGB(255, 255, 255)
RejoinText.TextSize = 14.000
RejoinText.TextXAlignment = Enum.TextXAlignment.Left

local ShudownButton = Instance.new("TextButton")
ShudownButton.Name = "ShudownButton"
ShudownButton.Parent = MiscellaneousScrollFrameOne
ShudownButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ShudownButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ShudownButton.Position = UDim2.new(-0.00465116277, 0, 0.63, 0)
ShudownButton.Size = UDim2.new(0, 13, 0, 13)
ShudownButton.Font = Enum.Font.Highway
ShudownButton.Text = ""
ShudownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ShudownButton.TextSize = 14.000

local ShutdownText = Instance.new("TextLabel")
ShutdownText.Name = "ShutdownText"
ShutdownText.Parent = ShudownButton
ShutdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ShutdownText.BackgroundTransparency = 1.000
ShutdownText.BorderColor3 = Color3.fromRGB(0, 0, 0)
ShutdownText.BorderSizePixel = 0
ShutdownText.Position = UDim2.new(1.15384614, 0, 0, 0)
ShutdownText.Size = UDim2.new(0, 52, 0, 13)
ShutdownText.Font = Enum.Font.Highway
ShutdownText.Text = " - Shutdown"
ShutdownText.TextColor3 = Color3.fromRGB(255, 255, 255)
ShutdownText.TextSize = 14.000
ShutdownText.TextXAlignment = Enum.TextXAlignment.Left

local ChatFrame = Instance.new("Frame")
ChatFrame.Name = "ChatFrame"
ChatFrame.Parent = ScrollFrameOneMisc
ChatFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ChatFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChatFrame.BorderSizePixel = 0
ChatFrame.Position = UDim2.new(0.0299999993, 0, 0.38499999, 0)
ChatFrame.Size = UDim2.new(0, 215, 0, 85)

local ChatFrame = Instance.new("Frame")
ChatFrame.Name = "ChatFrame"
ChatFrame.Parent = ScrollFrameOneMisc
ChatFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ChatFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChatFrame.BorderSizePixel = 0
ChatFrame.Position = UDim2.new(0.0299999993, 0, 0.38499999, 0)
ChatFrame.Size = UDim2.new(0, 215, 0, 85)

local ChatTitle = Instance.new("TextLabel")
ChatTitle.Name = "ChatTitle"
ChatTitle.Parent = ChatFrame
ChatTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ChatTitle.BackgroundTransparency = 1.000
ChatTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChatTitle.BorderSizePixel = 0
ChatTitle.Position = UDim2.new(-0.00236646086, 0, -0.000779511291, 0)
ChatTitle.Size = UDim2.new(0, 61, 0, 19)
ChatTitle.Font = Enum.Font.Highway
ChatTitle.Text = "Chat"
ChatTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatTitle.TextSize = 13.000
ChatTitle.TextWrapped = true
ChatTitle.TextXAlignment = Enum.TextXAlignment.Left

local ChatButton = Instance.new("TextButton")
ChatButton.Name = "ChatButton"
ChatButton.Parent = ChatFrame
ChatButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
ChatButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
ChatButton.Position = UDim2.new(0.0139534883, 0, 0.288817585, 0)
ChatButton.Size = UDim2.new(0, 13, 0, 13)
ChatButton.Font = Enum.Font.Highway
ChatButton.Text = ""
ChatButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatButton.TextSize = 14.000

local ChatText = Instance.new("TextLabel")
ChatText.Name = "ChatText"
ChatText.Parent = ChatButton
ChatText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ChatText.BackgroundTransparency = 1.000
ChatText.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChatText.BorderSizePixel = 0
ChatText.Position = UDim2.new(1.15384614, 0, 0, 0)
ChatText.Size = UDim2.new(0, 52, 0, 13)
ChatText.Font = Enum.Font.Highway
ChatText.Text = " - Chat"
ChatText.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatText.TextSize = 14.000
ChatText.TextXAlignment = Enum.TextXAlignment.Left

local ChatMessageBox = Instance.new("TextBox")
ChatMessageBox.Name = "ChatMessageBox"
ChatMessageBox.Parent = ChatFrame
ChatMessageBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ChatMessageBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChatMessageBox.BorderSizePixel = 0
ChatMessageBox.Position = UDim2.new(0.353488386, 0, 0.498630524, 0)
ChatMessageBox.Size = UDim2.new(0, 128, 0, 21)
ChatMessageBox.Font = Enum.Font.Ubuntu
ChatMessageBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
ChatMessageBox.PlaceholderText = ChatT['T']
ChatMessageBox.Text = ""
ChatMessageBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatMessageBox.TextSize = 14.000

local ChatMessageText = Instance.new("TextLabel")
ChatMessageText.Name = "ChatMessageText"
ChatMessageText.Parent = ChatMessageBox
ChatMessageText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ChatMessageText.BackgroundTransparency = 1.000
ChatMessageText.BorderColor3 = Color3.fromRGB(0, 0, 0)
ChatMessageText.BorderSizePixel = 0
ChatMessageText.Position = UDim2.new(0.135755539, 0, -1.17367113, 0)
ChatMessageText.Size = UDim2.new(0, 92, 0, 15)
ChatMessageText.Font = Enum.Font.Highway
ChatMessageText.Text = "Intro Message"
ChatMessageText.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatMessageText.TextSize = 14.000

local JoinsButton = Instance.new("TextButton")
JoinsButton.Name = "JoinsButton"
JoinsButton.Parent = ChatFrame
JoinsButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
JoinsButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
JoinsButton.Position = UDim2.new(0.0140000004, 0, 0.550000012, 0)
JoinsButton.Size = UDim2.new(0, 13, 0, 13)
JoinsButton.Font = Enum.Font.Highway
JoinsButton.Text = ""
JoinsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
JoinsButton.TextSize = 14.000

local JoinsText = Instance.new("TextLabel")
JoinsText.Name = "JoinsText"
JoinsText.Parent = JoinsButton
JoinsText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
JoinsText.BackgroundTransparency = 1.000
JoinsText.BorderColor3 = Color3.fromRGB(0, 0, 0)
JoinsText.BorderSizePixel = 0
JoinsText.Position = UDim2.new(1.15384614, 0, 0, 0)
JoinsText.Size = UDim2.new(0, 52, 0, 13)
JoinsText.Font = Enum.Font.Highway
JoinsText.Text = " - Joins"
JoinsText.TextColor3 = Color3.fromRGB(255, 255, 255)
JoinsText.TextSize = 14.000
JoinsText.TextXAlignment = Enum.TextXAlignment.Left

local LeavesButton = Instance.new("TextButton")
LeavesButton.Name = "LeavesButton"
LeavesButton.Parent = ChatFrame
LeavesButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LeavesButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
LeavesButton.Position = UDim2.new(0.0140000004, 0, 0.800000012, 0)
LeavesButton.Size = UDim2.new(0, 13, 0, 13)
LeavesButton.Font = Enum.Font.Highway
LeavesButton.Text = ""
LeavesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LeavesButton.TextSize = 14.000

local LeavesButtonText = Instance.new("TextLabel")
LeavesButtonText.Name = "LeavesButtonText"
LeavesButtonText.Parent = LeavesButton
LeavesButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
LeavesButtonText.BackgroundTransparency = 1.000
LeavesButtonText.BorderColor3 = Color3.fromRGB(0, 0, 0)
LeavesButtonText.BorderSizePixel = 0
LeavesButtonText.Position = UDim2.new(1.15384614, 0, 0, 0)
LeavesButtonText.Size = UDim2.new(0, 52, 0, 13)
LeavesButtonText.Font = Enum.Font.Highway
LeavesButtonText.Text = " - Leaves"
LeavesButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
LeavesButtonText.TextSize = 14.000
LeavesButtonText.TextXAlignment = Enum.TextXAlignment.Left

local UiScrollFrame = Instance.new("Frame")
UiScrollFrame.Name = "UiScrollFrame"
UiScrollFrame.Parent = ScrollFrameOneMisc
UiScrollFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
UiScrollFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
UiScrollFrame.BorderSizePixel = 0
UiScrollFrame.Position = UDim2.new(0.0299999993, 0, 0.0900000036, 0)
UiScrollFrame.Size = UDim2.new(0, 215, 0, 300)

local UserInterfaceTitle = Instance.new("TextLabel")
UserInterfaceTitle.Name = "UserInterfaceTitle"
UserInterfaceTitle.Parent = UiScrollFrame
UserInterfaceTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UserInterfaceTitle.BackgroundTransparency = 1.000
UserInterfaceTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
UserInterfaceTitle.BorderSizePixel = 0
UserInterfaceTitle.Position = UDim2.new(-0.00236646086, 0, -0.000779511291, 0)
UserInterfaceTitle.Size = UDim2.new(0, 61, 0, 19)
UserInterfaceTitle.Font = Enum.Font.Highway
UserInterfaceTitle.Text = "User Interface"
UserInterfaceTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
UserInterfaceTitle.TextSize = 13.000
UserInterfaceTitle.TextXAlignment = Enum.TextXAlignment.Left

local HealthBarColorBox = Instance.new("TextBox")
HealthBarColorBox.Name = "HealthBarColorBox"
HealthBarColorBox.Parent = UiScrollFrame
HealthBarColorBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
HealthBarColorBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
HealthBarColorBox.BorderSizePixel = 0
HealthBarColorBox.Position = UDim2.new(0.0139534883, 0, 0.147796839, 0)
HealthBarColorBox.Size = UDim2.new(0, 93, 0, 21)
HealthBarColorBox.Font = Enum.Font.Ubuntu
HealthBarColorBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
HealthBarColorBox.PlaceholderText = " 36, 182, 3 "
HealthBarColorBox.Text = ""
HealthBarColorBox.TextColor3 = Color3.fromRGB(255, 255, 255)
HealthBarColorBox.TextSize = 14.000

local HealthBarColorText = Instance.new("TextLabel")
HealthBarColorText.Name = "HealthBarColorText"
HealthBarColorText.Parent = HealthBarColorBox
HealthBarColorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HealthBarColorText.BackgroundTransparency = 1.000
HealthBarColorText.BorderColor3 = Color3.fromRGB(0, 0, 0)
HealthBarColorText.BorderSizePixel = 0
HealthBarColorText.Position = UDim2.new(0.0107553136, 0, -1.07843161, 0)
HealthBarColorText.Size = UDim2.new(0, 92, 0, 15)
HealthBarColorText.Font = Enum.Font.Highway
HealthBarColorText.Text = "Health Bar Color"
HealthBarColorText.TextColor3 = Color3.fromRGB(255, 255, 255)
HealthBarColorText.TextSize = 14.000

local HealthColorFrame = Instance.new("Frame")
HealthColorFrame.Name = "HealthColorFrame"
HealthColorFrame.Parent = HealthBarColorBox
HealthColorFrame.BackgroundColor3 = Color3.fromRGB(36, 182, 3)
HealthColorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
HealthColorFrame.BorderSizePixel = 0
HealthColorFrame.Position = UDim2.new(0.903656363, 0, 0.190476194, 0)
HealthColorFrame.Size = UDim2.new(0, 5, 0, 5)

local EnergyBarColorBox = Instance.new("TextBox")
EnergyBarColorBox.Name = "EnergyBarColorBox"
EnergyBarColorBox.Parent = UiScrollFrame
EnergyBarColorBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
EnergyBarColorBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
EnergyBarColorBox.BorderSizePixel = 0
EnergyBarColorBox.Position = UDim2.new(0.516279042, 0, 0.147796839, 0)
EnergyBarColorBox.Size = UDim2.new(0, 93, 0, 21)
EnergyBarColorBox.Font = Enum.Font.Ubuntu
EnergyBarColorBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
EnergyBarColorBox.PlaceholderText = " 182, 182, 9 "
EnergyBarColorBox.Text = ""
EnergyBarColorBox.TextColor3 = Color3.fromRGB(255, 255, 255)
EnergyBarColorBox.TextSize = 14.000

local EnergyBarColorText = Instance.new("TextLabel")
EnergyBarColorText.Name = "EnergyBarColorText"
EnergyBarColorText.Parent = EnergyBarColorBox
EnergyBarColorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EnergyBarColorText.BackgroundTransparency = 1.000
EnergyBarColorText.BorderColor3 = Color3.fromRGB(0, 0, 0)
EnergyBarColorText.BorderSizePixel = 0
EnergyBarColorText.Position = UDim2.new(0.0390000008, 0, -1, 0)
EnergyBarColorText.Size = UDim2.new(0, 85, 0, 15)
EnergyBarColorText.Font = Enum.Font.Highway
EnergyBarColorText.Text = "Energy Bar Color"
EnergyBarColorText.TextColor3 = Color3.fromRGB(255, 255, 255)
EnergyBarColorText.TextSize = 14.000

local EnergyColorFrame = Instance.new("Frame")
EnergyColorFrame.Name = "EnergyColorFrame"
EnergyColorFrame.Parent = EnergyBarColorBox
EnergyColorFrame.BackgroundColor3 = Color3.fromRGB(182, 182, 9)
EnergyColorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
EnergyColorFrame.BorderSizePixel = 0
EnergyColorFrame.Position = UDim2.new(0.903656363, 0, 0.190476194, 0)
EnergyColorFrame.Size = UDim2.new(0, 5, 0, 5)

local ArmorBarColorBox = Instance.new("TextBox")
ArmorBarColorBox.Name = "ArmorBarColorBox"
ArmorBarColorBox.Parent = UiScrollFrame
ArmorBarColorBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ArmorBarColorBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
ArmorBarColorBox.BorderSizePixel = 0
ArmorBarColorBox.Position = UDim2.new(0.0139534883, 0, 0.331130177, 0)
ArmorBarColorBox.Size = UDim2.new(0, 93, 0, 21)
ArmorBarColorBox.Font = Enum.Font.Ubuntu
ArmorBarColorBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
ArmorBarColorBox.PlaceholderText = " 0, 136, 194 "
ArmorBarColorBox.Text = ""
ArmorBarColorBox.TextColor3 = Color3.fromRGB(255, 255, 255)
ArmorBarColorBox.TextSize = 14.000

local ArmorBarColorText = Instance.new("TextLabel")
ArmorBarColorText.Name = "ArmorBarColorText"
ArmorBarColorText.Parent = ArmorBarColorBox
ArmorBarColorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ArmorBarColorText.BackgroundTransparency = 1.000
ArmorBarColorText.BorderColor3 = Color3.fromRGB(0, 0, 0)
ArmorBarColorText.BorderSizePixel = 0
ArmorBarColorText.Position = UDim2.new(0.0107553136, 0, -1.07843161, 0)
ArmorBarColorText.Size = UDim2.new(0, 92, 0, 15)
ArmorBarColorText.Font = Enum.Font.Highway
ArmorBarColorText.Text = "Armor Bar Color"
ArmorBarColorText.TextColor3 = Color3.fromRGB(255, 255, 255)
ArmorBarColorText.TextSize = 14.000

local ArmorColorFrame = Instance.new("Frame")
ArmorColorFrame.Name = "ArmorColorFrame"
ArmorColorFrame.Parent = ArmorBarColorBox
ArmorColorFrame.BackgroundColor3 = Color3.fromRGB(0, 136, 194)
ArmorColorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
ArmorColorFrame.BorderSizePixel = 0
ArmorColorFrame.Position = UDim2.new(0.903656363, 0, 0.190476194, 0)
ArmorColorFrame.Size = UDim2.new(0, 5, 0, 5)

local FireArmorBarColorBox = Instance.new("TextBox")
FireArmorBarColorBox.Name = "FireArmorBarColorBox"
FireArmorBarColorBox.Parent = UiScrollFrame
FireArmorBarColorBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
FireArmorBarColorBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
FireArmorBarColorBox.BorderSizePixel = 0
FireArmorBarColorBox.Position = UDim2.new(0.516279042, 0, 0.331130177, 0)
FireArmorBarColorBox.Size = UDim2.new(0, 93, 0, 21)
FireArmorBarColorBox.Font = Enum.Font.Ubuntu
FireArmorBarColorBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
FireArmorBarColorBox.PlaceholderText = " 253, 121, 33 "
FireArmorBarColorBox.Text = ""
FireArmorBarColorBox.TextColor3 = Color3.fromRGB(255, 255, 255)
FireArmorBarColorBox.TextSize = 14.000

local FireArmorBarColorText = Instance.new("TextLabel")
FireArmorBarColorText.Name = "FireArmorBarColorText"
FireArmorBarColorText.Parent = FireArmorBarColorBox
FireArmorBarColorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FireArmorBarColorText.BackgroundTransparency = 1.000
FireArmorBarColorText.BorderColor3 = Color3.fromRGB(0, 0, 0)
FireArmorBarColorText.BorderSizePixel = 0
FireArmorBarColorText.Position = UDim2.new(0.0107553136, 0, -1.07843161, 0)
FireArmorBarColorText.Size = UDim2.new(0, 92, 0, 15)
FireArmorBarColorText.Font = Enum.Font.Highway
FireArmorBarColorText.Text = "Fire Bar Color"
FireArmorBarColorText.TextColor3 = Color3.fromRGB(255, 255, 255)
FireArmorBarColorText.TextSize = 14.000

local FireColorFrame = Instance.new("Frame")
FireColorFrame.Name = "FireColorFrame"
FireColorFrame.Parent = FireArmorBarColorBox
FireColorFrame.BackgroundColor3 = Color3.fromRGB(253, 121, 33)
FireColorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
FireColorFrame.BorderSizePixel = 0
FireColorFrame.Position = UDim2.new(0.903656363, 0, 0.190476194, 0)
FireColorFrame.Size = UDim2.new(0, 5, 0, 5)

local RemoveUIButton = Instance.new("TextButton")
RemoveUIButton.Name = "RemoveUIButton"
RemoveUIButton.Parent = UiScrollFrame
RemoveUIButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
RemoveUIButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
RemoveUIButton.Position = UDim2.new(0.0140000451, 0, 0.918333352, 0)
RemoveUIButton.Size = UDim2.new(0, 13, 0, 13)
RemoveUIButton.Font = Enum.Font.Highway
RemoveUIButton.Text = ""
RemoveUIButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RemoveUIButton.TextSize = 14.000

local RemoveUiButtonText = Instance.new("TextLabel")
RemoveUiButtonText.Name = "RemoveUiButtonText"
RemoveUiButtonText.Parent = RemoveUIButton
RemoveUiButtonText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RemoveUiButtonText.BackgroundTransparency = 1.000
RemoveUiButtonText.BorderColor3 = Color3.fromRGB(0, 0, 0)
RemoveUiButtonText.BorderSizePixel = 0
RemoveUiButtonText.Position = UDim2.new(1.15384614, 0, 0, 0)
RemoveUiButtonText.Size = UDim2.new(0, 52, 0, 13)
RemoveUiButtonText.Font = Enum.Font.Highway
RemoveUiButtonText.Text = " - Remove Buttons"
RemoveUiButtonText.TextColor3 = Color3.fromRGB(255, 255, 255)
RemoveUiButtonText.TextSize = 14.000
RemoveUiButtonText.TextXAlignment = Enum.TextXAlignment.Left

local RestoreOldUIButton = Instance.new("TextButton")
RestoreOldUIButton.Name = "RestoreOldUIButton"
RestoreOldUIButton.Parent = UiScrollFrame
RestoreOldUIButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
RestoreOldUIButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
RestoreOldUIButton.Position = UDim2.new(0.0140000451, 0, 0.851666689, 0)
RestoreOldUIButton.Size = UDim2.new(0, 13, 0, 13)
RestoreOldUIButton.Font = Enum.Font.Highway
RestoreOldUIButton.Text = ""
RestoreOldUIButton.TextColor3 = Color3.fromRGB(255, 255, 255)
RestoreOldUIButton.TextSize = 14.000

local RestoreOldUiText = Instance.new("TextLabel")
RestoreOldUiText.Name = "RestoreUIText"
RestoreOldUiText.Parent = RestoreOldUIButton
RestoreOldUiText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
RestoreOldUiText.BackgroundTransparency = 1.000
RestoreOldUiText.BorderColor3 = Color3.fromRGB(0, 0, 0)
RestoreOldUiText.BorderSizePixel = 0
RestoreOldUiText.Position = UDim2.new(1.15384614, 0, 0, 0)
RestoreOldUiText.Size = UDim2.new(0, 52, 0, 13)
RestoreOldUiText.Font = Enum.Font.Highway
RestoreOldUiText.Text = " - Sync Old UI Settings"
RestoreOldUiText.TextColor3 = Color3.fromRGB(255, 255, 255)
RestoreOldUiText.TextSize = 14.000
RestoreOldUiText.TextXAlignment = Enum.TextXAlignment.Left

local SaveUIButton = Instance.new("TextButton")
SaveUIButton.Name = "SaveUIButton"
SaveUIButton.Parent = UiScrollFrame
SaveUIButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
SaveUIButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
SaveUIButton.Position = UDim2.new(0.0140000451, 0, 0.778333306, 0)
SaveUIButton.Size = UDim2.new(0, 13, 0, 13)
SaveUIButton.Font = Enum.Font.Highway
SaveUIButton.Text = ""
SaveUIButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveUIButton.TextSize = 14.000

local SaveUIText = Instance.new("TextLabel")
SaveUIText.Name = "SaveUIText"
SaveUIText.Parent = SaveUIButton
SaveUIText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SaveUIText.BackgroundTransparency = 1.000
SaveUIText.BorderColor3 = Color3.fromRGB(0, 0, 0)
SaveUIText.BorderSizePixel = 0
SaveUIText.Position = UDim2.new(1.15384614, 0, 0, 0)
SaveUIText.Size = UDim2.new(0, 52, 0, 13)
SaveUIText.Font = Enum.Font.Highway
SaveUIText.Text = " - Save UI Settings"
SaveUIText.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveUIText.TextSize = 14.000
SaveUIText.TextXAlignment = Enum.TextXAlignment.Left

local CashColorBox = Instance.new("TextBox")
CashColorBox.Name = "CashColorBox"
CashColorBox.Parent = UiScrollFrame
CashColorBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CashColorBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
CashColorBox.BorderSizePixel = 0
CashColorBox.Position = UDim2.new(0.511627913, 0, 0.511130154, 0)
CashColorBox.Size = UDim2.new(0, 93, 0, 21)
CashColorBox.Font = Enum.Font.Ubuntu
CashColorBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
CashColorBox.PlaceholderText = " 95, 255, 87 "
CashColorBox.Text = ""
CashColorBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CashColorBox.TextSize = 14.000

local CashColorText = Instance.new("TextLabel")
CashColorText.Name = "CashColorText"
CashColorText.Parent = CashColorBox
CashColorText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CashColorText.BackgroundTransparency = 1.000
CashColorText.BorderColor3 = Color3.fromRGB(0, 0, 0)
CashColorText.BorderSizePixel = 0
CashColorText.Position = UDim2.new(0.0107553136, 0, -1.07843161, 0)
CashColorText.Size = UDim2.new(0, 92, 0, 15)
CashColorText.Font = Enum.Font.Highway
CashColorText.Text = "Cash Color"
CashColorText.TextColor3 = Color3.fromRGB(255, 255, 255)
CashColorText.TextSize = 14.000

local CashColorFrame = Instance.new("Frame")
CashColorFrame.Name = "CashColorFrame"
CashColorFrame.Parent = CashColorBox
CashColorFrame.BackgroundColor3 = Color3.fromRGB(95, 255, 87)
CashColorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
CashColorFrame.BorderSizePixel = 0
CashColorFrame.Position = UDim2.new(0.903656363, 0, 0.190476194, 0)
CashColorFrame.Size = UDim2.new(0, 5, 0, 5)

local MovementButton = Instance.new("TextButton")
MovementButton.Name = "MovementButton"
MovementButton.Parent = FrontGui
MovementButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MovementButton.BackgroundTransparency = 1.000
MovementButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
MovementButton.BorderSizePixel = 0
MovementButton.Position = UDim2.new(0.206896558, 0, 0.954710126, 0)
MovementButton.Size = UDim2.new(0, 76, 0, 25)
MovementButton.Font = Enum.Font.Highway
MovementButton.Text = "Movement"
MovementButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MovementButton.TextSize = 17.000

local BackFrameMovement = Instance.new("Frame")
BackFrameMovement.Name = "BackFrameMovement"
BackFrameMovement.Parent = MovementButton
BackFrameMovement.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BackFrameMovement.BackgroundTransparency = 1.000
BackFrameMovement.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackFrameMovement.BorderSizePixel = 0
BackFrameMovement.Position = UDim2.new(-1.27741277, 0, -21.0799999, 0)
BackFrameMovement.Size = UDim2.new(0, 464, 0, 527)
BackFrameMovement.Visible = false

local ScrollFrameOneMovement = Instance.new("ScrollingFrame")
ScrollFrameOneMovement.Name = "ScrollFrameOneMovement"
ScrollFrameOneMovement.Parent = BackFrameMovement
ScrollFrameOneMovement.Active = true
ScrollFrameOneMovement.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollFrameOneMovement.BackgroundTransparency = 1.000
ScrollFrameOneMovement.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollFrameOneMovement.BorderSizePixel = 0
ScrollFrameOneMovement.Size = UDim2.new(0, 232, 0, 527)
ScrollFrameOneMovement.ScrollBarThickness = 4
ScrollFrameOneMovement.ScrollBarImageColor3 = Color3.fromRGB(85,0,255)

local FirstFrame_Movement1 = Instance.new("Frame")
FirstFrame_Movement1.Name = "FirstFrame_Movement1"
FirstFrame_Movement1.Parent = ScrollFrameOneMovement
FirstFrame_Movement1.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
FirstFrame_Movement1.BorderColor3 = Color3.fromRGB(0, 0, 0)
FirstFrame_Movement1.BorderSizePixel = 0
FirstFrame_Movement1.Position = UDim2.new(0.0379999988, 0, 0.00999999978, 0)
FirstFrame_Movement1.Size = UDim2.new(0, 215, 0, 141)

local SprintTitle = Instance.new("TextLabel")
SprintTitle.Name = "SprintTitle"
SprintTitle.Parent = FirstFrame_Movement1
SprintTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SprintTitle.BackgroundTransparency = 1.000
SprintTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
SprintTitle.BorderSizePixel = 0
SprintTitle.Position = UDim2.new(-0.00236646086, 0, -0.000779511291, 0)
SprintTitle.Size = UDim2.new(0, 61, 0, 19)
SprintTitle.Font = Enum.Font.Highway
SprintTitle.Text = "Sprints"
SprintTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SprintTitle.TextSize = 13.000
SprintTitle.TextXAlignment = Enum.TextXAlignment.Left

local SprintMethodsButton = Instance.new("TextButton")
SprintMethodsButton.Name = "SprintMethodsButton"
SprintMethodsButton.Parent = FirstFrame_Movement1
SprintMethodsButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SprintMethodsButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
SprintMethodsButton.BorderSizePixel = 0
SprintMethodsButton.Position = UDim2.new(0.0325581394, 0, 0.178324267, 0)
SprintMethodsButton.Size = UDim2.new(0, 200, 0, 21)
SprintMethodsButton.Font = Enum.Font.Highway
SprintMethodsButton.Text = "Blink"
SprintMethodsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SprintMethodsButton.TextSize = 14.000

local SprintMethodTexts = Instance.new("TextLabel")
SprintMethodTexts.Name = "SprintMethodTexts"
SprintMethodTexts.Parent = SprintMethodsButton
SprintMethodTexts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SprintMethodTexts.BackgroundTransparency = 1.000
SprintMethodTexts.BorderColor3 = Color3.fromRGB(0, 0, 0)
SprintMethodTexts.BorderSizePixel = 0
SprintMethodTexts.Position = UDim2.new(0.264999986, 0, -1.07843161, 0)
SprintMethodTexts.Size = UDim2.new(0, 85, 0, 15)
SprintMethodTexts.Font = Enum.Font.Highway
SprintMethodTexts.Text = "Sprint Methods"
SprintMethodTexts.TextColor3 = Color3.fromRGB(255, 255, 255)
SprintMethodTexts.TextSize = 14.000

local SprintMethodsButtonUpOrDown = Instance.new("TextLabel")
SprintMethodsButtonUpOrDown.Name = "SprintMethodsButtonUpOrDown"
SprintMethodsButtonUpOrDown.Parent = SprintMethodsButton
SprintMethodsButtonUpOrDown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SprintMethodsButtonUpOrDown.BackgroundTransparency = 1.000
SprintMethodsButtonUpOrDown.BorderColor3 = Color3.fromRGB(0, 0, 0)
SprintMethodsButtonUpOrDown.BorderSizePixel = 0
SprintMethodsButtonUpOrDown.Position = UDim2.new(0.899999976, 0, 0, 0)
SprintMethodsButtonUpOrDown.Size = UDim2.new(0, 20, 0, 21)
SprintMethodsButtonUpOrDown.Font = Enum.Font.Highway
SprintMethodsButtonUpOrDown.Text = "▼"
SprintMethodsButtonUpOrDown.TextColor3 = Color3.fromRGB(255, 255, 255)
SprintMethodsButtonUpOrDown.TextSize = 18.000

local BackFrameSprintMethods = Instance.new("Frame")
BackFrameSprintMethods.Name = "BackFrameSprintMethods"
BackFrameSprintMethods.Parent = SprintMethodsButton
BackFrameSprintMethods.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
BackFrameSprintMethods.BorderColor3 = Color3.fromRGB(0, 0, 0)
BackFrameSprintMethods.BorderSizePixel = 0
BackFrameSprintMethods.Position = UDim2.new(0, 0, 1, 0)
BackFrameSprintMethods.Size = UDim2.new(0, 200, 0, 107)
BackFrameSprintMethods.Visible = false
BackFrameSprintMethods.ZIndex = 2

local LookVectorSprintButton = Instance.new("TextButton")
LookVectorSprintButton.Name = "LookVectorSprintButton"
LookVectorSprintButton.Parent = BackFrameSprintMethods
LookVectorSprintButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
LookVectorSprintButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
LookVectorSprintButton.BorderSizePixel = 0
LookVectorSprintButton.Position = UDim2.new(0.0280000009, 0, 0.0500000007, 0)
LookVectorSprintButton.Size = UDim2.new(0, 188, 0, 21)
LookVectorSprintButton.ZIndex = 2
LookVectorSprintButton.Font = Enum.Font.Highway
LookVectorSprintButton.Text = "LookVector"
LookVectorSprintButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LookVectorSprintButton.TextSize = 14.000

local BlinkSprintButton = Instance.new("TextButton")
BlinkSprintButton.Name = "BlinkSprintButton"
BlinkSprintButton.Parent = BackFrameSprintMethods
BlinkSprintButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BlinkSprintButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
BlinkSprintButton.BorderSizePixel = 0
BlinkSprintButton.Position = UDim2.new(0.0280000009, 0, 0.300000012, 0)
BlinkSprintButton.Size = UDim2.new(0, 188, 0, 21)
BlinkSprintButton.ZIndex = 2
BlinkSprintButton.Font = Enum.Font.Highway
BlinkSprintButton.Text = "Blink"
BlinkSprintButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BlinkSprintButton.TextSize = 14.000

local CFrameSprintButton = Instance.new("TextButton")
CFrameSprintButton.Name = "CFrameSprintButton"
CFrameSprintButton.Parent = BackFrameSprintMethods
CFrameSprintButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CFrameSprintButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
CFrameSprintButton.BorderSizePixel = 0
CFrameSprintButton.Position = UDim2.new(0.0280000009, 0, 0.550000012, 0)
CFrameSprintButton.Size = UDim2.new(0, 188, 0, 21)
CFrameSprintButton.ZIndex = 2
CFrameSprintButton.Font = Enum.Font.Highway
CFrameSprintButton.Text = "CFrame"
CFrameSprintButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CFrameSprintButton.TextSize = 14.000

local SprintSpeedBox = Instance.new("TextBox")
SprintSpeedBox.Name = "SprintSpeedBox"
SprintSpeedBox.Parent = FirstFrame_Movement1
SprintSpeedBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SprintSpeedBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
SprintSpeedBox.BorderSizePixel = 0
SprintSpeedBox.Position = UDim2.new(0.0325581394, 0, 0.50425601, 0)
SprintSpeedBox.Size = UDim2.new(0, 200, 0, 21)
SprintSpeedBox.Font = Enum.Font.Highway
SprintSpeedBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
SprintSpeedBox.PlaceholderText = tonumber(BlinkSpeed)
SprintSpeedBox.Text = ""
SprintSpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SprintSpeedBox.TextSize = 14.000
SprintSpeedBox.Visible = true

local SprintSpeedBox2 = Instance.new("TextBox")
SprintSpeedBox2.Name = "SprintSpeedBox"
SprintSpeedBox2.Parent = FirstFrame_Movement1
SprintSpeedBox2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SprintSpeedBox2.BorderColor3 = Color3.fromRGB(0, 0, 0)
SprintSpeedBox2.BorderSizePixel = 0
SprintSpeedBox2.Position = UDim2.new(0.0325581394, 0, 0.50425601, 0)
SprintSpeedBox2.Size = UDim2.new(0, 200, 0, 21)
SprintSpeedBox2.Font = Enum.Font.Highway
SprintSpeedBox2.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
SprintSpeedBox2.PlaceholderText = tonumber(CFrameSpeed)
SprintSpeedBox2.Text = ""
SprintSpeedBox2.TextColor3 = Color3.fromRGB(255, 255, 255)
SprintSpeedBox2.TextSize = 14.000
SprintSpeedBox2.Visible = false

local SprintSpeedBox3 = Instance.new("TextBox")
SprintSpeedBox3.Name = "SprintSpeedBox"
SprintSpeedBox3.Parent = FirstFrame_Movement1
SprintSpeedBox3.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SprintSpeedBox3.BorderColor3 = Color3.fromRGB(0, 0, 0)
SprintSpeedBox3.BorderSizePixel = 0
SprintSpeedBox3.Position = UDim2.new(0.0325581394, 0, 0.50425601, 0)
SprintSpeedBox3.Size = UDim2.new(0, 200, 0, 21)
SprintSpeedBox3.Font = Enum.Font.Highway
SprintSpeedBox3.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
SprintSpeedBox3.PlaceholderText = tonumber(SprintSpeedLookVector)
SprintSpeedBox3.Text = ""
SprintSpeedBox3.TextColor3 = Color3.fromRGB(255, 255, 255)
SprintSpeedBox3.TextSize = 14.000
SprintSpeedBox3.Visible = false

local SprintSpeedTitle = Instance.new("TextLabel")
SprintSpeedTitle.Name = "SprintSpeedTitle"
SprintSpeedTitle.Parent = SprintSpeedBox
SprintSpeedTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SprintSpeedTitle.BackgroundTransparency = 1.000
SprintSpeedTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
SprintSpeedTitle.BorderSizePixel = 0
SprintSpeedTitle.Position = UDim2.new(0, 0, -1.04999995, 0)
SprintSpeedTitle.Size = UDim2.new(0, 200, 0, 21)
SprintSpeedTitle.Font = Enum.Font.Highway
SprintSpeedTitle.Text = "Sprint Speed"
SprintSpeedTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SprintSpeedTitle.TextSize = 14.000

local SprintButton = Instance.new("TextButton")
SprintButton.Name = "SprintButton"
SprintButton.Parent = FirstFrame_Movement1
SprintButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
SprintButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
SprintButton.Position = UDim2.new(0.0744186044, 0, 0.797202885, 0)
SprintButton.Size = UDim2.new(0, 13, 0, 13)
SprintButton.Font = Enum.Font.Highway
SprintButton.Text = ""
SprintButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SprintButton.TextSize = 14.000

local SprintText = Instance.new("TextLabel")
SprintText.Name = "SprintText"
SprintText.Parent = SprintButton
SprintText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SprintText.BackgroundTransparency = 1.000
SprintText.BorderColor3 = Color3.fromRGB(0, 0, 0)
SprintText.BorderSizePixel = 0
SprintText.Position = UDim2.new(1.15384614, 0, 0, 0)
SprintText.Size = UDim2.new(0, 52, 0, 13)
SprintText.Font = Enum.Font.Highway
SprintText.Text = " - Sprint"
SprintText.TextColor3 = Color3.fromRGB(255, 255, 255)
SprintText.TextSize = 14.000
SprintText.TextXAlignment = Enum.TextXAlignment.Left

local BackFrameMoreInfoFrameEsp = Instance.new("ImageLabel")
BackFrameMoreInfoFrameEsp.Name = "BackFrameMoreInfoFrameEsp"
BackFrameMoreInfoFrameEsp.Parent = Yas
BackFrameMoreInfoFrameEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BackFrameMoreInfoFrameEsp.BackgroundTransparency = 1.000
BackFrameMoreInfoFrameEsp.Position = UDim2.new(0.702685297, 0, 0.789889336, 0)
BackFrameMoreInfoFrameEsp.Size = UDim2.new(0, 400, 0, 220)
BackFrameMoreInfoFrameEsp.Image = "rbxassetid://3570695787"
BackFrameMoreInfoFrameEsp.ImageColor3 = Color3.fromRGB(0, 0, 0)
BackFrameMoreInfoFrameEsp.ScaleType = Enum.ScaleType.Slice
BackFrameMoreInfoFrameEsp.SliceCenter = Rect.new(100, 100, 100, 100)
BackFrameMoreInfoFrameEsp.SliceScale = 0.040
BackFrameMoreInfoFrameEsp.Visible = false

local MoreInfoFrameEsp = Instance.new("Frame")
MoreInfoFrameEsp.Name = "MoreInfoFrameEsp"
MoreInfoFrameEsp.Parent = BackFrameMoreInfoFrameEsp
MoreInfoFrameEsp.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MoreInfoFrameEsp.BorderColor3 = Color3.fromRGB(85, 0, 255)
MoreInfoFrameEsp.BorderSizePixel = 2
MoreInfoFrameEsp.Position = UDim2.new(0.0149999997, 0, 0.0309999119, 0)
MoreInfoFrameEsp.Size = UDim2.new(0, 388, 0, 206)

local FirstLabelEsp = Instance.new("TextLabel")
FirstLabelEsp.Name = "FirstLabelEsp"
FirstLabelEsp.Parent = MoreInfoFrameEsp
FirstLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FirstLabelEsp.BackgroundTransparency = 1.000
FirstLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
FirstLabelEsp.BorderSizePixel = 0
FirstLabelEsp.Size = UDim2.new(0, 195, 0, 20)
FirstLabelEsp.Font = Enum.Font.Highway
FirstLabelEsp.Text = "  AccountAge:"
FirstLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
FirstLabelEsp.TextSize = 14.000
FirstLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local SecondLabelEsp = Instance.new("TextLabel")
SecondLabelEsp.Name = "SecondLabelEsp"
SecondLabelEsp.Parent = MoreInfoFrameEsp
SecondLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SecondLabelEsp.BackgroundTransparency = 1.000
SecondLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
SecondLabelEsp.BorderSizePixel = 0
SecondLabelEsp.Position = UDim2.new(0, 0, 0.105820104, 0)
SecondLabelEsp.Size = UDim2.new(0, 194, 0, 20)
SecondLabelEsp.Font = Enum.Font.Highway
SecondLabelEsp.Text = "  UserId:"
SecondLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
SecondLabelEsp.TextSize = 14.000
SecondLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local ThirdLabelEsp = Instance.new("TextLabel")
ThirdLabelEsp.Name = "ThirdLabelEsp"
ThirdLabelEsp.Parent = MoreInfoFrameEsp
ThirdLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ThirdLabelEsp.BackgroundTransparency = 1.000
ThirdLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
ThirdLabelEsp.BorderSizePixel = 0
ThirdLabelEsp.Position = UDim2.new(0, 0, 0.211640209, 0)
ThirdLabelEsp.Size = UDim2.new(0, 195, 0, 20)
ThirdLabelEsp.Font = Enum.Font.Highway
ThirdLabelEsp.Text = "  ForceField:"
ThirdLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
ThirdLabelEsp.TextSize = 14.000
ThirdLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local FourthLabelEsp = Instance.new("TextLabel")
FourthLabelEsp.Name = "FourthLabelEsp"
FourthLabelEsp.Parent = MoreInfoFrameEsp
FourthLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FourthLabelEsp.BackgroundTransparency = 1.000
FourthLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
FourthLabelEsp.BorderSizePixel = 0
FourthLabelEsp.Position = UDim2.new(0, 0, 0.317460328, 0)
FourthLabelEsp.Size = UDim2.new(0, 195, 0, 20)
FourthLabelEsp.Font = Enum.Font.Highway
FourthLabelEsp.Text = "  DB-Shotgun:"
FourthLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
FourthLabelEsp.TextSize = 14.000
FourthLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local FifthLabelEsp = Instance.new("TextLabel")
FifthLabelEsp.Name = "FifthLabelEsp"
FifthLabelEsp.Parent = MoreInfoFrameEsp
FifthLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FifthLabelEsp.BackgroundTransparency = 1.000
FifthLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
FifthLabelEsp.BorderSizePixel = 0
FifthLabelEsp.Position = UDim2.new(0, 0, 0.423280418, 0)
FifthLabelEsp.Size = UDim2.new(0, 195, 0, 20)
FifthLabelEsp.Font = Enum.Font.Highway
FifthLabelEsp.Text = "  Ak-47:"
FifthLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
FifthLabelEsp.TextSize = 14.000
FifthLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local SixthLabelEsp = Instance.new("TextLabel")
SixthLabelEsp.Name = "SixthLabelEsp"
SixthLabelEsp.Parent = MoreInfoFrameEsp
SixthLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SixthLabelEsp.BackgroundTransparency = 1.000
SixthLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
SixthLabelEsp.BorderSizePixel = 0
SixthLabelEsp.Position = UDim2.new(0, 0, 0.529100537, 0)
SixthLabelEsp.Size = UDim2.new(0, 195, 0, 20)
SixthLabelEsp.Font = Enum.Font.Highway
SixthLabelEsp.Text = "  Shotgun:"
SixthLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
SixthLabelEsp.TextSize = 14.000
SixthLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local SeventhLabelEsp = Instance.new("TextLabel")
SeventhLabelEsp.Name = "SeventhLabelEsp"
SeventhLabelEsp.Parent = MoreInfoFrameEsp
SeventhLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SeventhLabelEsp.BackgroundTransparency = 1.000
SeventhLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
SeventhLabelEsp.BorderSizePixel = 0
SeventhLabelEsp.Position = UDim2.new(0, 0, 0.634920657, 0)
SeventhLabelEsp.Size = UDim2.new(0, 195, 0, 20)
SeventhLabelEsp.Font = Enum.Font.Highway
SeventhLabelEsp.Text = "  Revolver:"
SeventhLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
SeventhLabelEsp.TextSize = 14.000
SeventhLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local EighthLabelEsp = Instance.new("TextLabel")
EighthLabelEsp.Name = "EighthLabelEsp"
EighthLabelEsp.Parent = MoreInfoFrameEsp
EighthLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EighthLabelEsp.BackgroundTransparency = 1.000
EighthLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
EighthLabelEsp.BorderSizePixel = 0
EighthLabelEsp.Position = UDim2.new(0.00515463902, 0, 0.740740716, 0)
EighthLabelEsp.Size = UDim2.new(0, 193, 0, 20)
EighthLabelEsp.Font = Enum.Font.Highway
EighthLabelEsp.Text = "  Knife:"
EighthLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
EighthLabelEsp.TextSize = 14.000
EighthLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local NinthLabelEsp = Instance.new("TextLabel")
NinthLabelEsp.Name = "NinthLabelEsp"
NinthLabelEsp.Parent = MoreInfoFrameEsp
NinthLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
NinthLabelEsp.BackgroundTransparency = 1.000
NinthLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
NinthLabelEsp.BorderSizePixel = 0
NinthLabelEsp.Position = UDim2.new(0.00515463902, 0, 0.846560836, 0)
NinthLabelEsp.Size = UDim2.new(0, 193, 0, 20)
NinthLabelEsp.Font = Enum.Font.Highway
NinthLabelEsp.Text = "  TacticalShotgun:"
NinthLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
NinthLabelEsp.TextSize = 14.000
NinthLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local TenthLabelEsp = Instance.new("TextLabel")
TenthLabelEsp.Name = "TenthLabelEsp"
TenthLabelEsp.Parent = MoreInfoFrameEsp
TenthLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TenthLabelEsp.BackgroundTransparency = 1.000
TenthLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
TenthLabelEsp.BorderSizePixel = 0
TenthLabelEsp.Position = UDim2.new(0.518041253, 0, 0, 0)
TenthLabelEsp.Size = UDim2.new(0, 187, 0, 20)
TenthLabelEsp.Font = Enum.Font.Highway
TenthLabelEsp.Text = "  Armor:"
TenthLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
TenthLabelEsp.TextSize = 14.000
TenthLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local EleventhLabelEsp = Instance.new("TextLabel")
EleventhLabelEsp.Name = "EleventhLabelEsp"
EleventhLabelEsp.Parent = MoreInfoFrameEsp
EleventhLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EleventhLabelEsp.BackgroundTransparency = 1.000
EleventhLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
EleventhLabelEsp.BorderSizePixel = 0
EleventhLabelEsp.Position = UDim2.new(0.518041253, 0, 0.105820104, 0)
EleventhLabelEsp.Size = UDim2.new(0, 187, 0, 20)
EleventhLabelEsp.Font = Enum.Font.Highway
EleventhLabelEsp.Text = "  Currency:"
EleventhLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
EleventhLabelEsp.TextSize = 14.000
EleventhLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local TelevthLabelEsp = Instance.new("TextLabel")
TelevthLabelEsp.Name = "TelevthLabelEsp"
TelevthLabelEsp.Parent = MoreInfoFrameEsp
TelevthLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TelevthLabelEsp.BackgroundTransparency = 1.000
TelevthLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
TelevthLabelEsp.BorderSizePixel = 0
TelevthLabelEsp.Position = UDim2.new(0.518041253, 0, 0.211640209, 0)
TelevthLabelEsp.Size = UDim2.new(0, 187, 0, 20)
TelevthLabelEsp.Font = Enum.Font.Highway
TelevthLabelEsp.Text = "  Possible Age:"
TelevthLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
TelevthLabelEsp.TextSize = 14.000
TelevthLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local ThirteethLabelEsp = Instance.new("TextLabel")
ThirteethLabelEsp.Name = "ThirteethLabelEsp"
ThirteethLabelEsp.Parent = MoreInfoFrameEsp
ThirteethLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ThirteethLabelEsp.BackgroundTransparency = 1.000
ThirteethLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
ThirteethLabelEsp.BorderSizePixel = 0
ThirteethLabelEsp.Position = UDim2.new(0.518041253, 0, 0.317460328, 0)
ThirteethLabelEsp.Size = UDim2.new(0, 187, 0, 20)
ThirteethLabelEsp.Font = Enum.Font.Highway
ThirteethLabelEsp.Text = "  Possible Continent:"
ThirteethLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
ThirteethLabelEsp.TextSize = 14.000
ThirteethLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local FourteenthLabelEsp = Instance.new("TextLabel")
FourteenthLabelEsp.Name = "FourteenthLabelEsp"
FourteenthLabelEsp.Parent = MoreInfoFrameEsp
FourteenthLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FourteenthLabelEsp.BackgroundTransparency = 1.000
FourteenthLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
FourteenthLabelEsp.BorderSizePixel = 0
FourteenthLabelEsp.Position = UDim2.new(0.518041253, 0, 0.423280418, 0)
FourteenthLabelEsp.Size = UDim2.new(0, 187, 0, 20)
FourteenthLabelEsp.Font = Enum.Font.Highway
FourteenthLabelEsp.Text = "  Exploiter: "
FourteenthLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
FourteenthLabelEsp.TextSize = 14.000
FourteenthLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local FiftheenthLabelEsp = Instance.new("TextLabel")
FiftheenthLabelEsp.Name = "FiftheenthLabelEsp"
FiftheenthLabelEsp.Parent = MoreInfoFrameEsp
FiftheenthLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
FiftheenthLabelEsp.BackgroundTransparency = 1.000
FiftheenthLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
FiftheenthLabelEsp.BorderSizePixel = 0
FiftheenthLabelEsp.Position = UDim2.new(0.518041253, 0, 0.529100537, 0)
FiftheenthLabelEsp.Size = UDim2.new(0, 187, 0, 20)
FiftheenthLabelEsp.Font = Enum.Font.Highway
FiftheenthLabelEsp.Text = "  Possible E-Dater:"
FiftheenthLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
FiftheenthLabelEsp.TextSize = 14.000
FiftheenthLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local SixteenthLabelEsp = Instance.new("TextLabel")
SixteenthLabelEsp.Name = "SixteenthLabelEsp"
SixteenthLabelEsp.Parent = MoreInfoFrameEsp
SixteenthLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SixteenthLabelEsp.BackgroundTransparency = 1.000
SixteenthLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
SixteenthLabelEsp.BorderSizePixel = 0
SixteenthLabelEsp.Position = UDim2.new(0.518041253, 0, 0.634920657, 0)
SixteenthLabelEsp.Size = UDim2.new(0, 187, 0, 20)
SixteenthLabelEsp.Font = Enum.Font.Highway
SixteenthLabelEsp.Text = "  Warnings:"
SixteenthLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
SixteenthLabelEsp.TextSize = 14.000
SixteenthLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local SeventeenthLabelEsp = Instance.new("TextLabel")
SeventeenthLabelEsp.Name = "SeventeenthLabelEsp"
SeventeenthLabelEsp.Parent = MoreInfoFrameEsp
SeventeenthLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SeventeenthLabelEsp.BackgroundTransparency = 1.000
SeventeenthLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
SeventeenthLabelEsp.BorderSizePixel = 0
SeventeenthLabelEsp.Position = UDim2.new(0.518041253, 0, 0.740740716, 0)
SeventeenthLabelEsp.Size = UDim2.new(0, 187, 0, 20)
SeventeenthLabelEsp.Font = Enum.Font.Highway
SeventeenthLabelEsp.Text = "  RPG-User:"
SeventeenthLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
SeventeenthLabelEsp.TextSize = 14.000
SeventeenthLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local EighteenthLabelEsp = Instance.new("TextLabel")
EighteenthLabelEsp.Name = "EighteenthLabelEsp"
EighteenthLabelEsp.Parent = MoreInfoFrameEsp
EighteenthLabelEsp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
EighteenthLabelEsp.BackgroundTransparency = 1.000
EighteenthLabelEsp.BorderColor3 = Color3.fromRGB(0, 0, 0)
EighteenthLabelEsp.BorderSizePixel = 0
EighteenthLabelEsp.Position = UDim2.new(0.518041253, 0, 0.846560836, 0)
EighteenthLabelEsp.Size = UDim2.new(0, 187, 0, 20)
EighteenthLabelEsp.Font = Enum.Font.Highway
EighteenthLabelEsp.Text = "  Pyrus User:"
EighteenthLabelEsp.TextColor3 = Color3.fromRGB(255, 255, 255)
EighteenthLabelEsp.TextSize = 14.000
EighteenthLabelEsp.TextXAlignment = Enum.TextXAlignment.Left

local ScrollingFrameSecondCombat = Instance.new("ScrollingFrame")
ScrollingFrameSecondCombat.Name = "ScrollingFrameSecondCombat"
ScrollingFrameSecondCombat.Parent = BackFrameCombat
ScrollingFrameSecondCombat.Active = true
ScrollingFrameSecondCombat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrameSecondCombat.BackgroundTransparency = 1.000
ScrollingFrameSecondCombat.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScrollingFrameSecondCombat.BorderSizePixel = 0
ScrollingFrameSecondCombat.Position = UDim2.new(0.510775864, 0, 0, 0)
ScrollingFrameSecondCombat.Size = UDim2.new(0, 222, 0, 527)
ScrollingFrameSecondCombat.ScrollBarThickness = 4
ScrollingFrameSecondCombat.ScrollBarImageColor3 = Color3.fromRGB(85,0,255)

local DeepInfoFrame = Instance.new("Frame")
DeepInfoFrame.Name = "DeepInfoFrame"
DeepInfoFrame.Parent = ScrollingFrameSecondCombat
DeepInfoFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
DeepInfoFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
DeepInfoFrame.BorderSizePixel = 0
DeepInfoFrame.Position = UDim2.new(0.00300007034, 0, 0.0100000082, 0)
DeepInfoFrame.Size = UDim2.new(0, 215, 0, 104)

local DeepInfoTitle = Instance.new("TextLabel")
DeepInfoTitle.Name = "DeepInfoTitle"
DeepInfoTitle.Parent = DeepInfoFrame
DeepInfoTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DeepInfoTitle.BackgroundTransparency = 1.000
DeepInfoTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
DeepInfoTitle.BorderSizePixel = 0
DeepInfoTitle.Position = UDim2.new(-0.00236646086, 0, -0.000779518741, 0)
DeepInfoTitle.Size = UDim2.new(0, 60, 0, 19)
DeepInfoTitle.Font = Enum.Font.Highway
DeepInfoTitle.Text = "In-Depth Info"
DeepInfoTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
DeepInfoTitle.TextSize = 13.000
DeepInfoTitle.TextXAlignment = Enum.TextXAlignment.Left

local DeepInfoTargetBox = Instance.new("TextBox")
DeepInfoTargetBox.Name = "DeepInfoTargetBox"
DeepInfoTargetBox.Parent = DeepInfoFrame
DeepInfoTargetBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DeepInfoTargetBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
DeepInfoTargetBox.BorderSizePixel = 0
DeepInfoTargetBox.Position = UDim2.new(0.0325581394, 0, 0.417796791, 0)
DeepInfoTargetBox.Size = UDim2.new(0, 200, 0, 21)
DeepInfoTargetBox.Font = Enum.Font.Highway
DeepInfoTargetBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
DeepInfoTargetBox.PlaceholderText = "Enter Player Username!"
DeepInfoTargetBox.Text = ""
DeepInfoTargetBox.TextColor3 = Color3.fromRGB(255, 255, 255)
DeepInfoTargetBox.TextSize = 14.000

local DeepInfoTargetText = Instance.new("TextLabel")
DeepInfoTargetText.Name = "DeepInfoTargetText"
DeepInfoTargetText.Parent = DeepInfoTargetBox
DeepInfoTargetText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DeepInfoTargetText.BackgroundTransparency = 1.000
DeepInfoTargetText.BorderColor3 = Color3.fromRGB(0, 0, 0)
DeepInfoTargetText.BorderSizePixel = 0
DeepInfoTargetText.Position = UDim2.new(0.264999986, 0, -1.07843161, 0)
DeepInfoTargetText.Size = UDim2.new(0, 85, 0, 15)
DeepInfoTargetText.Font = Enum.Font.Highway
DeepInfoTargetText.Text = "In-Depth Info Target"
DeepInfoTargetText.TextColor3 = Color3.fromRGB(255, 255, 255)
DeepInfoTargetText.TextSize = 14.000

local DeepInfoButton = Instance.new("TextButton")
DeepInfoButton.Name = "DeepInfoButton"
DeepInfoButton.Parent = DeepInfoFrame
DeepInfoButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
DeepInfoButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
DeepInfoButton.Position = UDim2.new(0.0700000003, 0, 0.75, 0)
DeepInfoButton.Size = UDim2.new(0, 13, 0, 13)
DeepInfoButton.Font = Enum.Font.Highway
DeepInfoButton.Text = ""
DeepInfoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DeepInfoButton.TextSize = 14.000

local DeepInfoText = Instance.new("TextLabel")
DeepInfoText.Name = "DeepInfoText"
DeepInfoText.Parent = DeepInfoButton
DeepInfoText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DeepInfoText.BackgroundTransparency = 1.000
DeepInfoText.BorderColor3 = Color3.fromRGB(0, 0, 0)
DeepInfoText.BorderSizePixel = 0
DeepInfoText.Position = UDim2.new(1.15384614, 0, 0, 0)
DeepInfoText.Size = UDim2.new(0, 52, 0, 13)
DeepInfoText.Font = Enum.Font.Highway
DeepInfoText.Text = " - In-Depth Info"
DeepInfoText.TextColor3 = Color3.fromRGB(255, 255, 255)
DeepInfoText.TextSize = 14.000
DeepInfoText.TextXAlignment = Enum.TextXAlignment.Left

local SpinFrame = Instance.new("Frame")
SpinFrame.Name = "SpinFrame"
SpinFrame.Parent = ScrollingFrameSecondCombat
SpinFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
SpinFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpinFrame.BorderSizePixel = 0
SpinFrame.Position = UDim2.new(0.00300000003, 0, 0.115000002, 0)
SpinFrame.Size = UDim2.new(0, 215, 0, 104)

local SpinTitle = Instance.new("TextLabel")
SpinTitle.Name = "SpinTitle"
SpinTitle.Parent = SpinFrame
SpinTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpinTitle.BackgroundTransparency = 1.000
SpinTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpinTitle.BorderSizePixel = 0
SpinTitle.Position = UDim2.new(-0.00236646086, 0, -0.000779518741, 0)
SpinTitle.Size = UDim2.new(0, 60, 0, 19)
SpinTitle.Font = Enum.Font.Highway
SpinTitle.Text = "Spin"
SpinTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
SpinTitle.TextSize = 13.000
SpinTitle.TextXAlignment = Enum.TextXAlignment.Left

local SpinSpeedBox = Instance.new("TextBox")
SpinSpeedBox.Name = "SpinSpeedBox"
SpinSpeedBox.Parent = SpinFrame
SpinSpeedBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SpinSpeedBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpinSpeedBox.BorderSizePixel = 0
SpinSpeedBox.Position = UDim2.new(0.0325581394, 0, 0.417796791, 0)
SpinSpeedBox.Size = UDim2.new(0, 200, 0, 21)
SpinSpeedBox.Font = Enum.Font.Highway
SpinSpeedBox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
SpinSpeedBox.PlaceholderText = "30"
SpinSpeedBox.Text = ""
SpinSpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpinSpeedBox.TextSize = 14.000

local SpinSpeedText = Instance.new("TextLabel")
SpinSpeedText.Name = "SpinSpeedText"
SpinSpeedText.Parent = SpinSpeedBox
SpinSpeedText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpinSpeedText.BackgroundTransparency = 1.000
SpinSpeedText.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpinSpeedText.BorderSizePixel = 0
SpinSpeedText.Position = UDim2.new(0.264999986, 0, -1.07843161, 0)
SpinSpeedText.Size = UDim2.new(0, 85, 0, 15)
SpinSpeedText.Font = Enum.Font.Highway
SpinSpeedText.Text = "Spin Speed"
SpinSpeedText.TextColor3 = Color3.fromRGB(255, 255, 255)
SpinSpeedText.TextSize = 14.000

local SpinButton = Instance.new("TextButton")
SpinButton.Name = "SpinButton"
SpinButton.Parent = SpinFrame
SpinButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
SpinButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
SpinButton.Position = UDim2.new(0.0700000003, 0, 0.75, 0)
SpinButton.Size = UDim2.new(0, 13, 0, 13)
SpinButton.Font = Enum.Font.Highway
SpinButton.Text = ""
SpinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SpinButton.TextSize = 14.000

local SpinText = Instance.new("TextLabel")
SpinText.Name = "SpinText"
SpinText.Parent = SpinButton
SpinText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
SpinText.BackgroundTransparency = 1.000
SpinText.BorderColor3 = Color3.fromRGB(0, 0, 0)
SpinText.BorderSizePixel = 0
SpinText.Position = UDim2.new(1.15384614, 0, 0, 0)
SpinText.Size = UDim2.new(0, 52, 0, 13)
SpinText.Font = Enum.Font.Highway
SpinText.Text = " - Spin"
SpinText.TextColor3 = Color3.fromRGB(255, 255, 255)
SpinText.TextSize = 14.000
SpinText.TextXAlignment = Enum.TextXAlignment.Left

local ParentFrame_RestoreOldUi = Instance.new("Frame")
ParentFrame_RestoreOldUi.Name = "ParentFrame_RestoreOldUi"
ParentFrame_RestoreOldUi.Parent = BackFrameMisc
ParentFrame_RestoreOldUi.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ParentFrame_RestoreOldUi.BackgroundTransparency = 0.550
ParentFrame_RestoreOldUi.BorderColor3 = Color3.fromRGB(0, 0, 0)
ParentFrame_RestoreOldUi.BorderSizePixel = 0
ParentFrame_RestoreOldUi.Size = UDim2.new(0, 464, 0, 552)
ParentFrame_RestoreOldUi.Visible = false
ParentFrame_RestoreOldUi.ZIndex = 2

local ButtonFrame_RestoreOldSettings = Instance.new("Frame")
ButtonFrame_RestoreOldSettings.Name = "ButtonFrame_RestoreOldSettings"
ButtonFrame_RestoreOldSettings.Parent = ParentFrame_RestoreOldUi
ButtonFrame_RestoreOldSettings.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ButtonFrame_RestoreOldSettings.BorderColor3 = Color3.fromRGB(0, 0, 0)
ButtonFrame_RestoreOldSettings.BorderSizePixel = 0
ButtonFrame_RestoreOldSettings.Position = UDim2.new(0.318965524, 0, 0.425724626, 0)
ButtonFrame_RestoreOldSettings.Size = UDim2.new(0, 168, 0, 100)
ButtonFrame_RestoreOldSettings.ZIndex = 3

local AreYouSureText = Instance.new("TextLabel")
AreYouSureText.Name = "AreYouSureText"
AreYouSureText.Parent = ButtonFrame_RestoreOldSettings
AreYouSureText.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
AreYouSureText.BorderColor3 = Color3.fromRGB(0, 0, 0)
AreYouSureText.BorderSizePixel = 0
AreYouSureText.Position = UDim2.new(0, 0, -0.00999999978, 0)
AreYouSureText.Size = UDim2.new(0, 168, 0, 19)
AreYouSureText.ZIndex = 4
AreYouSureText.Font = Enum.Font.Highway
AreYouSureText.Text = "Are you sure?"
AreYouSureText.TextColor3 = Color3.fromRGB(255, 255, 255)
AreYouSureText.TextSize = 14.000

local WarningText = Instance.new("TextLabel")
WarningText.Name = "WarningText"
WarningText.Parent = ButtonFrame_RestoreOldSettings
WarningText.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
WarningText.BackgroundTransparency = 1.000
WarningText.BorderColor3 = Color3.fromRGB(0, 0, 0)
WarningText.BorderSizePixel = 0
WarningText.Position = UDim2.new(0, 0, 0.180000007, 0)
WarningText.Size = UDim2.new(0, 168, 0, 19)
WarningText.ZIndex = 4
WarningText.Font = Enum.Font.Highway
WarningText.Text = "Your UI changes will be deleted"
WarningText.TextColor3 = Color3.fromRGB(255, 255, 255)
WarningText.TextSize = 12.000

local YesButton = Instance.new("TextButton")
YesButton.Name = "YesButton"
YesButton.Parent = ButtonFrame_RestoreOldSettings
YesButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
YesButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
YesButton.BorderSizePixel = 0
YesButton.Position = UDim2.new(0.065476194, 0, 0.533599854, 0)
YesButton.Size = UDim2.new(0, 61, 0, 26)
YesButton.ZIndex = 5
YesButton.Font = Enum.Font.Highway
YesButton.Text = "Yes"
YesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
YesButton.TextSize = 14.000

local NoButton = Instance.new("TextButton")
NoButton.Name = "NoButton"
NoButton.Parent = ButtonFrame_RestoreOldSettings
NoButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
NoButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
NoButton.BorderSizePixel = 0
NoButton.Position = UDim2.new(0.559523821, 0, 0.533599854, 0)
NoButton.Size = UDim2.new(0, 61, 0, 26)
NoButton.ZIndex = 5
NoButton.Font = Enum.Font.Highway
NoButton.Text = "No"
NoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
NoButton.TextSize = 14.000

CombatButton.MouseButton1Click:Connect(function()
    BackFrameCombat.Visible = not BackFrameCombat.Visible
    BackFrameMisc.Visible = false
	BackFrameMovement.Visible = false
end)

MiscellaneousButton.MouseButton1Click:Connect(function()
    BackFrameMisc.Visible = not BackFrameMisc.Visible
    BackFrameCombat.Visible = false
	BackFrameMovement.Visible = false
end)

MovementButton.MouseButton1Click:Connect(function()
	BackFrameMovement.Visible = not BackFrameMovement.Visible
	BackFrameMisc.Visible = false
	BackFrameCombat.Visible = false
end)

function Chat()
	LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Visible = true 
	LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Position = LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Position + UDim2.new(UDim.new(), LocalPlayer.PlayerGui.Chat.Frame.ChatChannelParentFrame.Size.Y)
    StarterGui:SetCore('ChatMakeSystemMessage', ChatMsg)
end


if ColorsSaved then
	ColorsSaved = getHttp:JSONDecode(readfile'Coryu/Dahood/Pyrus/Colors/UiColors.lua')
	for i,v in next, UiColors do
	    if ColorsSaved then
	        UiColors[i] = ColorsSaved[i]
	    end
	end
	writefile('Coryu/Dahood/Pyrus/Colors/UiColors.lua', getHttp:JSONEncode(UiColors))
else
	ColorsSaved = writefile('Coryu/Dahood/Pyrus/Colors/UiColors.lua', getHttp:JSONEncode(UiColors))
end

if ChatSaved then
	ChatSaved = getHttp:JSONDecode(readfile'Coryu/Dahood/Pyrus/Chat.lua')
	for i,v in next, ChatT do
	    if ChatSaved then
	        ChatT[i] = ChatSaved[i]
	    end
	end
	writefile('Coryu/Dahood/Pyrus/Chat.lua', getHttp:JSONEncode(ChatT))
else
	ChatSaved = writefile('Coryu/Dahood/Pyrus/Chat.lua', getHttp:JSONEncode(ChatT))
end

local function savechat()
    if writefile and readfile then
        writefile('Coryu/Dahood/Pyrus/Chat.lua', getHttp:JSONEncode(ChatT))
    else
        UserNotifications('Pyrus - SaveChat()', 'There was an Error with JSONEncode')
    end
end

local function savecolors()
    if writefile and readfile then
        writefile('Coryu/Dahood/Pyrus/Colors/UiColors.lua', getHttp:JSONEncode(UiColors))
    else
        UserNotifications('Pyrus - SaveColors()', 'There was an Error with JSONEncode')
    end
end

function searchdata(ply : string)
	for i,v in next, Players:GetPlayers() do 
		if string.sub(string.lower(v.Name), 1, string.len(ply)) == string.lower(ply) then 
			return v
		end
	end
	return nil
end

local function Esp(Plr)
    if EspTarget == LocalPlayer then
         return nil
    end
    if EspColor == nil then
        EspColor = EspColorTable['Royal Purple']
    else
        local BillBoard = Instance.new('BillboardGui', Plr.Character.Head)
        local EspLabel = Instance.new('TextLabel', BillBoard)
        local Tracer = Drawing.new('Line')
        local Box = Drawing.new('Square')
        local BoxOutline = Drawing.new('Square')

        BillBoard.Name = 'Bill'
        BillBoard.Adornee = part
        BillBoard.AlwaysOnTop = true
        BillBoard.Size = UDim2.new(0,100,0,100)
        BillBoard.StudsOffset = Vector3.new(0,1.3,0)

        EspLabel.Name = 'Esp'
        EspLabel.BackgroundColor3 = Color3.fromRGB(0,0,0)
        EspLabel.BackgroundTransparency = 1
        EspLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
        EspLabel.BorderSizePixel = 1
        EspLabel.Size = UDim2.new(1,0,0,40)
        EspLabel.Font = Enum.Font.Code
        EspLabel.TextSize = 12
        EspLabel.ZIndex = 1

        Tracer.Visible = true
        Tracer.Transparency = 1

        Box.Visible = true
        Box.Transparency = 1
        Box.Filled = false

        RunService.RenderStepped:Connect(function()
            if Plr and Plr.Character and Plr.Character:FindFirstChild'Humanoid' then
                local Vec = Vector3.new(0,3,0)
                local NoVec = Vector3.new(0,0.5,0)
				EspLabel.TextColor3 = EspColor
				Tracer.Color = EspColor
                Box.Color = EspColor
                Box.Thickness = ThicknessDraw
                Tracer.Thickness = ThicknessDraw
                local Hum, OnScreen = Camera:WorldToViewportPoint(Plr.Character.HumanoidRootPart.Position)
                local Head = Camera:WorldToViewportPoint(Plr.Character.Head.Position + NoVec)
                local Division = 2200
                local Minus = Camera:WorldToViewportPoint(Plr.Character.HumanoidRootPart.Position - Vec)
                local Plus = Camera:WorldToViewportPoint(Plr.Character.HumanoidRootPart.Position + NoVec)
                    if BasicInfo then
                        BasicInfoButton.Text = "X"
                        MoreInfoButton.Text = ""
                        MoreInfoEsp = false
                        EspLabel.Text = 'Name: - '..Plr.Name..' Health: - '..math.round(Plr.Character.Humanoid.Health)..' \n Pos: - '..math.round((LocalPlayer.Character.Head.Position - Plr.Character.Head.Position).magnitude)
                    elseif MoreInfoEsp then
                        BasicInfo = false
                        BasicInfoButton.Text = ""
                        MoreInfoButton.Text = "X"
                        EspLabel.Text = 'Name: - '..Plr.Name..' Health: - '..math.round(Plr.Character.Humanoid.Health)..' \n Pos: - '..math.round((LocalPlayer.Character.Head.Position - Plr.Character.Head.Position).magnitude)..' Test'
                    end
                    if OnScreen then
                        if TracerEsp then
                            TracersButton.Text = 'X'
                            Tracer.Visible = true
                            Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
                            Tracer.To = Vector2.new(Hum.X, Hum.Y)
                        elseif not TracerEsp then
                            TracersButton.Text = ''
                            Tracer.Visible = false
                        end
                        if RectangeEsp then
                            ShapesButton.Text = 'X'
                            Box.Visible = true
                            Box.Size = Vector2.new(Division / Hum.Z, Head.Y - Minus.Y, Hum.X)
                            Box.Position = Vector2.new(Hum.X - Box.Size.X / 2, Hum.Y - Box.Size.Y / 2)
                        elseif not RectangeEsp then
                            Box.Visible = false
                        end
                    else
                        Tracer.Visible = false
                        Box.Visible = false
                    end
                else
                    Tracer.Visible = false
                    Box.Visible = false
                end
            end)
            Plr.CharacterAdded:connect(function()
            task.wait(0.1)
            local BillBoard = Instance.new('BillboardGui', Plr.Character.Head)
            local EspLabel = Instance.new('TextLabel', BillBoard)
            local Tracer = Drawing.new('Line')
            local Box = Drawing.new('Square')
            local BoxOutline = Drawing.new('Square')

            BillBoard.Name = 'Bill'
            BillBoard.Adornee = part
            BillBoard.AlwaysOnTop = true
            BillBoard.Size = UDim2.new(0,100,0,100)
            BillBoard.StudsOffset = Vector3.new(0,1.3,0)

            EspLabel.Name = 'Esp'
            EspLabel.BackgroundColor3 = Color3.fromRGB(0,0,0)
            EspLabel.BackgroundTransparency = 1
            EspLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
            EspLabel.BorderSizePixel = 1
            EspLabel.Size = UDim2.new(1,0,0,40)
            EspLabel.Font = Enum.Font.Code
            EspLabel.TextSize = 12
            EspLabel.ZIndex = 1

            Tracer.Visible = true
            Tracer.Transparency = 1

            Box.Visible = true
            Box.Transparency = 1
            Box.Filled = false

            RunService.RenderStepped:Connect(function()
                if Plr and Plr.Character and Plr.Character:FindFirstChild'Humanoid' then
                    local Vec = Vector3.new(0,3,0)
                    local NoVec = Vector3.new(0,0.5,0)
                    EspLabel.TextColor3 = EspColor
                    Tracer.Color = EspColor
                    Box.Color = EspColor
                    Box.Thickness = ThicknessDraw
                    Tracer.Thickness = ThicknessDraw
                    local Hum, OnScreen = Camera:WorldToViewportPoint(Plr.Character.HumanoidRootPart.Position)
                    local Head = Camera:WorldToViewportPoint(Plr.Character.Head.Position + NoVec)
                    local Division = 2200
                    local Minus = Camera:WorldToViewportPoint(Plr.Character.HumanoidRootPart.Position - Vec)
                    local Plus = Camera:WorldToViewportPoint(Plr.Character.HumanoidRootPart.Position + NoVec)
                        if BasicInfo then
                            BasicInfoButton.Text = "X"
                            MoreInfoButton.Text = ""
                            MoreInfoEsp = false
                            EspLabel.Text = 'Name: - '..Plr.Name..' Health: - '..math.round(Plr.Character.Humanoid.Health)..' \n Pos: - '..math.round((LocalPlayer.Character.Head.Position - Plr.Character.Head.Position).magnitude)
                        elseif MoreInfoEsp then
                            BasicInfo = false
                            BasicInfoButton.Text = ""
                            MoreInfoButton.Text = "X"
                            EspLabel.Text = 'Name: - '..Plr.Name..' Health: - '..math.round(Plr.Character.Humanoid.Health)..' \n Pos: - '..math.round((LocalPlayer.Character.Head.Position - Plr.Character.Head.Position).magnitude)..' Test'
                        end
                        if OnScreen then
                            if TracerEsp then
                                TracersButton.Text = 'X'
                                Tracer.Visible = true
                                Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 1)
                                Tracer.To = Vector2.new(Hum.X, Hum.Y)
                            elseif not TracerEsp then
                                TracersButton.Text = ''
                                Tracer.Visible = false
                            end
                            if RectangeEsp then
                                Box.Visible = true
                                Box.Size = Vector2.new(Division / Hum.Z, Head.Y - Minus.Y, Hum.X)
                                Box.Position = Vector2.new(Hum.X - Box.Size.X / 2, Hum.Y - Box.Size.Y / 2)
                            elseif not RectangeEsp then
                                Box.Visible = false
                            end
                        else
                            Tracer.Visible = false
                            Box.Visible = false
                        end
                    else
                    Tracer.Visible = false
                    Box.Visible = false
                end
            end)
        end)
    end
end

local function DeepInfoFunction(Host)
    FirstLabelEsp.Text = "  AccountAge: "..Host.AccountAge.." Days Old"
    SecondLabelEsp.Text = "  UserId: "..Host.UserId
    RunService.Stepped:Connect(function()
        if Host.Character:FindFirstChild'ForceField' then
            ThirdLabelEsp.Text = "  ForceField: true"
        elseif not Host.Character:FindFirstChild'ForceField' then
            ThirdLabelEsp.Text = "  ForceField: false"
        end
        if Host.Backpack:FindFirstChild'[Knife]' then
            EighthLabelEsp.Text = "  Knife: true"
        elseif not Host.Backpack:FindFirstChild'[Knife]' then
            EighthLabelEsp.Text = "  Knife: false"
        end
        if Host.Backpack:FindFirstChild'[Double-Barrel SG]' then
            FourthLabelEsp.Text = "  DB-Shotgun: true"
        elseif not Host.Backpack:FindFirstChild'[Double-Barrel SG]' then
            FourthLabelEsp.Text = "  DB-Shotgun: false"
        end
        if Host.Backpack:FindFirstChild'[AK47]' then
            FifthLabelEsp.Text = "  Ak-47: true"
        elseif not Host.Backpack:FindFirstChild'[AK47]' then
            FifthLabelEsp.Text = "  Ak-47: false"
        end
        if Host.Backpack:FindFirstChild'[AK47]' then
            FifthLabelEsp.Text = "  Ak-47: true"
        elseif not Host.Backpack:FindFirstChild'[AK47]' then
            FifthLabelEsp.Text = "  Ak-47: false"
        end
        if Host.Backpack:FindFirstChild'[Shotgun]' then
            SixthLabelEsp.Text = "  Shotgun: true" 
        elseif not Host.Backpack:FindFirstChild'[Shotgun]' then
            SixthLabelEsp.Text = "  Shotgun: false"
        end
        if Host.Backpack:FindFirstChild'[Revolver]' then
            SeventhLabelEsp.Text = "  Revolver: true"
        elseif not Host.Backpack:FindFirstChild'[Revolver]' then
            SeventhLabelEsp.Text = "  Revolver: false"
        end
        if Host.Backpack:FindFirstChild'[TacticalShotgun]' then
            NinthLabelEsp.Text = "  TacticalShotgun: true"
        elseif not Host.Backpack:FindFirstChild'[TacticalShotgun]' then
            NinthLabelEsp.Text = "  TacticalShotgun: false"
        end
        pcall(function()
            if Host.DataFolder:FindFirstChild'Currency' then 
                EleventhLabelEsp.Text = "  Currency: "..Host.DataFolder.Currency.Value
            end
        end)
        if Host and Host.Character then
            local age16 = {'die', 'kys', 'ihu', 'i hate you', 'lol', 'wsg', 'df', 'cry', 'ur weird', 'weird', 'btc', 'clipped', 'rec', 'clip'}
            local age15 = {'tf up', 'thot', 'wap', 'corny', 'smh', 'ofc', 'NPC', 'rizz', 'gas', 'nca', 'nc', 'cappin', 'cake', 'on god', 'on momma', 'omm', 'cap', 'no cap', 'BARK', 'furry', 'furries', 'im sad', 'depressed', 'pressed', 'skid', 'slay', 'emo', 'periodt', 'tool', 'fatahh', 'smash', 'RQ', 'exploiter', 'asl', 'no life', 'kid', 'roaches', 'npcs'}
            local age14 = {'bra', 'mammy', 'mami', 'daddy', 'daddi', 'son', 'seed', 'CUTEE', 'CUTE', 'WHA', 'wha', 'MOMMY', 'daddy', 'shooter', 'cuh', 'ez', 'nn', 'yur', 'XD', 'good son', 'bet', 'sleep on', 'deadahh', 'trap', 'jit', 'yeet', 'bae', 'beef', 'plug', 'gucci', 'IM DEAD', 'geeking', 'dope', 'finna', 'mood', 'shook', 'fire', 'pack', 'lookin ahh', 'lookin ah', 'lookin', 'silly', 'MAFRAKA', 'random', 'slayyy', 'pookie', 'blud'}
            local age13 = {'fam', 'sus', 'sussy', 'baka', 'sussy baka', 'YEET', 'bae', 'AF', 'oop', 'bih', 'bussin', 'ded', 'drip', 'karen', 'hits different', 'ok boomer', 'salty', 'simp', 'sis', 'thicc', 'vibing', 'zaddy', 'YAS', 'vsco', 'noob', 'e kitten'}
            Host.Chatted:Connect(function(cringewords)
                if table.find(age13,cringewords:lower()) then
                    TelevthLabelEsp.Text = "  Possible Age: 13"
                elseif table.find(age14,cringewords:lower()) then
                    TelevthLabelEsp.Text = "  Possible Age: 14"
                elseif table.find(age15,cringewords:lower()) then
                    TelevthLabelEsp.Text = "  Possible Age: 15"
                elseif table.find(age16,cringewords:lower()) then
                    TelevthLabelEsp.Text = "  Possible Age: 16"
                elseif table.find(age13,cringewords:upper()) then
                    TelevthLabelEsp.Text = "  Possible Age: 13"
                elseif table.find(age14,cringewords:upper()) then
                    TelevthLabelEsp.Text = "  Possible Age: 14"
                elseif table.find(age15,cringewords:upper()) then
                    TelevthLabelEsp.Text = "  Possible Age: 15"
                elseif table.find(age16,cringewords:upper()) then
                    TelevthLabelEsp.Text = "  Possible Age: 16"
                end
            end)
        end
        if Host and Host.Character then
            local europe = {'minimise', 'behaviour', 'tyre', 'colour', 'mum', 'sulphur', 'gray', 'aluminium', 'manoeuvre', 'flavour', 'humour', 'labour', 'neighbour', 'analyse', 'defence', 'license', 'offence', 'fulfil', 'rumour', 'honour', 'baboon', 'dirty americans'} -- last 2 from scar
            local japan = {'富', '士', '山'} -- i know japan isnt a continent lol
            local china = {'的', '一', '是', '不'} -- i know china isnt a continent lol
            local NA = {'jit', 'color', 'gon', 'finna', 'cuz', 'bum', 'bussin', 'banger', 'gucci', 'yas', 'yass', 'yasss', 'kek', 'les', 'nca', 'nc', 'cry', 'ur black', 'black', 'oops', 'oop', 'trap', 'trap house', 'trapper', 'crip', 'bloods', 'crib', 'L'} -- alot of coon words cringe
            Host.Chatted:Connect(function(coonwords)
                if table.find(europe,coonwords:lower()) then
                    ThirteethLabelEsp.Text = "  Possible Continent: Europe (UK)"
                elseif table.find(europe,coonwords:upper()) then
                    ThirteethLabelEsp.Text = "  Possible Continent: Europe (UK)"
                elseif table.find(japan,coonwords:lower()) then
                    ThirteethLabelEsp.Text = "  Possible Continent: Asia (Japan)"
                elseif table.find(japan,coonwords:upper()) then
                    ThirteethLabelEsp.Text = "  Possible Continent: Asia (Japan)"
                elseif table.find(china,coonwords:lower()) then
                    ThirteethLabelEsp.Text = "  Possible Continent: Asia (China)"
                elseif table.find(china,coonwords:upper()) then
                    ThirteethLabelEsp.Text = "  Possible Continent: Asia (China)"
                elseif table.find(NA,coonwords:lower()) then
                    ThirteethLabelEsp.Text = "  Possible Continent: NA (US)"
                elseif table.find(NA,coonwords:upper()) then
                    ThirteethLabelEsp.Text = "  Possible Continent: NA (US)"
                end
            end)
        end
        if Host and Host.Character then
            local edaterwords = {'mommy', 'daddy', 'mamas', 'mama', 'momma', 'mami', 'bae', 'baby', 'boo', 'ily', 'mwa', 'mwah', 'muah', 'mauh', 'daddi', 'dady', 'dadi', 'love', 'you cute', 'cute', 'my bf', 'my gf', 'daddys', 'daddis', 'dadys'}
            Host.Chatted:Connect(function(edater)
                if table.find(edaterwords,edater:lower()) then
                    FiftheenthLabelEsp.Text = "  Possible E-Dater: true"
                elseif table.find(edaterwords,edater:upper()) then
                    FiftheenthLabelEsp.Text = "  Possible E-Dater: true"
                end
            end)
            local corny_names = {'his', 'her', 'fangirl', 'fanboy', 'ilove', 'love', 'gf', 'bf', 'iscute', 'She', 'he', 'heluvs', 'sheluvs'}
            if table.find(corny_names, Host.Name:lower()) then
                FiftheenthLabelEsp.Text = "  Possible E-Dater: true"
            elseif table.find(corny_names, Host.Name:upper()) then
                FiftheenthLabelEsp.Text = "  Possible E-Dater: true"
            end
            if table.find(corny_names, Host.DisplayName:upper()) then
                FiftheenthLabelEsp.Text = "  Possible E-Dater: true"
            elseif table.find(corny_names, Host.DisplayName:lower()) then
                FiftheenthLabelEsp.Text = "  Possible E-Dater: true"
            end
        end
        if Host.CameraMaxZoomDistance == 30 then
            FourteenthLabelEsp.Text = "  Exploiter:"
        else
            FourteenthLabelEsp.Text = "  Exploiter: true"
        end
        if Host.DataFolder.Information:FindFirstChild'ArmorSave' then
            TenthLabelEsp.Text = "  Armor: "..Host.DataFolder.Information:FindFirstChild'ArmorSave'.Value
        end
        if Host.DataFolder:FindFirstChild'Warning' then
            SixteenthLabelEsp.Text = "  Warnings: "..Host.DataFolder:FindFirstChild'Warning'.Value
        end
        if Host.Backpack:FindFirstChild'[RPG]' then
            SeventeenthLabelEsp.Text = "  RPG-User: true"
        elseif not Host.Backpack:FindFirstChild'[RPG]' then
            SeventeenthLabelEsp.Text = "  RPG-User: false"
        end
    end)
end

RunService.Stepped:Connect(function()
	
	if LookVectorSprint then
		SprintSpeedBox3.Visible = true
		SprintSpeedBox2.Visible = false
		SprintSpeedBox.Visible = false
		if LookVectorSprinting then
			LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.Velocity = LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame.lookVector * SprintSpeedLookVector / 1
		end
	end
	
	if Blink then
	SprintSpeedBox.Visible = true
	SprintSpeedBox3.Visible = false
	SprintSpeedBox2.Visible = false
		if Blinking then
			LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame = LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame + Vector3.new(LocalPlayer.Character.Humanoid.MoveDirection.X * BlinkSpeed / 5, 0, LocalPlayer.Character.Humanoid.MoveDirection.Z * BlinkSpeed / 5)
		end
	end
	
	if CFrameSprint then
	SprintSpeedBox2.Visible = true
	SprintSpeedBox3.Visible = false
	SprintSpeedBox.Visible = false
		if CFrameSprinting then
			if KeysTable['W'] then
				LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame = LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame * CFrame.new(0,0,-CFrameSpeed)
			end
			if KeysTable['A'] then
				LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame = LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame * CFrame.new(-CFrameSpeed,0,0)
			end
			if KeysTable['S'] then
				LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame = LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame * CFrame.new(0,0,CFrameSpeed)
			end
			if KeysTable['D'] then
				LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame = LocalPlayer.Character:FindFirstChild'HumanoidRootPart'.CFrame * CFrame.new(CFrameSpeed,0,0)
			end
		end
	end

	if not Sprint then
		LookVectorSprint = false
		Blink = false
		CFrameSprint = false
	end
	
	if string.len(SprintSpeedBox3.Text) > 0 then
		if LookVectorSprint then
			SprintSpeedLookVector = string.upper(string.sub(tostring(SprintSpeedBox3.Text),1,4))
		end
	end
	
	if string.len(SprintSpeedBox2.Text) > 0 then
		if CFrameSprint then
			CFrameSpeed = string.upper(string.sub(tostring(SprintSpeedBox2.Text),1,4))
		end
	end
	
	if string.len(SprintSpeedBox.Text) > 0 then
		if Blink then
			BlinkSpeed = string.upper(string.sub(tostring(SprintSpeedBox.Text),1,4))
		end
	end

    if string.len(SpinSpeedBox.Text) > 0 then
		if Spin then
			SpinSpeed = string.upper(string.sub(tostring(SpinSpeedBox.Text),1,3))
		end
	end

	if Camlock and CamlockTarget and CamlockTarget.Character and CamlockTarget.Character:FindFirstChild(CamlockedPart) then 
		Camera.CFrame = CFrame.new(Camera.CFrame.p, CamlockTarget.Character:FindFirstChild(CamlockedPart).CFrame.p)
	else
		return nil
	end

    if Noclip then
        if LocalPlayer and LocalPlayer.Character then
            LocalPlayer.Character.Head.CanCollide = false
            LocalPlayer.Character.UpperTorso.CanCollide = false
            LocalPlayer.Character.LowerTorso.CanCollide = false
            LocalPlayer.Character.HumanoidRootPart.CanCollide = false
        end
    elseif not Noclip then
        if LocalPlayer and LocalPlayer.Character then
            LocalPlayer.Character.Head.CanCollide = true
            LocalPlayer.Character.UpperTorso.CanCollide = true
            LocalPlayer.Character.LowerTorso.CanCollide = true
            LocalPlayer.Character.HumanoidRootPart.CanCollide = true
        end
    end
end)

RunService.Stepped:Connect(function()
	if Sprint then
		LookVectorSprintButton.MouseButton1Click:Connect(function() 
			SprintMethodsButton.Text = "LookVector"
			task.wait(0.2)
			LookVectorSprint = true
			Blink = false
			CFrameSprint = false
			SprintSpeedBox.PlaceholderText = tonumber(SprintSpeedLookVector)
		end)
		BlinkSprintButton.MouseButton1Click:Connect(function()
			SprintMethodsButton.Text = "Blink"
			task.wait(0.2)
			Blink = true
			LookVectorSprint = false
			CFrameSprint = false
			SprintSpeedBox.PlaceholderText = tonumber(BlinkSpeed)
		end)
		CFrameSprintButton.MouseButton1Click:Connect(function()
			SprintMethodsButton.Text = "CFrame"
			task.wait(0.2)
			Blink = false
			LookVectorSprint = false
			CFrameSprint = true
			SprintSpeedBox.PlaceholderText = tonumber(CFrameSpeed)
		end)
	end
	if Camlock then
		HeadCamlockPartButton.MouseButton1Click:Connect(function()
			CamlockPartsButton.Text = 'Head'
			task.wait(0.2)
			CamlockedPart = AbledParts['Head']
		end)
		TorsoCamlockPartButton.MouseButton1Click:Connect(function()
			CamlockPartsButton.Text = 'Torso'
			task.wait(0.2)
			CamlockedPart = AbledParts['Torso']
		end)
		HumanoidRootPartCamlockPartButton.MouseButton1Click:Connect(function()
			CamlockPartsButton.Text = 'HumanoidRootPart'
			task.wait(0.2)
			CamlockedPart = AbledParts['HumanoidRootPart']
		end)
	end
	MoreInfoButton.MouseButton1Click:Connect(function()
		MoreInfoButton.Text = 'X'
		task.wait(0.2)
		BasicInfo = false
		MoreInfoEsp = true
	end)
	BasicInfoButton.MouseButton1Click:Connect(function()
		BasicInfoButton.Text = 'X'
		task.wait(0.2)
		MoreInfoEsp = false
		BasicInfo = true
	end)
	RedEspButton.MouseButton1Click:Connect(function()
		EspColorButton.Text = 'Red'
		task.wait(0.2)
		EspColor = EspColorTable['Red']
	end)
	PurpleEspButton.MouseButton1Click:Connect(function()
		EspColorButton.Text = 'Royal Purple'
		task.wait(0.2)
		EspColor = EspColorTable['Royal Purple']
	end)
	YellowEspButton.MouseButton1Click:Connect(function()
		EspColorButton.Text = 'Yellow'
		task.wait(0.2)
		EspColor = EspColorTable['Yellow']
	end)
	OrangeEspButton.MouseButton1Click:Connect(function()
		EspColorButton.Text = 'Orange'
		task.wait(0.2)
		EspColor = EspColorTable['Orange']
	end)
	BlueEspButton.MouseButton1Click:Connect(function()
		EspColorButton.Text = 'Blue'
		task.wait(0.2)
		EspColor = EspColorTable['Blue']
	end)
	GreenEspButton.MouseButton1Click:Connect(function()
		EspColorButton.Text = 'Green'
		task.wait(0.2)
		EspColor = EspColorTable['Green']
	end)
	PinkEspButton.MouseButton1Click:Connect(function()
		EspColorButton.Text = 'Pink'
		task.wait(0.2)
		EspColor = EspColorTable['Pink']
	end)
end)

UserInputService.InputBegan:Connect(function(Action, NoChat)
	if Action.KeyCode == Enum.KeyCode[LookVectorSpeedKey] then
		LookVectorSprinting = true
	end
	
	if Action.KeyCode == Enum.KeyCode[BlinkKey] then
		Blinking = true
	end
	
	if Action.KeyCode == Enum.KeyCode[CFrameKey] then
		CFrameSprinting = true
	end

	if NoChat then
		return nil
	end
	
	if Action.KeyCode == Enum.KeyCode.W then
		KeysTable['W'] = true
	end
	
	if Action.KeyCode == Enum.KeyCode.A then
		KeysTable['A'] = true
	end
	
	if Action.KeyCode == Enum.KeyCode.S then
		KeysTable['S'] = true
	end
	
	if Action.KeyCode == Enum.KeyCode.D then
		KeysTable['D'] = true
	end

    if Action.KeyCode == Enum.KeyCode[CamlockKey] then
        Camlock = not Camlock
    end
end)

UserInputService.InputEnded:Connect(function(ActionEnd)
	
	if ActionEnd.KeyCode == Enum.KeyCode[LookVectorSpeedKey] then
		LookVectorSprinting = false
	end
	
	if ActionEnd.KeyCode == Enum.KeyCode[BlinkKey] then
		Blinking = false
	end
	
	if ActionEnd.KeyCode == Enum.KeyCode[CFrameKey] then
		CFrameSprinting = false
	end
	
end)

RejoinButton.MouseButton1Click:Connect(function()
	RejoinButton.Text = "X"
	task.wait(0.2)
	Teleport:Teleport(game.PlaceId)
end)

ShudownButton.MouseButton1Click:Connect(function()
	ShudownButton.Text = "X"
	task.wait(0.2)
	game:shutdown()
end)

ChatButton.MouseButton1Click:Connect(function()
	ChatButton.Text = "X"
	task.wait(1)
	Chat()
end)

SprintButton.MouseButton1Click:Connect(function()
	Sprint = not Sprint
	UserNotifications('Pyrus', 'Sprint is now '..tostring(Sprint))
	if Sprint then 
		SprintButton.Text = "X"
		task.wait(0.2)
	elseif not Sprint then
		SprintButton.Text = ""
	end
end)

CamlockButton.MouseButton1Click:Connect(function()
	Camlock = not Camlock
	UserNotifications('Pyrus', 'Camlock is now '..tostring(Camlock))
	if Camlock then
		CamlockButton.Text = "X"
		task.wait(0.2)
	elseif not Camlock then
		CamlockButton.Text = ""
	end
end)

TracersButton.MouseButton1Click:Connect(function()
	TracerEsp = not TracerEsp
	UserNotifications('Pyrus', 'Tracers is now '..tostring(TracerEsp))
	if TracerEsp then
		TracersButton.Text = 'X'
		task.wait(0.2)
	elseif not TracerEsp then
		TracersButton.Text = ''
	end
end)

MoreInfoButton.MouseButton1Click:Connect(function()
	MoreInfoEsp = not MoreInfoEsp
	UserNotifications('Pyrus', 'More Info Esp is now '..tostring(MoreInfoEsp))
	if MoreInfoEsp then
		MoreInfoButton = 'X'
		task.wait(0.2)
	elseif not MoreInfoEsp then
		MoreInfoButton.Text = ''
	end
end)

BasicInfoButton.MouseButton1Click:Connect(function()
	BasicInfo = not BasicInfo
	UserNotifications('Pyrus', 'Basic Info Esp is now '..tostring(BasicInfo))
	if BasicInfo then
		BasicInfoButton.Text = 'X'
		task.wait(0.2)
	elseif not BasicInfo then
		BasicInfoButton.Text = ''
	end
end)

SprintMethodsButton.MouseButton1Click:Connect(function()
	SprintGui = not SprintGui
	if SprintGui then
		BackFrameSprintMethods:TweenPosition(UDim2.new(0, 0, 1, 0), "InOut", "Quart", 0.5, true, nil)
		BackFrameSprintMethods.Visible = true
	elseif not SprintGui then
		BackFrameSprintMethods:TweenPosition(UDim2.new(0, 0, 0.05, 0), "InOut", "Quart", 0.5, true, nil)
		task.wait(0.5)
		BackFrameSprintMethods.Visible = false
	end
end)

CamlockPartsButton.MouseButton1Click:Connect(function()
	CamlockGui = not CamlockGui
	if CamlockGui then
		BackFrameCamlockParts:TweenPosition(UDim2.new(0, 0, 1, 0), "InOut", "Quart", 0.5, true, nil)
		BackFrameCamlockParts.Visible = true
	elseif not CamlockGui then
		BackFrameCamlockParts:TweenPosition(UDim2.new(0, 0, 0.05, 0), "InOut", "Quart", 0.5, true, nil)
		task.wait(0.5)
		BackFrameCamlockParts.Visible = false
	end
end)

EspColorButton.MouseButton1Click:Connect(function()
	EspColoringFrame = not EspColoringFrame
	if EspColoringFrame then
		EspColorFrame:TweenPosition(UDim2.new(0, 0, 1, 0), "InOut", "Quart", 0.5, true, nil)
		EspColorFrame.Visible = true
	elseif not EspColoringFrame then
		EspColorFrame:TweenPosition(UDim2.new(0, 0, 0.05, 0), "InOut", "Quart", 0.5, true, nil)
		task.wait(0.5)
		EspColorFrame.Visible = false
	end
end)

ShapesButton.MouseButton1Click:Connect(function()
	ShapesEsp = not ShapesEsp
	if ShapesEsp then
		ShapesButton.Text = 'X'
		RectangeEsp = true
	elseif not ShapesEsp then
		ShapesButton.Text = ''
		RectangeEsp = false
	end
end)

DeepInfoButton.MouseButton1Click:Connect(function()
    DeepInfo = not DeepInfo
    if DeepInfo then
        DeepInfoButton.Text = 'X'
        task.wait(0.2)
        BackFrameMoreInfoFrameEsp.Visible = true
    elseif not DeepInfo then
        DeepInfoButton.Text = ''
        BackFrameMoreInfoFrameEsp.Visible = false
    end
end)

SpinButton.MouseButton1Click:Connect(function()
    Spin = not Spin
    if Spin then
        SpinButton.Text = 'X'
        task.wait(.2)
        Noclip = true
        getgenv().Spinning = Instance.new'BodyAngularVelocity'
        Spinning.Parent = LocalPlayer.Character:FindFirstChild'HumanoidRootPart'
        Spinning.MaxTorque = Vector3.new(0,math.huge,0)
        RunService.Stepped:Connect(function()
            Spinning.AngularVelocity = Vector3.new(0,SpinSpeed,0)
        end)
    elseif not Spin then
        SpinButton.Text = ''
        task.wait(.2)
        Noclip = false
        for _,v in pairs(LocalPlayer.Character:FindFirstChild'HumanoidRootPart':GetChildren()) do
            if v:IsA'BodyAngularVelocity' then
                v:Destroy()
            end
        end
    end
end)

RestoreOldUIButton.MouseButton1Click:Connect(function()
	RestoreOldUIButton.Text = 'X'
    ParentFrame_RestoreOldUi.Visible = true
    YesButton.MouseButton1Click:Connect(function()
        LocalPlayer.PlayerGui.MainScreenGui.Bar.HP.bar.BackgroundColor3 = Color3.fromRGB(36,182,3)
        LocalPlayer.PlayerGui.MainScreenGui.Bar.Armor.bar.BackgroundColor3 = Color3.fromRGB(0,136,194)
        LocalPlayer.PlayerGui.MainScreenGui.Bar.Armor.firebar.BackgroundColor3 = Color3.fromRGB(253,121,33)
        LocalPlayer.PlayerGui.MainScreenGui.Bar.Energy.bar.BackgroundColor3 = Color3.fromRGB(182,182,9)
        LocalPlayer.PlayerGui.MainScreenGui.MoneyText.TextColor3 = Color3.fromRGB(95,255,87)
        task.wait(1)
        ParentFrame_RestoreOldUi.Visible = false
        RestoreOldUIButton.Text = ''
    end)
    NoButton.MouseButton1Click:Connect(function()
        ParentFrame_RestoreOldUi.Visible = false
        RestoreOldUIButton.Text = ''
    end)
end)

SaveUIButton.MouseButton1Click:Connect(function()
	SaveUIButton.Text = 'X'
	savecolors()
	task.wait(1)
	SaveUIButton.Text = ''
end)

CamlockTargetBox.FocusLost:Connect(function()
	if string.len(CamlockTargetBox.Text) > 0 then
		CamlockTarget = searchdata(string.upper(string.sub(tostring(CamlockTargetBox.Text),1,1)))
		if CamlockTarget then
			Camlock = true
            CamlockButton.Text = "X"
		end
	end
end)

EspTargetBox.FocusLost:Connect(function()
	if string.len(EspTargetBox.Text) > 0 then
		EspTarget = searchdata(string.upper(string.sub(tostring(EspTargetBox.Text),1,1)))
        if EspTarget then
            Esp(EspTarget)
		end
	end
end)

DeepInfoTargetBox.FocusLost:Connect(function()
    if string.len(DeepInfoTargetBox.Text) > 0 then
        DeepInfoTarget = searchdata(string.upper(string.sub(tostring(DeepInfoTargetBox.Text),1,1)))
        if DeepInfoTarget then
            DeepInfoFunction(DeepInfoTarget)
            BackFrameMoreInfoFrameEsp.Visible = true
            DeepInfoButton.Text = "X"
        end
    end
end)

HealthBarColorBox.FocusLost:Connect(function()
	if string.len(HealthBarColorBox.Text) > 0 then
		UiColors['HealthColor'] = string.upper(string.sub(tostring(HealthBarColorBox.Text),1,6))
		LocalPlayer.PlayerGui.MainScreenGui.Bar.HP.bar.BackgroundColor3 = Color3.fromRGB(UiColors['HealthColor'])
	end
end)

ChatMessageBox.FocusLost:Connect(function()
	if string.len(ChatMessageBox.Text) > 0 then
		ChatT['T'] = string.upper(string.sub(tostring(ChatMessageBox.Text),1,60))
		savechat()
	end
end)

local Sound = Instance.new'Sound'
Sound.Parent = Work
Sound.SoundId = UserJoins
Sound.Playing = true
