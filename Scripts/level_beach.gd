extends Node2D

@onready var spawn_point: Node2D = $SpawnPoint
@onready var wife: Wife = $Wife

@onready var rocks_parent: Node2D = $Rocks

const SHELL_SCENE: PackedScene = preload("res://Scenes/shell.tscn")

const PLAYER: PackedScene = preload("res://Scenes/player.tscn")

func _ready() -> void:
 
	var rocks = rocks_parent.get_children()
	rocks.shuffle()
	var shell_rocks = rocks.slice(0, 3)
	
	for rock : Rock in shell_rocks:
		var shell_spawn_point: Node2D = rock.get_node("ShellSpawnPoint")
		var shell: Shell = SHELL_SCENE.instantiate()
		var ia = shell.get_node("Interaction Area")
		ia.interact = Callable(shell, "take")
		shell.global_position = shell_spawn_point.global_position
		add_child(shell)
		
	if GlobalVariables.is_new_game or GlobalVariables.saved_scene_name != get_tree().current_scene.scene_file_path:
		var player_instance = PLAYER.instantiate()
		player_instance.position.x = spawn_point.position.x
		player_instance.position.y = spawn_point.position.y
		add_child(player_instance)

	#if wife.quest_status == Wife.SEARCH_SHELL:
		#wife.quest_status = Wife.HAVE_SHELL
		#$Shell.queue_free()
	#else:
		#Dialog.launch_dialog(Dialog.BEAUTIFULL_SHELL)
