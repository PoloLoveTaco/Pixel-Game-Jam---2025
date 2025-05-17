extends Node

const SAVE_PATH="user://savegame.json"

func make_header() -> Dictionary:
		return {
			"scene"     = get_tree().current_scene.scene_file_path,
			"timestamp" = Time.get_unix_time_from_system(),
			"version"   = 1
		}

func save_game() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_line(JSON.stringify(make_header()))
	for node in get_tree().get_nodes_in_group("Persist"):
		if node.has_method("_save"):
			file.store_line(JSON.stringify(node._save()))
	file.close()
	
func load_game() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		push_warning("No save found.")
		return
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var header = JSON.parse_string(file.get_line())
	var scene_path = header["scene"]
	SceneTransition.change_scene_slide_only_exit(scene_path)
	GlobalVariables.saved_scene_name = scene_path
	
	while not get_tree().current_scene:
		await get_tree().process_frame
	
	while file.get_position() < file.get_length():
		var line = file.get_line()
		var data = JSON.parse_string(line)
		if data["name"] == "Player":
			var player: Player = load(data["scene"]).instantiate()
			player._load(data)
			get_tree().current_scene.add_child(player)
	file.close()
