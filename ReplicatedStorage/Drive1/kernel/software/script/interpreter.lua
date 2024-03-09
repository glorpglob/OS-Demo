local PATH = require(game.ReplicatedStorage["Drive1"].etc.user.ENV_PATH)
local cmd_int = require(script.Parent.Parent.command.interpreter)

return function(src: string)
	local out = {}
	src = src:split(";")
	src[#src] = nil
	for i, v in pairs(src) do 
		src[i] = string.sub(src[i], src[i]:find("%S") or 1, src[i]:len())
		out[i] = cmd_int(src[i])[1]	
	end
	return out
end
