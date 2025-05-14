extends Control

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	animation_player.play("spawn")
	await animation_player.animation_finished
	get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
	
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
