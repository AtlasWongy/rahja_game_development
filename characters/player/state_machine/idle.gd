extends PlayerState

@onready var player_animation = $"../../PlayerAnimation"

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func enter(_msg := {}) -> void:
	player.velocity = Vector2.ZERO
	
func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		return
		
	player_animation.play("idle")

	if !player.is_alive:
		state_machine.transition_to("Death")
		return
	
	if player.get_hit:
		state_machine.transition_to("Hurt")
		
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.transition_to("Air", {do_jump = true})
		pass
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		state_machine.transition_to("Run")
		pass
	elif Input.is_action_just_pressed("black"):
		state_machine.transition_to("Parry")
		pass
	elif Input.is_action_just_pressed("riposte") and player.stances.values().has(true):
		state_machine.transition_to("Riposte")
		pass
