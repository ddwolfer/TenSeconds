/// @description Insert description here
// You can write your code in this editor
image_angle = point_direction(x, y, mouse_x, mouse_y);
getInput()
if( up ){
	show_debug_message("UP")
	motion_add(point_direction(x,y,x,y-MoveSpeed),1)
}else if(down){
	show_debug_message("DOWN")
	motion_add(point_direction(x,y,x,y+MoveSpeed),1)
}else if(left){
	show_debug_message("LEFT")
	motion_add(point_direction(x,y,x-MoveSpeed,y),1)
}else if(right){
	show_debug_message("RIGHT")
	motion_add(point_direction(x,y,x+MoveSpeed,y),1)
}

if(speed > MoveSpeed){
	speed = MoveSpeed
}


