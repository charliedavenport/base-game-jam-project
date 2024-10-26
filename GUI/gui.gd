extends Control

const EndGameScreen = preload("res://GUI/end_game_screen.gd")

signal main_menu_pressed()
signal replay_pressed()
signal resume_pressed()

@onready var pause_menu := $PauseMenu
@onready var end_screen : EndGameScreen = $EndGameScreen

func _ready() -> void:
	reset()
	end_screen.main_menu_btn.pressed.connect(main_menu_pressed.emit)
	end_screen.replay_level_btn.pressed.connect(replay_pressed.emit)
	pause_menu.main_menu_btn.pressed.connect(main_menu_pressed.emit)
	pause_menu.resume_btn.pressed.connect(resume_pressed.emit)

func reset() -> void:
	end_screen.hide()
	pause_menu.hide()
