extends Timer

@onready var player = $"../../.."

func _on_timeout():
	for stance in player.stances:
		player.stances[stance] = false
	print("Lost your chance to counter attack")


