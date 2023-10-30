class_name Enemy
extends CharacterBody2D

@export_category("Enemy Stats")
@export var health: int
@export var is_alive: bool = true

var get_hit: bool = false
