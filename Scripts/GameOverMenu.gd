extends CanvasLayer

func _ready():
	$LabelScore.text = str(AutoLoad.score)
	$LabelBest.text = str(AutoLoad.get_high_score())

func _on_ButtonRestart_pressed():
	get_tree().change_scene("res://Scenes/Game.tscn")
