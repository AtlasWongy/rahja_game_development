extends CollisionShape2D

@onready var player = $"../.."
@onready var hit_cool_down = $"../HitCoolDown"

func _on_hit_box_area_entered(area):
	player.is_hit = true
	hit_cool_down.start()

func _on_hit_cool_down_timeout():
	player.is_hit = false
	player.get_hit = true
	take_damage()

func take_damage():
	player.health -= 1
	if player.health <= 0:
		player.is_alive = false
