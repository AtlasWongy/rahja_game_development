extends CharacterBody2D

const SPEED = 100.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var navigation_agent: NavigationAgent2D
@onready var ray_cast = $RayCast2D

var original_position: Vector2 = Vector2(193, 136)
var facing_right = true
var is_aggressive = false
var target: CharacterBody2D

func _ready():
	init_ray_cast()
	flip()
	set_up_navigation()
	
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	ray_cast_detection()
	
	if is_aggressive:
		
		if navigation_agent.is_navigation_finished():
			return
		
		var current_agent_position: Vector2 = global_position
		var next_path_position: Vector2 = navigation_agent.get_next_path_position()
		
		var new_velocity: Vector2 = next_path_position - current_agent_position
		new_velocity = new_velocity.normalized()
		new_velocity = new_velocity * SPEED
		
		velocity = new_velocity
	
	if !is_aggressive:
		if navigation_agent.is_navigation_finished():
			return
		
		var current_agent_position: Vector2 = global_position
		var next_path_position: Vector2 = navigation_agent.get_next_path_position()
		
		var new_velocity: Vector2 = next_path_position - current_agent_position
		new_velocity = new_velocity.normalized()
		new_velocity = new_velocity * SPEED
		
		velocity = new_velocity
		
	move_and_slide()
	
func flip():
	facing_right = !facing_right
	scale.x = abs(scale.x) * -1

func init_ray_cast():
	ray_cast.set_rotation(-1.5708)
	ray_cast.set_target_position(Vector2(0, 50.0))

func ray_cast_detection():
	if ray_cast.is_colliding():
		var target = ray_cast.get_collider()
		be_aggressive(target.position)
	elif !ray_cast.is_colliding():
		end_aggression()
		
func set_up_navigation():
	navigation_agent.path_desired_distance = 4.0
	navigation_agent.target_desired_distance = 4.0
	
	call_deferred("actor_setup")

func actor_setup():
	await get_tree().physics_frame
	
func be_aggressive(target: Vector2):
	is_aggressive = true
	navigation_agent.target_position = Vector2(target.x + 20.0, target.y)

func end_aggression():
	is_aggressive = false
	navigation_agent.target_position = original_position
	

	
#
	
	
