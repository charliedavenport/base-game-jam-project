extends Panel

signal key_input_entered(input : InputEventKey)
signal cancel_key_input()

func _input(event : InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_viewport().set_input_as_handled()
		cancel_key_input.emit()
		return
	elif event is InputEventKey and event.is_pressed():
		key_input_entered.emit(event)
		
