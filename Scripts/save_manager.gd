extends Node

const SAVE_PATH = "user://savegame.json"

enum beach_status {
	NOT_START,
	START,
	SEARCH_SHELLS,
	END
}

enum kitchen_status {
	NOT_START,
	START,
	GO_FRIDGE,
	GO_BOWL,
	GO_FURNACE,
	END_FURNACE,
	END
}

enum bye_status {
	START,
	END
}

var data : Dictionary = {
	"version": 1,
	"global": {},	# ex: Player
	"scenes": {},	# cache by scenes
	"quests": {
		"total": 4,
		"phone" : {
			"finished" : false,
		},
		"beach" : {
			"finished" : false,
			"status" : beach_status.NOT_START,
			"shells_found" : 0,
		},
		"kitchen" : {
			"finished" : false,
			"status" : kitchen_status.NOT_START,
			"fridge" : false,
			"bowl": false,
			"furnace": false,
		},
		"bye" : {
			"finished" : false,
			"status" : bye_status.START
		},
	}
}

var _player_ref : Node = null

func get_nb_quest_finished() -> int:
	var finished = 0
	
	if data["quests"]["phone"]["finished"] == true:
		finished += 1
	if data["quests"]["beach"]["finished"]  == true:
		finished += 1
	if data["quests"]["kitchen"]["finished"] == true:
		finished += 1
	if data["quests"]["bye"]["finished"] == true:
		finished += 1
	
	return finished


func remove_save():
	if FileAccess.file_exists(SAVE_PATH):
		var err = DirAccess.remove_absolute(SAVE_PATH)
		if err == OK:
			print("Save removed.")
		else:
			push_error("Error : %s" % error_string(err))


func _capture_scene(root: Node) -> void:
	var path = root.scene_file_path
	data["scenes"][path] = {}
	for n in root.get_tree().get_nodes_in_group("Persist"):
		if n.has_method("_save"):
			var d = n._save()
			if d["id"] == "Player":
				data["global"]["Player"] = d
			else:
				data["scenes"][path][d["id"]] = d


func write_file():
	data["timestamp"] = Time.get_unix_time_from_system()
	data["current_scene"] = get_tree().current_scene.scene_file_path
	var f = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	f.store_string(JSON.stringify(data))
	f.close()


func save_game():
	save_cache()
	write_file()


func save_cache():
	_capture_scene(get_tree().current_scene)


func on_change_scene(root: Node):
	print("exit scene: " + root.scene_file_path)
	_capture_scene(root)


func load_game() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		push_warning("No save found.")
		return
	data = JSON.parse_string(FileAccess.get_file_as_string(SAVE_PATH))
	
	SceneTransition.load_scene_from_save(data["current_scene"])
	while not get_tree().current_scene:
		await get_tree().process_frame
	
	_load_globals()


func _load_globals():
	if data["global"].has("Player"):
		var player_data = data["global"]["Player"]
		var player: Player = get_tree().current_scene.get_node("Player")
		player._load(player_data)


func charge_saved_scene(scene_path: String) -> void:
	if not data["scenes"].has(scene_path): return
	while not get_tree().current_scene:
		await get_tree().process_frame
	
	var current_scene = get_tree().current_scene
	for object in data["scenes"][scene_path].values():
		if object["id"] == "Player": continue
		var n = current_scene.get_node_or_null(object["id"])
		if n:
			n._load(object)
		else:
			var instance = load(object["file_path"]).instantiate()
			instance._load(object)
			current_scene.add_child(instance)
