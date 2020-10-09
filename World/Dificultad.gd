extends Node
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _on_TextureButton_pressed():
	PlayerStats.set_max_health(4)
	PlayerStats.set_health(4)
	get_tree().change_scene("res://world.tscn")


func _on_TextureButton2_pressed():
	PlayerStats.set_max_health(4)
	PlayerStats.set_health(4)
	Puntua.set_ata(2)
	get_tree().change_scene("res://world.tscn")
