extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var score_file = "user://dialog.txt"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_hurtcam_area_entered(area):
	var f = File.new()
	f.open(score_file, File.READ)
	var content = str(f.get_as_text())
	var list=content.split("|")
	var n=len(list)
	var ra=randi()%n
	if ra==n:
		 ra-=1
	$CanvasLayer/Label.text=String(list[ra])
	$CanvasLayer/Sprite.show()
	$CanvasLayer/Label.show()
	yield(get_tree().create_timer(7),"timeout")
	$CanvasLayer/Sprite.hide()
	$CanvasLayer/Label.hide()
