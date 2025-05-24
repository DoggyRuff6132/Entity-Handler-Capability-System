extends BaseShootHandler
class_name ChargePlayerShootHandler

var charge_proportion = 0.0

func get_projectile_speed_multiplier():
	return charge_proportion

func get_shoot_input():
	return Input.is_action_just_released("Shoot")

func get_charge_input():
	return Input.is_action_pressed("Shoot")

func add_charge_clamped(amount):
	charge_proportion = clamp(charge_proportion + amount, 0.0, 1.0)

func reset_charge():
	charge_proportion = 0.0
