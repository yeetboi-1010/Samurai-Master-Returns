extends Node2D
@onready var label: Label = $Label
@onready var label_3: Label = $Label3
@onready var label_2: Label = $Label2

@onready var label_4: Label = $Label4
@onready var label_5: Label = $Label5
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var quit_able = false
var restart_able = false

signal credits

func _ready() -> void:
	connect("credits", start_credits)
	label.visible = true
	label_2.visible = true
	label_3.visible = true
	
	label_4.visible = false
	label_5.visible = false
	animated_sprite_2d.visible = false
	


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("EndScreenInput"):
		label.visible = false
		label_2.visible = false
		label_3.visible = false
		
		emit_signal("credits")

func start_credits():
	label_4.visible = true
	label_5.visible = true
	animated_sprite_2d.visible = true
	
	quit_able = true
	restart_able = true

func _process(delta: float) -> void:
	if quit_able:
		if Input.is_action_pressed("Quit"):
			get_tree().quit()
	
	if restart_able:
		if Input.is_action_pressed("Restart"):
			Global.reset_health()
			get_tree().change_scene_to_file("res://scenes/game.tscn")
