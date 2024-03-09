local drive = game.ReplicatedStorage["Drive1"]
local dev_env = drive.dev_env.Sword

script.Parent.intro.Text = "welcome, " .. drive.user.environment.Value

script.Parent.moveon.MouseButton1Click:Connect(function()
	if script.Parent.passprompt.Text == drive.user.admin.info.password.Value then 
		dev_env.UI.Main.curuser.Value = "admin"
		dev_env.UI.Main.Parent = game.Players.LocalPlayer.PlayerGui
		script.Parent.Parent.Parent = dev_env.UI 
	end
end)
