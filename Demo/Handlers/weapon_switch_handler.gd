extends BaseCapability
class_name WeaponSwitchCapability

@export var weapon_handlers : Array[PackedScene]
var current_weapon_handler_index : int

func _get_weapon_switch_input_number() -> int:
	if Input.is_action_just_pressed("Weapon1"):
		return 0
	elif Input.is_action_just_pressed("Weapon2"):
		return 1
	elif Input.is_action_just_pressed("Weapon3"):
		return 2
	
	return -1

func v_setup():
	super()
	call_deferred("_set_up_handlers")

func _set_up_handlers():
	entity.add_handler(weapon_handlers[0])
	current_weapon_handler_index = entity.handler_nodes.size()-1

func v_should_activate():
	return true

func v_tick_active(delta: float) -> void:
	if _get_weapon_switch_input_number() == -1:
		return
	
	_switch_weapon(_get_weapon_switch_input_number())

func _switch_weapon(handler_index : int):
	entity.remove_handler(current_weapon_handler_index)
	current_weapon_handler_index = entity.handler_nodes.size()
	entity.add_handler(weapon_handlers[handler_index])
