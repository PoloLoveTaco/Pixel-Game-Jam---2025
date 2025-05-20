extends Node2D

@onready var level_kitchen: InteractionArea  = $LevelKitchen
@onready var level_beach: InteractionArea  = $LevelBeach
@onready var leaveHouse: InteractionArea  = $LeaveHouse
@onready var go_upstairs: InteractionArea = $"Go Upstairs"
@onready var phone: InteractionArea = $Phone

@onready var spawn_point: Node2D = $SpawnPoint
@onready var spawn_phone: Node2D = $SpawnPhone
@onready var spawn_beach: Node2D = $SpawnBeach
@onready var spawn_kitchen: Node2D = $SpawnKitchen

@onready var wife: Wife = $Wife

const PLAYER = preload("res://Scenes/player.tscn")

func _ready() -> void:
	level_kitchen.interact = Callable(self, "to_kitchen_scene")
	level_beach.interact = Callable(self, "to_beach_scene")
	leaveHouse.interact = Callable(self, "leave_house")
	go_upstairs.interact = Callable(self, "_go_upstairs")
	phone.interact = Callable(self, "to_phone_scene")
	
	if SaveManager.get_nb_quest_finished() == SaveManager.data["quests"]["total"]:
		wife.queue_free()
	
	if SaveManager.get_nb_quest_finished() == (SaveManager.data["quests"]["total"] - 1):
		SceneTransition.change_scene_slide("res://Scenes/Levels/final_goodbye.tscn")
	
	if not get_tree().root.has_node("Player"):
		var player_instance = PLAYER.instantiate()
		player_instance.global_position = get_spawn()
		add_child(player_instance)
	else:
		var player_instance = get_tree().root.get_node("Player")
		player_instance.get_parent().remove_child(player_instance)
		player_instance.global_position = get_spawn()
		add_child(player_instance)
	
func get_spawn():
	if GlobalVariables.last_scene_name == "Phone":
		return spawn_phone.global_position
	elif GlobalVariables.last_scene_name == "LevelBeach":
		return spawn_beach.global_position
	elif GlobalVariables.last_scene_name == "LevelKitchen":
		return spawn_kitchen.global_position
	else:
		return spawn_point.global_position

func _to_world_1():
	SceneTransition.change_scene_slide("res://Scenes/Levels/level_kitchen.tscn")

func to_kitchen_scene():
	SceneTransition.change_scene_slide("res://Scenes/Levels/level_kitchen.tscn")

func to_beach_scene():
	SceneTransition.change_scene_slide("res://Scenes/Levels/level_beach.tscn")

func _go_upstairs():
	SceneTransition.change_scene_slide("res://Scenes/Levels/lobby_house_upstairs.tscn")

func to_phone_scene():
	SceneTransition.change_scene_slide("res://Scenes/Levels/phone.tscn")

func leave_house():
	if SaveManager.get_nb_quest_finished() >= SaveManager.data["quests"]["total"]:
		SceneTransition.change_scene_slide("res://Scenes/Levels/city.tscn")
	else:
		Dialog.launch_dialog(Dialog.CANT_LEAVE_HOUSE)
