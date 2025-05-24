extends Node
class_name Entity

@export var default_handlers : Array[PackedScene]
var handler_nodes = []
@onready var handler_container : Node = $"Handler Container"
func get_handler_nodes():
	return handler_nodes

@export var default_capabilities : Array[PackedScene]
var capability_nodes = []
@onready var capability_container : Node = $"Capability Container"

var blocked_tags = {}



func _ready() -> void:
	for handler : PackedScene in default_handlers:
		_instantiate_handler(handler)
	
	for capability : PackedScene in default_capabilities:
		_instantiate_capability(capability)


func block_tag(instigator, tag : String):
	blocked_tags[instigator] = tag

func unblock_tag(instigator, tag : String):
	blocked_tags.erase(instigator)

func get_blocked_tags():
	return blocked_tags


func add_handler(handler : PackedScene):
	print("Added handler " + handler.resource_path)
	_instantiate_handler(handler)

func remove_handler(handler_index : int):
	if handler_index < 0 or handler_index > handler_nodes.size()-1:
		print("Cannot remove handler at index " + str(handler_index) + " because it is out of bounds.")
		return
	
	print("Removing handler " + handler_nodes[handler_index].name)
	handler_nodes[handler_index].queue_free()
	handler_nodes.remove_at(handler_index)
	

func _instantiate_handler(handler : PackedScene):
	print("Instantiated handler " + handler.resource_path)
	var instance = handler.instantiate()
	handler_container.add_child(instance)
	handler_nodes.append(instance)
	
	for capability : BaseCapability in instance.get_children():
		capability.entity = self
		capability.v_setup()

func _instantiate_capability(capability : PackedScene):
	print("Instantiated capability " + capability.resource_path)
	var instance = capability.instantiate()
	capability_container.add_child(instance)
	capability_nodes.append(instance)
	
	instance.entity = self
	instance.v_setup()
