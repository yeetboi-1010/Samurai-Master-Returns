extends Node

@onready var hearts_container: HBoxContainer = $"../HeartsContainer"

func _ready() -> void:
	hearts_container.set_max_hearts(3)
