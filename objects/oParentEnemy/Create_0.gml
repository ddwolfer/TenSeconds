image_speed = 0.3

enum ENEMYSTATE{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE
}

state = ENEMYSTATE.IDLE
accell = 1
layerID = layer_get_id("Tiles")
tiles = layer_tilemap_get_id(layerID)

tileSize = 16

chaseRange = 50

target = oPlayer

counter = 0