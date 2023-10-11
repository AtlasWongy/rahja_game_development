extends Node2D

@onready var _player = $".."

# color: Color, width: float = -1.0
func _draw() -> void:
	draw_line(
		Vector2.ZERO,
		Vector2.RIGHT * 20.0,
		Color.BLUE,
		1.0
	)
