/// @description Insert description here
// You can write your code in this editor


if(instance_exists(oExit)){
	if(!instance_exists(oParentEnemy)){
		oExit.showExit = true
	}
}

if( GameOverFlag ){
	if( GameOverAlpha >= 0.25 ){
		if( button_group_click(GameOverButton) == 0 ){ // back menu Button
			window_set_cursor(cr_default)
			GameOverFlag = false
			GameOverAlpha = 0
			room_goto(r_menu)
		}else if( button_group_click(GameOverButton) == 1 ){ // Quit Button
			game_end()
		}
	}
}

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