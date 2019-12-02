extends Node2D
var pre_player = preload("res://src/scene/pacmanplayer.tscn")
func _physics_process(delta):
	if game.spawn == true:
		spawnplayer()
		game.spawn = false
		
func spawnplayer():
	var player = pre_player.instance()
	player.position = $position.position
	$position.add_child(player)
	
