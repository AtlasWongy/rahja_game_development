extends PlayerState

@onready var riposte_timer = $RiposteTimer
@onready var player_animation = $"../../PlayerAnimation"

func enter(_msg := {}) -> void:
	riposte_timer.stop()
	for stance in player.stances:
		if player.stances[stance]:
			player_animation.play("attack_1")
			await player_animation.animation_finished
	state_machine.transition_to("Idle")
	
func exit() -> void:
	for stance in player.stances:
		player.stances[stance] = false
	print("All stances are now false: ", player.stances)
	
