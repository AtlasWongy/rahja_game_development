extends EnemyState

@onready var attack_cool_down = $AttackCoolDown
@onready var masked_bandit_animation = $"../../MaskedBanditAnimation"

signal play_attack_animation_signal

var can_attack: bool = true

func enter(_msg := {}) -> void:
	pass

func physics_update(delta: float) -> void:
	if can_attack:
		masked_bandit_animation.play("attack")
		await masked_bandit_animation.animation_finished
		can_attack = false
		attack_cool_down.start()
	if !can_attack:
		state_machine.transition_to("Idle")

func _on_attack_cool_down_timeout():
	can_attack = true
