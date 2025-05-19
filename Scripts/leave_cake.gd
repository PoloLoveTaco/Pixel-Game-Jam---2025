extends Node2D

@onready var ia: InteractionArea = $"Interaction Area"

func _ready() -> void:
	ia.action_name = "leave"
	ia.interact = Callable(self, "leave")

func leave():
	SceneTransition.change_scene_slide("res://Scenes/Levels/lobby_house.tscn")
