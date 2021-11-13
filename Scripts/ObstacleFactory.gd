extends Node2D

var Obstacle = preload("res://Scenes/Obstacle.tscn")

func _on_Timer_timeout():
	var obstacle = Obstacle.instance()
	add_child(obstacle)
	
func stop():
	$Timer.stop()
	
	for child in get_children():
		if child.is_in_group("obstacles"):
			child.stop()
			
func start():
	$Timer.start()
