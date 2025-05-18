extends Node2D

@onready var level_kitchen: InteractionArea  = $LevelKitchen
@onready var level_beach: InteractionArea  = $LevelBeach
@onready var leaveHouse: InteractionArea  = $LeaveHouse
@onready var go_upstairs: InteractionArea = $"Go Upstairs"

@onready var spawn_point: Node2D = $SpawnPoint

const PLAYER = preload("res://Scenes/player.tscn")
var quest : Dictionary

func _ready() -> void:
	level_kitchen.interact = Callable(self, "to_kitchen_scene")
	level_beach.interact = Callable(self, "to_beach_scene")
	leaveHouse.interact = Callable(self, "leave_house")
	go_upstairs.interact = Callable(self, "_go_upstairs")
	
	quest = SaveManager.data["quests"]
	
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

func to_kitchen_scene():
	SceneTransition.change_scene_slide("res://Scenes/Levels/level_kitchen.tscn")

func to_beach_scene():
	SceneTransition.change_scene_slide("res://Scenes/Levels/level_beach.tscn")

func _go_upstairs():
	SceneTransition.change_scene_slide("res://Scenes/Levels/lobby_house_upstairs.tscn")

func leave_house():
	if quest["nb_finished"] >= quest["total"]:
		SceneTransition.change_scene_slide("res://Scenes/Levels/city.tscn")
	else:
		Dialog.launch_dialog(Dialog.CANT_LEAVE_HOUSE)
