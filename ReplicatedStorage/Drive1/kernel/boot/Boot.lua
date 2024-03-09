local disk = script.Parent.Parent.Parent

function boot(Player)
	local devenv = disk.dev_env[disk.dev_env.current.Value]
	Player.PlayerGui.BIOS.Parent = game.ReplicatedStorage
	for _, v in pairs(Player.PlayerGui:GetChildren()) do 
		if v:IsA("ScreenGui") then 
			if v:FindFirstChild("dev_env") then 
				v.Parent = disk.dev_env[v.dev_env.Value].UI
			else 
				v.Parent = devenv.UI
			end
		end
	end
	devenv.UI.BOOT.Background.handler.Enabled = true
	devenv.UI.BOOT.Parent = Player.PlayerGui
end
return {boot, "sword-k" .. disk.kernel.kernelversion.Value .. "-d" .. disk.dev_env.Sword.declaratives.version.Value}
