if( collision_circle(x,y, sprite_width/2,oPlayer,-1,-1)){
	draw_sprite_ext(sDialogueBox, 0, guiWidth / 2, guiHeight / 2 + 200, 5, 5, 0, c_white, image_alpha)
	draw_set_halign(fa_left)
	draw_text(240, guiHeight / 2 + 150, text)
}