extends EnemyState

@onready var masked_bandit_animation = $"../../MaskedBanditAnimation"

func enter(_msg := {}) -> void:
	masked_bandit_animation.play("death")
	await masked_bandit_animation.animation_finished
	get_node("../..").queue_free()


