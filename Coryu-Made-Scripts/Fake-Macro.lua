--If Taken, Give Credits @hellokittysouljia or @killserver on discord or https://github.com/Not-Kyle
local Trace = setmetatable({}, {
    __index = function(self: Instance, ...)
        local Arguments = {...}
        rawget(self, Arguments)
        
        return game.GetService(game, Arguments[1]);
    end
})

local Players = Trace.Players;
local RunService = Trace.RunService;
local StarterGui = Trace.StarterGui;
local UserInputService = Trace.UserInputService;

local Speed = 4;

local Notifications = true -- Change to false if recording
local Sprint = true;
local Sprinting = false;

local Keybind = 'X'; -- Change Keybind here

local Host, Body, Root, Humanoid do
    Host = Players and Players.LocalPlayer;
    Body = Host and Host.Character or Host.CharacterAdded:Wait();
    Humanoid = Body and Body.WaitForChild(Body, 'Humanoid') or Body.FindFirstChildOfClass(Body, 'Humanoid');
    Root = Body and Body.WaitForChild(Body, 'HumanoidRootPart') or Humanoid.RootPart
end

function Notify(Title: string, Text: string, Icon: string, Duration: number)
    if Notifications then
        StarterGui:SetCore('SendNotification', {
            Title = Title;
            Text = Text;
            Icon = Icon;
            Duration = Duration;
        })
    end
end

function OnStepped(Delta: number)
    if Root and Sprint and Sprinting then
        Root.Velocity = Root.CFrame.LookVector * Speed * 25
    end
end

function OnInput(Arguments: EnumItem, OnChatted: string)
    if Arguments.KeyCode == Enum.KeyCode.LeftShift then
        Sprinting = true;
    end

    if OnChatted then
        return;
    end

    if Arguments.KeyCode == Enum.KeyCode[Keybind] then
        Sprint = not Sprint
        Notify('Sprint', 'Sprint is now '..tostring(Sprint))
    end

    if Arguments.KeyCode == Enum.KeyCode.K then
        Speed += 2
        Notify('Speed', 'Speed is now '..tostring(Sprint))
    end

    if Arguments.KeyCode == Enum.KeyCode.L then
        Speed -= 2
        Notify('Speed', 'Speed is now '..tostring(Sprint))
    end
end

function OnEnded(Arguments: EnumItem)
    if Arguments.KeyCode == Enum.KeyCode.LeftShift then
        Sprinting = false;
    end
end


function OnCharacterAdded(Character: Model)
    Body = Character or Host.Character;
    Humanoid = Body and Body.WaitForChild(Body, 'Humanoid') or Body.FindFirstChildOfClass(Body, 'Humanoid');
    Root = Body and Body.WaitForChild(Body, 'HumanoidRootPart') or Humanoid.RootPart
end

function ScriptCache()
    UserInputService.InputBegan:Connect(OnInput);
    UserInputService.InputEnded:Connect(OnEnded);

    RunService.Stepped:Connect(OnStepped);

    Host.CharacterAdded:Connect(OnCharacterAdded);
end
ScriptCache()
