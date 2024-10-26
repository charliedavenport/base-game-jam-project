extends Control

@onready var main_menu_btn := $MainMenuButton
@onready var replay_level_btn := $ReplayLevelButton
@onready var win_label := $WinLabel
@onready var fail_label := $FailLabel


func show_win() -> void:
	win_label.show()
	fail_label.hide()
	show()

func show_fail() -> void:
	win_label.hide()
	fail_label.show()
	show()
