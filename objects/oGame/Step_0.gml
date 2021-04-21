/// @description Insert description here
// You can write your code in this editor
if( MenuInGameState == 1 ){
	if( button_group_click(MenuInGameButton) == 0 ){ //resume Button
		MenuInGameState = MenuInGameState.hide
		window_set_cursor(cr_none)
		if(instance_exists(oPlayer)){
			oPlayer.control = true
		}
	}else if( button_group_click(MenuInGameButton) == 1 ){ // back menu Button
		MenuInGameState = 0
		window_set_cursor(cr_default)
		room_goto(r_menu)
	}else if( button_group_click(MenuInGameButton) == 2 ){ // Quit Button
		game_end()
	}
}

if(instance_exists(oPlayer)){
	with(oPlayer){
		if(instance_position(x, y, oExit)){
			room_goto(r_Room01)
		}
	}
}