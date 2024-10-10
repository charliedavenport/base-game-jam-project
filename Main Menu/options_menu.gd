extends Control

@onready var x_btn := $XButton
@onready var mute_toggle := $VBoxContainer/MuteToggle

func _ready() -> void:
	x_btn.pressed.connect(hide)
	mute_toggle.pressed.connect(Global.toggle_mute.emit)
