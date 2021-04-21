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
accell = 0.5
layerID = layer_get_id("Tiles")
tiles = layer_tilemap_get_id(layerID)

tileSize = 16

chaseRange = 50

target = oPlayer

counter = 0
//Attack
HitDamage = 5
HitCoolDown = 1
canHit = true
//Hp
MaxHp = 100
Hp = MaxHp
//get Hurt
EnemyGetHurt = false
HurtShaderAlpha = 1.0
sh_hurtAlpha = shader_get_uniform(shPlayerGetHurt, "hurtalpha")

