/// @description Insert description here
// You can write your code in this editor

MenuFont = font_add("NewRocker-Regular.ttf", 20,0 ,0 ,0 , 65535)
ViewW = view_get_wport(view_surface_id[0])
ViewH = view_get_hport(view_surface_id[0])

ReadyButton = button_box_init("READY",ViewW/2 - sprite_get_width(sMenuButton)/2,ViewH*3/4 - sprite_get_height(sMenuButton)/2,ViewW/2+sprite_get_width(sMenuButton)/2,ViewH*3/4+sprite_get_height(sMenuButton)/2)