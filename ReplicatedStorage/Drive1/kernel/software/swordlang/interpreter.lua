local Parser = require(script.Parent.parser)
local Router = require(script.Parent.router)


return function(src: string)
	local out = {}
	src = src:split(";")
	src[#src] = nil
	for i, v in pairs(src) do 
		src[i] = string.sub(src[i], string.find(src[i], "%w"), src[i]:len())
		
		local Command = Parser.get_command(src[i])
		local OutputString = string.sub(src[i], Command:len() + 1, src[i]:len())
		OutputString = OutputString:sub(OutputString:find("%w") - 1, OutputString:len())
		src[i] = {
			Command, 
			OutputString
		}
		
		local Location = Router[src[i][1]]
		out[i] = require(Location)[src[i][1]](src[i][2])
	end
	
	print(src, out)
	return out
end
