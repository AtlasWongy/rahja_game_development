class_name Enemy
extends CharacterBody2D

@export_category("Enemy Stats")
@export var health: int
@export var is_alive: bool = true

@export_category("Movement")
@export var speed: float = 50.0
@export var acceleration: float = 800.0
@export var friction: float = 1000.0
@export var direction: float = 1.0
@export var facing_right: bool = true


var get_hit: bool = false
var can_attack: bool = true
var is_aggressive: bool = false
