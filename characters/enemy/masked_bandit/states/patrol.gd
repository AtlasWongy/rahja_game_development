extends MaskedBanditState

@onready var enemy_animation_player = $"../../EnemyAnimationPlayer"

func physics_update(delta: float) -> void:
	masked_bandit.velocity.x = move_toward(
		masked_bandit.velocity.x, 
		masked_bandit.speed * masked_bandit.direction, 
		masked_bandit.acceleration * delta
	)
	
	enemy_animation_player.play("patrol")
	
	masked_bandit.move_and_slide()
	
	if masked_bandit.is_aggressive:
		state_machine.transition_to("Attack")

func change_state():
	masked_bandit.direction *= -1
	flip()
	state_machine.transition_to("Idle")

func flip():
	if masked_bandit.facing_right:
		masked_bandit.facing_right = false
	elif !masked_bandit.facing_right:
		masked_bandit.facing_right = true
	masked_bandit.scale.x = abs(masked_bandit.scale.x) * -1
