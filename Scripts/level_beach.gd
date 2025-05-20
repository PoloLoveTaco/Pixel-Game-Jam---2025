extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint
@onready var wife: Wife = $Wife

@onready var rocks_parent: Node2D = $Rocks

@onready var water_music: AudioStreamPlayer = $Water

const SHELL_SCENE: PackedScene = preload("res://Scenes/shell.tscn")

const PLAYER: PackedScene = preload("res://Scenes/player.tscn")

@onready var LEAVE_SHELL: PackedScene = preload("res://Scenes/leave_shell.tscn")
var leave_shell_spawned = false
@onready var spawn_shell_leave: Node2D = $SpawnPointShellLeave

func _ready() -> void:
	
	GlobalVariables.last_scene_name = "LevelBeach"
	
	if SaveManager.data["quests"]["beach"]["status"] == SaveManager.beach_status.NOT_START:
		spawn_shells()
		SaveManager.data["quests"]["beach"]["status"] = SaveManager.beach_status.START
		
	if not get_tree().root.has_node("Player"):
		var player_instance = PLAYER.instantiate()
		player_instance.global_position = spawn_point.global_position
		add_child(player_instance)
	else:
		var player_instance = get_tree().root.get_node("Player")
		player_instance.get_parent().remove_child(player_instance)
		add_child(player_instance)
		player_instance.global_position = spawn_point.global_position
		
func _process(delta: float) -> void:
	if SaveManager.data["quests"]["beach"]["status"] == SaveManager.beach_status.END and not leave_shell_spawned:
		leave_shell_spawned = true
		var ls: Node2D = LEAVE_SHELL.instantiate()
		ls.global_position = spawn_shell_leave.global_position
		add_child(ls)

func spawn_shells():
	var rocks = rocks_parent.get_children()
	rocks.shuffle()
	var shell_rocks = rocks.slice(0, 3)
	water_music.play()
	
	var shell_uids: Array = ["Shell", "Shell2", "Shell3"]
	var index: int = 0
	
	for rock : Rock in shell_rocks:
		var shell_spawn_point: Node2D = rock.get_node("ShellSpawnPoint")
		var shell: Shell = SHELL_SCENE.instantiate()
		shell.uid = shell_uids[index]
		shell.global_position = shell_spawn_point.global_position
		add_child(shell)
		index += 1
