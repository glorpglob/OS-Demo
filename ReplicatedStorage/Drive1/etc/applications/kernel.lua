local disk = script.Parent.Parent.Parent

return {
	["getversion"] = function() 
		return disk.kernel.kernelversion.Value
	end,
	["parser"] = { -- adapted from sword admin commands by me :)
		find_in_bounds = function(str, match)
			if string.find(str, match) == nil then return str end
			local _str = str:sub(string.find(str, match) + match:len(), str:len())
			local _str = _str:sub(1, string.find(_str, match) - match:len())
			return _str
		end,

		get_command = function(str)
			return string.split(str, " ")[1]:sub(1, str:len()) or str:sub(1, str:len())
		end,

		get_time_period = {
			periods = {
				["m"] = {"month" , 2628288},
				["d"] = {"day", 86400},
				["h"] = {"hour", 3600},
				["s"] = {"second", 2}
			},
			parse = function(str)

			end,
		}
	}
}
