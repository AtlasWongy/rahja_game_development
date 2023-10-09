extends GutTest

var Player = load("res://characters/player/player.gd")
var _player = null

func before_each():
	_player = Player.new()

func after_each():
	_player.free()

func test_apply_gravity_not_touching_floor():
	gut.simulate(_player, 1, 0.1)
	assert_eq(_player.velocity.y, 98.0, "The velocity on the y-axis should be 98")

func test_apply_gravity_touching_floor():
	var DoubledPlayer = double(Player)
	var doubled_player = DoubledPlayer.new()
	stub(doubled_player, 'is_on_floor').to_return(true)
	assert_eq(doubled_player.is_on_floor(), true, 'The player should be on the floor')
	assert_eq(doubled_player.velocity.y, 0.0, 'The velocity on the y-axis should be 0')
	doubled_player.free()

	
	
	

	
