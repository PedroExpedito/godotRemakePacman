extends KinematicBody2D
var motion = Vector2()
var speed = 25000
var move = true
func _physics_process(delta):
	if Input.is_action_pressed("ui_down") and move == false:
		motion.y = speed*delta
		move = true
		$anim.play("down")
		
	elif Input.is_action_pressed("ui_up") and move ==false:
		motion.y = -speed*delta
		move = true
		$anim.play("up")
	elif Input.is_action_pressed("ui_right") and move ==false:
		motion.x = speed*delta
		move = true
		$anim.play("right")
	elif Input.is_action_pressed("ui_left") and move ==false:
		motion.x = -speed*delta	
		move = true
		$anim.play("left")
	else:
		move = false
		motion = Vector2()	
	motion = move_and_slide(motion)
func player():
	pass
func kill_me():
	if game.life_player > 0:
		game.request_spawn = true
	game.life_player -= 1
	self.queue_free()
