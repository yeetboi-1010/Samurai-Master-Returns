extends Node2D

class_name Checkpoint

@export var spawnpoint = false
var activated = false
@onready var checkpoint_sfx: AudioStreamPlayer2D = $CheckpointSFX


func activate():
	Global.current_checkpoint = self
	activated = true
	print("Activated!")
	checkpoint_sfx.play()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is Player && !activated:
		activate()
