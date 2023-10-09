extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var player_detection = $PlayerDetection
@onready var animation_player = $Weapon/WeaponSprite/AnimationPlayer

const SPEED = 50.0
const ACCELERATION = 800.0
const FRICTION = 1000.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 1.0
var facing_right: bool = true

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	handle_acceleration(delta)
	detect_the_player()
	handle_animation()
	move_and_slide()
	

func handle_acceleration(delta):
	velocity.x = move_toward(velocity.x, SPEED * direction, ACCELERATION * delta)
	
func change_state():
	direction *= -1
	flip()

func flip():
	if facing_right:
		facing_right = false
	elif !facing_right:
		facing_right = true
	scale.x = abs(scale.x) * -1

func handle_animation():
	if velocity.x != 0.0:
		animated_sprite_2d.play('move')
	else:
		animated_sprite_2d.play('idle')

func detect_the_player():
	if player_detection.is_colliding():
		var collider = player_detection.get_collider()
		if collider.is_in_group('player'):
			animation_player.play("swing")
			velocity.x = 0.0
	else:
		animation_player.stop()
	
	
	
