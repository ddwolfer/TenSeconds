/// @description Insert description here
// You can write your code in this editor
getInput()

if( GameOverFlag ){
	GameOverAlpha = approach(GameOverAlpha,0.25,0.02)
	draw_set_alpha(GameOverAlpha)
	draw_rectangle_color(0,0,ViewW,ViewH,c_black,c_black,c_black,c_black,false)
	draw_set_font(GameOverFont)
	draw_set_alpha(GameOverAlpha*4)
	draw_text(ViewW/2,ViewH/3,"Game Over")
	draw_set_alpha(1)
	
	if( GameOverAlpha >= 0.25 ){
		window_set_cursor(cr_default)
		draw_set_font(MenuInGameFont)
		draw_button_sprite_group(GameOverButton,sMenuButton,sMenuButtonPressed)
	}
}

if(room != r_menu and room != r_Credit and not GameOverFlag){
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
