-----------------------------------------------------------------------------------------------
local title		= "More Silex"
local version 	= "0.0.4"
local mname		= "moresilex"
-----------------------------------------------------------------------------------------------
-- by Mossmanikin
-- License (everything): 	WTFPL
-- Contains code from: 		stoneage
-- Looked at code from:
-- Dependencies: 			stoneage
-- Supports:				
-----------------------------------------------------------------------------------------------

minetest.register_node("moresilex:desert_sand_with_silex", {
	description = "Silex",
	tiles = {"default_desert_sand.png^stoneage_silex_ore.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1},
	drop = 'stoneage:silex',
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("moresilex:gravel_with_silex", {
	description = "Silex",
	tiles = {"default_gravel.png^stoneage_silex_ore.png"},
	is_ground_content = true,
	groups = {crumbly=3, falling_node=1},
	drop = 'stoneage:silex',
	sounds = default.node_sound_sand_defaults(),
})

-----------------------------------------------------------------------------------------------
-- Generating
-----------------------------------------------------------------------------------------------

local function generate_ore(name, wherein, minp, maxp, seed, chunks_per_volume, ore_per_chunk, height_min, height_max)
	if maxp.y < height_min or minp.y > height_max then
		return
	end
	local y_min = math.max(minp.y, height_min)
	local y_max = math.min(maxp.y, height_max)
	local volume = (maxp.x-minp.x+1)*(y_max-y_min+1)*(maxp.z-minp.z+1)
	local pr = PseudoRandom(seed)
	local num_chunks = math.floor(chunks_per_volume * volume)
	local chunk_size = 3
	if ore_per_chunk <= 4 then
		chunk_size = 2
	end
	local inverse_chance = math.floor(chunk_size*chunk_size*chunk_size / ore_per_chunk)
	--print("generate_ore num_chunks: "..dump(num_chunks))
	for i=1,num_chunks do
		local y0 = pr:next(y_min, y_max-chunk_size+1)
		if y0 >= height_min and y0 <= height_max then
			local x0 = pr:next(minp.x, maxp.x-chunk_size+1)
			local z0 = pr:next(minp.z, maxp.z-chunk_size+1)
			local p0 = {x=x0, y=y0, z=z0}
			for x1=0,chunk_size-1 do
			for y1=0,chunk_size-1 do
			for z1=0,chunk_size-1 do
				if pr:next(1,inverse_chance) == 1 then
					local x2 = x0+x1
					local y2 = y0+y1
					local z2 = z0+z1
					local p2 = {x=x2, y=y2, z=z2}
					if minetest.env:get_node(p2).name == wherein then
						minetest.env:set_node(p2, {name=name})
					end
				end
			end
			end
			end
		end
	end
end

minetest.register_on_generated(function(minp, maxp, seed)
generate_ore("moresilex:desert_sand_with_silex", "default:desert_sand", minp, maxp, seed+485,   				1/21/21/21,    11, -16,  32)
generate_ore("moresilex:gravel_with_silex", "default:gravel", minp, maxp, seed+485,   				1/21/21/21,    11, -16,  32)
end)

-----------------------------------------------------------------------------------------------
print("[Mod] "..title.." ["..version.."] ["..mname.."] Loaded...")
-----------------------------------------------------------------------------------------------