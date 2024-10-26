extends Node2D

#region usings
const Player = preload("res://Player/player.gd")
const Level = preload("res://Levels/level.gd")
const MainMenu = preload("res://Main Menu/main_menu.gd")
const GUI = preload("res://GUI/gui.gd")
#endregion

#region scenes
const player_scene = preload("res://Player/player.tscn")
const level_scenes = [
	preload("res://Levels/level_0.tscn")
]
#endregion

enum GameState {
	MainMenu, 
	Playing, 
	Victory
}
var curr_state : GameState:
	set(value): 
		curr_state = value
		#print(curr_state)

@onready var main_menu : MainMenu = $CanvasLayer/MainMenu
@onready var gui : GUI = $CanvasLayer/GUI

var player : Player
var curr_level : Level

@onready var is_muted := false
@onready var curr_level_ind := 0

var default_input_map : Dictionary

func _ready() -> void:
	init_default_inputs()
	main_menu.play_pressed.connect(on_menu_play_pressed)
	gui.main_menu_pressed.connect(open_main_menu)
	gui.replay_pressed.connect(start_game)
	gui.resume_pressed.connect(resume)
	open_main_menu()


func open_main_menu() -> void:
	curr_state = GameState.MainMenu
	gui.hide()
	main_menu.reset()
	main_menu.show()


func _input(event : InputEvent) -> void:
	if event.is_action_pressed("pause") and curr_state == GameState.Playing:
		toggle_pause()


func on_menu_play_pressed() -> void:
	main_menu.hide()
	start_game()


func start_game() -> void:
	print("starting game")
	load_level(0)
	curr_state = GameState.Playing
	resume()


func load_level(level_ind: int) -> void:
	if level_ind not in range(len(level_scenes)):
		printerr("ERROR: level index out of range: %s" % level_ind)
		return
	
	if curr_level:
		curr_level.queue_free()
	
	curr_level = level_scenes[level_ind].instantiate()
	add_child(curr_level)
	curr_level.objective.objective_taken.connect(on_objective_taken)
	spawn_player()
	
	gui.reset()
	gui.show()


func spawn_player(location: Vector2 = Vector2.ZERO) -> void:
	if player:
		player.queue_free()
	
	player = player_scene.instantiate()
	add_child(player)
	player.global_position = location


func on_objective_taken() -> void:
	curr_level.objective.queue_free()
	gui.victory_screen.show()
	curr_state = GameState.Victory


func toggle_pause() -> void:
	if get_tree().paused:
		resume()
	else:
		pause()


func resume() -> void:
	if not get_tree().paused:
		return
	get_tree().paused = false
	gui.pause_menu.hide()


func pause() -> void:
	if get_tree().paused:
		return
	get_tree().paused = true
	gui.pause_menu.show()

func init_default_inputs() -> void:
	pass
