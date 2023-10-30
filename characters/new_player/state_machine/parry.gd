extends PlayerState

@onready var hit_cool_down = $"../../HitBox/HitCoolDown"
@onready var riposte_timer = $"../Riposte/RiposteTimer"

func enter(_msg := {}) -> void:
	pass

func physics_update(delta: float) -> void:
	if Input.is_action_pressed("black"):
		if player.is_hit:
			print("Parry Registered, Player Health Left: ", player.health)
			hit_cool_down.stop()
			player.is_hit = false
			player.stances["tortoise"] = true
			riposte_timer.start()
	else:
		state_machine.transition_to("Idle")
