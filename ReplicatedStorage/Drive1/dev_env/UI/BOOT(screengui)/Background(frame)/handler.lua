local ContentProvider = game:GetService("ContentProvider")
local disk = game.ReplicatedStorage["Drive1"]
local status = script.Parent.info.status

for i, v in pairs(disk:GetDescendants()) do
	local percent = math.round((i / #disk:GetDescendants()) * 100) 
	pcall(function()		
		script.Parent.Parent.Frame.Frame.Size = UDim2.new(percent / 100 - 0.015, 0, 0.7, 0)
		ContentProvider:PreloadAsync({v})
		status.Text  = "Preloading files (" .. percent .. "%)\nCurrent file: " .. v.Name 
	end)
end
task.wait(.1)
status.Text = "Loaded successfully!"
task.wait(.5)
status.Text = "Booting now..."
disk.dev_env.Sword.UI.LOG_IN.Parent = game.Players.LocalPlayer.PlayerGui
script.Parent.Parent.Parent = disk.dev_env.Sword.UI
