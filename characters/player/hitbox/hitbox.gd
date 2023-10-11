extends CollisionShape2D

@onready var parry_timer = $"../../Combat/ParryTimer"
@onready var parry = $"../../Combat/Parry"

signal emit_parry_signal
signal emit_damage_taken_signal

func _ready():
	parry.emit_damage_signal.connect(get_hit)
	
func get_hit():
	emit_signal("emit_damage_taken_signal")

func _on_hit_box_area_entered(area):
	emit_signal("emit_parry_signal")

