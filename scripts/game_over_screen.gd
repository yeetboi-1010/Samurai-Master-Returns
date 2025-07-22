extends Node2D

@onready var game_over_sound: AudioStreamPlayer2D = $GameOverSound

func _process(delta: float) -> void:
	if game_over_sound.playing == false:
		game_over_sound.play()
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Quit"):
		get_tree().quit()
	
	if event.is_action_pressed("Restart"):
		Global.reset_health()
		get_tree().change_scene_to_file("res://scenes/game.tscn")
