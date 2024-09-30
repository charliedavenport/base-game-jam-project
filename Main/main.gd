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

@onready var main_menu : MainMenu = $CanvasLayer/MainMenu
@onready var gui : GUI = $CanvasLayer/GUI

var player : Player
var curr_level : Level

@onready var curr_level_ind : int = 0

func _ready() -> void:
	
	start_game()

func start_game() -> void:
	print("starting game")
	load_level(0)

func load_level(level_ind: int) -> void:
	if level_ind not in range(len(level_scenes)):
		printerr("ERROR: level index out of range: %s" % level_ind)
		return
	
	if curr_level:
		curr_level.queue_free()
	
	curr_level = level_scenes[level_ind].instantiate()
	add_child(curr_level)
	
	spawn_player()

func spawn_player(location: Vector2 = Vector2.ZERO) -> void:
	if player:
		player.queue_free()
	
	player = player_scene.instantiate()
	add_child(player)
	player.global_position = location

func reset_level() -> void:
	pass

func pause() -> void:
	get_tree().paused = not get_tree().paused

func mute() -> void:
	pass
