extends Node2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

var enemy_medium_hp: int = 2
const SPEED = 50

var enemy_medium_direction = 1

func enemy_medium_take_damage(amount: int):
	$AnimatedSprite2D.play("took_damage")
	enemy_medium_hp -= amount
	if enemy_medium_hp <= 0:
		queue_free()

func _process(delta):
	if ray_cast_right.is_colliding():
		enemy_medium_direction = -1
	
	if ray_cast_left.is_colliding():
		enemy_medium_direction = 1
	
	position.x += enemy_medium_direction * SPEED * delta
