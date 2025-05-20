extends Node2D

@onready var ia: InteractionArea = $"Interaction Area"

func _ready() -> void:
	ia.action_name = "leave"
	ia.interact = Callable(self, "leave")

func leave():
	SceneTransition.change_scene_slide("res://Scenes/Levels/lobby_house.tscn")

func _save() -> Dictionary:
	return {
		"scene_path" : get_tree().current_scene.scene_file_path,
		"id"      : "LeaveCake",
		"node_path" : get_path_to(self),
		"file_path"  : get_scene_file_path(),
		"pos"     : [global_position.x, global_position.y],
	}

func _load(data: Dictionary) -> void:
	global_position = Vector2(data["pos"][0], data["pos"][1])
