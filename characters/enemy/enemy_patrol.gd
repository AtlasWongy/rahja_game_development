extends Node2D

func _on_area_2d_body_entered(body):
	if body.get_children()[2].get_child(1).has_method('change_state'):
		body.get_children()[2].get_child(1).change_state()
