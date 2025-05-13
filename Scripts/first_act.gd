extends Node2D

@onready var rain = $Rain
@onready var cam = $Player/Camera2D
@onready var office_door: InteractionArea  = $OfficeDoor

func _ready() -> void:
	office_door.interact = Callable(self, "launch_dialog_1")
	pass

func _process(delta: float) -> void:
	rain.global_position = cam.get_canvas_transform().affine_inverse() * Vector2.ZERO
	rain.global_position.y -= 32;

func launch_dialog_1():
	Dialog.launch_dialog(Dialog.FIRST_ACT_OFFICE)
