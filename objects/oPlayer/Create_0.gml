/// @description Insert description here
// You can write your code in this editor
friction = 0.5

sh_handle_range = shader_get_uniform(shReplaceColor,"range")
sh_handle_replace = shader_get_uniform(shReplaceColor,"colorReplace")

control = true

accell = 1.5

death = false;
damaged = false;

image_speed = 0.3

//Tile collision
layerID = layer_get_id("Tiles")
tiles = layer_tilemap_get_id(layerID)

tileSize = 16

// GunSetting
HaveGunFlag = false
GunKeepTime = 0
StartCountGunTime = true

//HpSetting
MaxHp = 10
Hp = 10

//getHurt
PlayerGetHurt = false
HurtShaderAlpha = 1.0
sh_hurtAlpha = shader_get_uniform(shPlayerGetHurt, "hurtalpha")


