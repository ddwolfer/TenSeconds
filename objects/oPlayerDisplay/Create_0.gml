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

BodyColor = new Color(183,183,183)


MenuFont = font_add("NewRocker-Regular.ttf", 20,0 ,0 ,0 , 65535)
TitleFont = font_add("NewRocker-Regular.ttf", 50,0 ,0 ,0 , 65535)
ViewW = view_get_wport(view_surface_id[0])
ViewH = view_get_hport(view_surface_id[0])

ReadyButton = button_box_init("READY",ViewW/2 - sprite_get_width(sMenuButton)/2,ViewH*4/5 - sprite_get_height(sMenuButton)/2,ViewW/2+sprite_get_width(sMenuButton)/2,ViewH*4/5+sprite_get_height(sMenuButton)/2)


sh_handle_range = shader_get_uniform(shReplaceColor,"range")
sh_handle_replace = shader_get_uniform(shReplaceColor,"colorReplace")