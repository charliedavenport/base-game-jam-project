@tool
extends Button

## must match the input name in project settings
@export var input_event_name : String
## name to show the player
@export var input_display_name : String

@onready var name_label : Label = $MarginContainer/HBoxContainer/NameLabel
@onready var input_label : Label = $MarginContainer/HBoxContainer/InputLabel

var key_label : Key 

func _ready() -> void:
	name_label.text = input_display_name + ":"
	refresh_key_label()

func refresh_key_label() -> void:
	var action_events : Array[InputEvent] = InputMap.action_get_events(input_event_name)
	if action_events:
		var input_event : InputEventKey = action_events[0]
		var key_char := str(char(input_event.unicode)).to_upper()
		if key_char and key_char.strip_edges() != "":
			input_label.text = key_char
		else:
			input_label.text = OS.get_keycode_string(input_event.physical_keycode)
