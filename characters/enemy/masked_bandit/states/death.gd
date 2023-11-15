extends MaskedBanditState

@onready var enemy_animation_player = $"../../EnemyAnimationPlayer"


func enter(_msg := {}) -> void:
	enemy_animation_player.play("death")
	await enemy_animation_player.animation_finished
	get_node("../..").queue_free()


