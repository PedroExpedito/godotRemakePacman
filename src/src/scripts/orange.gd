extends KinematicBody2D
export var name_enemy = ""
var speed : int = 10000
var side : int = 1
var motion = Vector2()
var aleatorio : bool = true
var timer = 0
func _ready():
	randomize()
	side = 4
	pass 
func _physics_process(delta) -> void:
	if game.vulnerable_enemy == true:
		$anim.play("ghost")
	else:
		$anim.play("normal")
	
	if side == 1:
		motion.x = speed*delta
		$sprite.flip_h = false
	elif side == 2:
		motion.x = -speed * delta
		$sprite.flip_h = true
	elif side == 3:
		motion.y = speed * delta
	elif side == 4:
		motion.y = -speed * delta
	elif aleatorio == false:
		timer += 1*delta
		if timer > 6:
			aleatorio = true
			timer = 0
	if game.request_spawn == true:
		kill_all()
		pass
					
	motion = move_and_slide(motion)

func _on_timer_timeout():
	if aleatorio == true:
		$timer.set_wait_time(rand_range(0.2,0.6))
		side = int(rand_range(1,5))
func _on_down_body_entered(body):#Down
	if body.has_method("player"):
		aleatorio = false
		side = 3
func _on_up_body_entered(body):#Up
	if body.has_method("player"):
		aleatorio = false
		side = 4
func _on_left_body_entered(body):#left
	if body.has_method("player"):
		aleatorio = false
		side = 1
		
func _on_right_body_entered(body):#riht
	if body.has_method("player"):
		aleatorio = false
		side = 2
		

func _on_aura_body_entered(body):
	if body.has_method("player"):
		if game.vulnerable_enemy == false:
			game.running_game = false
			body.kill_me()
		
		else:
			if body.has_method("player"):
				self.queue_free()
				game.game_score += 10
				if self.name_enemy == "orange":
					game.orange_alive_enemy = false
				elif self.name_enemy == "blue":
					game.blue_alive_enemy = false
				elif self.name_enemy == "red":
					game.red_alive_enemy = false		
			
func kill_all():
	game.orange_alive_enemy = false
	game.blue_alive_enemy = false
	game.red_alive_enemy = false
	queue_free()	

