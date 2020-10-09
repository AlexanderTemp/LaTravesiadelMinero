extends Control

var hearts = 2 setget set_hearts
var max_hearts = 2 setget set_max_hearts
onready var batstats=$"/Enemies/BatStats.tscn"
onready var hearthUIFullEnemy=$HearthUIFullEnemy
onready var hearthUIEmptyEnemy=$HearthUIEmptyEnemy
func set_hearts(value):
	hearts=clamp(value, 0, max_hearts)
	#aumenta en los pixeles de la textura
	if hearthUIFullEnemy!=null:
		hearthUIFullEnemy.rect_size.x=hearts * 15
	
func set_max_hearts(value):
	max_hearts=max(value,1)
	self.hearts=min(hearts, max_hearts)
	if hearthUIEmptyEnemy!=null:
		hearthUIEmptyEnemy.rect_size.x=max_hearts*15
func _ready():
	self.max_hearts=batstats.max_health
	self.hearts=batstats.health
	batstats.connect("health_changed", self, "set_hearts")
	batstats.connect("max_health_changed", self, "set_max_hearts")
