extends Node2D

@onready var book_1= $Book1
@onready var beach_level = $BeachLevel
@onready var leaveHouse = $LeaveHouse
@onready var go_upstairs: InteractionArea = $"Go Upstairs"

@onready var spawn_point: Node2D = $SpawnPoint

const PLAYER = preload("res://Scenes/player.tscn")

func _ready() -> void:
	connect("tree_exiting", Callable(SaveManager, "on_change_scene").bind(self))
	book_1.interact = Callable(self, "_to_world_1")
	beach_level.interact = Callable(self, "_to_beach_scene")
	leaveHouse.interact = Callable(self, "launch_dialog_cant_leave")
	go_upstairs.interact = Callable(self, "_go_upstairs")
	
	if not get_tree().root.has_node("Player"):
		var player_instance = PLAYER.instantiate()
		player_instance.global_position = spawn_point.global_position
		add_child(player_instance)
	else:
		var player_instance = get_tree().root.get_node("Player")
		player_instance.get_parent().remove_child(player_instance)
		add_child(player_instance)
		player_instance.global_position = spawn_point.global_position
	

func _to_world_1():
	SceneTransition.change_scene_slide("res://Scenes/Levels/level_kitchen.tscn")

func _to_beach_scene():
	SceneTransition.change_scene_slide("res://Scenes/Levels/level_beach.tscn")

func _go_upstairs():
	SceneTransition.change_scene_slide("res://Scenes/Levels/lobby_house_upstairs.tscn")

func launch_dialog_cant_leave():
	Dialog.launch_dialog(Dialog.CANT_LEAVE_HOUSE)
