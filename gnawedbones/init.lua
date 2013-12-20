-----------------------------------------------------------------------------------------------
local title		= "Gnawed Bones"
local version 	= "0.0.3"
local mname		= "gnawedbones"
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		animalmaterials, fishing, legacy, mobs
-- Looked at code from:
-- Dependencies: 			default, legacy
-- Supports:				animalmaterials, mobs
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
--	Bone
-----------------------------------------------------------------------------------------------
minetest.register_craftitem("gnawedbones:bone", {
	description = "Bone",
	inventory_image = "gnawedbones_bone.png",
})

-- replace, just in case bones from animalmaterials and/or bone are in inventory/world and mod(s) disabled/deinstalled
minetest.register_alias("bone:bone",				"gnawedbones:bone")
minetest.register_alias("animalmaterials:bone",		"gnawedbones:bone")

local heal_1 = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local heal = user:get_hp() + 1
		user:set_hp(heal)
		itemstack:take_item()
		if inv:room_for_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""}) then
			inv:add_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""})
		end
		return itemstack
	end
	
local heal_3 = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local heal = user:get_hp() + 3
		user:set_hp(heal)
		itemstack:take_item()
		if inv:room_for_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""}) then
			inv:add_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""})
		end
		return itemstack
	end
	
-----------------------------------------------------------------------------------------------
-- Old items (legacy)
-----------------------------------------------------------------------------------------------
-- Rat
minetest.register_craftitem(":rat", {
	description = "Rat",
	inventory_image = "rat.png",
	on_use = heal_3,
})
-- Cooked Rat
minetest.register_craftitem(":cooked_rat", {
	description = "Cooked rat",
	inventory_image = "cooked_rat.png",
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local heal = user:get_hp() + 6
		user:set_hp(heal)
		itemstack:take_item()
		if inv:room_for_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""}) then
			inv:add_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""})
		end
		return itemstack
	end,
})

-----------------------------------------------------------------------------------------------
-- Simple Mobs
-----------------------------------------------------------------------------------------------

if minetest.get_modpath("mobs") ~= nil then
-- Raw Meat
minetest.register_craftitem(":mobs:meat_raw", {
	description = "Raw Meat",
	inventory_image = "mobs_meat_raw.png",
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local heal = user:get_hp() + 4
		user:set_hp(heal)
		itemstack:take_item()
		if inv:room_for_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""}) then
			inv:add_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""})
		end
		return itemstack
	end,
})
-- Meat
minetest.register_craftitem(":mobs:meat", {
	description = "Meat",
	inventory_image = "mobs_meat.png",
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local heal = user:get_hp() + 8
		user:set_hp(heal)
		itemstack:take_item()
		if inv:room_for_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""}) then
			inv:add_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""})
		end
		return itemstack
	end,
})
-- Rat
minetest.register_craftitem(":mobs:rat", {
	description = "Rat",
	inventory_image = "mobs_rat_inventory.png",
	on_use = heal_1,
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
			minetest.env:add_entity(pointed_thing.above, "mobs:rat")
			itemstack:take_item()
		end
		return itemstack
	end,
})
-- Cooked Rat	
minetest.register_craftitem(":mobs:rat_cooked", {
	description = "Cooked Rat",
	inventory_image = "mobs_cooked_rat.png",
	on_use = heal_3,
})
end

-----------------------------------------------------------------------------------------------
-- Mobf
-----------------------------------------------------------------------------------------------	
if minetest.get_modpath("animalmaterials") ~= nil then
minetest.register_craftitem(":animalmaterials:meat_raw", {
	description = "Raw meat",
	image = "animalmaterials_meat_raw.png",
	on_use = heal_1,
	groups = { meat=1, eatable=1 },
	stack_max=25
})
minetest.register_craftitem(":animalmaterials:meat_pork", {
	description = "Pork (raw)",
	image = "animalmaterials_meat_raw.png",
	on_use = heal_1,
	groups = { meat=1, eatable=1 },
	stack_max=25
})
minetest.register_craftitem(":animalmaterials:meat_beef", {
	description = "Beef (raw)",
	image = "animalmaterials_meat_raw.png",
	on_use = heal_1,
	groups = { meat=1, eatable=1 },
	stack_max=25
})
minetest.register_craftitem(":animalmaterials:meat_chicken", {
	description = "Chicken (raw)",
	image = "animalmaterials_meat_raw.png",
	on_use = heal_1,
	groups = { meat=1, eatable=1 },
	stack_max=25
})
minetest.register_craftitem(":animalmaterials:meat_lamb", {
	description = "Lamb (raw)",
	image = "animalmaterials_meat_raw.png",
	on_use = heal_1,
	groups = { meat=1, eatable=1 },
	stack_max=25
})
minetest.register_craftitem(":animalmaterials:meat_venison", {
	description = "Venison (raw)",
	image = "animalmaterials_meat_raw.png",
	on_use = heal_1,
	groups = { meat=1, eatable=1 },
	stack_max=25
})
minetest.register_craftitem(":animalmaterials:meat_undead", {
	description = "Meat (not quite dead)",
	image = "animalmaterials_meat_raw.png",
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local heal = user:get_hp() - 2
		user:set_hp(heal)
		itemstack:take_item()
		if inv:room_for_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""}) then
			inv:add_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""})
		end
		return itemstack
	end,
	groups = { meat=1, eatable=1 },
	stack_max=5
})
minetest.register_craftitem(":animalmaterials:meat_toxic", {
	description = "Toxic Meat",
	image = "animalmaterials_meat_raw.png",
	on_use = function(itemstack, user, pointed_thing)
		local inv = user:get_inventory()
		local heal = user:get_hp() - 5
		user:set_hp(heal)
		itemstack:take_item()
		if inv:room_for_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""}) then
			inv:add_item("main", {name="gnawedbones:bone", count=1, wear=0, metadata=""})
		end
		return itemstack
	end,
	groups = { meat=1, eatable=1 },
	stack_max=5
})
minetest.register_craftitem(":animalmaterials:meat_ostrich", {
	description = "Ostrich Meat",
	image = "animalmaterials_meat_raw.png",
	on_use = heal_3,
	groups = { meat=1, eatable=1 },
	stack_max=5
})
end

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------