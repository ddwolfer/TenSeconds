if(!instance_exists(oPlayer)) return;
getInput()

image_angle = point_direction(x, y, mouse_x, mouse_y);
x = oPlayer.x
y = oPlayer.y

if(mouseLeft and canShoot) {
	instance_create_layer(x, y, "Bullet", bulletType)
	canShoot = false
	alarm[0] = 30 / attackSpeed
	alarm[1] = activeTimeLeft * room_speed
}
