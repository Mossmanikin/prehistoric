-----------------------------------------------------------------------------------------------
local title		= "Primitive Deco"
local version 	= "0.0.3"
local mname		= "primitivedeco"
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		sign
-- Looked at code from:		animalmaterials, dye
-- Dependencies: 			default, dye
-- Supports:				animalmaterials
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Fur Cover
-----------------------------------------------------------------------------------------------
if (minetest.get_modpath("animalmaterials")) ~= nil then
minetest.register_node("primitivedeco:fur", {
	description = "Fur Cover",
	inventory_image = "animalmaterials_fur.png",
	wield_image = "animalmaterials_fur.png",
	drawtype = "signlike",
	tiles = { "animalmaterials_fur.png" },
	paramtype = "light",
	paramtype2 = "wallmounted",
	--paramtype2 = "facedir",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
})
-- craft
minetest.register_craft({
	output = 'primitivedeco:fur',
	recipe = {
		{'animalmaterials:fur'},
	}
})
end

-----------------------------------------------------------------------------------------------
-- Wisent Painting
-----------------------------------------------------------------------------------------------
minetest.register_node("primitivedeco:wisent", {
	description = "Wisent Painting",
	inventory_image = "primitivedeco_wisent.png",
	wield_image = "dye_red.png",
	drawtype = "signlike",
	tiles = { "primitivedeco_wisent.png" },
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {choppy=2,dig_immediate=2,attached_node=1},
	legacy_wallmounted = true,
})
-- craft
minetest.register_craft({
	output = 'primitivedeco:wisent',
	recipe = {
		{'dye:black', '', 'dye:black'},
		{'dye:red', 'dye:red', 'dye:red'},
		{'', 'dye:red', ''},
	}
})

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------