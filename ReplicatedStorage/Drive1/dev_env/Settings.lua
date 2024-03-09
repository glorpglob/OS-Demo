return { 
	["dm"] = { 
		["ON"] = function() 
			--incredibly basic
			for _, v in pairs(game.Players.LocalPlayer.PlayerGui.Main:GetDescendants()) do 
				if v:IsA("GuiBase") then 
					pcall(function()
						v.BackgroundColor3 = Color3.new(0,0,0)
						v.TextColor3 = Color3.new(255,255,255)
					end)
				end
			end	
		end,
		["OFF"] = function()
			for _, v in pairs(game.Players.LocalPlayer.PlayerGui.Main:GetDescendants()) do 
				if v:IsA("GuiBase") then 
					pcall(function()
						v.BackgroundColor3 = Color3.new(255,255,255)
						v.TextColor3 = Color3.new(0,0,0)
					end)
				end
			end	
		end
	}
}
