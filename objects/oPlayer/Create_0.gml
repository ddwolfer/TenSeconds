/// @description Insert description here
// You can write your code in this editor
Color = function(r, g, b)constructor{
	red = r;
	green = g;
	blue = b;
	
	static toShaderValue = function(value){
		return value / 255;
	}
};
friction = 0.5

sh_handle_range = shader_get_uniform(shReplaceColor,"range")
sh_handle_replace = shader_get_uniform(shReplaceColor,"colorReplace")

ColorReplace = new Color(color_get_red(oGame.PlayerBodyColor),color_get_green(oGame.PlayerBodyColor),color_get_blue(oGame.PlayerBodyColor))

control = true

accell = 1.5

death = false;
damaged = false;

image_speed = 0.3

//Tile collision
layerID = layer_get_id("Tiles")
tiles = layer_tilemap_get_id(layerID)

tileSize = 16