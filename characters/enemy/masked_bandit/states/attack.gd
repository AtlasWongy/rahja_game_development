extends MaskedBanditState

@onready var attack_cool_down = $AttackCoolDown
@onready var enemy_animation_player = $"../../EnemyAnimationPlayer"

func physics_update(delta: float) -> void:
	if masked_bandit.can_attack:
		enemy_animation_player.play("attack_1")
		await enemy_animation_player.animation_finished
		masked_bandit.can_attack = false
		attack_cool_down.start()
		
	if !masked_bandit.can_attack:
		state_machine.transition_to("Idle")

func _on_attack_cool_down_timeout():
	masked_bandit.can_attack = true
