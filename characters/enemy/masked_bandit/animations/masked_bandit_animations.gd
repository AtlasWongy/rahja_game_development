extends AnimationPlayer

@onready var idle = $"../StateMachine/Idle"
@onready var patrol = $"../StateMachine/Patrol"
@onready var attack = $"../StateMachine/Attack"

func _ready():
	idle.play_idle_animation_signal.connect(play_idle_animation)
	patrol.play_run_animation_signal.connect(play_patrol_animation)
	
func play_idle_animation():
	play("idle")

func play_patrol_animation():
	play("patrol")
