-----------------------------------------------------------------------------------------------
local title		= "Burning Materials"
local version 	= "0.0.4"
local mname		= "burningmaterials"
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		campfire, stoneage
-- Looked at code from:
-- Dependencies: 			stoneage
-- Supports:				darkage, dryplants
-----------------------------------------------------------------------------------------------

dofile(minetest.get_modpath("burningmaterials").."/settings.txt")

tinder = {
	"flowers:cotton",
	"default:paper",
	"default:coal_lump",
	"garden:cotton",
	
	"default:dry_shrub",
	"darkage:dry_leaves",
	"darkage:straw",
	"dryplants:hay",
	"dryplants:reed",
}

for _,tinder in ipairs(tinder) do
	minetest.register_craft({
		output = 'stoneage:bonfire',
		recipe = {
			{'', 'default:stick', ''},
			{'default:stick', tinder, 'default:stick'},
		}
	})
end

if BONFIRE_FOR_COOKING == true then

minetest.register_node(":stoneage:bonfire_unlit", {
	description = "Bonfire",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"stoneage_bonfire_unlit.png"},
	inventory_image = "stoneage_bonfire_unlit.png",
	wield_image = "stoneage_bonfire_unlit.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drop = "default:coal_lump",
	groups = {snappy=3,flammable=2,attached_node=1},
	after_dig_node = function(pos, node, oldmetadata, puncher)
		local wield = puncher:get_wielded_item():get_name()
		if wield == "default:torch" then
			node.name = "stoneage:bonfire"
			minetest.env:set_node(pos, node)
			local inv = puncher:get_inventory()
			inv:remove_item("main", "default:coal_lump")
		end
	end,
	sounds = default.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-1/3, -1/2, -1/3, 1/3, 1/6, 1/3},
	},
	
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("infotext", "Campfire")
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
})

minetest.register_node(":stoneage:bonfire", {
	description = "Bonfire",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {
		{name="stoneage_bonfire_animated.png", animation={type="vertical_frames", aspect_w=16, aspect_h=16, length=2.0}}
	},
	inventory_image = "stoneage_bonfire_unlit.png",
	wield_image = "stoneage_bonfire_unlit.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	drop = "",
	damage_per_second = 1,
	light_source = LIGHT_MAX-1,
	groups = {dig_immediate=3,igniter=1,attached_node=1},
	after_place_node = function(pos, placer)
--		fire.on_flame_add_at(pos)
	end,
	after_dig_node = function(pos, node, oldmetadata, puncher)
		node.name = "stoneage:bonfire_unlit"
		minetest.env:set_node(pos, node)
--		fire.on_flame_remove_at(pos)
		puncher:set_hp(puncher:get_hp()-3)
	end,
	sounds = default.node_sound_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-1/3, -1/2, -1/3, 1/3, 1/6, 1/3},
	},
	
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", default.furnace_inactive_formspec)
		meta:set_string("infotext", "Bonfire");
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
		inv:set_size("src", 1)
		inv:set_size("dst", 4)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		elseif not inv:is_empty("dst") then
			return false
		elseif not inv:is_empty("src") then
			return false
		end
		return true
	end,
})

function hacky_swap_node(pos,name)
	local node = minetest.env:get_node(pos)
	local meta = minetest.env:get_meta(pos)
	local meta0 = meta:to_table()
	if node.name == name then
		return
	end
	node.name = name
	local meta0 = meta:to_table()
	minetest.env:set_node(pos,node)
	meta = minetest.env:get_meta(pos)
	meta:from_table(meta0)
end

minetest.register_abm({
	nodenames = {"stoneage:bonfire_unlit","stoneage:bonfire"},
	interval = 1.0,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.env:get_meta(pos)
		for i, name in ipairs({
				"fuel_totaltime",
				"fuel_time",
				"src_totaltime",
				"src_time"
		}) do
			if meta:get_string(name) == "" then
				meta:set_float(name, 0.0)
			end
		end

		local inv = meta:get_inventory()

		local srclist = inv:get_list("src")
		local cooked = nil
		
		if srclist then
			cooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		
		local was_active = false
		
		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			was_active = true
			meta:set_float("fuel_time", meta:get_float("fuel_time") + 0.25)
			meta:set_float("src_time", meta:get_float("src_time") + 0.25)
			if cooked and cooked.item and meta:get_float("src_time") >= cooked.time then
				-- check if there's room for output in "dst" list
				if inv:room_for_item("dst",cooked.item) then
					-- Put result in "dst" list
					inv:add_item("dst", cooked.item)
					-- take stuff from "src" list
					srcstack = inv:get_stack("src", 1)
					srcstack:take_item()
					inv:set_stack("src", 1, srcstack)
				else
					print("Could not insert '"..cooked.item:to_string().."'")
				end
				meta:set_string("src_time", 0)
			end
		end
		
		if meta:get_float("fuel_time") < meta:get_float("fuel_totaltime") then
			local percent = math.floor(meta:get_float("fuel_time") /
					meta:get_float("fuel_totaltime") * 100)
			meta:set_string("infotext","Furnace active: "..percent.."%")
			hacky_swap_node(pos,"stoneage:bonfire")
			meta:set_string("formspec",
				"size[8,9]"..
				"image[2,2;1,1;default_furnace_fire_bg.png^[lowpart:"..
						(100-percent)..":default_furnace_fire_fg.png]"..
				"list[current_name;fuel;2,3;1,1;]"..
				"list[current_name;src;2,1;1,1;]"..
				"list[current_name;dst;5,1;2,2;]"..
				"list[current_player;main;0,5;8,4;]")
			return
		end

		local fuel = nil
		local cooked = nil
		local fuellist = inv:get_list("fuel")
		local srclist = inv:get_list("src")
		
		if srclist then
			cooked = minetest.get_craft_result({method = "cooking", width = 1, items = srclist})
		end
		if fuellist then
			fuel = minetest.get_craft_result({method = "fuel", width = 1, items = fuellist})
		end

		if fuel.time <= 0 then
			meta:set_string("infotext","Put more wood on the fire!")
			hacky_swap_node(pos,"stoneage:bonfire_unlit")
			meta:set_string("formspec", default.furnace_inactive_formspec)
			return
		end

		

		meta:set_string("fuel_totaltime", fuel.time)
		meta:set_string("fuel_time", 0)
		
		local stack = inv:get_stack("fuel", 1)
		stack:take_item()
		inv:set_stack("fuel", 1, stack)
	end,
})

end
-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------