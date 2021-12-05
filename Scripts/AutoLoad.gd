extends Node

var score = 0

const FILE_NAME = "user://highscore.save"

func set_high_score(highscore):
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_var(highscore)
	file.close()
	
func get_high_score():
	var highscore = 0
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		highscore = file.get_var()
		file.close()
	else:
		highscore = 0
	
	return highscore
