-----------------------------------------------------------------------------------------------
local title		= "Hunter Tools"
local version 	= "0.0.3"
local mname		= "huntertools"
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		throwing
-- Looked at code from:		default
-- Dependencies: 			throwing
-- Supports:				animalmaterials, flint, stoneage
-----------------------------------------------------------------------------------------------
-- add obsidian shard?

-----------------------------------------------------------------------------------------------
-- Bow
-----------------------------------------------------------------------------------------------

minetest.register_craft({
	output = 'throwing:bow_wood',
	recipe = {
		{'farming:string', 'default:stick', ''},
		{'farming:string', '', 'default:stick'},
		{'farming:string', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'throwing:bow_wood',
	recipe = {
		{'', 'default:stick', 'farming:string'},
		{'default:stick', '', 'farming:string'},
		{'', 'default:stick', 'farming:string'},
	}
})

-----------------------------------------------------------------------------------------------
-- Arrow
-----------------------------------------------------------------------------------------------

-- default

minetest.register_craft({
	output = 'throwing:arrow 16',
	recipe = {
		{'group:stone', 'default:stick', 'default:stick'},
	}
})

-- stoneage

minetest.register_craft({
	output = 'throwing:arrow 16',
	recipe = {
		{'stoneage:silex', 'default:stick', 'default:stick'},
	}
})

-- flint

minetest.register_craft({
	output = 'throwing:arrow 16',
	recipe = {
		{'flint:flintstone', 'default:stick', 'default:stick'},
	}
})

-- with feathers

-- animalmaterials

minetest.register_craft({
	output = 'throwing:arrow 16',
	recipe = {
		{'', 'group:stone', ''},
		{'', 'default:stick', ''},
		{'', 'animalmaterials:feather', ''},
	}
})

minetest.register_craft({
	output = 'throwing:arrow 16',
	recipe = {
		{'group:stone', 'default:stick', 'animalmaterials:feather'},
	}
})

-- animalmaterials & stoneage

minetest.register_craft({
	output = 'throwing:arrow 16',
	recipe = {
		{'', 'stoneage:silex', ''},
		{'', 'default:stick', ''},
		{'', 'animalmaterials:feather', ''},
	}
})

minetest.register_craft({
	output = 'throwing:arrow 16',
	recipe = {
		{'stoneage:silex', 'default:stick', 'animalmaterials:feather'},
	}
})

-- animalmaterials & flint

minetest.register_craft({
	output = 'throwing:arrow 16',
	recipe = {
		{'', 'flint:flintstone', ''},
		{'', 'default:stick', ''},
		{'', 'animalmaterials:feather', ''},
	}
})

minetest.register_craft({
	output = 'throwing:arrow 16',
	recipe = {
		{'flint:flintstone', 'default:stick', 'animalmaterials:feather'},
	}
})

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------