if(!instance_exists(oPlayer)) exit

var mouseDisX = mouse_x - x
var mouseDisY = mouse_y - y

var targetX = oPlayer.x
var targetY = oPlayer.y

x = lerp(x, targetX + mouseDisX/2, .1)
y = lerp(y, targetY + mouseDisY/2, .1)

camera_set_view_pos(view_camera[0], x - width / 2, y - height / 2)