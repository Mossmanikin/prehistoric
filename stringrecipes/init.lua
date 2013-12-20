-----------------------------------------------------------------------------------------------
local title		= "String Recipes"
local version 	= "0.0.5"
local mname		= "stringrecipes"
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		
-- Looked at code from:		animaltools, default, farming
-- Dependencies: 			default, farming
-- Supports:				animalmaterials, dryplants
-----------------------------------------------------------------------------------------------

minetest.register_craft({
	output = "farming:string 4", -- looked ad farming mod and thought: why not the other way around?
	recipe = {
		{"group:wool"},
	}
})

minetest.register_craft({
	output = "farming:string 4",
	recipe = {
		{"animalmaterials:fur"},
		{"animalmaterials:fur"},
	}
})

minetest.register_craft({
	output = "farming:string 2",
	recipe = {
		{"default:grass_1"},
		{"default:grass_1"},
	}
})


minetest.register_craft({
	output = "farming:string 4", -- wanted the recipe of the original throwing mod, but with more output
	recipe = {
		{"default:junglegrass"},
		{"default:junglegrass"},
	}
})

minetest.register_craft({
	output = "farming:string 4",
	recipe = {
		{"default:papyrus"},
		{"default:papyrus"},
	}
})

minetest.register_craft({
	output = "farming:string 4",
	recipe = {
		{"dryplants:reedmace_sapling"},
		{"dryplants:reedmace_sapling"},
	}
})
-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------