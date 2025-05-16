extends Node2D
class_name Shell

var wife: Wife

@onready var sound: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	wife = get_tree().current_scene.get_node("Wife")

func take():
	wife.shell_founded()
	sound.play()
	hide()
	await sound.finished
	queue_free()
