class_name Player
extends CharacterBody2D

@export_category("Player Stats")
@export var health: int
@export var is_alive: bool = true

@export_category("Movement")
@export var speed: float = 100.0
@export var acceleration: float = 800.0
@export var friction: float = 1000.0
@export var jump_velocity: float = -300.0
@export var facing_right: bool = true

var is_hit: bool = false
var get_hit: bool = false
var stances: Dictionary = {
	"human": false,
	"phoenix": false,
	"dragon": false,
	"lion": false,
	"tortoise": false
}
