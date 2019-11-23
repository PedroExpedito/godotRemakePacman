extends KinematicBody2D
var speed = 10000
var side = 1
var motion = Vector2()
var aleatorio = true
var timer = 0
func _ready():
	randomize()
	side = 4
	pass 
func _physics_process(delta):
	if side == 1:
		motion.x = speed*delta
	elif side == 2:
		motion.x = -speed * delta
	elif side == 3:
		motion.y = speed * delta
	elif side == 4:
		motion.y = -speed * delta
	elif aleatorio == false:
		timer += 1*delta
		if timer > 6:
			aleatorio = true
			timer = 0
					
	motion = move_and_slide(motion)

func _on_timer_timeout():
	if aleatorio == true:
		$timer.set_wait_time(rand_range(0.2,0.6))
		side = int(rand_range(1,5))
		pass 


func _on_down_body_entered(body):#Down
	if body.has_method("player"):
		aleatorio = false
		side = 3
	pass 


func _on_up_body_entered(body):#Up
	if body.has_method("player"):
		aleatorio = false
		side = 4
	pass 


func _on_left_body_entered(body):#left
	if body.has_method("player"):
		aleatorio = false
		side = 1
		pass


func _on_right_body_entered(body):#riht
	if body.has_method("player"):
		aleatorio = false
		side = 2
	pass # Replace with function body.


func _on_aura_body_entered(body):
	
	if body.has_method("player"):
		print("relou")
		game.life_player = 0
		body.queue_free()
	pass # Replace with function body.
