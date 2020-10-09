extends Node
var ran=0 setget set_ran
var fin=0 setget set_fin
var coca=0 setget set_coca
var cerve=0 setget set_cerve
var alco=0 setget set_alco
var ciga=0 setget set_ciga
var ataque=1 setget set_ata
onready var labi=$CanvasLayer/puntos
onready var sp=$CanvasLayer/Sprite
var cal = load("res://puntual.gd").new()
func set_ran(more):
	ran+=more
	print(ran)
	cal.acta(ran)
	labi.text="Puntos: " +  str(ran)
func actualiza():
	labi.text=str(ran)
func set_ata(vari):
	ataque=vari
func set_fin(mas):
	ran+=200
	labi.text="Puntos: "+String(ran)
	fin+=mas
	print(fin)
	if fin==4:
		get_tree().change_scene("res://Victoria.tscn")

func set_coca(num):
	coca=1
func set_cerve(num):
	cerve=1
func set_alco(num):
	alco=1
func set_ciga(num):
	ciga=1

func _ready():
	labi.text="Puntos: "+String(ran)

func _on_Pen_renamed():
	labi.text=str(ran)
