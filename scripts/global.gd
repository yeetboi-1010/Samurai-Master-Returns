extends Node

@export var max_health: int = 3
@onready var current_health: int = max_health


var current_checkpoint : Checkpoint

#alternate name for thingy idk
var player_check : Player


func _ready() -> void:
	pass

func respawn_player():
	if current_checkpoint !=null:
		player_check.position = current_checkpoint.global_position

func global_hp_reduction() -> void:
	current_health -= 1
	print(current_health)
	
	#set this for later for the game over screen
	if current_health <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
		
	else:
		Global.respawn_player()

func reset_health() -> void:
	current_health = max_health

func on_boss_defeated():
	get_tree().change_scene_to_file("res://scenes/end_screen.tscn")
