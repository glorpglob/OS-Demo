-- applications/Handler:
return { 
	prompt = function(appname: string) 
		script.Parent[appname].Visible = not script.Parent[appname].Visible 
	end,
	kill = function(appname: string) 
		
	end,
}

-- applications/cmd/version  
-- 0.1.5

-- ../minimize_close/Frame/_Handler
script.Parent.Close.MouseButton1Click:Connect(function()
	require(script.Parent.Parent.Parent.Parent.Parent.applications.Handler).prompt(script.Parent.Parent.Parent.Name)
end)

-- ../application_name/Movement
local UserInputService = game:GetService("UserInputService")
local ON = true
local db = true
local ENV = require(game.ReplicatedStorage.Drive1.etc.applications.UIENV)["Movement"]

script.Parent.MouseEnter:Connect(function()
	ON = true
	script.Parent.MouseButton1Down:Connect(function()
		if db == true then 
			db = false
			coroutine.wrap(function()
				local screenres = workspace.CurrentCamera.ViewportSize
				while true do wait()
					if ON == false then db = true break end
					local Vector = game:GetService("UserInputService"):GetMouseLocation()
					script.Parent.Parent.Parent.Position = ENV.default(Vector, screenres)
					db = true
				end
			end)()	
		end
	end)

	script.Parent.MouseLeave:Connect(function()
		ON = false
	end)

	script.Parent.MouseButton1Click:Connect(function() 
		if ON == true then
			ON = false
		end
	end)
end)

-- .../TextBox/cmd_handle
local interpreter = require(game.ReplicatedStorage.Drive1.kernel.software.command.interpreter)
local parser = require(game.ReplicatedStorage.Drive1.kernel.software.parser)

script.Parent.FocusLost:Connect(function(enterPressed, key) 
	if enterPressed == true then 
		local out = parser.array_as_string(interpreter(script.Parent.Text))

		script.Parent.Parent.history.TextLabel.Text ..= " \n" .. out .. "\n"
		script.Parent.Text = ""
	end
end)

-- 
--
-- PLEASE NOTE: 
-- I will upload the rest later (hopefully, if I remember, try submitting an issue if you n eed it).
-- 
-- 
