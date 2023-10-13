extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var player_detection = $PlayerDetection
@onready var animation_player = $Weapon/WeaponSprite/AnimationPlayer
@onready var cool_down = $CoolDown
@onready var patrol = $Patrol

const SPEED = 50.0
const ACCELERATION = 800.0
const FRICTION = 1000.0

signal turn_on_patrol_signal
signal turn_off_patrol_signal

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 1.0
var facing_right: bool = true
var can_attack: bool = true

func _ready():
	patrol.change_state_signal.connect(change_state)
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	handle_acceleration(delta)
	detect_the_player()
	handle_animation()
	move_and_slide()

func handle_acceleration(delta):
	velocity.x = move_toward(velocity.x, SPEED * direction, ACCELERATION * delta)

func detect_the_player():
	if player_detection.is_colliding():
		var collider = player_detection.get_collider()
		print("I knocked into: ", player_detection.get_collider())
		if collider == null or !collider.is_in_group('player'):
			return
		if collider.is_in_group('player') and can_attack:
			emit_signal("turn_off_patrol_signal")
			animation_player.play("swing")
			velocity.x = 0.0
			can_attack = false
			cool_down.start()
		elif collider.is_in_group('player'):
			velocity.x = 0.0
	else:
		animation_player.stop()

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

func _on_cool_down_timeout():
	can_attack = true
