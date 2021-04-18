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
	
		/*//Horizontal movement use when needed
		if(place_meeting(x + xSpeed, y, oParentSolid)){
			while(!place_meeting(x + sign(xSpeed), y, oParentSolid)){
				x += sign(xSpeed);
			}
			xSpeed = 0;
		}

		//Vertical movement
		if(place_meeting(x, y + ySpeed, oParentSolid)){
			while(!place_meeting(x, y + sign(ySpeed), oParentSolid)){
				y += sign(ySpeed);
			}
			ySpeed = 0;
		}*/
		
		//tile collision
		//horizontal
		if(xSpeed > 0) bboxSide = bbox_right; else bboxSide = bbox_left;
		
		if(tilemap_get_at_pixel(tiles, bboxSide + xSpeed, bbox_top) != 0 || tilemap_get_at_pixel(tiles, bboxSide + xSpeed, bbox_bottom) != 0){
			if(xSpeed > 0) x = x - (x mod tileSize) + (tileSize - 1) - (bbox_right - x)
			else x = x - (x mod tileSize)  - (bbox_left - x)
			xSpeed = 0
		}
		
		//vertical
		if(ySpeed > 0) bboxSide = bbox_bottom; else bboxSide = bbox_top;
		
		if(tilemap_get_at_pixel(tiles, bbox_left, bboxSide + ySpeed) != 0 || tilemap_get_at_pixel(tiles, bbox_right, bboxSide + ySpeed) != 0){
			if(ySpeed > 0) y = y - (y mod tileSize) + (tileSize - 1) - (bbox_bottom - y)
			else y = y - (y mod tileSize)  - (bbox_top - y)
			ySpeed = 0
		}
		
		y += ySpeed;
		x += xSpeed;
	
		//Sprites
		sprite_index = sPlayerWalk
	
		if(xSpeed > 0) image_xscale = 1;
		else if(xSpeed < 0) image_xscale = -1;
	}else{
		sprite_index = sPlayerIdle
	}
}






