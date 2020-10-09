extends Label
onready var cambia="" setget actua
func _ready():
	self.text="Puntuación: "+str(Puntua.ran)
func actua(cambia):
	self.text="Puntuación: "+str(cambia)

