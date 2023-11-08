extends EnemyState

@onready var masked_bandit_animation = $"../../MaskedBanditAnimation"

func physics_update(delta: float) -> void:
	enemy.velocity.x = move_toward(
		enemy.velocity.x, 
		enemy.speed * enemy.direction, 
		enemy.acceleration * delta
	)
	
	masked_bandit_animation.play("patrol")
	
	enemy.move_and_slide()
	
	if enemy.is_aggressive:
		state_machine.transition_to("Attack")

func change_state():
	enemy.direction *= -1
	flip()
	state_machine.transition_to("Idle")

func flip():
	if enemy.facing_right:
		enemy.facing_right = false
	elif !enemy.facing_right:
		enemy.facing_right = true
	enemy.scale.x = abs(enemy.scale.x) * -1
