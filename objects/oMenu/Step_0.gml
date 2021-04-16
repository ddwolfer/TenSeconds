/// @description Insert description here
// You can write your code in this editor

if( button_group_click(MenuButton) == 0 ){ //Start Button
	room_goto_next()
}else if( button_group_click(MenuButton) == 1 ){ // Credits Button
	
}else if( button_group_click(MenuButton) == 2 ){ // Quit Button
	game_end()
}