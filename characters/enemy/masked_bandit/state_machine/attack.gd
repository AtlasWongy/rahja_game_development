extends EnemyState

@onready var attack_cool_down = $AttackCoolDown
@onready var masked_bandit_animation = $"../../MaskedBanditAnimation"

func physics_update(delta: float) -> void:
	if enemy.can_attack:
		masked_bandit_animation.play("attack")
		await masked_bandit_animation.animation_finished
		enemy.can_attack = false
		attack_cool_down.start()
		
	if !enemy.can_attack:
		state_machine.transition_to("Idle")

func _on_attack_cool_down_timeout():
	enemy.can_attack = true
