extends BaseShootHandler
class_name AutoPlayerShootHandler

func get_shoot_input():
	return Input.is_action_pressed("Shoot")
