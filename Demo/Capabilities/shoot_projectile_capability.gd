extends BaseCapability
class_name ShootProjectileCapability

@export var projectile_to_shoot : PackedScene

var shoot_handler : BaseShootHandler

@export var _shot_cooldown = 0.5
var _on_shot_cooldown = false
func get_shot_cooldown():
	return _shot_cooldown * shoot_handler.get_shot_delay_modifier()


func v_setup():
	super()
	shoot_handler = get_parent()

func v_should_activate() -> bool:
	if not shoot_handler.get_shoot_input():
		return false
	if _on_shot_cooldown:
		return false
	
	return true

func v_should_deactivate() -> bool:
	
	return true

func v_on_activate():
	var proj_instance = projectile_to_shoot.instantiate()
	proj_instance.position = entity.position
	proj_instance.look_at(entity.get_global_mouse_position())
	proj_instance.set_speed_multiplier(shoot_handler.get_projectile_speed_multiplier())
	
	get_tree().root.add_child(proj_instance)
	
	_start_shot_cooldown()


func _start_shot_cooldown():
	_on_shot_cooldown = true
	await get_tree().create_timer(get_shot_cooldown()).timeout
	_on_shot_cooldown = false
