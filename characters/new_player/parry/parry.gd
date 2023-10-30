extends Node2D

@onready var hit_box_shape = $"../../HitBox/HitBoxShape"
@onready var parry_timer = $"../ParryTimer"
@onready var riposte = $"../Riposte"

signal emit_damage_signal
signal emit_riposte_charge_signal

var got_hit: bool = false

func _ready():
	hit_box_shape.emit_parry_signal.connect(start_parry_timer)

func _input(event):
	handle_black_parry(event)

func handle_black_parry(event):
	if event.is_action_pressed("black"):
		if got_hit:
			got_hit = false
			parry_timer.stop()
			emit_signal("emit_riposte_charge_signal")
	elif event.is_action_released("black"):
		pass
		
func start_parry_timer():
	got_hit = true
	parry_timer.start()

func _on_parry_timer_timeout():
	got_hit = false
	emit_signal("emit_damage_signal")
