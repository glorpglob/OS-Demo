local drive = game.ReplicatedStorage["Drive01"]
local dev_env = drive.dev_env.Sword

script.Parent.moveon.MouseButton1Click:Connect(function()
	local username = script.Parent.usrprompt.Text
	
	if script.Parent.passprompt.Text == drive.user[username].info.password.Value then 
		if drive.user.environment.Value ~= username then 
			local apps = game.ReplicatedStorage.applications_backup:Clone()
			dev_env.UI.Main.applications:Destroy()
			apps.Name = "applications"
			apps.Parent = dev_env.UI.Main
		end
		
		drive.user.environment.Value = username
		dev_env.UI.Main.curuser.Value = username
		dev_env.UI.Main.Parent = game.Players.LocalPlayer.PlayerGui
		script.Parent.Parent.Parent = dev_env.UI 
	end
end)
