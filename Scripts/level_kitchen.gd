extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint

const PLAYER = preload("res://Scenes/player.tscn")

var quest : Dictionary

var player_instance

func _ready() -> void:
	quest = SaveManager.data["quests"]["kitchen"]
	
	if not get_tree().root.has_node("Player"):
		player_instance = PLAYER.instantiate()
		player_instance.global_position = spawn_point.global_position
		add_child(player_instance)
	else:
		player_instance = get_tree().root.get_node("Player")
		player_instance.get_parent().remove_child(player_instance)
		add_child(player_instance)
		player_instance.global_position = spawn_point.global_position
	
	while not has_node("Player"):
		await get_tree().process_frame
