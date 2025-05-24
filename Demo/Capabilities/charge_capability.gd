extends BaseCapability
class_name ChargeShootCapabiility

var charge_shoot_handler : ChargePlayerShootHandler
@export var charge_speed = 1.0
func get_charge_speed():
	return charge_speed

func v_setup():
	super()
	charge_shoot_handler = get_parent()

func v_should_activate() -> bool:
	if not charge_shoot_handler.get_charge_input():
		return false
	
	return true

func v_should_deactivate() -> bool:
	if charge_shoot_handler.get_charge_input():
		return false
	
	return true

func v_on_deactivate():
	charge_shoot_handler.reset_charge()

func v_tick_active(delta : float):
	charge_shoot_handler.add_charge_clamped(get_charge_speed() * delta)
