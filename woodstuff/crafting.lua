-----------------------------------------------------------------------------------------------
-- Wood Stuff - Crafting 0.0.1
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Looked at code from:		default, darkage, stairs, stoneage
-- Dependencies: 			default
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = 'woodstuff:twigs',
	recipe = {
		{'default:stick','default:stick'},
		{'default:stick','default:stick'},
	}
})

minetest.register_craft({
	output = 'default:stick 4',
	recipe = {
		{'woodstuff:twigs'},
	}
})

minetest.register_craft({
	output = 'woodstuff:twigs_slab 6',
	recipe = {
		{'woodstuff:twigs','woodstuff:twigs','woodstuff:twigs'},
	}
})

minetest.register_craft({
	output = 'default:stick 2',
	recipe = {
		{'woodstuff:twigs_slab'},
	}
})

minetest.register_craft({
	output = 'woodstuff:twigs_roof 4',
	recipe = {
		{'woodstuff:twigs',''},
		{'','woodstuff:twigs'},
	}
})

minetest.register_craft({
	output = 'woodstuff:twigs_roof 4',
	recipe = {
		{'','woodstuff:twigs'},
		{'woodstuff:twigs',''},
	}
})

minetest.register_craft({
	output = 'woodstuff:twigs_roof_corner 8',
	recipe = {
		{'','woodstuff:twigs',''},
		{'woodstuff:twigs','','woodstuff:twigs'},
	}
})

