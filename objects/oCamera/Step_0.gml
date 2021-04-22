x += random_range(-screenShake, screenShake)
y += random_range(-screenShake, screenShake)

if(!instance_exists(oPlayer)) exit

var mouseDisX = mouse_x - x
var mouseDisY = mouse_y - y

var targetX = oPlayer.x
var targetY = oPlayer.y

x = lerp(x, targetX + mouseDisX/2, .1)
y = lerp(y, targetY + mouseDisY/2, .1)

if(x < width / 2) x = width / 2
else if(x > room_width - width / 2) x = room_width - width / 2

if(y < height / 2) y = height / 2
else if(y > room_height - height / 2) y = room_height - height / 2

camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2)