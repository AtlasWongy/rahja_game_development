extends PlayerState

@onready var player_animation = $"../../PlayerAnimation"

func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		return

	var input_direction_x: float = Input.get_axis("ui_left", "ui_right")
	handle_acceleration(input_direction_x, delta)
	apply_friction(input_direction_x, delta)
	player.move_and_slide()
	player_animation.play("run", -1, 2.0, false)
	
	if player.get_hit:
		state_machine.transition_to("Hurt")
	
	if Input.is_action_just_pressed("ui_accept"):
		state_machine.transition_to("Air", {do_jump = true})
	elif is_equal_approx(player.velocity.x, 0.0):
		state_machine.transition_to("Idle")
	
func handle_acceleration(input_direction_x, delta):
	if input_direction_x:
		player.velocity.x = move_toward(
			player.velocity.x, 
			player.speed * input_direction_x, 
			player.acceleration * delta
		)
	if input_direction_x < 0.0 and player.facing_right:
		player.scale.x = abs(player.scale.x) * -1
		player.facing_right = false
	elif input_direction_x > 0.0 and !player.facing_right:
		player.scale.x = abs(player.scale.x) * -1
		player.facing_right = true

func apply_friction(input_direction_x, delta):
	if input_direction_x == 0:
		player.velocity.x = move_toward(
			player.velocity.x, 
			0, 
			player.friction * delta
		)
