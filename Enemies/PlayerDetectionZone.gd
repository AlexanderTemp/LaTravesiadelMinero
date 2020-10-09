extends Area2D

var player  = null
###funciones para detectar movimiento del jugador
func can_see_player():
	return player !=null
	
func _on_PlayerDetectionZone_body_entered(body):
	player = body


func _on_PlayerDetectionZone_body_exited(body):
	player = null
