extends Control

signal main_menu_pressed()
signal replay_pressed()
signal resume_pressed()

@onready var pause_menu := $PauseMenu
@onready var victory_screen := $VictoryScreen

func _ready() -> void:
	reset()
	victory_screen.main_menu_btn.pressed.connect(main_menu_pressed.emit)
	victory_screen.replay_level_btn.pressed.connect(replay_pressed.emit)
	pause_menu.main_menu_btn.pressed.connect(main_menu_pressed.emit)
	pause_menu.resume_btn.pressed.connect(resume_pressed.emit)

func reset() -> void:
	victory_screen.hide()
	pause_menu.hide()
