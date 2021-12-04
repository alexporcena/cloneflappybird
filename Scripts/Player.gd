extends RigidBody2D

class_name Player

var is_playing = false
var game_over = false

signal s_game_over
signal s_game_start
signal s_game_score

func _physics_process(delta):
	if Input.is_action_just_pressed("flappy") and game_over == false:
		play()
		flappy()
	
	if rotation_degrees < -30.0:
		angular_velocity = 0.0
		rotation_degrees = -30.0
		
	if linear_velocity.y > 200.0:
		angular_velocity = 5.0
		if rotation_degrees > 90.0:
			angular_velocity = 0.0
			rotation_degrees = 90.0

func play():
	if is_playing == false:
		emit_signal("s_game_start")
		is_playing = true
		gravity_scale = 8.0
		$AnimacaoPassaro.play("fly")

func flappy():
	linear_velocity.y = -320.0
	angular_velocity = -15.0
	$Wing.play()
	
func stop():
	if game_over == false:
		$Hit.play()
	
	game_over = true
	$AnimacaoPassaro.stop()
	emit_signal("s_game_over")
	
func score():
	$Point.play()
	emit_signal("s_game_score")
