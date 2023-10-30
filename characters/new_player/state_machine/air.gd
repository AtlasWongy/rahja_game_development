extends PlayerState

@onready var player_animation = $"../../PlayerAnimation"

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func enter(msg := {}) -> void:
	if msg.has("do_jump"):
		player.velocity.y = player.jump_velocity
		player_animation.play("jump")
	
func physics_update(delta: float) -> void:
	apply_gravity(delta)
	var input_direction_x: float = Input.get_axis("ui_left", "ui_right")
	handle_acceleration(input_direction_x, delta)
	apply_friction(input_direction_x, delta)
	player.move_and_slide()
	player_animation.play("jump")
	
	if player.get_hit:
		state_machine.transition_to("Hurt")
	
	if player.is_on_floor():
		if is_equal_approx(player.velocity.x, 0.0):
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")

func apply_gravity(delta):
	if not player.is_on_floor():
		player.velocity.y += gravity * delta
	
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
