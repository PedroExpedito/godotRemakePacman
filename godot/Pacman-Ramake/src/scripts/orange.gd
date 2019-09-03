extends KinematicBody2D
var speed = 13000
var side = 1
var motion = Vector2()
func _ready():
	randomize()
	side = 4
	pass 
func _physics_process(delta):
	if side == 1:
		motion.x = speed*delta
	elif side == 2:
		motion.x = -speed * delta
	if side == 3:
		motion.y = speed * delta
	elif side == 4:
		motion.y = -speed * delta		
	motion = move_and_slide(motion)

func _on_timer_timeout():
	$timer.set_wait_time(rand_range(0.2,0.6))
	print(side)
	side = int(rand_range(1,5))
	pass 
