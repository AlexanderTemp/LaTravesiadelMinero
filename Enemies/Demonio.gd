extends KinematicBody2D

const EnemyDeathEffect = preload("res://Effects/EnemyDeathEffect.tscn")
export var ACCELERATION = 300
export var MAX_SPEED=20
export var FRICTION = 200
enum{
	IDLE,
	WANDER, 
	CHASE
}
var velocity = Vector2.ZERO
var state = CHASE
var knockback = Vector2.ZERO
#acdeso al stats
onready var sprite=$AnimatedSprite
onready var stats = $DemonState
onready var playerDetectionZone=$PlayerDetectionZone
onready var hurtbox=$HurtBox
func _physics_process(delta):
	knockback=knockback.move_toward(Vector2.ZERO, 200*delta)
	knockback=move_and_slide(knockback)
	match state:
		IDLE:
			velocity=velocity.move_toward(Vector2.ZERO, FRICTION*delta)
			seek_player()
		WANDER:
			pass
		CHASE:
			var player=playerDetectionZone.player
			if player != null:
				#vector entre el player y el enemig
				var direction = (player.global_position-global_position).normalized()
				velocity=velocity.move_toward(direction*MAX_SPEED, ACCELERATION*delta)
			else :
				##CUANDO ESTE FUERA DEL RANGO YA NO PERSIGA AL JUGADOR
				state=IDLE
			#para que los enemigos nos vean cuando se mueven 
			sprite.flip_h=velocity.x<0
	velocity=move_and_slide(velocity)
func seek_player():
	if playerDetectionZone.can_see_player():
		state=CHASE
func _on_HurtBox_area_entered(area):
	stats.health-=Puntua.ataque
	#tenemos un pegue al bat y retrocede
	knockback=area.knockback_vector*90
	hurtbox.create_hit_effect()

func _on_Stats_no_health():
	Puntua.set_ran(70)
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position
func _ready():
	#stados del jugador se conectan al 
	stats.connect("no_health", self , "queue_free")
	stats.max_health = 4
	#enemigo ruede
	#swordHitbox.knockback_vector=roll_vector
	
