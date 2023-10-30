extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#extends Node2D
#
#@export var health: int = 3
#@onready var hit_box_shape = $"../HitBox/HitBoxShape"
#
#func _ready():
#	hit_box_shape.emit_damage_taken_signal.connect(take_damage)
#
#func take_damage():
#	health -= 1
#	if health <= 0:
#		get_parent().queue_free()
