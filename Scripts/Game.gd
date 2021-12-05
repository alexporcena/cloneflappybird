extends Node2D

var new_score = 0
var GameOverMenu = preload("res://Scenes/GameOverMenu.tscn")

func _ready():
	$Player.connect("s_game_over", self, "game_over")
	$Player.connect("s_game_start", self, "start")
	$Player.connect("s_game_score", self, "score")
	
func game_over():
	$Ground.stop()
	$ObstacleFactory.stop()
	
	AutoLoad.score = new_score
	if AutoLoad.get_high_score() < new_score:
		AutoLoad.set_high_score(new_score)
	
	$HUD/Label.hide()
	
	var game_over_menu = GameOverMenu.instance()
	add_child(game_over_menu)
	
func start():
	$ObstacleFactory.start()
	
func score():
	new_score += 1
	$HUD.update_score(new_score)
