extends BaseCapability

#var xxxx_handler : xxxxHandler

func v_setup():
	#xxxx_handler = get_parent()
	super()

func v_should_activate() -> bool:
	if true:
		return false
	
	return true

func v_should_deactivate() -> bool:
	if true:
		return false
	
	return true

func v_on_activate():
	#print("On Activated")
	pass

func v_on_deactivate():
	#print("On Deactivated")
	pass

func v_tick_active(delta : float):
	#print("Tick Active")
	pass
