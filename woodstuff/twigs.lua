-----------------------------------------------------------------------------------------------
-- Wood Stuff - Twigs 0.0.4
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Looked at code from:		default, darkage, stairs, stoneage
-- Dependencies: 			default
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- TWIGS
-----------------------------------------------------------------------------------------------
minetest.register_node("woodstuff:twigs", {
	description = "Twigs",
	paramtype2 = "facedir",
	tiles = {"woodstuff_twigs.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

-----------------------------------------------------------------------------------------------
-- TWIGS SLAB
-----------------------------------------------------------------------------------------------
minetest.register_node("woodstuff:twigs_slab", {
	description = "Twigs Slab",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"woodstuff_twigs.png"},
	node_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, 0, 1/2},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/2, -1/2, -1/2, 1/2, 0, 1/2},
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

-----------------------------------------------------------------------------------------------
-- TWIGS ROOF
-----------------------------------------------------------------------------------------------
minetest.register_node("woodstuff:twigs_roof", {
	description = "Twigs Roof",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"woodstuff_twigs.png"},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, -1/2, -1/2, 1/2, 0, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, -1/2, -1/2, 1/2, 0, 0},
		}
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

-----------------------------------------------------------------------------------------------
-- TWIGS ROOF CORNER
-----------------------------------------------------------------------------------------------
minetest.register_node("woodstuff:twigs_roof_corner", {
	description = "Twigs Roof Corner",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"woodstuff_twigs_corner.png",
		"woodstuff_twigs_corner.png",
		"woodstuff_twigs.png"
	},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, 0, 0, 0, 1/2, 1/2},
			{0, -1/2, 0, 1/2, 0, 1/2},
			{-1/2, -1/2, -1/2, 0, 0, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, 0, 0, 0, 1/2, 1/2},
			{0, -1/2, 0, 1/2, 0, 1/2},
			{-1/2, -1/2, -1/2, 0, 0, 0},
		}
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

-----------------------------------------------------------------------------------------------
-- TWIGS ROOF CORNER 2
-----------------------------------------------------------------------------------------------
minetest.register_node("woodstuff:twigs_roof_corner_2", {
	description = "Twigs Roof Corner 2",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"woodstuff_twigs_corner.png",
		"woodstuff_twigs_corner.png",
		"woodstuff_twigs.png"
	},
	node_box = {
		type = "fixed",
--				{ left	, bottom , front  ,  right ,  top   ,  back  }
		fixed = {
			{-1/2, -1/2, 0, 0, 0, 1/2},
			{0, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, 0, -1/2, 0, 1/2, 0},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1/2, -1/2, 0, 0, 0, 1/2},
			{0, 0, 0, 1/2, 1/2, 1/2},
			{-1/2, 0, -1/2, 0, 1/2, 0},
		}
	},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

if AUTO_ROOF_CORNER == true then

	local roof = "woodstuff:twigs_roof"
	local corner = "woodstuff:twigs_roof_corner"
	local corner_2 = "woodstuff:twigs_roof_corner_2"

	minetest.register_abm({
		nodenames = {roof},
		interval = 1,
		chance = 1,
		action = function(pos)
	
			local node_east = 			minetest.env:get_node({x=pos.x+1, y=pos.y, z=pos.z  })
			local node_west = 			minetest.env:get_node({x=pos.x-1, y=pos.y, z=pos.z  })
			local node_north = 			minetest.env:get_node({x=pos.x,   y=pos.y, z=pos.z+1})
			local node_south = 			minetest.env:get_node({x=pos.x,   y=pos.y, z=pos.z-1})
		-- corner 1
			if ((node_west.name == roof and node_west.param2 == 0)
			or (node_west.name == corner and node_west.param2 == 1))
			and ((node_north.name == roof and node_north.param2 == 3)
			or (node_north.name == corner and node_north.param2 == 3))
			then
				minetest.env:add_node(pos, {name=corner, param2=0})
			end
		
			if ((node_north.name == roof and node_north.param2 == 1)
			or (node_north.name == corner and node_north.param2 == 2))
			and ((node_east.name == roof and node_east.param2 == 0)
			or (node_east.name == corner and node_east.param2 == 0))
			then
				minetest.env:add_node(pos, {name=corner, param2=1})
			end
		
			if ((node_east.name == roof and node_east.param2 == 2)
			or (node_east.name == corner and node_east.param2 == 3))
			and ((node_south.name == roof and node_south.param2 == 1)
			or (node_south.name == corner and node_south.param2 == 1))
			then
				minetest.env:add_node(pos, {name=corner, param2=2})
			end
		
			if ((node_south.name == roof and node_south.param2 == 3)
			or (node_south.name == corner and node_south.param2 == 0))
			and ((node_west.name == roof and node_west.param2 == 2)
			or (node_west.name == corner and node_west.param2 == 2))
			then
				minetest.env:add_node(pos, {name=corner, param2=3})
			end
		-- corner 2
			if ((node_west.name == roof and node_west.param2 == 2)
			or (node_west.name == corner_2 and node_west.param2 == 1))
			and ((node_north.name == roof and node_north.param2 == 1)
			or (node_north.name == corner_2 and node_north.param2 == 3))
			then
				minetest.env:add_node(pos, {name=corner_2, param2=0})
			end
		
			if ((node_north.name == roof and node_north.param2 == 3)
			or (node_north.name == corner_2 and node_north.param2 == 2))
			and ((node_east.name == roof and node_east.param2 == 2)
			or (node_east.name == corner_2 and node_east.param2 == 0))
			then
				minetest.env:add_node(pos, {name=corner_2, param2=1})
			end
		
			if ((node_east.name == roof and node_east.param2 == 0)
			or (node_east.name == corner_2 and node_east.param2 == 3))
			and ((node_south.name == roof and node_south.param2 == 3)
			or (node_south.name == corner_2 and node_south.param2 == 1))
			then
				minetest.env:add_node(pos, {name=corner_2, param2=2})
			end
		
			if ((node_south.name == roof and node_south.param2 == 1)
			or (node_south.name == corner_2 and node_south.param2 == 0))
			and ((node_west.name == roof and node_west.param2 == 0)
			or (node_west.name == corner_2 and node_west.param2 == 2))
			then
				minetest.env:add_node(pos, {name=corner_2, param2=3})
			end

		end,
	})
end