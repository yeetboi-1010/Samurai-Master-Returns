extends Node2D

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var boss_attackable: Timer = $BossAttackable
@onready var danger: CollisionShape2D = $Killzone/danger
@onready var collision_shape_2d: CollisionShape2D = $Trigger/CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

@onready var trigger: Area2D = $Trigger

var enemy_boss_hp: int = 15



func _ready() -> void:
	danger.disabled = true
	collision_shape_2d.disabled = false



func enemy_boss_take_damage(amount: int):
	enemy_boss_hp -= amount
	animated_sprite_2d.play("hurt")
	await animated_sprite_2d.animation_finished
	animated_sprite_2d.play("idle")
	print(enemy_boss_hp)
	if enemy_boss_hp <= 0:
		queue_free()

func _on_trigger_area_entered(area: Area2D) -> void: #1
	if area.get_parent() is Player:
		timer.start()
		print("Boss battle entered!")

func _on_timer_timeout() -> void: #2
	collision_shape_2d.disabled = true
	animation_player.play("enter_animation")
	await animation_player.animation_finished
	boss_attackable.start()



func _on_boss_attackable_timeout() -> void: #3
	danger.disabled = false
	animation_player.play("idle_boss_anim")
