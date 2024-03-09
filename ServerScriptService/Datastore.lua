local drive = game.ReplicatedStorage["Drive1"]
local DSS = game:GetService("DataStoreService")
local DS = DSS:GetDataStore("meow")
local defaultval = {
	["deskenv"] = "default"
} 

game.ReplicatedStorage.savetods.OnServerEvent:Connect(function(player, arg1, arg2)
	local cur = DS:GetAsync(player.UserId) or defaultval
	cur[arg1] = arg2 
	DS:SetAsync(player.UserId, cur)
end)

game.ReplicatedStorage.getfromds.OnServerInvoke = function(player, arg1, arg2)
	local cur = DS:GetAsync(player.UserId) or {
		[arg1] = "nil"
	}
	if arg2 == false then 
		return cur[arg1]  
	else 
		return cur
	end
end

game.ReplicatedStorage.error.OnServerEvent:Connect(function(player, err, timestamp)
	local cDS = DSS:GetDataStore("errors")
	local cur = cDS:GetAsync(1) or {}
	cur[player.UserId] = err
	cDS:SetAsync(1, cur)
	print(cDS:GetAsync(1))
end)

game.Players.PlayerAdded:Connect(function(player) 
	print("In: " .. player.Name)
	local data = DS:GetAsync(player.UserId) or defaultval
	if drive.dev_env:FindFirstChild(data["deskenv"]) then 
		drive.dev_env.current.Value = data["deskenv"]
	else 
		drive.dev_env.current.Value = "default"
	end
end)
