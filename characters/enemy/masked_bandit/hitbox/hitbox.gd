extends CollisionShape2D

@onready var masked_bandit = $"../.."

func _on_hit_box_area_entered(area):
	masked_bandit.get_hit = true
	take_damage()
	print("The enemy health is now: ", masked_bandit.health)

func take_damage():
	masked_bandit.health -= 1
	if masked_bandit.health <= 0:
		masked_bandit.is_alive = false
