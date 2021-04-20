/// @description Insert description here
// You can write your code in this editor
PlayerBodyColor = make_color_rgb(0,0,0)

enum MenuInGameState{
	hide = 0,
	show = 1
}
MenuInGameState = 0

//menu Setting
MenuInGameFont = font_add("NewRocker-Regular.ttf", 20,0 ,0 ,0 , 65535)

ViewW = view_get_wport(view_surface_id[0])
ViewH = view_get_hport(view_surface_id[0])

var ButtonW = ViewW/16
var ButtonH = ViewH/32
var ButtonSpace = ViewH/8

ResumeButton = button_box_init("Resume", ViewW/2 - ButtonW, ViewH/2 - ButtonH - ButtonSpace,  ViewW/2 + ButtonW, ViewH/2 + ButtonH - ButtonSpace)
BackMenuButton = button_box_init("Back to menu", ViewW/2 - ButtonW, ViewH/2 - ButtonH ,  ViewW/2 + ButtonW, ViewH/2 + ButtonH )
QuitButton = button_box_init("Quit", ViewW/2 - ButtonW, ViewH/2 - ButtonH + ButtonSpace,  ViewW/2 + ButtonW, ViewH/2 + ButtonH +ButtonSpace)

MenuInGameButton = button_group_init(ResumeButton, BackMenuButton, QuitButton, 1) //0 左右  1 上下