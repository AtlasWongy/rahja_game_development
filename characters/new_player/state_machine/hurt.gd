extends PlayerState

@onready var player_animation = $"../../PlayerAnimation"

func enter(_msg := {}) -> void:
	print("I am currently getting hit?: ", player.is_hit)
	print("I am receiving damage now?: ", player.get_hit)
	
func physics_update(delta: float) -> void:
	player_animation.play("hurt")
	player.get_hit = false
	await player_animation.animation_finished
	state_machine.transition_to("Idle")
	
	
	
	
	
#	if Input.is_action_just_pressed("ui_accept"):
#		state_machine.transition_to("Air", {do_jump = true})
#		pass
#	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
#		state_machine.transition_to("Run")
#		pass
