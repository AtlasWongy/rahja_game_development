extends CollisionShape2D

@onready var armor_kabuto = $"../.."

func _on_hit_box_area_entered(area):
	armor_kabuto.get_hit = true
	take_damage()
	print("The enemy health is now: ", armor_kabuto.health)

func take_damage():
	armor_kabuto.health -= 1
	if armor_kabuto.health <= 0:
		armor_kabuto.is_alive = false
