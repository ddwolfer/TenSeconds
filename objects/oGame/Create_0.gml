/// @description Insert description here
// You can write your code in this editor
PlayerBodyColor = make_color_rgb(0,0,0)

enum MenuInGameState{
	hide = 0,
	show = 1
}
MenuInGameState = 0

randomize()
globalvar AllRoom,RoomList,RoomPassCount;
RoomPassCount = 0
AllRoom = [r_Room01, r_Room02, r_Room03, r_Room04, r_Room05, r_Room06, r_Room07, r_Room08]
RoomList = [noone , noone, noone, r_EndRoom]
var i
for( i=0 ; i < 3 ; i++){
	var roomnumber = irandom(7)
	if(AllRoom[roomnumber] != 0){
		RoomList[i] = AllRoom[roomnumber]
		AllRoom[roomnumber] = 0
	}
	else
		i -= 1
}
show_debug_message("[oGame Step 04]"+string(RoomList))



//menu Setting
MenuInGameFont = font_add("NewRocker-Regular.ttf", 20,0 ,0 ,0 , 65535)
GameOverFont = font_add("NewRocker-Regular.ttf", 80,0 ,0 ,0 , 65535)

ViewW = view_get_wport(view_surface_id[0])
ViewH = view_get_hport(view_surface_id[0])

var ButtonW = ViewW/16
var ButtonH = ViewH/32
var ButtonSpace = ViewH/7

ResumeButton = button_box_init("Resume", ViewW/2 - ButtonW, ViewH/2 - ButtonH - ButtonSpace,  ViewW/2 + ButtonW, ViewH/2 + ButtonH - ButtonSpace)
BackMenuButton = button_box_init("Back to menu", ViewW/2 - ButtonW, ViewH/2 - ButtonH ,  ViewW/2 + ButtonW, ViewH/2 + ButtonH )
QuitButton = button_box_init("Quit", ViewW/2 - ButtonW, ViewH/2 - ButtonH + ButtonSpace,  ViewW/2 + ButtonW, ViewH/2 + ButtonH +ButtonSpace)

MenuInGameButton = button_group_init(ResumeButton, BackMenuButton, QuitButton, 1) //0 左右  1 上下

GameOverFlag = false
GameOverAlpha = 0

GameOverBackMenuButton = button_box_init("Back to menu", ViewW/2 - ButtonW, ViewH/2 - ButtonH + ButtonSpace,  ViewW/2 + ButtonW, ViewH/2 + ButtonH + ButtonSpace)
GameOverQuitButton = button_box_init("Quit", ViewW/2 - ButtonW, ViewH/2 - ButtonH + ButtonSpace*2,  ViewW/2 + ButtonW, ViewH/2 + ButtonH +ButtonSpace*2)

GameOverButton = button_group_init( GameOverBackMenuButton, GameOverQuitButton, 1) //0 左右  1 上下