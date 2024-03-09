local PATH = require(game.ReplicatedStorage["Drive1"].etc.user.ENV_PATH)
local parser = require(game.ReplicatedStorage["Drive1"].kernel.software.parser)

return function(cmd)
	local out = {}
	for i, v in pairs(cmd:split("&&") or {cmd}) do 
		if i > 1 then 
			v = v:sub(v:find("%w"), v:len())
		end
		
		local Command = parser.get_command(v)

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
