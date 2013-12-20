-----------------------------------------------------------------------------------------------
local title		= "Wood Stuff"
local version 	= "0.0.4"
local mname		= "woodstuff"
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		trees
-- Looked at code from:		default, stoneage
-- Dependencies: 			default
-----------------------------------------------------------------------------------------------

dofile(minetest.get_modpath("woodstuff").."/settings.txt")
dofile(minetest.get_modpath("woodstuff").."/crafting.lua")
dofile(minetest.get_modpath("woodstuff").."/poles.lua")
dofile(minetest.get_modpath("woodstuff").."/twigs.lua")

minetest.register_craft({
	output = 'default:stick 6',
	recipe = {
		{'group:leafdecay'},
		{'group:leafdecay'},
		{'group:leafdecay'},
	}
})

if PLANKS_NOW_LOGS == true then
minetest.register_node(":default:junglewood", {
	description = "Junglewood Logs",
	tiles = {"default_junglewood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node(":default:wood", {
	description = "Wooden Logs",
	tiles = {"default_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=3,wood=1},
	sounds = default.node_sound_wood_defaults(),
})
end


-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------