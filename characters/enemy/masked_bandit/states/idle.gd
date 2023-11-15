extends MaskedBanditState

@onready var idle_timer = $IdleTimer
@onready var enemy_animation_player = $"../../EnemyAnimationPlayer"

func enter(_msg := {}) -> void:
	masked_bandit.velocity = Vector2.ZERO
	idle_timer.start()

func physics_update(_delta: float) -> void:
	enemy_animation_player.play("idle")
	
	if !masked_bandit.is_alive:
		idle_timer.stop()
		state_machine.transition_to("Death")
		return
	
	if masked_bandit.get_hit:
		idle_timer.stop()
		state_machine.transition_to("Hurt")
		return
	
	if masked_bandit.is_aggressive:
		state_machine.transition_to("Attack")

func _on_idle_timer_timeout():
	state_machine.transition_to("Patrol")
