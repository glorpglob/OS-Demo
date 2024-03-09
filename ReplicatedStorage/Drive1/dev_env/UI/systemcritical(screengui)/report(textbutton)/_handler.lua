script.Parent.MouseButton1Click:Connect(function() 
	script.Parent.Visible = false
	game.ReplicatedStorage.error:FireServer(script.Parent.Parent.err.Text, DateTime.now().UnixTimestampMillis)
end)
