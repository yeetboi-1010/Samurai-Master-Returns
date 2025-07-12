extends Node

@onready var hearts_container: HBoxContainer = $"../Player/Camera2D/HeartsContainer"




func _ready() -> void:
	hearts_container.set_max_hearts(Global.current_health)
