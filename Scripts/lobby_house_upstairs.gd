extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint
@onready var go_downstairs: InteractionArea = $"Go Downstairs"
@onready var box: InteractionArea = $Box
@onready var toilet: InteractionArea = $Toilet
@onready var animation_player: AnimationPlayer = $AnimationPlayer

const PLAYER = preload("res://Scenes/player.tscn")

func _ready() -> void:
	go_downstairs.interact = Callable(self, "_go_downstairs")
	box.interact = Callable(self, "_interact_box")
	toilet.interact = Callable(self, "_interact_toilet")
	
	if not get_tree().root.has_node("Player"):
		var player_instance = PLAYER.instantiate()
		player_instance.global_position = spawn_point.global_position
		add_child(player_instance)
	else:
		var player_instance = get_tree().root.get_node("Player")
		player_instance.get_parent().remove_child(player_instance)
		add_child(player_instance)
		player_instance.global_position = spawn_point.global_position

func _go_downstairs():
	SceneTransition.change_scene_slide("res://Scenes/Levels/lobby_house.tscn")

func _interact_box():
	Dialog.launch_dialog(Dialog.BABY_BOX)

func _interact_toilet():
	GlobalVariables.is_in_cinematic = true
	animation_player.play("toilet")
	await animation_player.animation_finished
	GlobalVariables.is_in_cinematic = false
