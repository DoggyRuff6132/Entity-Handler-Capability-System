extends Node
class_name Entity

@export var default_handlers : Array[PackedScene]
var handler_nodes : Array[Node]

var blocked_tags = {}

# holds all the handlers in the scene tree
@onready var handler_container : Node = $"Handler Container"


func _ready() -> void:
	for handler : PackedScene in default_handlers:
		_instantiate_handler(handler)


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
