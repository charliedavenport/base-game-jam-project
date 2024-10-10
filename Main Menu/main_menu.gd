extends Control

const OptionsMenu = preload("res://Main Menu/options_menu.gd")

signal play_pressed()

@onready var options_menu := $OptionsMenu

@onready var play_btn := $VBoxContainer/PlayButton
@onready var options_btn := $VBoxContainer/OptionsButton

func _ready() -> void:
	play_btn.pressed.connect(play_pressed.emit)
	options_btn.pressed.connect(options_menu.show)

func reset() -> void:
	options_menu.hide()
