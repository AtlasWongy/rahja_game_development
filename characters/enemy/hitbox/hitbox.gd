extends CollisionShape2D

signal enemy_take_damage_signal

func _on_hit_box_area_entered(area):
	emit_signal("enemy_take_damage_signal")
