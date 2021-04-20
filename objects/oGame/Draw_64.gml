/// @description Insert description here
// You can write your code in this editor
getInput()

if(room != r_menu ){
	switch(MenuInGameState){
		case 0 :
			if(select){
				MenuInGameState = MenuInGameState.show
				window_set_cursor(cr_default)
				if(instance_exists(oPlayer)){
					oPlayer.control = false
				}
			}
			break
		
		case 1 :
			draw_set_alpha(0.5)
			draw_rectangle_color(0,0,view_get_wport(view_surface_id[0]),view_get_hport(view_surface_id[0]),c_black,c_black,c_black,c_black, false )
			draw_set_alpha(1)
			if(select){
				MenuInGameState = MenuInGameState.hide
				window_set_cursor(cr_none)
				if(instance_exists(oPlayer)){
					oPlayer.control = true
				}
			}
			draw_set_font(MenuInGameFont)
			draw_button_sprite_group(MenuInGameButton,sMenuButton,sMenuButtonPressed)
			
			break
	}

}