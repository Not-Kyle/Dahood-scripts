local coryuLocalPlayer = game:GetService('Players').LocalPlayer
local coryuRunService = game:GetService('RunService')
local coryuColor = Color3.fromRGB(255,0,0)

coryuRunService.Stepped:Connect(function()
	coryuLocalPlayer.PlayerGui.MainScreenGui.Bar.HP.bar.BackgroundColor3 = coryuColor
end)
