extends Node2D

const Objective = preload("res://Objective/objective.gd")
const Enemy = preload("res://Enemy/enemy.gd")

@onready var objective : Objective = $Objective
@onready var enemy : Enemy = $Enemy
