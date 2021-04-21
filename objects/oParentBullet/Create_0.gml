speed = 5

direction = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);

image_angle = direction

//Tile collision
layerID = layer_get_id("Tiles")
tiles = layer_tilemap_get_id(layerID)

tileSize = 16

BulletDamage = 0