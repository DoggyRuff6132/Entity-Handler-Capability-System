extends BaseCapability
class_name AccelerateCapability

var movement_handler : WASDMovementHandler

func v_setup():
	super()
	movement_handler = get_parent()


func v_should_activate() -> bool:
	if movement_handler.get_input() == Vector2.ZERO:
		return false
	
	return true

func v_should_deactivate() -> bool:
	if movement_handler.get_input() != Vector2.ZERO:
		return false
	
	return true

func v_tick_active(delta : float):
	var target_speed = movement_handler.get_input() * movement_handler.get_move_speed()
	var accel = movement_handler.get_acceleration() * delta
	
	entity.velocity = entity.velocity.move_toward(target_speed, accel) 
