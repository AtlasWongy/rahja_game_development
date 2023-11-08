class_name ArmorKabutoState
extends State

var armor_kabuto: Enemy

func _ready() -> void:
	await owner.ready
	armor_kabuto = owner as Enemy
	assert(armor_kabuto != null)
