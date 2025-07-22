extends Area2D
@onready var respawn_sfx: AudioStreamPlayer2D = $RespawnSFX

signal hp_reduction

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print("You Died!")
		respawn_sfx.play()
		emit_signal("hp_reduction")

func _ready():
	connect("hp_reduction", Global.global_hp_reduction)
	
