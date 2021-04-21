depth = -y

if(!instance_exists(oPlayer)) return;
getInput()

if(PlayerPickGun and instance_exists(oPlayer)){
	depth = oPlayer.depth -1 
	if(oPlayer.control = true){
		image_angle = point_direction(x, y, mouse_x, mouse_y);
		x = oPlayer.x
		y = oPlayer.y

		if(mouseLeft and canShoot) {
			var BulletShoot = instance_create_layer(x, y, "Bullet", bulletType)
			BulletShoot.BulletDamage = GunDamage
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

