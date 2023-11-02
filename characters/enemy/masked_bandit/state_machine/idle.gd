extends EnemyState

@onready var idle_timer = $IdleTimer
@onready var masked_bandit_animation = $"../../MaskedBanditAnimation"

func enter(_msg := {}) -> void:
	enemy.velocity = Vector2.ZERO
	idle_timer.start()

func physics_update(_delta: float) -> void:
	masked_bandit_animation.play("idle")
	
	if !enemy.is_alive:
		idle_timer.stop()
		state_machine.transition_to("Death")
		return
	
	if enemy.get_hit:
		idle_timer.stop()
		state_machine.transition_to("Hurt")
		return
	
	if enemy.is_aggressive:
		state_machine.transition_to("Attack")

func _on_idle_timer_timeout():
	state_machine.transition_to("Patrol")
