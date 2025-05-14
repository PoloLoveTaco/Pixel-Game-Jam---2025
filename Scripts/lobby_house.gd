extends Node2D

@onready var book_1= $Book1
@onready var beach_level = $BeachLevel
@onready var leaveHouse = $LeaveHouse

@onready var spawn_point: Node2D = $SpawnPoint

const PLAYER = preload("res://Scenes/player.tscn")

func _ready() -> void:
	book_1.interact = Callable(self, "_to_world_1")
	beach_level.interact = Callable(self, "_to_beach_scene")
	leaveHouse.interact = Callable(self, "launch_dialog_cant_leave")
	
	if GlobalVariables.is_new_game or GlobalVariables.saved_scene_name != get_tree().current_scene.scene_file_path:
		# Create the player when new game
		var player_instance = PLAYER.instantiate()
		player_instance.position.x = spawn_point.position.x
		player_instance.position.y = spawn_point.position.y
		add_child(player_instance)
	

func _to_world_1():
	SceneTransition.change_scene_slide("res://Scenes/Levels/level_kitchen.tscn")

func _to_beach_scene():
	SceneTransition.change_scene_slide("res://Scenes/Levels/level_beach.tscn")
	
func launch_dialog_cant_leave():
	Dialog.launch_dialog(Dialog.CANT_LEAVE_HOUSE)
