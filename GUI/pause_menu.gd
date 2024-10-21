extends Control

@onready var main_menu_btn := $VBoxContainer/MainMenuButton
@onready var resume_btn := $VBoxContainer/ResumeButton
@onready var options_btn := $VBoxContainer/OptionsButton
@onready var options_menu := $OptionsMenu

func _ready() -> void:
	options_btn.pressed.connect(options_menu.show)
