extends Node2D

const SPEED = 80.0
var game_over = false

func _ready():
	randomize()
	var y_pos = rand_range(-150.0, 50.0)
	position = Vector2(320.0, y_pos)
	
func _physics_process(delta):
	position.x = position.x - SPEED * delta
	if position.x < -30.0:
		queue_free()

func _on_Pipe_body_entered(body):
	if body is Player and game_over == false:
		game_over = true
		body.stop()

func _on_PointArea_body_entered(body):
	if body is Player and game_over == false:
		body.score()
		
func stop():
	set_physics_process(false)
