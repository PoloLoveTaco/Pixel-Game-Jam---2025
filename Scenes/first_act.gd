extends Node2D

@onready var rain = $Rain
@onready var cam = $Player/Camera2D

func _process(delta: float) -> void:
	rain.global_position = cam.get_canvas_transform().affine_inverse() * Vector2.ZERO
	rain.global_position.y -= 32;
