extends Control


func _ready():
	pass 




func _on_play_pressed():
	get_tree().change_scene("res://src/scene/main.tscn")
	pass 

func _on_quit_pressed():
	get_tree().quit()
	pass # Replace with function body.
