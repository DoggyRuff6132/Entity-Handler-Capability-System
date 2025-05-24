extends Node
class_name WASDMovementHandler

@export var move_speed : float = 100.0
@export var time_to_max_speed : float = 0.7

func get_move_speed():
	return move_speed

func get_time_to_max_speed():
	return time_to_max_speed

func get_acceleration():
	return move_speed / time_to_max_speed

func get_input():
	var x_dir = Input.get_axis("Left", "Right")
	var y_dir = Input.get_axis("Up", "Down")
	
	return Vector2(x_dir, y_dir).normalized()
