extends ArmorKabutoState

@onready var enemy_animation_player = $"../../EnemyAnimationPlayer"

func physics_update(delta: float) -> void:
	armor_kabuto.velocity.x = move_toward(
		armor_kabuto.velocity.x, 
		armor_kabuto.speed * armor_kabuto.direction, 
		armor_kabuto.acceleration * delta
	)
	
	enemy_animation_player.play("patrol")
	
	armor_kabuto.move_and_slide()
	
	if armor_kabuto.is_aggressive:
		state_machine.transition_to("Attack")

func change_state():
	armor_kabuto.direction *= -1
	flip()
	state_machine.transition_to("Idle")

func flip():
	if armor_kabuto.facing_right:
		armor_kabuto.facing_right = false
	elif !armor_kabuto.facing_right:
		armor_kabuto.facing_right = true
	armor_kabuto.scale.x = abs(armor_kabuto.scale.x) * -1
