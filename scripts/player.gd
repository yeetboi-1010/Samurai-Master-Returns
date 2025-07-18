extends CharacterBody2D

class_name Player


const SPEED = 150.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var swords_hitbox: CollisionShape2D = $SwordHitbox/SwordsHitbox
@onready var coyote_timer: Timer = $CoyoteTimer
@onready var sword_hitbox: Area2D = $SwordHitbox


var attack_ready = true
var can_coyote_jump = false

signal attack_triggered

func _ready():
	self.connect("attack_triggered", Callable(self, "_on_attack_triggered"))
	Global.player_check = self

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor() || can_coyote_jump:
			velocity.y = JUMP_VELOCITY
			if can_coyote_jump:
				can_coyote_jump = false
				print("Coyote Jump")
	
	#Handle attack initial
	if Input.is_action_just_pressed("Attack") and attack_ready:
		emit_signal("attack_triggered")
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite.flip_h = false
		swords_hitbox.scale.x = 1
	elif direction < 0:
		animated_sprite.flip_h = true
		swords_hitbox.scale.x = -1
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var was_on_floor = is_on_floor()
	move_and_slide()
	if was_on_floor && !is_on_floor() && velocity.y >= 0:
		can_coyote_jump = true
		coyote_timer.start()

func _on_coyote_timer_timeout() -> void:
	can_coyote_jump = false


func _on_attack_triggered():
	$AnimatedSprite2D.play("attack")
	swords_hitbox.disabled = false
	
	await get_tree().physics_frame
	
	var overlapping_objects = sword_hitbox.get_overlapping_areas()
	
	for area in overlapping_objects:
		var parent = area.get_parent()
		if parent.is_in_group("Enemies"):
			parent.queue_free()
		
		elif parent.is_in_group("Enemies2"):
			parent.enemy_medium_take_damage(1)
		
		elif parent.is_in_group("Enemies3"):
			parent.enemy_boss_take_damage(1)
		#adjusted to only work if the hitbox detects an enemy in the group Enemies


func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "attack":
		$AnimatedSprite2D.play("idle")
		swords_hitbox.disabled = true
