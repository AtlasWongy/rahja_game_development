extends ArmorKabutoState

@onready var enemy_animation_player = $"../../EnemyAnimationPlayer"
@onready var idle_timer = $IdleTimer

func enter(_msg := {}) -> void:
	armor_kabuto.velocity = Vector2.ZERO
	idle_timer.start()
	
func physics_update(_delta: float) -> void:
	enemy_animation_player.play("idle")
	
	if !armor_kabuto.is_alive:
		idle_timer.stop()
		state_machine.transition_to("Death")
		return
	
	if armor_kabuto.get_hit:
		idle_timer.stop()
		state_machine.transition_to("Hurt")
		return
	
	if armor_kabuto.is_aggressive:
		state_machine.transition_to("Attack")

func _on_idle_timer_timeout():
	state_machine.transition_to("Patrol")
