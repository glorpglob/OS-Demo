neofetch = [[<font size="6">
                                                                                       
                                                                  *#%%                 
                                                               ****#%                  
                                                             *#**#%%                   
                                                           *****%%                     
                                                         ****#%%%                      
                                                       ****##%%                        
                                                     **#*##%%                          
                                                   #*####%%                            
                                                 #*####%%                              
                                                *#**#%%                                
                                              *#**#%%                                  
                                            **#*#%%                                    
                                          **#*#%%                                      
                                        #***#%%                                        
                             ++       ##**#%%                                          
                             #**    %#***#%                                            
                             #**+ %#***#%%                                             
                              ++++***###                                               
                               #%*=+++=                                                
                             +**%%%*--=*+==++                                          
                           **###%                                                      
                         %##%#%                                                        
                       =+*#%%                                                          
                     %*==+**                                                           
                     %#%%#</font>]]

local drive = game.ReplicatedStorage["Drive01"]
local parser = require(game.ReplicatedStorage["Drive01"].kernel.software.parser)

cmds = {
	["s_version"] = {
		function(args) 
			return "\nDesktop environment version: " .. drive.dev_env.Sword.declaratives.version.Value ..
				"\nKernel version: " .. drive.kernel.kernelversion.Value
		end,
		["default"] = "Sword Version details:",
		args = {
			function(str) return str end,
			function(str) return str end,
			function(str) return str end
		},
	},
	["slang_version"] = {
		function(args) 
			return tostring(drive.kernel.software.swordlang.declaratives.version.Value)
		end,
		["default"] = "SwordLang Version:",
		args = {
			function(str) return str end,
			function(str) return str end,
			function(str) return str end
		},
	},
	["nope"] = {
		function(args) 
			return args[1]
		end,
		["default"] = "Failed to execute:",
		args = {
			function(str) return str end,
			function(str) return str end,
			function(str) return str end
		},
	},
	["help"] = {
		function(args)
			local a = "\n"
			local i = 0
			
			for v in pairs (cmds) do 
				i += 1
				a ..= i .. ". " .. v .. "\n"
			end
			return a .. "\nRun sudo `help` for more." -- .. "\n1. s_version\n2. restart\n3. gmemory\n4. neofetch\n5. setdeskenv\n6. ping\n7. thrwerr\n8. logout" .. 
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
	["help-system"] = {
		function(args)
			return "\n1. restart"
		end,
		["default"] = "Always excercise caution when using these commands as they may be destructive.\nCommands:",
		args = {
			function(str) return str end,
			function(str) return str end,
			function(str) return str end
		},
	},
	["gmemory"] = {
		function(args) 
			return  math.round(game:GetService("Stats"):GetTotalMemoryUsageMb()) / 1000 .. 
				"GB (by you: " .. math.round(game:GetService("Stats"):GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.Script) 
					+ game:GetService("Stats"):GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.Gui)) / 1000 .. "GB)"
		end,
		["default"] = "Memory usage:",
		args = {
			function(str) return str end,
			function(str) return str end,
			function(str) return str end
		},
	},
	["neofetch"] = {
		function(args) 
			return  "\nMemory usage: " .. math.round(game:GetService("Stats"):GetTotalMemoryUsageMb()) / 1000 .. 
				"GB (by you: " .. math.round(game:GetService("Stats"):GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.Script) 
					+ game:GetService("Stats"):GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.Gui)) / 1000 .. "GB)\n".. "Desktop Environment: " .. game.ReplicatedStorage["Drive01"].dev_env.current.Value
				.. "\nDesktop environment version: " .. drive.dev_env.Sword.declaratives.version.Value ..
				"\nKernel version: " .. drive.kernel.kernelversion.Value .. "\nCurrent user: " .. drive.user.environment.Value .. neofetch
		end,
		["default"] = "",
		args = {
			function(str) return str end, 
			function(str) return str end,
			function(str) return str end
		},
	},
	["ping"] = {
		function(args) 
			print("pong")
			return "Heard at: " .. os.date("%X" .. " " .. os.date("%x"))
		end,
		["default"] = "Pong:",
		args = {
			function(str) return str end, 
			function(str) return str end,
			function(str) return str end
		},
	},
	["thrwerr"] = {
		function(args) 
			error(args[1])
			return args[1]
		end,
		["default"] = "Error thrown:",
		args = {
			function(str) return string.split(str, " ")[2] end, 
			function(str) return str end,
			function(str) return str end
		},
	},
	["run"] = {
		function(args) 
			local out = ""
			local interpreter = require(drive.kernel.software.script.interpreter)
			local src = cmds["getstorage"][1]({args[1]})
			local output = interpreter(src)

			for _, v in ipairs(output) do 
				out ..= "\n" .. v
			end
			return out 
		end,
		["default"] = "Running script (please note this feature is new and may be buggy):",
		args = {
			function(str) return string.split(str, " ")[2] end, 
			function(str) return str end,
			function(str) return str end
		},		
	},
	["print"] = {
		function(args) 
			print(args[1])
			return args[1]
		end,
		["default"] = "Output:",
		args = {
			function(str) return string.split(str, " ")[2] end, 
			function(str) return str end,
			function(str) return str end
		},		
	},
	["fthrwerr"] = {
		function(args) 
			return '<font color="rgb(255,0,0)">' .. args[1] .. "</font>"
		end,
		["default"] = "Error:",
		args = {
			function(str) return parser.find_in_bounds(str, "'") end, 
			function(str) return str end,
			function(str) return str end
		},		
	},
	["system"] = {
		function(args) 
			local commands = { 
				["restart"] = function()
					local Player = game.Players.LocalPlayer
					local NewDrive = Player.Backpack.Drive01:Clone()
					local NewBIOS = Player.Backpack.BIOS:Clone()

					for _, v in pairs(Player.PlayerGui:GetChildren()) do
						v:Destroy()
					end
					for _, v in pairs(game.ReplicatedStorage:GetChildren()) do
						if v.Name == "BIOS" then 
							v:Destroy()
						end 
					end

					NewBIOS.Parent = Player.PlayerGui 
					NewDrive.Parent = game.ReplicatedStorage
					game.ReplicatedStorage.Drive01:Destroy()
				end,
			}

			return commands[args[1]]() or "Invalid input"
		end,
		["default"] = "Running relevant system command:\n",
		args = {
			function(str) return parser.find_in_bounds(str, "'") end, 
			function(str) return str end, 
			function(str) return str end 
		}
	},
	--[[ ["sudo"] = {
		function(args) 
			local commands = require(drive.etc.root.ENV_PATH)

			return commands[ args[1] ]() or "Invalid input"
		end,
		["default"] = "Running relevant system command:\n",
		args = {
			function(str) return parser.find_in_bounds(str, "'") end, 
			function(str) return str end, 
			function(str) return str end 
		}
    }]]

	
}

return cmds
