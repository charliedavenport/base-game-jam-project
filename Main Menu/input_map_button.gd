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
	var action_event : InputEventKey = InputMap.action_get_events(input_event_name)[0]
	input_label.text = str(char(action_event.unicode)).to_upper()
