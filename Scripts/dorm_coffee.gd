extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint
@onready var music: AudioStreamPlayer = $Music

const PLAYER = preload("res://Scenes/player.tscn")

func _ready() -> void:
	if not get_tree().root.has_node("Player"):
		var player_instance = PLAYER.instantiate()
		player_instance.global_position = spawn_point.global_position
		add_child(player_instance)
	else:
		var player_instance = get_tree().root.get_node("Player")
		player_instance.get_parent().remove_child(player_instance)
		add_child(player_instance)
		player_instance.global_position = spawn_point.global_position
	
	music.play()
