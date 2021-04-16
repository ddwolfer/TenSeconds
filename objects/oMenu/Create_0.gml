/// @description Insert description here
// You can write your code in this editor

MenuFont = font_add("NewRocker-Regular.ttf", 20,0 ,0 ,0 , 65535)
ViewW = view_get_wport(view_surface_id[0])
ViewH = view_get_hport(view_surface_id[0])

ButtonW = ViewW/16
ButtonH = ViewH/32
ButtonSpace = ViewH/8

StartButton = button_box_init("Start", ViewW/2 - ButtonW, ViewH/2 - ButtonH,  ViewW/2 + ButtonW, ViewH/2 + ButtonH )
QuitButton = button_box_init("Quit", ViewW/2 - ButtonW, ViewH/2 - ButtonH + ButtonSpace,  ViewW/2 + ButtonW, ViewH/2 + ButtonH +ButtonSpace)

MenuButton = button_group_init(StartButton, QuitButton, 1) 