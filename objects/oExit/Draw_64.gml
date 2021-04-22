/// @description Insert description here
// You can write your code in this editor
if( doTransition and showExit){
	
	draw_set_alpha(transitionAlpha)
	draw_rectangle(0,0,view_get_wport(view_surface_id[0]), view_get_hport(view_surface_id[0]), false)
	draw_set_alpha(1)
	transitionAlpha = approach( transitionAlpha , 1.0 , 0.025 )
	
	if( transitionAlpha == 1.0 ){
		RoomPassCount += 1
		room_goto( target_room )
	}
}
if( showExit ){
	var cam = view_camera[0];
	var CaX1 = camera_get_view_x(cam);
	var CaY1 = camera_get_view_y(cam);
	var CaX2 = CaX1 + camera_get_view_width(cam);
	var CaY2 = CaY1 + camera_get_view_height(cam);
	
	var ArrorX1 = 640 - 512
	var ArrorX2 = 640 + 512
	var ArrorY1 = 360 - 288
	var ArrorY2 = 360 + 288
	var ArrorDir = point_direction((CaX1+CaX2)/2, (CaY1+CaY2)/2, x, y)
	
	if(ArrorDir>=0 and ArrorDir < 30){
		ArrorX = ArrorX2
		ArrorY = 360 - (ArrorDir*(288/30))
	}else if(ArrorDir>=30 and ArrorDir < 150){
		ArrorX = ArrorX2 - (ArrorDir-30)*(1024/120)
		ArrorY = ArrorY1
	}else if(ArrorDir>=150 and ArrorDir < 210){
		ArrorX = ArrorX1
		ArrorY = ArrorY1 + (ArrorDir-150)*(576/60)
	}else if(ArrorDir>=210 and ArrorDir < 330){
		ArrorX = ArrorX1 + (ArrorDir-210)*(1024/120)
		ArrorY = ArrorY2
	}else if(ArrorDir>=330 and ArrorDir < 360){
		ArrorX = ArrorX2
		ArrorY = ArrorY2 - (ArrorDir-330)*(288/30)
	}
	
	if( not point_in_rectangle( x, y, CaX1, CaY1, CaX2, CaY2)){
		draw_sprite_ext(sExitArror,0,ArrorX,ArrorY,4,4, ArrorDir ,-1,1)
	}
}