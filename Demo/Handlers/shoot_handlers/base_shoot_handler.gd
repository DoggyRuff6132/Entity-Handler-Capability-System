extends Node
class_name BaseShootHandler

var _shot_delay_multiplier = 1.0
var _projectile_speed_multiplier = 1.0


func get_shot_delay_multiplier():
	return _shot_delay_multiplier

func set_shot_delay_multiplier(value):
	_shot_delay_multiplier = value

func reset_shot_delay_multiplier():
	_shot_delay_multiplier = 1.0


func get_projectile_speed_multiplier():
	return _projectile_speed_multiplier

func set_projectile_speed_multiplier(value):
	_projectile_speed_multiplier = value

func reset_projectile_speed_multiplier():
	_projectile_speed_multiplier = 1.0


func get_shoot_input():
	pass
