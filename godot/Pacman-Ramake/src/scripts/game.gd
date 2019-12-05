extends Node

var game_score = 0
var life_player = 3
var alive_player = false
var vulnerable_enemy = false
var vulnerable_enemy_time = 0
var orange_alive_enemy = true
var blue_alive_enemy = true
var red_alive_enemy = true 
var orange_time_spawn = 0
var blue_time_spawn = 0
var red_time_spawn = 0
var coin = 0
var spawn = false
var request_spawn = false
var time_spawn = 0
var running_game = true
func _ready():
	spawn = true
	pass # Replace with function body.
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_home"):
		spawn = true
		pass
	if vulnerable_enemy == true:
		vulnerable_enemy_time += 1 * delta
		if vulnerable_enemy_time >= 5:
			vulnerable_enemy = false
			vulnerable_enemy_time = 0
	if coin > 141 and running_game == true:
		running_game = false
		get_tree().change_scene("res://src/scene/youwin.tscn")
	if life_player <= 0 and running_game == true:
		running_game = false
		get_tree().change_scene("res://src/scene/gameover.tscn")
	if request_spawn == true:
		time_spawn += 1 * delta
		if time_spawn >=3:
			spawn()
		
func spawn():
	request_spawn = false
	time_spawn = 0
	spawn = true
func reset_vars():
	game_score = 0
	life_player = 3
	vulnerable_enemy = false
	vulnerable_enemy_time = 0
	orange_alive_enemy = true
	blue_alive_enemy = true
	red_alive_enemy = true 
	orange_time_spawn = 0
	blue_time_spawn = 0
	red_time_spawn = 0
	coin = 0
	spawn = true
	running_game = true
    