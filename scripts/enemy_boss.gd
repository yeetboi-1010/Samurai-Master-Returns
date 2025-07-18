extends Node2D

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var boss_attackable: Timer = $BossAttackable
@onready var danger: CollisionShape2D = $Killzone/danger
@onready var collision_shape_2d: CollisionShape2D = $Trigger/CollisionShape2D

@onready var trigger: Area2D = $Trigger

var enemy_boss_hp: int = 25

signal attackable_boss_signal

func _ready() -> void:
	danger.disabled = true
	collision_shape_2d.disabled = false



func enemy_boss_take_damage(amount: int):
	enemy_boss_hp -= amount
	if enemy_boss_hp <= 0:
		queue_free()

func _on_trigger_area_entered(area: Area2D) -> void: #1
	if area.get_parent() is Player:
		timer.start()
		print("Boss battle entered!")

func _on_timer_timeout() -> void: #2
	collision_shape_2d.disabled = true
	animation_player.play("enter_animation")
	boss_attackable.start()

func _on_boss_attackable_timeout() -> void: #3
	danger.disabled = false
	emit_signal("attackable_boss_signal")
	connect("attackable_boss_signal", _on_trigger_area_entered)
