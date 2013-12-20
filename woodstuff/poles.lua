-----------------------------------------------------------------------------------------------
-- Wood Stuff - Poles 0.0.1
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Looked at code from:		default, mobf, throwing
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- POLE
-----------------------------------------------------------------------------------------------
minetest.register_node("woodstuff:pole", {
	description = "Pole",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"woodstuff_pole_top.png",
		"woodstuff_pole_top.png",
		"woodstuff_pole.png"
	},
	node_box = {
		type = "fixed",
		fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

-----------------------------------------------------------------------------------------------
-- WATER POLE
-----------------------------------------------------------------------------------------------
minetest.register_node("woodstuff:water_pole", {
	description = "Water Pole",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"woodstuff_pole_top.png",
		"woodstuff_pole_top.png",
		"woodstuff_pole.png"
	},
	node_box = {
		type = "fixed",
		fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
	},
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	sounds = default.node_sound_wood_defaults(),
	on_place = function (itemstack, placer, pointed_thing)
		minetest.add_entity(pointed_thing.above, "woodstuff:pole_entity")
		if string.find(minetest.env:get_node(pointed_thing.under).name, "woodstuff:water_pole") then
			minetest.remove_node(pointed_thing.under, {name="woodstuff:water_pole"})
		end
		if not minetest.setting_getbool("creative_mode") then
			itemstack:take_item()
		end
		return itemstack
	end,
})

-----------------------------------------------------------------------------------------------
-- WATER POLE ENTITY
-----------------------------------------------------------------------------------------------
minetest.register_entity("woodstuff:pole_entity",{
	physical = true,
	hp_max = 8,
	visual = "wielditem",
	visual_size = {x=2/3, y=2/3, z=2/3},
	textures = {"woodstuff:water_pole"},
	collisionbox = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	on_punch = function(self, puncher)
		self.object:set_hp(self.object:get_hp()-1)
		minetest.sound_play("default_dig_oddly_breakable_by_hand", {
			pos = self.object:getpos(),
			gain = 0.4,
		})
		if self.object:get_hp() == 0 then
			if puncher:is_player() and puncher:get_inventory() then
				if not minetest.setting_getbool("creative_mode") then
					puncher:get_inventory():add_item("main", "woodstuff:water_pole")
				end
				self.object:remove()
			end
		end
	end,
})

-----------------------------------------------------------------------------------------------
-- CRAFTING
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = "woodstuff:pole 12",
	recipe = {
		{'default:tree'},
		{'default:tree'},
		{'default:tree'},
	}
})

minetest.register_craft({
	output = "woodstuff:water_pole",
	recipe = {
		{"woodstuff:pole"},
	}
})

minetest.register_craft({
	output = "woodstuff:pole",
	recipe = {
		{"woodstuff:water_pole"},
	}
})