/// @description Insert description here
// You can write your code in this editor
if( PlayerAudio and not MonsterClearAudioFlag ){
	audio_play_sound(sd_MonsterClear,10,false)
	MonsterClearAudioFlag = true
}

