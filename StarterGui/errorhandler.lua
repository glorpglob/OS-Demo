game:GetService("LogService").MessageOut:Connect(function(msg, msgtype)
	if msgtype == Enum.MessageType.MessageError then 
		local drive = game.ReplicatedStorage["Drive1"]
		local devenv = drive.dev_env[drive.dev_env.current.Value]
		local plrgui = game.Players.LocalPlayer.PlayerGui
			
		for _, v in pairs (plrgui:GetChildren()) do
			v.Parent = devenv.UI	
			if v.Name == "BIOS" then 
				v.Parent = game.ReplicatedStorage
			end
		end
		devenv.UI.systemcritical.Parent = plrgui
		plrgui.systemcritical.Background.err.Text = "Reporting will hand over the following information to developers:\n\t" ..
			"Error:" .. msg .. "\nTimestamp: " .. tostring(DateTime.now().UnixTimestampMillis) .. "\n\n<b>Forcing BIOS will only soft restart your OS, if you still encounter issues, run `system 'restart'` in a terminal program.</b>"
	end
end)
