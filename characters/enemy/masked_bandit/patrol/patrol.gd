extends Node2D

@onready var masked_bandit = $".."
@onready var patrol_cool_down = $PatrolCoolDown

signal change_state_signal
signal rest_signal

var random_timer_idx: int
var timings: Array = [1, 3]
var current_state: String = "patrol"

func _ready():
	start_the_timer()
	masked_bandit.turn_on_patrol_signal.connect(turn_on_patrol)
	masked_bandit.turn_off_patrol_signal.connect(turn_off_patrol)

func _on_patrol_cool_down_timeout():
	if current_state == "patrol":
		emit_signal("rest_signal")
		current_state = "rest"
	elif current_state == "rest":
		emit_signal("change_state_signal")
		current_state = "patrol"
	start_the_timer()

func generate_random_timing() -> int:
	random_timer_idx = randi() % timings.size()
	return timings[random_timer_idx]

func start_the_timer():
	patrol_cool_down.wait_time = generate_random_timing()
	patrol_cool_down.start()

func turn_on_patrol():
	start_the_timer()

func turn_off_patrol():
	patrol_cool_down.stop()



