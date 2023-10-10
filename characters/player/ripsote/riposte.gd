extends Node2D

var riposte_charge = 0

@onready var emitter = $"../CollisionShape2D/ParryAnimation"

func _ready():
	emitter.emit_riposte_charge.connect(add_riposite_charge)

func _input(event):
	if event.keycode == 4194326:
		print("Send the unbound signal over")
	if event.is_action_pressed("riposte_black"):
		pass

func add_riposite_charge():
	riposte_charge += 1
	print("Current Charge: ", riposte_charge)
