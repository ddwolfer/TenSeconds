/// @description Insert description here
// You can write your code in this editor


draw_self()



if( PlayerGetHurt ){	
	shader_set(shPlayerGetHurt)
	
	shader_set_uniform_f( sh_hurtAlpha, HurtShaderAlpha )
	
	draw_self()
	shader_reset()
	HurtShaderAlpha += -0.02
}

if( HurtShaderAlpha <= 0 ){
	PlayerGetHurt = false
	HurtShaderAlpha = 1.0
}


//life bar
if(Hp > 0)
draw_line_width_color(x-6, y-sprite_height + 2, x-6 + floor(Hp*10/MaxHp), y-sprite_height + 2,2,c_red,c_red)

draw_sprite(sTimeBar, 0, x, y-sprite_height + 2)
//gun bar
if(HaveGunFlag){
	draw_line_width_color(x-6, y-sprite_height + 4, x-6 + GunKeepTime, y-sprite_height + 4,2,c_blue,c_blue)
	draw_sprite(sTimeBar, 0, x, y-sprite_height + 4)
}
//pick gun sign
if( collision_circle(x,y, sprite_width/2,oParentGun,-1,-1) and not HaveGunFlag){
	draw_sprite_ext(sKeyBoardESign,0,x, y-sprite_height-2, 0.3, 0.3 ,0,-1,1)
}

//pick gun sign
if( collision_circle(x,y, sprite_width/2,oSign,-1,-1)){
	draw_sprite_ext(sKeyBoardESign,0,x, y-sprite_height-2, 0.3, 0.3 ,0,-1,1)
}
