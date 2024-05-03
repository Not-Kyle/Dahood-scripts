local mt = getrawmetatable(game)
setreadonly(mt, false)
local oldmt = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
	local method = getnamecallmethod()
	if method == "IsInGroup" then
		return true
	end
	return oldmt(self, ...)
end)
setreadonly(mt, true)
