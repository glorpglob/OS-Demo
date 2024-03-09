return { 
	["Movement"] = {
		default = function(Vector, screenres) 
			return UDim2.new(
				(Vector.X / screenres.X) / 1.3,
				0,
				(Vector.Y / screenres.Y) ,
				0
			)
		end
	}
}
