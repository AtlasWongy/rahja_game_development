extends EnemyState

@onready var masked_bandit_animation = $"../../MaskedBanditAnimation"

func enter(_msg := {}) -> void:
	enemy.velocity = Vector2.ZERO

func physics_update(_delta: float) -> void:
	masked_bandit_animation.play("hurt")
	await masked_bandit_animation.animation_finished
	enemy.get_hit = false
	state_machine.transition_to("Idle")
	
