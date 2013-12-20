-----------------------------------------------------------------------------------------------
local title		= "Archae Tools"
local version 	= "0.1.1"
local mname		= "archaetools"
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		default, farming, flint & stoneage
-- Looked at code from:		animalmaterials, bone
-- Dependencies: 			default, farming
-- Supports:				animalmaterials, bone, flint, gnawedbones, stoneage
-----------------------------------------------------------------------------------------------

dofile(minetest.get_modpath("archaetools").."/settings.txt")
dofile(minetest.get_modpath("archaetools").."/crafting.lua")

-----------------------------------------------------------------------------------------------
-- Wooden Axe -> Club
-----------------------------------------------------------------------------------------------
minetest.register_tool(":default:axe_wood", {
	description = "Club",
	inventory_image = "archaetools_woodclub.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=0,
		groupcaps={
			choppy={times={[3]=0.80}, uses=10, maxlevel=1},
			fleshy={times={[2]=1.50, [3]=0.80}, uses=10, maxlevel=1},
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

if BONE_TOOLS == true then
-----------------------------------------------------------------------------------------------
-- Wooden Pick -> Antler Pick
-----------------------------------------------------------------------------------------------
minetest.register_tool(":default:pick_wood", {
	description = "Deer Antler Pickaxe",
	inventory_image = "archaetools_antlerpick.png",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			cracky = {times={[3]=1.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

-----------------------------------------------------------------------------------------------
-- Wooden Shovel -> Bone Shovel
-----------------------------------------------------------------------------------------------
minetest.register_tool(":default:shovel_wood", {
	description = "Bone Shovel",
	inventory_image = "archaetools_boneshovel.png",
	wield_image = "archaetools_boneshovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=3.00, [2]=1.60, [3]=0.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

else
-----------------------------------------------------------------------------------------------
-- Wooden Shovel
-----------------------------------------------------------------------------------------------
minetest.register_tool(":default:shovel_wood", {
	description = "Wooden Shovel",
	inventory_image = "archaetools_woodshovel.png",
	wield_image = "archaetools_woodshovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=3.00, [2]=1.60, [3]=0.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

end

-----------------------------------------------------------------------------------------------
-- Stone Shovel
-----------------------------------------------------------------------------------------------
minetest.register_tool(":default:shovel_stone", {
	description = "Stone Shovel",
	inventory_image = "archaetools_stoneshovel.png",
	wield_image = "archaetools_stoneshovel.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})

-----------------------------------------------------------------------------------------------
-- Wooden Sword -> Wooden Spear
-----------------------------------------------------------------------------------------------
minetest.register_tool(":default:sword_wood", {
	description = "Wooden Spear",
	inventory_image = "archaetools_woodspear.png",
	wield_image = "archaetools_woodspear.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	}
})

-----------------------------------------------------------------------------------------------
-- Stone Sword -> Stone Spear
-----------------------------------------------------------------------------------------------
minetest.register_tool(":default:sword_stone", {
	description = "Stone Spear",
	inventory_image = "archaetools_stonespear.png",
	wield_image = "archaetools_stonespear.png^[transformFX",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
	}
})

-----------------------------------------------------------------------------------------------
-- Wooden Hoe -> Digging Stick
-----------------------------------------------------------------------------------------------
if (minetest.get_modpath("farming")) ~= nil then
-- turns nodes with group soil=1 into soil
local function hoe_on_use(itemstack, user, pointed_thing, uses)
	local pt = pointed_thing
	-- check if pointing at a node
	if not pt then
		return
	end
	if pt.type ~= "node" then
		return
	end
	
	local under = minetest.get_node(pt.under)
	local p = {x=pt.under.x, y=pt.under.y+1, z=pt.under.z}
	local above = minetest.get_node(p)
	
	-- return if any of the nodes is not registered
	if not minetest.registered_nodes[under.name] then
		return
	end
	if not minetest.registered_nodes[above.name] then
		return
	end
	
	-- check if the node above the pointed thing is air
	if above.name ~= "air" then
		return
	end
	
	-- check if pointing at dirt
	if minetest.get_item_group(under.name, "soil") ~= 1 then
		return
	end
	
	-- turn the node into soil, wear out item and play sound
	minetest.set_node(pt.under, {name="farming:soil"})
	minetest.sound_play("default_dig_crumbly", {
		pos = pt.under,
		gain = 0.5,
	})
	if minetest.get_modpath("fishing") ~= nil then
		if math.random(1, 100) < 60 then
			local inv = user:get_inventory()
			if inv:room_for_item("main", {name="fishing:bait_worm", count=1, wear=0, metadata=""}) then
				inv:add_item("main", {name="fishing:bait_worm", count=1, wear=0, metadata=""})
			end
		end
	end
	itemstack:add_wear(65535/(uses-1))
	return itemstack
end

minetest.register_tool(":farming:hoe_wood", {
	description = "Digging Stick",
	inventory_image = "archaetools_wooddigstick.png",
	wield_image = "archaetools_wooddigstick.png^[transformFX",
	on_use = function(itemstack, user, pointed_thing)
		return hoe_on_use(itemstack, user, pointed_thing, 30)
	end,
})
end

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------