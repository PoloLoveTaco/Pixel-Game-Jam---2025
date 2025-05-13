extends CanvasLayer

func _ready() -> void:
	return
	GlobalVariables.bw_amount = 1.0

func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_continue_button_pressed() -> void:
	SceneTransition.change_scene_dissolve("res://Scenes/intro_first_act.tscn")


func _on_new_game_button_pressed() -> void:
	SceneTransition.change_scene_dissolve("res://Scenes/intro_first_act.tscn")


func _on_option_button_pressed() -> void:
	pass # Replace with function body.
