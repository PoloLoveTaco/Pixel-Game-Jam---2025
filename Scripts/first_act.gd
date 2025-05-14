extends Node2D

@onready var rain = $Rain
@onready var cam: Camera2D
@onready var office_door: InteractionArea = $OfficeDoor
@onready var house_door: InteractionArea = $HouseDoor
@onready var spawn_point: Node2D = $SpawnPoint
const PLAYER = preload("res://Scenes/player.tscn")

func _ready() -> void:
	var player_instance = PLAYER.instantiate()
	if GlobalVariables.is_new_game:
		player_instance.position.x = spawn_point.position.x
		player_instance.position.y = spawn_point.position.y
	add_child(player_instance)

	cam = player_instance.get_node("Camera2D")
	
	office_door.interact = Callable(self, "launch_dialog_1")
	house_door.interact = Callable(self, "go_home")


func _process(delta: float) -> void:
	rain.global_position = cam.get_canvas_transform().affine_inverse() * Vector2.ZERO
	rain.global_position.y -= 32;


func launch_dialog_1():
	Dialog.launch_dialog(Dialog.FIRST_ACT_OFFICE)


func go_home():
	get_tree().change_scene_to_file("res://Scenes/Levels/lobby_house.tscn")
