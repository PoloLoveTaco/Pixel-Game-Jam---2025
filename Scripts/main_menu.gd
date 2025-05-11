extends CanvasLayer


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_continue_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/first_act.tscn")


func _on_new_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/first_act.tscn")


func _on_option_button_pressed() -> void:
	pass # Replace with function body.
