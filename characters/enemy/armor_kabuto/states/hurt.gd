extends ArmorKabutoState

@onready var enemy_animation_player = $"../../EnemyAnimationPlayer"

func enter(_msg := {}) -> void:
	armor_kabuto.velocity = Vector2.ZERO

func physics_update(_delta: float) -> void:
	enemy_animation_player.play("hurt")
	await enemy_animation_player.animation_finished
	armor_kabuto.get_hit = false
	state_machine.transition_to("Idle")
