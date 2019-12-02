extends CanvasLayer

func _physics_process(delta):
	$score.set_text(str(game.game_score))
	$life.set_text(str(game.life_player))