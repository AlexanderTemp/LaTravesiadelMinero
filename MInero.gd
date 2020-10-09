extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const PlayerHurtSound=preload("res://Player/PlayerHurtSound.tscn")

# Called when the node enters the scene tree for the first time.
##physic se actualiza cada vez en un loop delta es cuanto toma el frame 
#delta tiene el tiempo que el ultimo frame toma en ser procesado
#delta 1/16 caida de frames 
export var  MAX_SPEED=80
export var ACCELERATION=500
export var ROLL_SPEED=120
export var FRICTION= 500

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state=MOVE
var velocity = Vector2.ZERO
var roll_vector=Vector2.DOWN
var stats = PlayerStats
#usar un nodo aparte y simplificar la función
onready var animationPlayer=$AnimationPlayer
onready var animationTree=$AnimationTree
onready var animationState=animationTree.get("parameters/playback")
onready var swordHitbox=$HitboxPivot/SwordHitBox
onready var hurtbox=$HurtBox
func _ready():
	#stados del jugador se conectan al 
	stats.connect("no_health", self , "queue_free")
	animationTree.active = true
	#enemigo ruede
	#swordHitbox.knockback_vector=roll_vector
	
func _process(delta):
	match state:
			MOVE:
				move_state(delta)
			ROLL:
				pass
			ATTACK:
				attack_state(delta)
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	input_vector.y=Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	input_vector=input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		
		animationState.travel("Run")
		velocity=velocity.move_toward(input_vector*MAX_SPEED, ACCELERATION*delta)
		
	else:
		animationState.travel("Idle")
		velocity=velocity.move_toward(Vector2.ZERO, FRICTION*delta)
	##velocidad relativa al lag 	
	velocity = move_and_slide(velocity)
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
func attack_state(delta):
	velocity=Vector2.ZERO
	animationState.travel("Attack")
func attack_animation_finished():
	state=MOVE


func _on_HurtBox_area_entered(area):
	stats.health-=1 
	hurtbox.start_invincibility(0.5)
	hurtbox.create_hit_effect()
	var playerHurtSound=PlayerHurtSound.instance()
	get_tree().current_scene.add_child(playerHurtSound)
	# Replace with function body.
