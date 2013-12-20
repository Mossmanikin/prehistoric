-----------------------------------------------------------------------------------------------
-- Archae Tools - Crafting Recipes 0.1.0 
-- by Mossmanikin
-- License (everything): WTFPL
-----------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------
-- Wooden Axe -> Club
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = 'default:axe_wood',
	recipe = {
		{'default:stick', 'default:stick'},
		{'default:stick', 'default:stick'},
		{'', 'default:stick'},
	}
})

-----------------------------------------------------------------------------------------------
-- Stone Axe
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = 'default:axe_stone',
	recipe = {
		{'flint:flintstone', 'flint:flintstone'},
		{'flint:flintstone', 'default:stick'},
		{'', 'default:stick'},
	}
})

if BONE_TOOLS == true then

-----------------------------------------------------------------------------------------------
-- Wooden Pick -> Antler Pick
-----------------------------------------------------------------------------------------------
minetest.register_craft({			-- animalmaterials
	output = 'default:pick_wood',
	recipe = {
		{'animalmaterials:bone', 'animalmaterials:bone', 'animalmaterials:bone'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	output = 'default:pick_wood',
	recipe = {
		{'animalmaterials:bone', 'animalmaterials:bone', 'animalmaterials:bone'},
		{'', 'animalmaterials:bone', ''},
		{'', 'animalmaterials:bone', ''},
	}
})
minetest.register_craft({			-- bone
	output = 'default:pick_wood',
	recipe = {
		{'bone:bone', 'bone:bone', 'bone:bone'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	output = 'default:pick_wood',
	recipe = {
		{'bone:bone', 'bone:bone', 'bone:bone'},
		{'', 'bone:bone', ''},
		{'', 'bone:bone', ''},
	}
})

minetest.register_craft({			-- gnawedbones
	output = 'default:pick_wood',
	recipe = {
		{'gnawedbones:bone', 'gnawedbones:bone', 'gnawedbones:bone'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})
minetest.register_craft({
	output = 'default:pick_wood',
	recipe = {
		{'gnawedbones:bone', 'gnawedbones:bone', 'gnawedbones:bone'},
		{'', 'gnawedbones:bone', ''},
		{'', 'gnawedbones:bone', ''},
	}
})
-- get rid of old recipe
minetest.register_craft({
	output = 'default:stick 14',
	recipe = {
		{'group:wood', 'group:wood', 'group:wood'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

end

-----------------------------------------------------------------------------------------------
-- Stone Pickaxe
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = 'default:pick_stone',
	recipe = {
		{'flint:flintstone', 'flint:flintstone', 'flint:flintstone'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

if BONE_TOOLS == true then
-----------------------------------------------------------------------------------------------
-- Wooden Shovel -> Bone Shovel
-----------------------------------------------------------------------------------------------
minetest.register_craft({			-- animalmaterials
	output = 'default:shovel_wood',
	recipe = {
		{''},
		{'animalmaterials:bone'},
		{'animalmaterials:bone'},
	}
})
minetest.register_craft({
	output = 'default:shovel_wood',
	recipe = {
		{'animalmaterials:bone'},
		{'default:stick'},
		{'default:stick'},
	}
})
minetest.register_craft({			-- bone
	output = 'default:shovel_wood',
	recipe = {
		{''},
		{'bone:bone'},
		{'bone:bone'},
	}
})
minetest.register_craft({
	output = 'default:shovel_wood',
	recipe = {
		{'bone:bone'},
		{'default:stick'},
		{'default:stick'},
	}
})
minetest.register_craft({ 			-- gnawedbones
	output = 'default:shovel_wood',
	recipe = {
		{''},
		{'gnawedbones:bone'},
		{'gnawedbones:bone'},
	}
})
minetest.register_craft({
	output = 'default:shovel_wood',
	recipe = {
		{'gnawedbones:bone'},
		{'default:stick'},
		{'default:stick'},
	}
})
-- get rid of old recipe
minetest.register_craft({
	output = 'default:stick 6',
	recipe = {
		{'group:wood'},
		{'default:stick'},
		{'default:stick'},
	}
})
end
-----------------------------------------------------------------------------------------------
-- Stone Shovel
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = 'default:shovel_stone',
	recipe = {
		{'flint:flintstone'},
		{'default:stick'},
		{'default:stick'},
	}
})

-----------------------------------------------------------------------------------------------
-- Wooden Sword -> Wooden Spear
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = 'default:sword_wood',
	recipe = {
		{'default:stick'},
		{'default:stick'},
		{'default:stick'},
	}
})

-----------------------------------------------------------------------------------------------
-- Stone Sword -> Stone Spear
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = 'default:sword_stone',
	recipe = {
		{'flint:flintstone'},
		{'flint:flintstone'},
		{'default:stick'},
	}
})

if (minetest.get_modpath("farming")) ~= nil then
-----------------------------------------------------------------------------------------------
-- Wooden Hoe -> Digging Stick
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = 'farming:hoe_wood',
	recipe = {
		{'default:stick', 'default:stick'},
		{'', 'default:stick'},
		{'', 'default:stick'},
	}
})

-----------------------------------------------------------------------------------------------
-- Stone Hoe
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = 'farming:hoe_stone',
	recipe = {
		{'flint:flintstone', 'flint:flintstone'},
		{'', 'default:stick'},
		{'', 'default:stick'},
	}
})

end

if (minetest.get_modpath("stoneage")) ~= nil then
-----------------------------------------------------------------------------------------------
-- Biface
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	output = 'stoneage:biface',
	recipe = {
		{'flint:flintstone'},
	}
})

-----------------------------------------------------------------------------------------------
-- Firestriker
-----------------------------------------------------------------------------------------------
minetest.register_craft({
	type = 'shapeless',
	output = 'stoneage:firestriker_stone',
	recipe = {'flint:flintstone', 'group:stone'},
})

end



