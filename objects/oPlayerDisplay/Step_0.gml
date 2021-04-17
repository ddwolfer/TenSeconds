/// @description Insert description here
// You can write your code in this editor

ColorReplace = new Color(color_get_red(PaletteColor),color_get_green(PaletteColor),color_get_blue(PaletteColor))

if( button_click(ReadyButton) ){
	
	oGame.PlayerBodyColor = PaletteColor
	room_goto_next()
}