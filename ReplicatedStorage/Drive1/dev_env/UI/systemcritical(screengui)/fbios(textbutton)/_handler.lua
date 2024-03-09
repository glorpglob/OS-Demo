script.Parent.MouseButton1Click:Connect(function() 
	local plrgui = game.Players.LocalPlayer.PlayerGui
	local devenv =  game.ReplicatedStorage["Drive1"].dev_env
	plrgui.systemcritical.Parent = devenv[devenv.current.Value].UI
	game.ReplicatedStorage.BIOS.Parent = plrgui
end)
