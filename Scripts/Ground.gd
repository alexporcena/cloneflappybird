extends StaticBody2D

var game_over = false

func _on_GroundArea_body_entered(body):
	if body is Player and game_over == false:
		game_over = true
		body.stop()
		body.sleeping = true

func stop():
	$AnimationPlayer.stop()
