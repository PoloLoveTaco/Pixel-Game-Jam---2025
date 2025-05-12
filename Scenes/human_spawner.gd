extends Node2D

@onready var random_human_scene: PackedScene = preload("res://Scenes/random_human.tscn")

func _on_timer_timeout() -> void:
	var min = $SpawnMin.global_position
	var max = $SpawnMax.global_position
	var random_pos_x = randf_range(min.x, max.x)
	
	var random_human := random_human_scene.instantiate()
	
	random_human.global_position = Vector2(random_pos_x, min.y)
	get_tree().current_scene.add_child(random_human)
	
