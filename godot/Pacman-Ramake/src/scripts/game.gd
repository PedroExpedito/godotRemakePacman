extends Node
var game_score = 0
var life_player = 1
var oi = true
func _ready():
	pass # Replace with function body.
func _physics_process(delta):
	if game_score > 17:
		
		if oi == true:
			get_tree().change_scene("res://src/scene/youwin.tscn")
			oi = false
	if life_player <= 0:
		get_tree().change_scene("res://src/scene/gameover.tscn")
		life_player = 1
		print("gameover")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
