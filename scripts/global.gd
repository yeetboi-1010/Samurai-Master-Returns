extends Node

@export var max_health: int = 3
@onready var current_health: int = max_health


func global_hp_reduction() -> void:
	current_health -= 1
	print(current_health)
	
	#set this for later for the game over screen
	if current_health <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
		
	else:
		pass #adust for checkpoints

func reset_health() -> void:
	current_health = max_health
