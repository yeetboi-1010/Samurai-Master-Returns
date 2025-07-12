extends Area2D

@onready var timer: Timer = $Timer

signal hp_reduction

func _on_body_entered(body: Node2D) -> void:
	print("You Died!")
	emit_signal("hp_reduction")
	Engine.time_scale = 0.5
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()

func _ready():
	connect("hp_reduction", Global.global_hp_reduction)
	
