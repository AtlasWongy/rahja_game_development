extends Node2D

@onready var enemy = $".."
@onready var patrol_cool_down = $PatrolCoolDown

signal change_state_signal

var random_timer_idx: int
var timings: Array = [1, 3]

func _ready():
	start_the_timer()
	enemy.turn_on_patrol_signal.connect(turn_on_patrol)
	enemy.turn_off_patrol_signal.connect(turn_off_patrol)
	
func _on_patrol_cool_down_timeout():
	emit_signal("change_state_signal")
	start_the_timer()

func generate_random_timing() -> int:
	random_timer_idx = randi() % timings.size()
	return timings[random_timer_idx]

func start_the_timer():
	patrol_cool_down.wait_time = generate_random_timing()
	patrol_cool_down.start()
	print("The wait time is now: ", patrol_cool_down.wait_time)

func turn_on_patrol():
	start_the_timer()

func turn_off_patrol():
	patrol_cool_down.stop()
