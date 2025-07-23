extends Panel

@onready var heart_health: AnimatedSprite2D = $HeartHealth


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_hearts(full: bool):
	if full: heart_health.play("default")
	else: heart_health.play("heart_gone")
