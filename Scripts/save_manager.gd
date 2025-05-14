extends Node

# Note: This can be called from anywhere inside the tree. This function is
# path independent.
# Go through everything in the persist category and ask them to return a
# dict of relevant variables.
func save_game():
	var save_file = FileAccess.open("res://Saves/savegame.save", FileAccess.WRITE)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		# Check the node is an instanced scene so it can be instanced again during load.
		if node.scene_file_path.is_empty():
			print("persistent node '%s' is not an instanced scene, skipped" % node.name)
			continue

		# Check the node has a save function.
		if !node.has_method("save"):
			print("persistent node '%s' is missing a save() function, skipped" % node.name)
			continue

		# Call the node's save function.
		var node_data = node.call("save")

		# JSON provides a static method to serialized JSON string.
		var json_string = JSON.stringify(node_data)

		# Store the save dictionary as a new line in the save file.
		save_file.store_line(json_string)


func load_game():
	# Vérification de l'existence du fichier de sauvegarde
	if not FileAccess.file_exists("res://Saves/savegame.save"):
		print("Aucun fichier de sauvegarde trouvé.")
		return

	# On supprime les anciens nodes persistants (reset de l'état)
	var save_nodes = get_tree().get_nodes_in_group("Persist")
	for node in save_nodes:
		node.queue_free()

	# On ouvre le fichier de sauvegarde
	var save_file = FileAccess.open("res://Saves/savegame.save", FileAccess.READ)

	while save_file.get_position() < save_file.get_length():
		var json_string = save_file.get_line()
		var json = JSON.new()
		var parse_result = json.parse(json_string)

		if parse_result != OK:
			print("Erreur JSON : ", json.get_error_message(), " à la ligne ", json.get_error_line())
			continue

		var node_data = json.data

		# Si la scène de jeu n'est pas chargée, on la charge
		SceneTransition.change_scene_slide_only_exit(node_data["in_wich_scene"])
		while not get_tree().current_scene or get_tree().current_scene.name != "LobbyHouse":
			await get_tree().process_frame
		
		# On instancie le nouvel objet
		var new_object = load(node_data["filename"]).instantiate()

		# On cherche le parent node de manière sécurisée
		var parent_node = get_node_or_null(node_data["parent"])
		if parent_node:
			parent_node.add_child(new_object)
		else:
			print("Parent node introuvable : ", node_data["parent"])
			continue  # On passe à la suite si le parent est introuvable

		# On positionne l'objet
		new_object.position = Vector2(node_data["pos_x"], node_data["pos_y"])

		# On restaure les autres variables sauvegardées
		for key in node_data.keys():
			if key in ["filename", "parent", "pos_x", "pos_y"]:
				continue
			new_object.set(key, node_data[key])
