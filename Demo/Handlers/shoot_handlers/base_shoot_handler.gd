extends Node
class_name BaseShootHandler

var _shot_delay_modifier = 1.0

func get_shot_delay_modifier():
	return _shot_delay_modifier

func get_shoot_input():
	pass

func get_projectile_speed_multiplier():
	return 1.0
