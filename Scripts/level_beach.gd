extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint
@onready var wife: Wife = $Wife

@onready var rocks_parent: Node2D = $Rocks

@onready var water_music: AudioStreamPlayer = $Water

const SHELL_SCENE: PackedScene = preload("res://Scenes/shell.tscn")

const PLAYER: PackedScene = preload("res://Scenes/player.tscn")

func _ready() -> void:
	connect("tree_exiting", Callable(SaveManager, "on_change_scene").bind(self))
	var rocks = rocks_parent.get_children()
	rocks.shuffle()
	var shell_rocks = rocks.slice(0, 3)
	water_music.play()
	
	for rock : Rock in shell_rocks:
		var shell_spawn_point: Node2D = rock.get_node("ShellSpawnPoint")
		var shell: Shell = SHELL_SCENE.instantiate()
		var ia = shell.get_node("Interaction Area")
		ia.interact = Callable(shell, "take")
		shell.global_position = shell_spawn_point.global_position
		add_child(shell)
		
	if not get_tree().root.has_node("Player"):
		var player_instance = PLAYER.instantiate()
		player_instance.global_position = spawn_point.global_position
		add_child(player_instance)
	else:
		var player_instance = get_tree().root.get_node("Player")
		player_instance.get_parent().remove_child(player_instance)
		add_child(player_instance)
		player_instance.global_position = spawn_point.global_position
