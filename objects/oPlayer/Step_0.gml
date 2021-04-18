/// @description Insert description here
// You can write your code in this editor
//image_angle = point_direction(x, y, mouse_x, mouse_y);
getInput();
if(control){
	xx = right - left;
	yy = down - up;
	
	if(xx != 0 || yy != 0){
		dir = point_direction(0, 0, xx, yy)

		var xSpeed = lengthdir_x(accell, dir)
		var ySpeed = lengthdir_y(accell, dir)
	
		//Horizontal movement
		if(place_meeting(x + xSpeed, y, oParentSolid)){
			while(!place_meeting(x + sign(xSpeed), y, oParentSolid)){
				x += sign(xSpeed);
			}
			xSpeed = 0;
		}
		x += xSpeed;

		//Vertical movement
		if(place_meeting(x, y + ySpeed, oParentSolid)){
			while(!place_meeting(x, y + sign(ySpeed), oParentSolid)){
				y += sign(ySpeed);
			}
			ySpeed = 0;
		}
		y += ySpeed;
	
		//Sprites
		sprite_index = sPlayerWalk
	
		if(xSpeed > 0) image_xscale = 1;
		else if(xSpeed < 0) image_xscale = -1;
	}else{
		sprite_index = sPlayerIdle
	}
}

show_debug_message(yy)




