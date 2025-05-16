extends Node2D
class_name Shell

var wife: Wife

func _ready() -> void:
	wife = get_tree().current_scene.get_node("Wife")

func take():
	wife.shell_founded()
	queue_free()
