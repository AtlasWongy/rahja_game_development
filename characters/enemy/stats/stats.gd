extends Node2D

@export var health: int = 3
@onready var hit_box_shape = $"../HitBox/HitBoxShape"

func _ready():
	hit_box_shape.enemy_take_damage_signal.connect(take_damage)
	
func take_damage():
	health -= 1
	if health <= 0:
		get_parent().queue_free()
