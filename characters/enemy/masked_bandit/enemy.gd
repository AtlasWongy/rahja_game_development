class_name Enemy
extends CharacterBody2D

@export_category("Enemy Stats")
@export var health: int
@export var is_alive: bool = true

@export_category("Movement")
@export var speed: float = 50.0
@export var acceleration: float = 800.0
@export var friction: float = 1000.0

var get_hit: bool = false
