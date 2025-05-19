extends CharacterBody2D

@export var speed: float = 300

func _ready() -> void:
	pass

func get_input() -> void:
	var input_direction: Vector2 = Input.get_vector("left", "right", "up", "down")
	input_direction.y = 0
	velocity = input_direction * speed

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
