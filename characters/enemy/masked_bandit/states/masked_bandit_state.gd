class_name MaskedBanditState
extends State

var masked_bandit: Enemy

func _ready() -> void:
	await owner.ready
	masked_bandit = owner as Enemy
	assert(masked_bandit != null)
