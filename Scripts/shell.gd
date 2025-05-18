extends Node2D
class_name Shell

var wife: Wife

@onready var sound: AudioStreamPlayer = $AudioStreamPlayer

@onready var ia: InteractionArea = $"Interaction Area"

var uid: String

func _ready() -> void:
	ia.interact = Callable(self, "take")
	wife = get_tree().current_scene.get_node("Wife")

func take():
	wife.shell_founded()
	sound.play()
	hide()
	await sound.finished
	queue_free()
	
func _save() -> Dictionary:
	return {
		"scene_path" : get_tree().current_scene.scene_file_path,
		"id"      : uid,
		"node_path" : get_path_to(self),
		"file_path"  : get_scene_file_path(),
		"pos"     : [global_position.x, global_position.y],
	}

func _load(data: Dictionary) -> void:
	global_position = Vector2(data["pos"][0], data["pos"][1])
