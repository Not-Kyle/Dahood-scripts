local localPlayer = game:GetService('Players').LocalPlayer;
local localCharacter = localPlayer.Character;
local Character:FindFirstChildOfClass('Humanoid').Health = 0;
local newCharacter = localPlayer.CharacterAdded:Wait();
local spoofFolder = Instance.new('Folder');
spoofFolder.Name = 'FULLY_LOADED_CHAR';
spoofFolder.Parent = newCharacter;
newCharacter:WaitForChild('RagdollConstraints'):Destroy();
local spoofValue = Instance.new('BoolValue', newCharacter);
spoofValue.Name = 'RagdollConstraints';
local name = game.Players.LocalPlayer.Name
local lol =    game.Workspace:WaitForChild(name)
local money = Instance.new("Folder",game.Players.LocalPlayer.Character);money.Name = "FULLY_LOADED_CHAR"
lol.Parent = game.Workspace.Players
game.Players.LocalPlayer.Character:WaitForChild("BodyEffects")
game.Players.LocalPlayer.Character.BodyEffects.BreakingParts:Destroy()
