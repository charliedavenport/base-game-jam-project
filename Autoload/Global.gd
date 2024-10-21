extends Node

const mappable_inputs = [
	"up",
	"down",
	"left",
	"right"
]

@onready var is_muted := false

signal toggle_mute()
signal set_input_action_key(action_name : String, event : InputEventKey)
