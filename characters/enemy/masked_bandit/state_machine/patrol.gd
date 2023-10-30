extends EnemyState

const SPEED = 50.0
const ACCELERATION = 800.0
const FRICTION = 1000.0

signal play_run_animation_signal

var facing_right: bool = true
var direction: float = 1.0

func physics_update(delta: float) -> void:
	enemy.velocity.x = move_toward(enemy.velocity.x, SPEED * direction, ACCELERATION * delta)
	emit_signal("play_run_animation_signal")
	enemy.move_and_slide()
	if state_machine.is_aggressive:
		state_machine.transition_to("Attack")

func change_state():
	direction *= -1
	flip()
	state_machine.transition_to("Idle")

func flip():
	if facing_right:
		facing_right = false
	elif !facing_right:
		facing_right = true
	enemy.scale.x = abs(enemy.scale.x) * -1
