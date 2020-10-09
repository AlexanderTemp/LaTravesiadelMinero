extends Control

var hearts = 4 setget set_hearts
var max_hearts = 4 setget set_max_hearts
onready var hearthUIFull=$lleno
onready var hearthUIEmpty=$vacio
onready var batStats=$"../BatStats"
func set_hearts(value):
	hearts=clamp(value, 0, max_hearts)
	#aumenta en los pixeles de la textura
	if hearthUIFull!=null:
		hearthUIFull.rect_size.x=hearts * 15
	
func set_max_hearts(value):
	max_hearts=max(value,1)
	self.hearts=min(hearts, max_hearts)
	if hearthUIEmpty!=null:
		hearthUIEmpty.rect_size.x=max_hearts*15
	
func _ready():
	self.max_hearts = batStats.max_health
	self.hearts = batStats.health
	batStats.health=connect("health_changed", self, "set_hearts")
	batStats.max_health=connect("max_health_changed", self, "set_max_hearts")
	
