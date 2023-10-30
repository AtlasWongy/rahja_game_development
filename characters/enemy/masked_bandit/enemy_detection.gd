extends RayCast2D

signal aggression_signal
signal end_aggression_signal

func _physics_process(delta):
	detecting_player()

func detecting_player():
	if is_colliding():
		var collider = get_collider()
		if collider.is_in_group("player"):
			emit_signal("aggression_signal")
	else:
		emit_signal("end_aggression_signal")
