Spinspeed = 100

local Spin = Instance.new'BodyAngularVelocity'
Spin.Parent = game:GetService'Players'.LocalPlayer.Character:FindFirstChild'HumanoidRootPart'
Spin.MaxTorque = Vector3.new(0, math.huge, 0)
Spin.AngularVelocity = Vector3.new(0,Spinspeed,0)
