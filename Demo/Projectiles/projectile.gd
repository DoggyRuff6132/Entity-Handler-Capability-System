extends Node2D
class_name Projectile

@export var _lifetime = 3.0
@export var _speed = 250.0
var _speed_multiplier = 1.0

func _ready() -> void:
	_lifetime_expire()

func _physics_process(delta: float) -> void:
	position += Vector2.from_angle(rotation) * _speed * _speed_multiplier * delta

func _lifetime_expire():
	await get_tree().create_timer(_lifetime).timeout
	queue_free()

func set_speed_multiplier(amount):
	_speed_multiplier = amount
