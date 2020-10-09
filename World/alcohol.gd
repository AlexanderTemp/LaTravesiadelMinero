extends KinematicBody2D

onready var stats = $Statalco
onready var hurtbox=  $HurtBox
func _ready():
	stats.max_health=1
	stats.connect("no_health", self , "queue_free")
func _on_Stats_no_health():
	queue_free()


func _on_HurtBox_area_entered(area):
	stats.health-=1
	hurtbox.create_hit_effect()
