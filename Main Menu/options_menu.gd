extends Control

const InputMapButton = preload("res://Main Menu/input_map_button.gd")

@onready var x_btn := $XButton
@onready var mute_toggle := $VBoxContainer/MuteToggle
@onready var listen_for_input_panel := $ListenForInputPanel

var listening_for_action_name : String

func _ready() -> void:
	listen_for_input_panel.set_process_input(false)
	listen_for_input_panel.hide()
	listen_for_input_panel.key_input_entered.connect(on_key_input_entered)
	listen_for_input_panel.cancel_key_input.connect(on_key_input_cancel)
	x_btn.pressed.connect(hide)
	mute_toggle.pressed.connect(Global.toggle_mute.emit)
	visibility_changed.connect(on_visibility_changed)
	for child in $VBoxContainer.get_children():
		if child is InputMapButton:
			child.pressed.connect(on_input_map_btn_pressed.bind(child.input_event_name))

func _input(event : InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		hide()

func on_visibility_changed() -> void:
	if visible:
		mute_toggle.button_pressed = Global.is_muted
	for child in $VBoxContainer.get_children():
		if child is InputMapButton:
			child.refresh_key_label()

func on_input_map_btn_pressed(event_name : String) -> void:
	listen_for_input_panel.show()
	listen_for_input_panel.set_process_input(true)
	listening_for_action_name = event_name

func on_key_input_entered(event : InputEventKey) -> void:
	listen_for_input_panel.hide()
	listen_for_input_panel.set_process_input(false)
	Global.set_input_action_key.emit(listening_for_action_name, event)
	for child in $VBoxContainer.get_children():
		if child is InputMapButton:
			child.refresh_key_label()

func on_key_input_cancel() -> void:
	listen_for_input_panel.hide()
	listen_for_input_panel.set_process_input(false)
	
