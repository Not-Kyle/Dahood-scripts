loadstring(game:HttpGet("https://pastebin.com/raw/VrwjH9Pq", true))()


getgenv().Aiming.FOV = 14.3
getgenv().Aiming.FOVSides = 360
getgenv().Aiming.HitChance = 100
getgenv().Aiming.ShowFOV = false
DahoodSettings.Prediction = 0.138

getgenv().Aiming.UseMoreHitparts = true
getgenv().Aiming.UseNearestCursor = true
getgenv().Aiming.AutoPrediction = true
getgenv().Aiming.KnockedCheck = true
getgenv().Aiming.GrabbedCheck = true
getgenv().Aiming.Wallcheck = true


local keybindwuuwuwufw= "p" -- toggle key --// You can tell some retard put this here
local mouse = game.Players.LocalPlayer:GetMouse()
  mouse.KeyDown:Connect(function(value)
    if value == keybindwuuwuwufwthen
      if DaHoodSettings.SilentAim == true then
      DaHoodSettings.SilentAim = false
      else
      DaHoodSettings.SilentAim = true
      end
    end
end)
