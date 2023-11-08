extends RayCast2D

@onready var armor_kabuto = $".."

func _physics_process(delta):
	detecting_player()

func detecting_player():
	if is_colliding():
		var collider = get_collider()
		if collider.is_in_group("player"):
			armor_kabuto.is_aggressive = true
	else:
		armor_kabuto.is_aggressive = false
