extends Area2D
func _ready():
	pass
func _on_giantcoin_body_entered(body):

	if body.has_method("player"):
		game.vulnerable_enemy = true
		game.game_score += 5
		game.coin += 1
		queue_free()
