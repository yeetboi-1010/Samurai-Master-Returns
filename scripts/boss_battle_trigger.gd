extends Area2D
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $EnemyBoss/AnimationPlayer



func _on_area_entered(area: Area2D) -> void:
	timer.start()
	print("Boss battle entered!")

func _on_timer_timeout():
	animation_player.play("enter_animation")
