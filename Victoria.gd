extends Node

var score_file = "user://leader.txt"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	Puntua.labi.hide()
	Puntua.sp.hide()
	Items.cocava.hide()
	Items.cigava.hide()
	Items.alcova.hide()
	Items.cerveva.hide()
	$Label.text="Tu puntuación fue: "+str(Puntua.ran)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

	
func _on_TextureButton_pressed():
	var f =File.new()
	f.open(score_file, File.READ_WRITE)
	var r=str(Puntua.ran)
	var a=str(f.get_as_text())
	var loque=str($TextEdit.text)
	f.store_string(a+"|"+r+"%"+loque)
	f.close()
	get_tree().change_scene("res://Ranking.tscn")
