extends Node
var pre_orange_enemy = preload ("res://src/scene/orange.tscn")
var pre_blue_enemy = preload ("res://src/scene/blue.tscn")
var pre_red_enemy = preload("res://src/scene/red.tscn")
func _ready():
	spawn_orange_enemy()
	spawn_blue_enemy()
	spawn_red_enemy()
func _physics_process(delta):
	if game.orange_alive_enemy != true:
		game.orange_time_spawn += 1 * delta
		if game.orange_time_spawn >= 5:
			spawn_orange_enemy()
			game.orange_alive_enemy = true
			game.orange_time_spawn = 0
	if game.blue_alive_enemy != true:
		game.blue_time_spawn += 1 * delta
		if game.blue_time_spawn >= 5:
			spawn_blue_enemy()
			game.blue_alive_enemy = true
			game.blue_time_spawn = 0
	if game.red_alive_enemy != true:
		game.red_time_spawn += 1 * delta
		if game.red_time_spawn >= 5:
			spawn_red_enemy()
			game.red_alive_enemy = true
			game.red_time_spawn = 0
			
			
			
			
		pass	
func spawn_orange_enemy():
	var orange_enemy = pre_orange_enemy.instance()
	orange_enemy.position = $position.position
	$position.add_child(orange_enemy)
func spawn_blue_enemy():
	var blue_enemy = pre_blue_enemy.instance()
	blue_enemy.position = $position2.position
	$position2.add_child(blue_enemy)
func spawn_red_enemy():
	var red_enemy = pre_red_enemy.instance()
	red_enemy.position = $position3.position
	$position3.add_child(red_enemy)
func _on_timer_timeout():
	pass
