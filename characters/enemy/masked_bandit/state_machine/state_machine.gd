class_name StateMachine
extends Node

signal transitioned(state_name)

@export var initial_state := NodePath()

@onready var state: State = get_node(initial_state)
@onready var enemy_detection = $"../EnemyDetection"

var is_aggressive: bool = false

func _ready() -> void:
	enemy_detection.aggression_signal.connect(enter_aggression)
	enemy_detection.end_aggression_signal.connect(exit_aggression)
	await owner.ready
	for child in get_children():
		child.state_machine = self
	state.enter()
	
func _process(delta: float) -> void:
	state.update(delta)

func _physics_process(delta: float) -> void:
	state.physics_update(delta)
	
func transition_to(target_state_name: String, msg: Dictionary = {}) -> void:
	if not has_node(target_state_name): 
		return
	
	state.exit()
	state = get_node(target_state_name)
	state.enter(msg)
	emit_signal("transitioned", state.name)

func enter_aggression():
	is_aggressive = true

func exit_aggression():
	is_aggressive = false
