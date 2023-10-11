extends Node2D

const UNBOUND_STATE = 4194326

@onready var parry = $"../Parry"
@onready var weapon_animation = $"../Weapon/WeaponSprite/WeaponAnimation"

@export var riposte_charge: int = 0

func _ready():
	parry.emit_riposte_charge_signal.connect(add_riposite_charge)

func _input(event):
	if event.is_action_pressed("riposte") and riposte_charge > 0:
		weapon_animation.play("riposte")
		riposte_charge -= 1

func add_riposite_charge():
	riposte_charge += 1
