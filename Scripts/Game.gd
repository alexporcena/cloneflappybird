extends Node2D

var new_score = 0

func _ready():
	$Player.connect("s_game_over", self, "game_over")
	$Player.connect("s_game_start", self, "start")
	
func game_over():
	$Ground.stop()
	$ObstacleFactory.stop()
	
func start():
	$ObstacleFactory.start()
