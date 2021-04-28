depth = -y

if( (direction >= 0 and direction < 90-directionRange) or (direction >= 270+directionRange and direction < 360)){
	image_xscale = 1 * image_ratio
}else if( ( direction >= 90+directionRange and direction < 270-directionRange ) ){
	image_xscale = -1 * image_ratio
}

if(!instance_exists(target)){
	state = ENEMYSTATE.IDLE
	return;
}
if( tilemap_get_at_pixel(tiles,x,y)!=0 ){
	instance_destroy(id)
}

if( Hp / MaxHp < 1.0){
	chaseRange = 10000
}
//body attack 基礎撞擊傷害
if( place_meeting(x,y,oPlayer) and not oPlayer.PlayerGetHurt){
	playerGetHurt(HitDamage)
}

switch(state){	
	case ENEMYSTATE.IDLE:
		counter += 1
		xx = 0
		yy = 0
		if(counter >= room_speed * 1){
			var change = choose(0, 1)
			switch(change){
				case 0: 
					createWanderPos = true
					while(createWanderPos){
						wanderX = x+random_range(-wanderRange,wanderRange)
						wanderY = y+random_range(-wanderRange,wanderRange)
						show_debug_message("X:"+string(wanderX)+"|Y:"+string(wanderY))
						show_debug_message("tilemap 判定"+string(tilemap_get_at_pixel(tiles, wanderX, wanderY)))
						if(tilemap_get_at_pixel(tiles, wanderX, wanderY) <= 0 ){
							createWanderPos = false
						}
					}
					mp_potential_path(wanderPath, wanderX, wanderY, wanderSpeed, 4,false)
					path_start( wanderPath, wanderSpeed, path_action_stop, true )
					state = ENEMYSTATE.WANDER
					
					break
				case 1: 
					counter = 0
					break
			}
		}
		
		if(collision_circle(x, y, chaseRange, target, false, false)){
			state = ENEMYSTATE.CHASE
		}
		//show_debug_message("[oParentEnemy Step 26]idle")
		break
	
	case ENEMYSTATE.WANDER:
		/*counter += 1
		
		if(counter >= room_speed * 3){
			var change = choose(0, 1)
			switch(change){
				case 0: state = ENEMYSTATE.IDLE
				case 1: 
					dir = irandom_range(0, 359)
					xx = lengthdir_x(10, dir)
					yy+= lengthdir_y(10, dir)
					counter = 0
					//show_debug_message("[oParentEnemy Step 41]"+string(xx))
					//show_debug_message("[oParentEnemy Step 42]" + string(dir))
			}
		}*/
		
		if(collision_circle(x, y, chaseRange, target, false, false)){
			state = ENEMYSTATE.CHASE
		}
		if( path_index >= 1.0 ){
			state = ENEMYSTATE.IDLE
		}
		
		break
		
	case ENEMYSTATE.CHASE:
		/*
		if(self.x - target.x < 0) xx = 1
		else if(self.x - target.x > 0) xx = -1
		else if(self.x - target.x == 0) xx = 0
		
		if(self.y - target.y < 0) yy = 1
		else if(self.y - target.y > 0) yy = -1
		else if(self.y - target.y == 0) yy = 0
		//show_debug_message("[oParentEnemy Step 60]chase")
		if( abs(self.x - target.x) > 2 ){
			if(xx == 1) image_xscale = 1
			if(xx == -1) image_xscale = -1
		}
		if(!collision_circle(x, y, chaseRange, target, false, false)){
			state = ENEMYSTATE.IDLE
		}
		*/
		if( pathChangeCount == 0 ){
			enemyPath = path_add()
			mp_potential_path(enemyPath, oPlayer.x, oPlayer.y, chaseSpeed, 4,false)
			path_start( enemyPath, chaseSpeed, path_action_stop, true )
		}
		pathChangeCount+=1
		if( pathChangeCount >= room_speed/2 ){
			pathChangeCount = 0
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
}