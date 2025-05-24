extends BaseCapability
class_name DecelerateCapability

@export var deceleration_multiplier = 2.0
var movement_handler : WASDMovementHandler

func v_setup():
	super()
	movement_handler = get_parent()


func v_should_activate() -> bool:
	if movement_handler.get_input() != Vector2.ZERO:
		return false
	
	return true

func v_should_deactivate() -> bool:
	if movement_handler.get_input() == Vector2.ZERO:
		return false
	
	return true

func v_tick_active(delta : float):
	entity.velocity = entity.velocity.move_toward(Vector2.ZERO, movement_handler.get_acceleration() * deceleration_multiplier * delta)
