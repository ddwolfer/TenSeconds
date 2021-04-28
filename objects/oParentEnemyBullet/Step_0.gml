/// @description Insert description here
// You can write your code in this editor
event_inherited()

//bullet attack 子彈傷害
if( place_meeting(x,y,oPlayer) and not oPlayer.PlayerGetHurt){
	show_debug_message("打到人拉")
	audio_play_sound(sd_PlayerGetHurt,10,false)
	oPlayer.Hp -= BulletDamage
	oPlayer.PlayerGetHurt = true
	addScreenShake(8, 16)
	instance_destroy(id)
}
