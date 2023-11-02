extends RayCast2D

@onready var masked_bandit = $".."

func _physics_process(delta):
	detecting_player()

func detecting_player():
	if is_colliding():
		var collider = get_collider()
		if collider.is_in_group("player"):
			masked_bandit.is_aggressive = true
	else:
		masked_bandit.is_aggressive = false
