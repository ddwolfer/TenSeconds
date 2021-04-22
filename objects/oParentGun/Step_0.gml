depth = -y

if(!instance_exists(oPlayer)) return;
getInput()

if(PlayerPickGun and instance_exists(oPlayer)){
	depth = oPlayer.depth -1 
	image_angle = point_direction(x, y, mouse_x, mouse_y)
	//show_debug_message(string(x)+"|"+string(y)+"|"+string(mouse_x)+"|"+string(mouse_y)+"|")
	if(oPlayer.control = true){
		x = oPlayer.x
		y = oPlayer.y
		
		show_debug_message("ParentGun angle:"+string(image_angle) + "|" + string(point_direction(x, y, mouse_x, mouse_y)))

		if(mouseLeft and canShoot) {
			var BulletShoot = instance_create_layer(x, y, "Bullet", bulletType)
			audio_play_sound(sd_Shoot2, 10, false)
			BulletShoot.BulletDamage = GunDamage
			BulletShoot.direction = point_direction(x, y, mouse_x, mouse_y)
			canShoot = false
			alarm[0] = 30 / attackSpeed
			gunShootOnce = true
		}
		if( gunShootOnce and activeGunDeath ){
			activeGunDeath = false
			alarm[1] = activeTimeLeft * room_speed
		}
	}

}

