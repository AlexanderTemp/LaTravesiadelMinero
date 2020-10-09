extends Node

func _ready():
	Puntua.sp.hide()
	Puntua.labi.hide()
	Items.cocava.hide()
	Items.cigava.hide()
	Items.alcova.hide()
	Items.cerveva.hide()
	
func _physics_process(delta):
	if $TextureButton.is_hovered()==true:
		$TextureButton.grab_focus()
	if $TextureButton2.is_hovered()==true:
		$TextureButton2.grab_focus()
	

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Instrucciones.tscn")


func _on_TextureButton2_pressed():
	get_tree().quit()


func _on_TextureButton3_pressed():
	get_tree().change_scene("res://Ranking.tscn")
	
