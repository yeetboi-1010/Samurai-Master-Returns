extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Quit"):
		get_tree().quit()
	
	if event.is_action_pressed("Restart"):
		Global.reset_health()
		get_tree().change_scene_to_file("res://scenes/game.tscn")
