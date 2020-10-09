extends Node
#podemos editar la maxhealth
export(int) var max_health=1 setget set_max_health
var health=max_health setget set_health
#podemos modificar con el script variables el valor máximo de la vida del jugador 
signal no_health
signal health_changed(value)
signal max_health_changed(value)

func set_max_health(value):
	max_health=value
	self.health=min(health, max_health)
	emit_signal("max_health_changed", max_health)
func set_health(value):
	health=value
	emit_signal("health_changed", health)
	if health<=0:
		Puntua.set_ran(70)
		emit_signal("no_health")
func _ready():
	self.health = max_health

#para que cada enemigo tenga su vida

