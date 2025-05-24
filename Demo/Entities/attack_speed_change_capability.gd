extends BaseCapability

var shoot_handlers : Array[BaseShootHandler]
var active_time_remaining : float = 0.0
@export var change_amount = 0.33

func v_should_activate() -> bool:
	if not Input.is_action_just_pressed("Ability1"):
		return false
	
	return true

func v_should_deactivate() -> bool:
	if active_time_remaining > 0:
		return false
	
	return true

func v_on_activate():
	active_time_remaining = active_duration
	print("Activated attack speed")
	



func v_on_deactivate():
	print("Attack speed expired")
	for handler in entity.get_handler_nodes():
		if handler is BaseShootHandler:
			handler.reset_shot_delay_multiplier()


func v_tick_active(delta : float):
	for handler in entity.get_handler_nodes():
		if handler is BaseShootHandler:
			handler.set_shot_delay_multiplier(change_amount)
	
	active_time_remaining -= delta
