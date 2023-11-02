extends PlayerState

@onready var player_animation = $"../../PlayerAnimation"

func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO
	player_animation.play("death")
	await player_animation.animation_finished
	get_node("../..").queue_free()
	
