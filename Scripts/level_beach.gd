extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint

const PLAYER = preload("res://Scenes/player.tscn")

func _ready() -> void:
	if GlobalVariables.is_new_game or GlobalVariables.saved_scene_name != get_tree().current_scene.scene_file_path:
		var player_instance = PLAYER.instantiate()
		player_instance.position.x = spawn_point.position.x
		player_instance.position.y = spawn_point.position.y
		add_child(player_instance)
