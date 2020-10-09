extends Node

var score_file = "user://leader.txt"
var highscore = 0
var ran=Puntua

func load_score():
	var f = File.new()
	if f.file_exists(score_file):
		f.open(score_file, File.READ)
		var content = f.get_as_text()
		highscore = int(content)
		f.close()

func _on_TextureButton_pressed():
	var f =File.new()
	f.open(score_file, File.READ_WRITE)
	var r=str(Puntua.ran)
	var a=str(f.get_as_text())
	var loque=str($TextEdit.text)
	f.store_string(a+"|"+r+"%"+loque)
	f.close()
	get_tree().change_scene("res://Ranking.tscn")
	
func _ready():
	Puntua.sp.hide()
	Puntua.labi.hide()
	Items.cocava.hide()
	Items.cigava.hide()
	Items.alcova.hide()
	Items.cerveva.hide()
	$Label.text="Tu Puntuación fue: "+str(Puntua.ran)
