extends KinematicBody2D
onready var cocava=$CanvasLayer/Sprite4
onready var cigava=$CanvasLayer/Sprite3
onready var alcova=$CanvasLayer/Sprite
onready var cerveva=$CanvasLayer/Sprite2

onready var cocalleno=$CanvasLayer/Sprite8
onready var cigarrolleno=$CanvasLayer/Sprite7
onready var cervelleno=$CanvasLayer/Sprite6
onready var alcolleno=$CanvasLayer/Sprite5

func cocal():
	cocalleno.show()
	cocava.hide()
func cigal():
	cigarrolleno.show()
	cigava.hide()
func cervel():
	cervelleno.show()
	cerveva.hide()
func alcol():
	alcolleno.show()
	alcova.hide()
	


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Sp1rite8_visibility_changed():
	pass # Replace with function body.
