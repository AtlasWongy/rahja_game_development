extends EnemyState

@onready var idle_timer = $IdleTimer

signal play_idle_animation_signal

func enter(_msg := {}) -> void:
	enemy.velocity = Vector2.ZERO
	idle_timer.start()

func physics_update(_delta: float) -> void:
	emit_signal("play_idle_animation_signal")
	
	if !enemy.is_alive:
		idle_timer.stop()
		state_machine.transition_to("Death")
		return
	
	if enemy.get_hit:
		idle_timer.stop()
		state_machine.transition_to("Hurt")
		return
	
	if state_machine.is_aggressive:
		state_machine.transition_to("Attack")

func _on_idle_timer_timeout():
	state_machine.transition_to("Patrol")
