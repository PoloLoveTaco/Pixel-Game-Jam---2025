extends Node

const SAVE_PATH = "user://savegame.json"

var last_scene: Node = null

var data : Dictionary = {
	"version": 1,
	"global": {},	# ex: Player
	"scenes": {},	# cache by scenes
}

func _ready() -> void:
	last_scene = get_tree().current_scene

func capture_scene(root: Node) -> void:
	var path = root.scene_file_path
	data["scenes"][path] = {}
	for n in root.get_tree().get_nodes_in_group("Persist"):
		if n.has_method("_save"):
			var d = n._save()
			if d["id"] == "Player":
				data["global"]["Player"] = d
			else:
				data["scenes"][path][d["id"]] = d

func write_file() -> void:
	data["timestamp"] = Time.get_unix_time_from_system()
	var f = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	f.store_string(JSON.stringify(data))
	f.close()
	
func save_game():
	capture_scene(get_tree().current_scene)
	write_file()

func on_change_scene(root: Node):
	print("exit scene: " + root.scene_file_path)
	capture_scene(root)

#func save_game():
	#var data = {}
	#if FileAccess.file_exists(SAVE_PATH):
		#data = JSON.parse_string(FileAccess.get_file_as_string(SAVE_PATH))
		#
	#var scene_path = get_tree().current_scene.scene_file_path
	#if not data.has("scenes"):
		#data["scenes"] = {}
	#data["scenes"][scene_path] = {}
	#
	#for n in get_tree().get_nodes_in_group("Persist"):
		#if n.has_method("_save"):
			#var d = n._save()
			#data["scenes"][scene_path][d["id"]] = d
	#
	#data["current_scene"] = scene_path
	#data["timestamp"] = Time.get_unix_time_from_system()
	#
	#var f = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	#f.store_string(JSON.stringify(data))
	#f.close()

#func make_header() -> Dictionary:
		#return {
			#"scene"     = get_tree().current_scene.scene_file_path,
			#"timestamp" = Time.get_unix_time_from_system(),
			#"version"   = 1
		#}
#
#func save_game() -> void:
	#var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	#file.store_line(JSON.stringify(make_header()))
	#for node in get_tree().get_nodes_in_group("Persist"):
		#if node.has_method("_save"):
			#file.store_line(JSON.stringify(node._save()))
	#file.close()
	#
#func load_game() -> void:
	#if not FileAccess.file_exists(SAVE_PATH):
		#push_warning("No save found.")
		#return
	#var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	#var header = JSON.parse_string(file.get_line())
	#var scene_path = header["scene"]
	#SceneTransition.change_scene_slide_only_exit(scene_path)
	#GlobalVariables.saved_scene_name = scene_path
	#
	#while not get_tree().current_scene:
		#await get_tree().process_frame
	#
	#while file.get_position() < file.get_length():
		#var line = file.get_line()
		#var data = JSON.parse_string(line)
		#if data["name"] == "Player":
			#var player: Player = load(data["scene"]).instantiate()
			#player._load(data)
			#get_tree().current_scene.add_child(player)
	#file.close()
