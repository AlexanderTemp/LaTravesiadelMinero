extends KinematicBody2D
###PLAYERSTATS.MAX_HEALTH+=1 O =.

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
##physic se actualiza cada vez en un loop delta es cuanto toma el frame 
#delta tiene el tiempo que el ultimo frame toma en ser procesado
#delta 1/16 caida de frames 
const MAX_SPEED=80
const ACCELERATION=500
const FRICTION= 500
var velocity = Vector2.ZERO
#usar un nodo aparte y simplificar la función
onready var animationPlayer=$AnimationPlayer
onready var animationTree=$AnimationTree
onready var animationState=animationTree.get("parameters/playback")

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x=Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	input_vector.y=Input.get_action_strength("ui_down")-Input.get_action_strength("ui_up")
	input_vector=input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		velocity=velocity.move_toward(input_vector*MAX_SPEED, ACCELERATION*delta)
		
	else:
		animationState.travel("Idle")
		velocity=velocity.move_toward(Vector2.ZERO, FRICTION*delta)
	##velocidad relativa al lag 	
	velocity = move_and_slide(velocity)
