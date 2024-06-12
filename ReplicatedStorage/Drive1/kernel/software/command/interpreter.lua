
local drive = game.ReplicatedStorage["Drive01"]
local PATH = require(drive.etc.user.ENV_PATH)
local parser = require(drive.kernel.software.parser)

local function a(cmd)
	local out = {}
	for i, v in pairs(cmd:split("&&") or {cmd}) do 
		if i > 1 then 
			v = v:sub(v:find("%w"), v:len())
		end

		local Command = parser.get_command(v)
		if Command == "sudo" then 
			PATH = require(drive.etc.root.ENV_PATH)
			v = parser.find_in_bounds(v, "`")
			Command = parser.get_command(v)
		elseif drive.user.environment.Value == "root" then 
			PATH = require(drive.etc.root.ENV_PATH)
		else
			PATH = require(drive.etc.user.ENV_PATH)
		end

		if PATH[Command] then
			out[i] = PATH[Command]["default"] .. PATH[Command][1](
				{
					PATH[Command].args[1](v),
					PATH[Command].args[2](v),
					PATH[Command].args[3](v)
				}
			)
		else
			out[i] = "Command not found."
		end
	end
	
	return out
end 

return a
