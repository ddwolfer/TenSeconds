/// @description Insert description here
// You can write your code in this editor
//image_angle = point_direction(x, y, mouse_x, mouse_y);
getInput()
if(control){
	xx = right - left;
	yy = down - up;

	var xSpeed = xx * accell;
	var ySpeed = yy * accell;

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
	if(xx != 0 || yy != 0){
		sprite_index = sPlayerWalk
	}else{
		sprite_index = sPlayerIdle
	}
	
	if(xSpeed > 0) image_xscale = 1;
	else if(xSpeed < 0) image_xscale = -1;
}




