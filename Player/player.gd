extends CharacterBody2D


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var move_input := Input.get_vector("left", "right", "up", "down")
	velocity = move_input * 500.0
	move_and_slide()

func _die() -> void:
	print("player died!")
