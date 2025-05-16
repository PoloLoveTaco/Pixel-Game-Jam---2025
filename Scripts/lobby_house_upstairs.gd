extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint
@onready var go_downstairs: InteractionArea = $"Go Downstairs"

const PLAYER = preload("res://Scenes/player.tscn")

func _ready() -> void:
	go_downstairs.interact = Callable(self, "_go_downstairs")
	
	if GlobalVariables.is_new_game or GlobalVariables.saved_scene_name != get_tree().current_scene.scene_file_path:
		# Create the player when new game
		var player_instance = PLAYER.instantiate()
		player_instance.position.x = spawn_point.position.x
		player_instance.position.y = spawn_point.position.y
		add_child(player_instance)

func _go_downstairs():
	SceneTransition.change_scene_slide("res://Scenes/Levels/lobby_house.tscn")
