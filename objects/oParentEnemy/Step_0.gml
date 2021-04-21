if(!instance_exists(target)) return;

switch(state){
	
	case ENEMYSTATE.IDLE:
		counter += 1
		xx = 0
		yy = 0
		if(counter >= room_speed * 1){
			var change = choose(0, 1)
			switch(change){
				case 0: state = ENEMYSTATE.WANDER
				case 1: 
					counter = 0
					break
			}
		}
		
		if(collision_circle(x, y, chaseRange, target, false, false)){
			state = ENEMYSTATE.CHASE
		}
		show_debug_message("idle")
		break
	
	case ENEMYSTATE.WANDER:
		counter += 1
		
		if(counter >= room_speed * 3){
			var change = choose(0, 1)
			switch(change){
				case 0: state = ENEMYSTATE.IDLE
				case 1: 
					dir = irandom_range(0, 359)
					xx = lengthdir_x(10, dir)
					yy+= lengthdir_y(10, dir)
					counter = 0
					show_debug_message(xx)
					show_debug_message(dir)
			}
		}
		
		if(collision_circle(x, y, chaseRange, target, false, false)){
			state = ENEMYSTATE.CHASE
		}
		
		break
		
	case ENEMYSTATE.CHASE:
		if(self.x - target.x < 0) xx = 1
		else if(self.x - target.x > 0) xx = -1
		else if(self.x - target.x == 0) xx = 0
		
		if(self.y - target.y < 0) yy = 1
		else if(self.y - target.y > 0) yy = -1
		else if(self.y - target.y == 0) yy = 0
		show_debug_message("chase")
		if(!collision_circle(x, y, chaseRange, target, false, false)){
			state = ENEMYSTATE.IDLE
		}
		break
	
}
	
if(xx != 0 || yy != 0){
	dir = point_direction(0, 0, xx, yy)

	var xSpeed = lengthdir_x(accell, dir)
	var ySpeed = lengthdir_y(accell, dir)
		
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
	sprite_index = sEnemy
	
	if(xSpeed > 0) image_xscale = 1;
	else if(xSpeed < 0) image_xscale = -1;
	
}