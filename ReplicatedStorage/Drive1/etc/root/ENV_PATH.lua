
local drive = game.ReplicatedStorage["Drive01"]
local parser = require(game.ReplicatedStorage["Drive01"].kernel.software.parser)
cmds = { 
	["help"] = {
		function(args)
			local a = "\n"
			local i = 0

			for v in pairs (cmds) do 
				i += 1
				a ..= i .. ". " .. v .. "\n"
			end
			return a -- .. "\n1. s_version\n2. restart\n3. gmemory\n4. neofetch\n5. setdeskenv\n6. ping\n7. thrwerr\n8. logout" .. 
			--"\n9. savestorage\n10. getstorage\n11. run\n12. run_os\n13. nope\n14. fthrwerr\n15. print\n16. getallstorage" .. 
			--"\n17. system [help-system for more]\n18. add_os\n19. rm_os"
		end,
		["default"] = "Commands:",
		args = {
			function(str) return str end,
			function(str) return str end,
			function(str) return str end
		},
	},
	["restart"] = {
		function(args) 
			args[1] = args[1] or 0.3
			coroutine.wrap(function()
				wait(tonumber(args[1]))
				local devenv = drive.dev_env[drive.dev_env.current.Value]
				for _, v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do 
					if v:IsA("ScreenGui") then 
						if v:FindFirstChild("dev_env") then 
							v.Parent = drive.dev_env[v.dev_env.Value].UI
						else 
							v.Parent = devenv.UI
						end
					end
				end
				game.ReplicatedStorage["BIOS"].Parent = game.Players.LocalPlayer.PlayerGui
			end)()
			return args[1] .. " seconds"
		end,
		["default"] = "Restarting in:",
		args = {
			function(str) return string.split(str, " ")[2] end,
			function(str) return str end,
			function(str) return str end
		},
	},
	["logout"] = {
		function(args) 
			args[1] = args[1] or 0
			coroutine.wrap(function()
				wait(tonumber(args[1]))
				local plrgui = game.Players.LocalPlayer.PlayerGui
				if not plrgui:FindFirstChild("Main") then 
					return "FAILED: Currently not signed into a desktop environment, could not log out" 
				end

				local devenv = game.ReplicatedStorage["Drive01"].dev_env[plrgui.Main.dev_env.Value]
				if not devenv.UI:FindFirstChild("LOG_IN") then 
					return "FAILED: You are not currently logged into a desktop environment that supports this feature"
				end

				plrgui.Main.Parent = devenv.UI 
				devenv.UI.LOG_IN.Parent = plrgui
			end)()
			return args[1] .. "seconds"
		end,
		["default"] = "Logging out in:",
		args = {
			function(str) return string.split(str, " ")[2] end,
			function(str) return str end,
			function(str) return str end
		},
	},
	["run_os"] = {
		function(args) 
			local kernel_location = drive.kernel.software.script
			local out = ""
			local interpreter = require(kernel_location.interpreter)
			local src

			if kernel_location.builtin:FindFirstChild(args[1]) then
				src = kernel_location.builtin:FindFirstChild(args[1]).Value 
			else 
				src = "nope; fthrwerr 'Failed (script not found)';"
			end

			local output = interpreter(src)

			for _, v in ipairs(output) do 
				out ..= "\n" .. v
			end
			return out 
		end,
		["default"] = "Running built-in script (please note this feature is new and may be buggy):",
		args = {
			function(str) return string.split(str, " ")[2] end, 
			function(str) return str end,
			function(str) return str end
		},		
	},
	["getallstorage"] = {
		function(args) 
			local out = "\n{"
			local output = game.ReplicatedStorage.getfromds:InvokeServer("", true)
			print(output)

			for i, v in pairs(output) do 
				out ..= "\n\t'" .. i .. "': " .. v .. ","
			end
			out ..="\n}</font>"
			return out 
		end,
		["default"] = 'All storage:<font face="Roboto">',
		args = {
			function(str) return string.split(str, " ")[2] end, 
			function(str) return str end,
			function(str) return str end
		},		
	},
	["add_os"] = {
		function (args) 
			local OS = game.ReplicatedStorage.rq:InvokeServer(args[1]) 
			return "Added: " .. OS.info.osname.Value
		end,
		["default"] = "",
		args = {
			function(str) return string.split(str, " ")[2] end, 
			function(str) return str end,
			function(str) return str end
		},		
	},
	["rm_os"] = {
		function (args) 
			game.ReplicatedStorage[args[1]]:Destroy() 
			return "Destroyed"
		end,
		["default"] = "Status",
		args = {
			function(str) return string.split(str, " ")[2] end, 
			function(str) return str end,
			function(str) return str end
		},	
	},
	["new_user"] = {
		function (args) 
			print(args)
			local user = drive.user.admin:Clone()
			user.Name = args[1] 
			user.info.password.Value = args[2]
			user.Parent = drive.user
			return "Created [" .. args[1] .. ", " .. args[2] .. "]"
		end,
		["default"] = "Status",
		args = {
			function(str) return string.split(str, " ")[2] end, 
			function(str) return string.split(str, " ")[3] end,
			function(str) return str end
		},	
	},
	["setdeskenv"] = {
		function(args) 
			drive.dev_env.current.Value = args[1]
			return args[1]
		end,
		["default"] = "Desktop environment set to:",
		args = {
			function(str) return string.split(str, " ")[2] end, 
			function(str) return str end,
			function(str) return str end
		},
	},
	["setdeskenv-Sword"] = { -- purely for backwards compat
		function(args) 
			drive.dev_env.current.Value = "Sword"
			return "Sword"
		end,
		["default"] = "Desktop environment set to:",
		args = {
			function(str) return str end, 
			function(str) return str end,
			function(str) return str end
		},
	},
	["savestorage"] = {
		function(args) 
			game.ReplicatedStorage.savetods:FireServer(args[1], args[2])
			print("SAVED: "  .. args[2] .. " to: " .. args[1])
			return args[2] .. " to: " .. args[1]
		end,
		["default"] = "Saving:",
		args = {
			function(str) return string.split(str, " ")[2] end, 
			function(str) return parser.find_in_bounds(str, "'") end,
			function(str) return str end
		},
	},
	["getstorage"] = {
		function(args) 
			return game.ReplicatedStorage.getfromds:InvokeServer(args[1], false)
		end,
		["default"] = "Retrieved:",
		args = {
			function(str) return string.split(str, " ")[2] end, 
			function(str) return str end,
			function(str) return str end
		},
	},	
	["test"] = {
		function(args) 
			return "passed"
		end,
		["default"] = "Status:",
		args = {
			function(str) return str end, 
			function(str) return str end,
			function(str) return str end
		},
	}
}
return cmds
