extends KinematicBody2D
var motion = Vector2()
var speed = 25000
var move = true
var life = game.life_player
func _physics_process(delta):
	if Input.is_action_pressed("ui_down") and move == false:
		motion.y = speed*delta
		move = true
	elif Input.is_action_pressed("ui_up") and move ==false:
		motion.y = -speed*delta
		move = true
	elif Input.is_action_pressed("ui_right") and move ==false:
		motion.x = speed*delta
		move = true
	elif Input.is_action_pressed("ui_left") and move ==false:
		motion.x = -speed*delta	
		move = true
	else:
		move = false
		motion = Vector2()	
		
	motion = move_and_slide(motion)
func player():
	pass