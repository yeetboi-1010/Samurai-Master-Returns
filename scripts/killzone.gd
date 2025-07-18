extends Area2D

signal hp_reduction

func _on_body_entered(body: Node2D) -> void:
		print("You Died!")
		emit_signal("hp_reduction")

func _ready():
	connect("hp_reduction", Global.global_hp_reduction)
	
