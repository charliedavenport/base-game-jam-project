extends Node2D

signal enemy_touched()

@onready var area : Area2D = $Area2D

func _ready() -> void:
	area.body_entered.connect(on_body_entered)

func on_body_entered(_body : PhysicsBody2D) -> void:
	enemy_touched.emit()
