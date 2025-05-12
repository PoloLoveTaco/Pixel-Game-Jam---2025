extends Node2D

@onready var random_human_scene: PackedScene = preload("res://Scenes/random_human.tscn")

@onready var cam: Camera2D = $"../Player/Camera2D"

func _ready() -> void:
	set_spawners_position()
	
func _process(delta: float) -> void:
	if (get_bottom_y() > $SpawnMin.global_position.y):
		set_spawners_position()

func set_spawners_position():
	$SpawnMin.global_position = Vector2($SpawnMin.global_position.x, get_bottom_y())
	$SpawnMax.global_position = Vector2($SpawnMax.global_position.x, get_bottom_y())

func get_bottom_y() -> float:
	var half_h = 0.5 * get_viewport().get_visible_rect().size.y
	var center = cam.get_screen_center_position()
	center = center.y + half_h * cam.zoom.y
	return center + 100

func _on_timer_timeout() -> void:
	var min = $SpawnMin.global_position
	var max = $SpawnMax.global_position
	var random_pos_x = randf_range(min.x, max.x)
	
	var random_human := random_human_scene.instantiate()
	
	random_human.global_position = Vector2(random_pos_x, min.y)
	get_tree().current_scene.add_child(random_human)
	
