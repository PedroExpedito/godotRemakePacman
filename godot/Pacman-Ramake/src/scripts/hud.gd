extends CanvasLayer

func _process(delta):
	$score.set_text(str(game.game_score))
	$life.set_text(str(game.life_player))
	if game.running_game == false:
		$whiteblack.visible = true
	else:
		$whiteblack.visible = false