/// @description Insert description here
// You can write your code in this editor
//image_angle = point_direction(x, y, mouse_x, mouse_y);

getInput();
//死亡判定
//show_debug_message("[oPlayer Step 07]" + string(HurtShaderAlpha))
if(death){
	if(floor(image_index)>=9){
		oGame.alarm[0] = room_speed
		instance_destroy(id)
	}
}
if(Hp <= 0 and not death){
	control = false
	death = true
	sprite_index = sPlayerDeath
}

if(control){
	
	if( collision_circle(x,y, sprite_width/2,oParentGun,-1,-1) and not HaveGunFlag){
		//show_debug_message("[Player strp]碰到槍了")
		if( keyboard_check_pressed(ord("E")) ){
			pickGun = instance_nearest(x,y,oParentGun)
			pickGun.pickedGun = true
			HaveGunFlag = true
			GunKeepTime = 10
		}
	}else if( collision_circle(x,y, sprite_width/2,oParentGun,-1,-1) and HaveGunFlag){
		if( keyboard_check_pressed(ord("E")) ){
			instance_destroy(pickGun)
			pickGun = instance_nearest(x,y,oParentGun)
			pickGun.pickedGun = true
			HaveGunFlag = true
			GunKeepTime = 10
			alarm[0] = -1
			StartCountGunTime = true
		}
	}
	if( HaveGunFlag and mouseLeft and StartCountGunTime){
		StartCountGunTime = false
		alarm[0] = room_speed
	}
	if( GunKeepTime <= 0 ){
		HaveGunFlag = false
		StartCountGunTime = true
	}
	
	#region//move
	xx = right - left;
	yy = down - up;
	
	
	if(xx != 0 || yy != 0){
		if( animationHitFrame(0) || animationHitFrame(2) ){
			audio_play_sound(sd_PlayerWalk,10,false)
		}
		
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
		
		if(place_meeting(x + xSpeed, y, oParentSolid)){
			while(!place_meeting(x + sign(xSpeed), y, oParentSolid)){
				x += sign(xSpeed);
			}
			xSpeed = 0;
		}
		if(place_meeting(x, y + ySpeed, oParentSolid)){
		while(!place_meeting(x, y + sign(ySpeed), oParentSolid)){
			y += sign(ySpeed);
		}
		ySpeed = 0;
	}
		
		y += ySpeed;
		x += xSpeed;
	#endregion
		//Sprites
		sprite_index = sPlayerWalk
	
		if(xSpeed > 0) image_xscale = 1;
		else if(xSpeed < 0) image_xscale = -1;
	}else{
		sprite_index = sPlayerIdle
	}
}






