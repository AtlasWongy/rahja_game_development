extends Node

@onready var parry_animation = $"."

var in_unbound_state = false

signal emit_riposte_charge

func _ready():
	parry_animation.play("normal")

func _input(event):
	if in_unbound_state:
		return
	handle_red_parry(event)
	handle_blue_parry(event)
	handle_white_parry(event)
	handle_black_parry(event)

func handle_red_parry(event):
	if event.is_action_pressed("red"):
		parry_animation.play("red")
	elif event.is_action_released("red"):
		parry_animation.play("normal")
		
func handle_blue_parry(event):
	if event.is_action_pressed("blue"):
		parry_animation.play("blue")
	elif event.is_action_released("blue"):
		parry_animation.play("normal")
		
func handle_white_parry(event):
	if event.is_action_pressed("white"):
		parry_animation.play("white")
	elif event.is_action_released("white"):
		parry_animation.play("normal")
		
func handle_black_parry(event):
	if event.is_action_pressed("black"):
		parry_animation.play("black")
		emit_signal("emit_riposte_charge")
	elif event.is_action_released("black"):
		parry_animation.play("normal")
