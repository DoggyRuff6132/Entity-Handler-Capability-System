extends Node
class_name BaseCapability

# Part 1: Activation Functions
func _ready():
	v_setup()

func _physics_process(delta: float) -> void:
	if is_active():
		if v_should_deactivate():
			_deactivate()
		else:
			v_tick_active(delta)
	else:
		if v_should_activate():
			_activate()

func _notification(what):
	if (what == NOTIFICATION_PREDELETE):
		_on_owner_destroyed()

func _on_owner_destroyed():
	if is_active():
		v_on_deactivate()

func _activate():
	_active = true
	v_on_activate()

func _deactivate():
	_active = false
	v_on_deactivate()


# Part 2: Variables
@export var tags : Array[String]

var entity : Entity
var _active : bool = false
var active_duration : float = 0.0
var deactive_duration : float = 0.0

func find_entity():
	var current_node = get_parent()
	while current_node is not Entity:
		current_node = current_node.get_parent()
	entity = current_node

func is_active() -> bool:
	return _active

func is_blocked():
	if tags == null:
		return false
	
	var blocked_tags = entity.get_blocked_tags()
	for blocked_tag in blocked_tags:
		for self_tag in tags:
			if blocked_tags[blocked_tag] == self_tag:
				return true


# Part 3: Virtual Functions
func v_setup():
	find_entity()

func v_should_activate() -> bool:
	return true

func v_should_deactivate() -> bool:
	return false

func v_on_activate():
	pass

func v_on_deactivate():
	pass

func v_tick_active(delta : float):
	pass
