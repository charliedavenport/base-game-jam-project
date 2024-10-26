extends Node

const Options = preload("res://Autoload/Options.gd")
const default_options = preload("res://Autoload/DefaultOptions.tres")

# these all need to match the input names in project settings exactly
const mappable_inputs = [
	"up",
	"down",
	"left",
	"right",
	"pause"
]

var current_options : Options
var default_inputs : Dictionary

func _ready() -> void:
	reset_options()
	init_default_inputs()

func toggle_mute() -> void:
	current_options.is_muted = not current_options.is_muted

func reset_options() -> void:
	current_options = default_options.duplicate()

func init_default_inputs() -> void:
	for input_name : String in mappable_inputs:
		var input_event : InputEvent = InputMap.action_get_events(input_name)[0]
		default_inputs[input_name] = input_event

func reset_inputs() -> void:
	if not default_inputs:
		printerr("called reset_default_inputs but default_inputs is NULL")
		return
	
	for input_name : String in mappable_inputs:
		var default_input : InputEvent = default_inputs[input_name]
		InputMap.action_erase_events(input_name)
		InputMap.action_add_event(input_name, default_input)

func set_input_action_key(action_name : String, event : InputEventKey) -> void:
	#print("setting action %s to input event %s" % [action_name, event])
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, event)
