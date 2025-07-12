extends HBoxContainer

var heartsUI = preload("res://scenes/heart_health.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_max_hearts(max: int):
	for i in range (max):
		var heart_shown= heartsUI.instantiate()
		add_child(heart_shown)

func show_current_hearts(current_health: int):
	var hearts = get_children()
	
	for i in range(current_health):
		hearts[i].update_hearts(true)

	for i in range(current_health, hearts.size()):
		hearts[i].update_hearts(false)
