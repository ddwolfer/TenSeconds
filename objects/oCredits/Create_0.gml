/// @description Insert description here
// You can write your code in this editor
CreditsFont = font_add("NewRocker-Regular.ttf", 30,0 ,0 ,0 , 65535)
CreditsText = "Creators:\nDDwolf\nChowDog\nmore games at chowdog.itch.io"

ViewW = view_get_wport(view_surface_id[0])
ViewH = view_get_hport(view_surface_id[0])
var ButtonW = sprite_get_width(sMenuButton)/2
var ButtonH = sprite_get_height(sMenuButton)/2

BackButton = button_box_init("Back",ViewW*4/5-ButtonW,ViewH*5/6-ButtonH,ViewW*4/5+ButtonW,ViewH*5/6+ButtonH)