extends CharacterBody2D

const SPEED = 100.0
const ACCELERATION = 800.0
const FRICTION = 1000.0
const JUMP_VELOCITY = -300

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_getting_hit: bool = false
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var timer = $Timer

func _physics_process(delta):
	apply_gravity(delta)
	handle_jump()
	var input_axis = Input.get_axis("ui_left", "ui_right")
	handle_acceleration(input_axis, delta)
	apply_friction(input_axis, delta)
	update_animations(input_axis)
	move_and_slide()
	getting_hit()
	
func apply_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_jump():
	if is_on_floor():
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
	else:
		if Input.is_action_just_pressed("ui_accept") and velocity.y < JUMP_VELOCITY / 2:
			velocity.y = JUMP_VELOCITY / 2

func handle_acceleration(input_axis, delta):
	if input_axis:
		velocity.x = move_toward(velocity.x, SPEED * input_axis, ACCELERATION * delta)

func apply_friction(input_axis, delta):
	if input_axis == 0:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

func update_animations(input_axis):
	if input_axis != 0:
		animated_sprite_2d.flip_h = (input_axis < 0)
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")

	if not is_on_floor():
		animated_sprite_2d.play("jump")
		
func getting_hit():
	if !is_getting_hit:
		return
	else:
		if Input.is_action_just_pressed("red"):
			print("Parried using phoenix")
			is_getting_hit = false
			timer.stop()
		if Input.is_action_just_pressed("blue"):
			print("Parried using dragon")
			is_getting_hit = false
			timer.stop()
		if Input.is_action_just_pressed("white"):
			print("Parried using lion")
			is_getting_hit = false
			timer.stop()
		if Input.is_action_just_pressed("black"):
			print("Parried using tortoise")
			is_getting_hit = false
			timer.stop()
		
func _on_area_2d_area_entered(area):
	if area.is_in_group("weapon"):
		is_getting_hit = true
		timer.start()
		
func _on_timer_timeout():
	print("I will now receive damage")
	is_getting_hit = false
