extends BaseShootHandler
class_name SemiPlayerShootHandler

func get_shoot_input():
	return Input.is_action_just_pressed("Shoot")
