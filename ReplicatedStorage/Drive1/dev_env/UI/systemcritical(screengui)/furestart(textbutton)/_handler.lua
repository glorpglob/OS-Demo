script.Parent.MouseButton1Click:Connect(function() 
	local drive = game.ReplicatedStorage["Drive1"]
	local cmds = require(drive.etc.user.ENV_PATH)
	
	cmds["system"][1]({"restart"})
end)
