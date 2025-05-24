extends Entity

func _physics_process(delta: float) -> void:
	call_deferred("move_and_slide")
