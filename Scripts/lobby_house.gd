extends Node2D

@onready var book_1= $Book1

func _ready() -> void:
	book_1.interact = Callable(self, "_to_world_1")

func _to_world_1():
	SceneTransition.change_scene_slide("res://Scenes/level_kitchen.tscn")
