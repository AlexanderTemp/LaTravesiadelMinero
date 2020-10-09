extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score_file = "user://leader.txt"
var highscore = 0
onready var lab=$Label
onready var lab2=$Label2

# Called when the node enters the scene tree for the first time.
func _ready():
	Puntua.sp.hide()
	Puntua.labi.hide()
	Items.cocava.hide()
	Items.cigava.hide()
	Items.alcova.hide()
	Items.cerveva.hide()
	var f = File.new()
	if f.file_exists(score_file):
		f.open(score_file, File.READ)
		var content = str(f.get_as_text())
		var list=content.split("|")
		var nom=""
		var pun=""
		var i = 0
		var n=len(list)
		var j=0
		var conteo=0
		print(n)
		while i<n:
			j=i
			var mayor=-5
			var au=0
			while j<n:
				var x=list[j].split("%")
				if int(x[0])>mayor:
					mayor=int(x[0])
					au=j
				j+=1
			var aux=list[i]
			list[i]=list[au]
			list[au]=aux
			var z=list[i].split("%")
			nom+=(str(z[1])+"\n")
			pun+=(str(z[0])+"\n")
			i+=1
		print(list)
		conteo+=1
		if conteo<=22:
			lab.text=str(nom)
			lab2.text=str(pun)
		f.close()



func _on_TextureButton_pressed():
	get_tree().change_scene("res://Menu.tscn")
