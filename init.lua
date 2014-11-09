--= Baked Clay (0.3) by TenPlus1
--= Code-base taken from default wool mod

local clay = {}
clay.dyes = {
	{"white",      "White",      "basecolor_white"},
	{"grey",       "Grey",       "basecolor_grey"},
	{"black",      "Black",      "basecolor_black"},
	{"red",        "Red",        "basecolor_red"},
	{"yellow",     "Yellow",     "basecolor_yellow"},
	{"green",      "Green",      "basecolor_green"},
	{"cyan",       "Cyan",       "basecolor_cyan"},
	{"blue",       "Blue",       "basecolor_blue"},
	{"magenta",    "Magenta",    "basecolor_magenta"},
	{"orange",     "Orange",     "excolor_orange"},
	{"violet",     "Violet",     "excolor_violet"},
	{"brown",      "Brown",      "unicolor_dark_orange"},
	{"pink",       "Pink",       "unicolor_light_red"},
	{"dark_grey",  "Dark Grey",  "unicolor_darkgrey"},
	{"dark_green", "Dark Green", "unicolor_dark_green"},
}

minetest.register_craft({
	type = "cooking",
	output = "bakedclay:white",
	recipe = "default:clay",
})

for _, row in ipairs(clay.dyes) do
	local name = row[1]
	local desc = row[2]
	local craft_color_group = row[3]
	-- Node Definition
	minetest.register_node("bakedclay:"..name, {
		description = desc.." Baked Clay",
		tiles = {"baked_clay_"..name..".png"},
		groups = {cracky=3,bakedclay=1},
		sounds = default.node_sound_stone_defaults(),
	})
	if craft_color_group then
		-- Crafting from dye and white clay
		minetest.register_craft({
			type = "shapeless",
			output = "bakedclay:"..name,
			recipe = {"group:dye,"..craft_color_group, "group:bakedclay"},
		})
	end
	-- Register Stair
	stairs.register_stair_and_slab("bakedclay_"..name, "bakedclay:"..name,
		{cracky=3},
		{"baked_clay_"..name..".png"},
		"Baked Clay "..desc.." Stair",
		"Baked Clay "..desc.." Slab",
		default.node_sound_stone_defaults())
end

--=  Register a few extra Dye Colour Options

minetest.register_craft( {
       type = "shapeless",
       output = "dye:dark_grey 3",
       recipe = {
               "dye:black",
               "dye:black",
               "dye:white",
	},
})

minetest.register_craft( {
       type = "shapeless",
       output = "dye:grey 3",
       recipe = {
               "dye:black",
               "dye:white",
               "dye:white",
	},
})

minetest.register_craft( {
       type = "shapeless",
       output = "dye:green 4",
       recipe = {
               "default:cactus",
	},
})

minetest.register_craft( {
       type = "shapeless",
       output = "dye:black 4",
       recipe = {
               "default:coal_lump",
	},
})
