/// @description Insert description here
// You can write your code in this editor

//bullet collision wall delete
if( tilemap_get_at_pixel(tiles,x,y)!=0 ){
	instance_destroy(id)
}